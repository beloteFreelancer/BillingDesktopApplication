package com.selrom.db;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

public class DatabaseInitializer {

    private static boolean initialized = false;

    public static void initialize(Connection conn) {
        if (initialized) {
            return;
        }
        try {
            System.out.println("Checking database schema...");
            String schemaSql = loadSchema();
            if (schemaSql == null) {
                System.err.println("Could not load schema.sql");
                return;
            }

            Map<String, TableDefinition> schemaTables = parseSchema(schemaSql);
            System.out.println("Parsed " + schemaTables.size() + " tables from schema.sql.");

            for (Map.Entry<String, TableDefinition> entry : schemaTables.entrySet()) {
                String tableName = entry.getKey();
                TableDefinition tableDef = entry.getValue();

                if (!tableExists(conn, tableName)) {
                    System.out.println("Table '" + tableName + "' does not exist. Creating...");
                    createTable(conn, tableDef.fullSql);
                } else {
                    // Check columns
                    checkAndSyncColumns(conn, tableName, tableDef);
                }
            }

            // Execute any other statements (like INSERT)
            List<String> otherStatements = parseOtherStatements(schemaSql);
            try (Statement stmt = conn.createStatement()) {
                for (String sql : otherStatements) {
                    try {
                        stmt.execute(sql);
                    } catch (SQLException e) {
                        // Ignore errors like duplicate entry
                    }
                }
            }

            // Fix peracc table schema for existing installations
            try (Statement stmt = conn.createStatement()) {
                // Check if sno is auto_increment. If not, modify it.
                // This is a "hotfix" migration.
                try {
                    stmt.execute("ALTER TABLE peracc MODIFY sno INT AUTO_INCREMENT");
                    System.out.println("Migrated peracc table to AUTO_INCREMENT.");
                } catch (SQLException e) {
                    // Ignore if already auto_increment or other benign errors
                    System.out.println("Skipping peracc migration: " + e.getMessage());
                }
            }

            // Add loyalty_points column to sales table for existing installations
            {
                DatabaseMetaData meta = conn.getMetaData();
                if (!columnExists(meta, "sales", "loyalty_points")) {
                    try (Statement stmt = conn.createStatement()) {
                        stmt.execute("ALTER TABLE sales ADD COLUMN loyalty_points varchar(10) DEFAULT '0.00'");
                        System.out.println("Migrated sales table: added loyalty_points column.");
                    } catch (SQLException e) {
                        System.out.println("Skipping sales loyalty_points migration: " + e.getMessage());
                    }
                }
            }

            // Add bank detail columns to company table for existing installations
            {
                DatabaseMetaData meta = conn.getMetaData();
                String[][] bankCols = {
                        { "bank_name", "varchar(150) DEFAULT ''" },
                        { "bank_acc_no", "varchar(50) DEFAULT ''" },
                        { "bank_ifsc", "varchar(20) DEFAULT ''" },
                        { "bank_branch", "varchar(150) DEFAULT ''" },
                        { "bank_holder", "varchar(150) DEFAULT ''" }
                };
                for (String[] col : bankCols) {
                    if (!columnExists(meta, "company", col[0])) {
                        try (Statement stmt = conn.createStatement()) {
                            stmt.execute("ALTER TABLE company ADD COLUMN " + col[0] + " " + col[1]);
                            System.out.println("Migrated company: added " + col[0]);
                        } catch (SQLException e) {
                            System.out.println("Skipping company " + col[0] + " migration: " + e.getMessage());
                        }
                    }
                }
            }

            // Add redemption settings columns to setting_points for existing installations
            {
                DatabaseMetaData meta = conn.getMetaData();
                String[][] redemptionCols = {
                        { "min_redemption", "int NOT NULL DEFAULT 100" },
                        { "conversion_rate", "decimal(5,2) NOT NULL DEFAULT 1.00" },
                        { "redemption_enabled", "varchar(5) NOT NULL DEFAULT 'Yes'" }
                };
                for (String[] col : redemptionCols) {
                    if (!columnExists(meta, "setting_points", col[0])) {
                        try (Statement stmt = conn.createStatement()) {
                            stmt.execute("ALTER TABLE setting_points ADD COLUMN " + col[0] + " " + col[1]);
                            System.out.println("Migrated setting_points: added " + col[0]);
                        } catch (SQLException e) {
                            System.out.println("Skipping setting_points " + col[0] + " migration: " + e.getMessage());
                        }
                    }
                }
            }

            // Migrate single-column primary keys to composite (pk_col, company_id)
            migrateCompositePrimaryKeys(conn);

            // Migrate single-column unique keys to composite with company_id
            migrateCompositeUniqueKeys(conn);

            // Ensure super admin user exists (idempotent)
            // ensureAdminUser(conn);

            initialized = true;
            System.out.println("Database schema verified/updated.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void migrateCompositePrimaryKeys(Connection conn) {
        System.out.println("Checking composite primary keys...");

        // Tables that need nullable company_id fixed before PK change
        String[] nullableCompanyIdTables = {
                "ereturn", "estimate", "preturn", "purchase", "sales", "sreturn", "stock_entry"
        };
        for (String table : nullableCompanyIdTables) {
            try {
                if (tableExists(conn, table)) {
                    try (Statement stmt = conn.createStatement()) {
                        stmt.executeUpdate("UPDATE `" + table + "` SET company_id = '' WHERE company_id IS NULL");
                        stmt.execute("ALTER TABLE `" + table + "` MODIFY company_id varchar(50) NOT NULL DEFAULT ''");
                    }
                }
            } catch (SQLException e) {
                System.out.println("Skipping company_id fix for " + table + ": " + e.getMessage());
            }
        }

        // All tables needing composite PK: [table_name, pk_column]
        String[][] compositePkTables = {
                { "item", "ino" },
                { "cust", "cid" },
                { "cust_bill", "sno" },
                { "ereturn", "billno" },
                { "estimate", "billno" },
                { "preturn", "grn" },
                { "purchase", "grn" },
                { "sales", "billno" },
                { "sreturn", "billno" },
                { "stock_entry", "grn" },
                { "ven_bill", "sno" },
                { "vendor", "cname" }
        };

        for (String[] entry : compositePkTables) {
            String table = entry[0];
            String pkCol = entry[1];
            try {
                if (tableExists(conn, table) && !isPrimaryKeyComposite(conn, table)) {
                    try (Statement stmt = conn.createStatement()) {
                        stmt.execute("ALTER TABLE `" + table + "` DROP PRIMARY KEY, ADD PRIMARY KEY (`" + pkCol
                                + "`, `company_id`)");
                        System.out.println("Migrated " + table + " PK to composite (" + pkCol + ", company_id).");
                    }
                }
            } catch (SQLException e) {
                System.out.println("Skipping " + table + " PK migration: " + e.getMessage());
            }
        }
    }

    private static void migrateCompositeUniqueKeys(Connection conn) {
        System.out.println("Checking composite unique keys...");

        // Each entry: [table, old_index_name, new_index_name, col1, col2]
        String[][] uniqueKeyMigrations = {
                { "item", "item_barcode", "item_barcode_company", "barcode", "company_id" },
                { "stock", "ino", "stock_ino_company", "ino", "company_id" },
                { "stock", "stock_barcode", "stock_barcode_company", "barcode", "company_id" }
        };

        for (String[] entry : uniqueKeyMigrations) {
            String table = entry[0];
            String oldIndex = entry[1];
            String newIndex = entry[2];
            String col1 = entry[3];
            String col2 = entry[4];
            try {
                if (!tableExists(conn, table))
                    continue;
                if (indexExists(conn, table, newIndex))
                    continue;

                try (Statement stmt = conn.createStatement()) {
                    if (indexExists(conn, table, oldIndex)) {
                        stmt.execute("ALTER TABLE `" + table + "` DROP INDEX `" + oldIndex + "`");
                        System.out.println("Dropped old index " + oldIndex + " on " + table);
                    }
                    stmt.execute("ALTER TABLE `" + table + "` ADD UNIQUE KEY `" + newIndex + "` (`" + col1 + "`, `"
                            + col2 + "`)");
                    System.out.println("Created composite unique key " + newIndex + " on " + table);
                }
            } catch (SQLException e) {
                System.out.println("Skipping " + table + " unique key migration (" + oldIndex + "): " + e.getMessage());
            }
        }
    }

    private static boolean indexExists(Connection conn, String tableName, String indexName) throws SQLException {
        DatabaseMetaData meta = conn.getMetaData();
        String catalog = conn.getCatalog();
        try (ResultSet rs = meta.getIndexInfo(catalog, null, tableName, false, false)) {
            while (rs.next()) {
                String name = rs.getString("INDEX_NAME");
                if (indexName.equalsIgnoreCase(name))
                    return true;
            }
        }
        return false;
    }

    private static boolean isPrimaryKeyComposite(Connection conn, String tableName) throws SQLException {
        DatabaseMetaData meta = conn.getMetaData();
        String catalog = conn.getCatalog();
        int pkColumnCount = 0;
        try (ResultSet rs = meta.getPrimaryKeys(catalog, null, tableName)) {
            while (rs.next()) {
                pkColumnCount++;
            }
        }
        return pkColumnCount > 1;
    }

    private static String loadSchema() {
        try (InputStream in = DatabaseInitializer.class.getResourceAsStream("/db/schema.sql")) {
            if (in == null)
                return null;
            try (BufferedReader reader = new BufferedReader(new InputStreamReader(in))) {
                return reader.lines().collect(Collectors.joining("\n"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private static boolean tableExists(Connection conn, String tableName) throws SQLException {
        String catalog = conn.getCatalog();

        // Special check for 'users' table in H2 to avoid conflict with system table
        if (tableName.equalsIgnoreCase("users")) {
            DatabaseMetaData meta = conn.getMetaData();
            // Check if it has 'utype' column which implies it is OUR table
            if (!columnExists(meta, tableName, "utype")) {
                System.out.println(
                        "DEBUG: Found 'users' table but missing 'utype' column. Assuming system table and returning false.");
                return false;
            }
        }

        // First try exact match
        try (ResultSet rs = conn.getMetaData().getTables(catalog, null, tableName, new String[] { "TABLE" })) {
            if (rs.next()) {
                System.out.println(
                        "DEBUG: Found table " + rs.getString("TABLE_NAME") + " type=" + rs.getString("TABLE_TYPE"));
                return true;
            }
        }

        // Then try case variations if not found (for robustness on case-sensitive OS
        // with case-insensitive logic)
        // Note: on Linux MySQL, if lower_case_table_names=0, 'User' and 'user' are
        // different tables.
        // We really want the table with the exact name from schema.sql.
        // However, existing DB might have UpperCase tables.

        try (ResultSet rs = conn.getMetaData().getTables(catalog, null, tableName.toUpperCase(),
                new String[] { "TABLE" })) {
            if (rs.next()) {
                System.out.println("DEBUG: Found table (upper) " + rs.getString("TABLE_NAME") + " type="
                        + rs.getString("TABLE_TYPE"));
                // If we found the UPPERCASE version, we consider it existing to avoid duplicate
                // creation errors
                // or parallel existence confusion.
                return true;
            }
        }
        try (ResultSet rs = conn.getMetaData().getTables(catalog, null, tableName.toLowerCase(),
                new String[] { "TABLE" })) {
            if (rs.next()) {
                System.out.println("DEBUG: Found table (lower) " + rs.getString("TABLE_NAME") + " type="
                        + rs.getString("TABLE_TYPE"));
                return true;
            }
        }
        return false;
    }

    private static void createTable(Connection conn, String sql) throws SQLException {
        try (Statement stmt = conn.createStatement()) {
            stmt.execute(sql);
        } catch (SQLException e) {
            System.err
                    .println("Failed to execute creation SQL: " + sql.substring(0, Math.min(50, sql.length())) + "...");
            throw e;
        }
    }

    private static void checkAndSyncColumns(Connection conn, String tableName, TableDefinition tableDef)
            throws SQLException {
        DatabaseMetaData meta = conn.getMetaData();

        for (ColumnDefinition colDef : tableDef.columns) {
            if (!columnExists(meta, tableName, colDef.name)) {
                System.out.println("Column " + colDef.name + " missing in table " + tableName + ". Adding...");
                String alterSql = "ALTER TABLE `" + tableName + "` ADD COLUMN " + colDef.fullDefinition;
                try (Statement stmt = conn.createStatement()) {
                    stmt.execute(alterSql);
                } catch (SQLException e) {
                    System.err.println("Failed to add column " + colDef.name + ": " + e.getMessage());
                }
            }
        }
    }

    private static boolean columnExists(DatabaseMetaData meta, String tableName, String columnName)
            throws SQLException {
        String catalog = meta.getConnection().getCatalog();
        try (ResultSet rs = meta.getColumns(catalog, null, tableName, columnName)) {
            if (rs.next())
                return true;
        }
        // Try variants
        try (ResultSet rs = meta.getColumns(catalog, null, tableName.toUpperCase(), columnName.toUpperCase())) {
            if (rs.next())
                return true;
        }
        try (ResultSet rs = meta.getColumns(catalog, null, tableName.toLowerCase(), columnName.toLowerCase())) {
            if (rs.next())
                return true;
        }
        return false;
    }

    private static void ensureAdminUser(Connection conn) {
        // First check if 'users' table exists to avoid errors if creation failed
        try {
            if (!tableExists(conn, "users")) {
                System.err.println("Cannot ensure admin user: 'users' table missing.");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }

        String checkSql = "SELECT `user` FROM users WHERE `user` = 'admin'";
        String insertSql = "INSERT INTO users (utype, `user`, pass, last) VALUES ('Super Admin', 'admin', 'admin', 'admin')";

        try (Statement stmt = conn.createStatement()) {
            try (ResultSet rs = stmt.executeQuery(checkSql)) {
                if (!rs.next()) {
                    System.out.println("Creating admin user...");
                    stmt.executeUpdate(insertSql);
                }
            }
        } catch (SQLException e) {
            System.err.println("Failed to ensure admin user: " + e.getMessage());
        }
    }

    // --- Simple SQL Parser ---

    private static class TableDefinition {
        String name;
        String fullSql;
        List<ColumnDefinition> columns = new ArrayList<>();
    }

    private static class ColumnDefinition {
        String name;
        String fullDefinition;
    }

    private static Map<String, TableDefinition> parseSchema(String schemaSql) {
        Map<String, TableDefinition> tables = new HashMap<>();

        // Remove comments
        schemaSql = schemaSql.replaceAll("--.*", "");

        // Split by semicolon
        String[] statements = schemaSql.split(";");

        Pattern createTablePattern = Pattern.compile(
                "CREATE\\s+TABLE\\s+(?:IF\\s+NOT\\s+EXISTS\\s+)?`?(\\w+)`?\\s*\\((.*)\\)",
                Pattern.CASE_INSENSITIVE | Pattern.DOTALL);

        for (String stmt : statements) {
            stmt = stmt.trim();
            if (stmt.isEmpty())
                continue;

            Matcher m = createTablePattern.matcher(stmt);
            if (m.find()) {
                TableDefinition table = new TableDefinition();
                table.name = m.group(1);
                table.fullSql = stmt;

                String body = m.group(2);
                table.columns = parseColumns(body);

                tables.put(table.name, table);
            }
        }
        return tables;
    }

    private static List<String> parseOtherStatements(String schemaSql) {
        List<String> others = new ArrayList<>();
        String[] statements = schemaSql.split(";");
        for (String stmt : statements) {
            stmt = stmt.trim();
            if (stmt.isEmpty())
                continue;
            if (!stmt.toUpperCase().startsWith("CREATE TABLE")) {
                others.add(stmt);
            }
        }
        return others;
    }

    private static List<ColumnDefinition> parseColumns(String body) {
        List<ColumnDefinition> columns = new ArrayList<>();
        List<String> parts = splitByCommaIgnoringParens(body);

        for (String part : parts) {
            part = part.trim();
            if (part.isEmpty())
                continue;

            // Skip keys/constraints
            if (part.toUpperCase().startsWith("PRIMARY KEY") ||
                    part.toUpperCase().startsWith("KEY") ||
                    part.toUpperCase().startsWith("UNIQUE KEY") ||
                    part.toUpperCase().startsWith("CONSTRAINT")) {
                continue;
            }

            // Extract column name
            String colName = null;
            if (part.startsWith("`")) {
                int endQuote = part.indexOf("`", 1);
                if (endQuote > 1) {
                    colName = part.substring(1, endQuote);
                }
            } else {
                int space = part.indexOf(" ");
                if (space > 0) {
                    colName = part.substring(0, space);
                }
            }

            if (colName != null) {
                ColumnDefinition col = new ColumnDefinition();
                col.name = colName;
                col.fullDefinition = part;
                columns.add(col);
            }
        }
        return columns;
    }

    private static List<String> splitByCommaIgnoringParens(String text) {
        List<String> tokens = new ArrayList<>();
        int parens = 0;
        StringBuilder current = new StringBuilder();
        for (char c : text.toCharArray()) {
            if (c == '(')
                parens++;
            if (c == ')')
                parens--;

            if (c == ',' && parens == 0) {
                tokens.add(current.toString());
                current.setLength(0);
            } else {
                current.append(c);
            }
        }
        tokens.add(current.toString());
        return tokens;
    }
}
