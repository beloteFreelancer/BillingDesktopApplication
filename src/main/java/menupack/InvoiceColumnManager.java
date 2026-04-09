package menupack;

import com.selrom.db.DataUtil;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Dialog for managing product table columns displayed in Invoice and Estimate
 * print-outs (A4 / A5). Columns stored in the {@code invoice_columns} DB table.
 */
public class InvoiceColumnManager extends JDialog {

    private final DataUtil util;

    // Invoice tab
    private DefaultTableModel invoiceModel;
    private JTable invoiceTable;

    // Estimate tab
    private DefaultTableModel estimateModel;
    private JTable estimateTable;

    // Purchase tab
    private DefaultTableModel purchaseModel;
    private JTable purchaseTable;

    // Purchase Order tab
    private DefaultTableModel poModel;
    private JTable poTable;

    // Shop Type selector
    private JComboBox<String> shopTypeCombo;

    // Pre-defined column order for each doc_type (order matches DB col_order)
    private static final String[] INVOICE_KEYS = { "sno", "product_name", "qty", "mrp", "net_rate", "price",
            "disc", "disc_amt", "sub_total", "tax_pct", "tax_amt", "amount", "hsn",
            "mfg_date", "exp_date" };
    private static final String[] ESTIMATE_KEYS = { "sno", "product_name", "qty", "mrp", "net_rate", "price",
            "disc", "disc_amt", "sub_total", "tax_pct", "tax_amt", "amount", "hsn",
            "mfg_date", "exp_date" };
    private static final String[] PURCHASE_KEYS = { "mrp", "rprice", "wprice", "disc", "disc_amt", "sub_total",
            "tax_pct", "tax_amt", "hsn", "tax_type", "category", "manufacturer", "size", "color", "brand" };
    private static final String[] PO_KEYS = { "mrp", "reorder_level", "stock_hand", "tax_pct", "tax_amt",
            "total", "size", "color", "brand" };

    /** col_key → friendly display label shown in the manager UI */
    private static String keyToLabel(String key) {
        switch (key) {
            case "sno":
                return "Serial No.";
            case "product_name":
                return "Item Name";
            case "hsn":
                return "HSN Code";
            case "qty":
                return "Quantity";
            case "rate":
                return "Rate";
            case "net_rate":
                return "Net Rate";
            case "price":
                return "Price";
            case "tax":
                return "Tax";
            case "amount":
                return "Amount";
            case "mfg_date":
                return "Mfg Date";
            case "exp_date":
                return "Exp Date";
            case "mrp":
                return "MRP";
            // purchase keys
            case "rprice":
                return "Retail Price";
            case "wprice":
                return "Wholesale Price";
            case "disc":
                return "Discount %";
            case "disc_amt":
                return "Discount Amt";
            case "sub_total":
                return "Sub Total";
            case "tax_pct":
                return "Tax %";
            case "tax_amt":
                return "Tax Amt";
            case "tax_type":
                return "Tax Type";
            case "category":
                return "Category";
            case "manufacturer":
                return "Manufacturer";
            // clothing keys
            case "size":
                return "Size";
            case "color":
                return "Color";
            case "brand":
                return "Brand";
            // po keys
            case "reorder_level":
                return "Re-Order Level";
            case "stock_hand":
                return "Stock-in-Hand";
            case "total":
                return "Total";
            default:
                return key;
        }
    }

    public InvoiceColumnManager(DataUtil util) {
        super((Frame) null, "Manage Invoice / Estimate Columns", true);
        this.util = util;

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(540, 420);
        setLocationRelativeTo(null);
        setLayout(new BorderLayout(6, 6));
        getContentPane().setBackground(Color.WHITE);

        // ── Title ────────────────────────────────────────────────────────────
        JLabel title = new JLabel("Manage Product Table Columns", SwingConstants.CENTER);
        title.setFont(new Font("Arial", Font.BOLD, 16));
        title.setBorder(BorderFactory.createEmptyBorder(10, 0, 4, 0));

        // ── Shop Type row ────────────────────────────────────────────────────
        JPanel shopTypeRow = new JPanel(new FlowLayout(FlowLayout.LEFT, 12, 4));
        shopTypeRow.setBackground(Color.WHITE);
        JLabel stLbl = new JLabel("Shop Type:");
        stLbl.setFont(new Font("Arial", Font.BOLD, 13));
        shopTypeCombo = new JComboBox<>(
                new String[] { "General", "Grocery", "Clothing", "Pharmacy", "Hardware", "Electronics" });
        shopTypeCombo.setFont(new Font("Arial", Font.PLAIN, 13));
        shopTypeCombo.setPreferredSize(new Dimension(160, 28));
        JButton applyPresetBtn = new JButton("Apply Preset");
        styleButton(applyPresetBtn, new Color(0x2E7D32), Color.WHITE);
        applyPresetBtn.setPreferredSize(new Dimension(120, 28));
        applyPresetBtn.addActionListener(e -> applyShopTypePreset());
        shopTypeRow.add(stLbl);
        shopTypeRow.add(shopTypeCombo);
        shopTypeRow.add(applyPresetBtn);

        JPanel northPanel = new JPanel(new BorderLayout());
        northPanel.setBackground(Color.WHITE);
        northPanel.add(title, BorderLayout.NORTH);
        northPanel.add(shopTypeRow, BorderLayout.CENTER);
        add(northPanel, BorderLayout.NORTH);

        // ── Tabs ─────────────────────────────────────────────────────────────
        JTabbedPane tabs = new JTabbedPane();

        invoiceTable = buildTable();
        estimateTable = buildTable();
        purchaseTable = buildTable();
        poTable = buildTable();

        invoiceModel = (DefaultTableModel) invoiceTable.getModel();
        estimateModel = (DefaultTableModel) estimateTable.getModel();
        purchaseModel = (DefaultTableModel) purchaseTable.getModel();
        poModel = (DefaultTableModel) poTable.getModel();

        tabs.addTab("Invoice Columns", new JScrollPane(invoiceTable));
        tabs.addTab("Estimate Columns", new JScrollPane(estimateTable));
        tabs.addTab("Purchase Columns", new JScrollPane(purchaseTable));
        tabs.addTab("PO Columns", new JScrollPane(poTable));
        add(tabs, BorderLayout.CENTER);

        // ── Buttons ──────────────────────────────────────────────────────────
        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.CENTER, 12, 8));
        btnPanel.setBackground(Color.WHITE);

        JButton saveBtn = new JButton("Save");
        styleButton(saveBtn, new Color(0x1E2D4D), Color.WHITE);
        saveBtn.addActionListener(e -> save());

        JButton closeBtn = new JButton("Close");
        styleButton(closeBtn, new Color(0xCCCCCC), Color.BLACK);
        closeBtn.addActionListener(e -> dispose());

        btnPanel.add(saveBtn);
        btnPanel.add(closeBtn);
        add(btnPanel, BorderLayout.SOUTH);

        // ── Load data ────────────────────────────────────────────────────────
        loadData();
        loadShopType();
    }

    // ── Helpers ──────────────────────────────────────────────────────────────

    private JTable buildTable() {
        DefaultTableModel model = new DefaultTableModel(
                new Object[] { "Column", "Header Label", "Visible" }, 0) {
            @Override
            public Class<?> getColumnClass(int col) {
                return col == 2 ? Boolean.class : String.class;
            }

            @Override
            public boolean isCellEditable(int row, int col) {
                // Column key (col 0) is read-only; label and visible are editable
                return col != 0;
            }
        };
        JTable table = new JTable(model);
        table.setRowHeight(26);
        table.setFont(new Font("Arial", Font.PLAIN, 13));
        table.getTableHeader().setFont(new Font("Arial", Font.BOLD, 13));
        table.getColumnModel().getColumn(0).setPreferredWidth(120);
        table.getColumnModel().getColumn(1).setPreferredWidth(180);
        table.getColumnModel().getColumn(2).setPreferredWidth(60);
        return table;
    }

    private void styleButton(JButton btn, Color bg, Color fg) {
        btn.setBackground(bg);
        btn.setForeground(fg);
        btn.setFont(new Font("Arial", Font.BOLD, 13));
        btn.setFocusPainted(false);
        btn.setPreferredSize(new Dimension(100, 32));
    }

    // ── Data loading ─────────────────────────────────────────────────────────

    private void loadShopType() {
        try {
            String where = UserSession.hasSelectedCompany()
                    ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            ResultSet rs = util.doQuery("SELECT shop_type FROM company" + where + " LIMIT 1");
            if (rs != null && rs.next()) {
                String st = rs.getString("shop_type");
                if (st != null && !st.isEmpty())
                    shopTypeCombo.setSelectedItem(st);
            }
        } catch (Exception ignored) {
        }
    }

    /**
     * Updates the visible checkboxes in all four tab models to match the chosen
     * shop type preset.
     *
     * Presets per shop type:
     * General – HSN/Tax visible; no mfg/exp; standard purchase cols
     * Grocery – HSN/Tax visible; mfg_date + exp_date visible (food expiry)
     * Clothing – No HSN/Tax; wholesale price shown; no mfg/exp
     * Pharmacy – HSN/Tax + mfg_date + exp_date + disc_amt visible
     * Hardware – HSN/Tax; no mfg/exp; standard purchase cols
     * Electronics – HSN/Tax; disc_amt visible; no mfg/exp
     */
    private void applyShopTypePreset() {
        String st = shopTypeCombo.getSelectedItem().toString();

        boolean isPharmacy = st.equals("Pharmacy");
        boolean isClothing = st.equals("Clothing");
        boolean isGrocery = st.equals("Grocery");
        boolean isElectronics = st.equals("Electronics");

        boolean hasTax = !isClothing;
        boolean hasHsn = !isClothing;
        boolean hasMfgExp = isPharmacy || isGrocery;
        boolean hasWprice = isClothing;
        boolean hasDiscAmt = true; // Disc % and Disc Amount visible for every shop type
        boolean hasClothingCols = isClothing; // size, color, brand for purchase/PO only
        // ── Invoice ──────────────────────────────────────────────────────────
        setVisible(invoiceModel, INVOICE_KEYS, "qty", true);
        setVisible(invoiceModel, INVOICE_KEYS, "mrp", true);
        setVisible(invoiceModel, INVOICE_KEYS, "net_rate", true);
        setVisible(invoiceModel, INVOICE_KEYS, "price", false);
        setVisible(invoiceModel, INVOICE_KEYS, "disc", true);
        setVisible(invoiceModel, INVOICE_KEYS, "disc_amt", true);
        setVisible(invoiceModel, INVOICE_KEYS, "sub_total", true);
        setVisible(invoiceModel, INVOICE_KEYS, "tax_pct", false);
        setVisible(invoiceModel, INVOICE_KEYS, "tax_amt", true);
        setVisible(invoiceModel, INVOICE_KEYS, "amount", false);
        setVisible(invoiceModel, INVOICE_KEYS, "hsn", hasHsn);
        setVisible(invoiceModel, INVOICE_KEYS, "mfg_date", hasMfgExp);
        setVisible(invoiceModel, INVOICE_KEYS, "exp_date", hasMfgExp);

        // ── Estimate ─────────────────────────────────────────────────────────
        setVisible(estimateModel, ESTIMATE_KEYS, "qty", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "mrp", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "net_rate", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "disc", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "disc_amt", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "sub_total", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "tax_pct", false);
        setVisible(estimateModel, ESTIMATE_KEYS, "tax_amt", true);
        setVisible(estimateModel, ESTIMATE_KEYS, "amount", false);
        setVisible(estimateModel, ESTIMATE_KEYS, "hsn", hasHsn);
        setVisible(estimateModel, ESTIMATE_KEYS, "mfg_date", hasMfgExp);
        setVisible(estimateModel, ESTIMATE_KEYS, "exp_date", hasMfgExp);

        // ── Purchase ─────────────────────────────────────────────────────────
        setVisible(purchaseModel, PURCHASE_KEYS, "wprice", hasWprice);
        setVisible(purchaseModel, PURCHASE_KEYS, "disc", true);
        setVisible(purchaseModel, PURCHASE_KEYS, "disc_amt", hasDiscAmt);
        setVisible(purchaseModel, PURCHASE_KEYS, "tax_pct", hasTax);
        setVisible(purchaseModel, PURCHASE_KEYS, "tax_amt", hasTax);
        setVisible(purchaseModel, PURCHASE_KEYS, "hsn", hasHsn);
        setVisible(purchaseModel, PURCHASE_KEYS, "tax_type", hasHsn);
        setVisible(purchaseModel, PURCHASE_KEYS, "size", hasClothingCols);
        setVisible(purchaseModel, PURCHASE_KEYS, "color", hasClothingCols);
        setVisible(purchaseModel, PURCHASE_KEYS, "brand", hasClothingCols);

        // ── PO ───────────────────────────────────────────────────────────────
        setVisible(poModel, PO_KEYS, "tax_pct", hasTax);
        setVisible(poModel, PO_KEYS, "tax_amt", hasTax);
        setVisible(poModel, PO_KEYS, "size", hasClothingCols);
        setVisible(poModel, PO_KEYS, "color", hasClothingCols);
        setVisible(poModel, PO_KEYS, "brand", hasClothingCols);
    }

    private void setVisible(DefaultTableModel model, String[] keys, String key, boolean visible) {
        for (int i = 0; i < keys.length; i++) {
            if (keys[i].equals(key) && i < model.getRowCount()) {
                model.setValueAt(visible, i, 2);
                break;
            }
        }
    }

    private void loadData() {
        loadForType("invoice", invoiceModel, INVOICE_KEYS);
        loadForType("estimate", estimateModel, ESTIMATE_KEYS);
        loadForType("purchase", purchaseModel, PURCHASE_KEYS);
        loadForType("po", poModel, PO_KEYS);
    }

    private void loadForType(String docType, DefaultTableModel model, String[] keyOrder) {
        model.setRowCount(0);

        String colCompanyFilter = UserSession.hasSelectedCompany()
                ? "'" + UserSession.getSelectedCompanyID() + "'"
                : "''";

        // Build a lookup map from DB
        java.util.Map<String, Object[]> dbMap = new java.util.LinkedHashMap<>();
        try {
            ResultSet rs = util.doQuery(
                    "SELECT col_key, col_header, col_visible FROM invoice_columns "
                            + "WHERE doc_type='" + docType + "' AND company_id=" + colCompanyFilter
                            + " ORDER BY col_order");
            while (rs != null && rs.next()) {
                String key = rs.getString("col_key");
                String header = rs.getString("col_header");
                boolean visible = rs.getInt("col_visible") == 1;
                dbMap.put(key, new Object[] { header, visible });
            }
        } catch (Exception ex) {
            // Table may not exist yet if migration hasn't run; use defaults
        }

        // Add rows in defined key order so the UI is always predictable
        for (String key : keyOrder) {
            String header = "#";
            boolean visible = true;
            if (dbMap.containsKey(key)) {
                header = (String) dbMap.get(key)[0];
                visible = (Boolean) dbMap.get(key)[1];
            } else {
                // Fall back to key itself as header
                header = key.toUpperCase();
            }
            model.addRow(new Object[] { keyToLabel(key), header, visible });
        }
    }

    // ── Save ─────────────────────────────────────────────────────────────────

    private void save() {
        try {
            saveForType("invoice", invoiceModel, INVOICE_KEYS);
            saveForType("estimate", estimateModel, ESTIMATE_KEYS);
            saveForType("purchase", purchaseModel, PURCHASE_KEYS);
            saveForType("po", poModel, PO_KEYS);
            // Persist shop_type to company record
            String shopType = shopTypeCombo.getSelectedItem().toString();
            String where = UserSession.hasSelectedCompany()
                    ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            if (!where.isEmpty()) {
                util.doManipulation("UPDATE company SET shop_type='" + shopType + "'" + where);
            }
            JOptionPane.showMessageDialog(this,
                    "Column settings saved successfully.",
                    "Saved", JOptionPane.INFORMATION_MESSAGE);
        } catch (Exception ex) {
            JOptionPane.showMessageDialog(this,
                    "Error saving column settings:\n" + ex.getMessage(),
                    "Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void saveForType(String docType, DefaultTableModel model, String[] keys) throws Exception {
        String cid = UserSession.hasSelectedCompany() ? UserSession.getSelectedCompanyID() : "";
        ArrayList<String> queries = new ArrayList<>();
        for (int i = 0; i < keys.length && i < model.getRowCount(); i++) {
            String colKey = keys[i];
            String colHeader = escSql(model.getValueAt(i, 1).toString());
            int colVis = Boolean.TRUE.equals(model.getValueAt(i, 2)) ? 1 : 0;

            queries.add(
                    "INSERT INTO invoice_columns (doc_type, col_key, company_id, col_header, col_visible, col_order) "
                            + "VALUES ('" + docType + "','" + colKey + "','" + cid + "','" + colHeader + "'," + colVis
                            + "," + (i + 1)
                            + ") "
                            + "ON DUPLICATE KEY UPDATE col_header='" + colHeader + "', col_visible=" + colVis);
        }
        util.doManipulation_Batch(queries);
    }

    /** Minimal SQL escaping for string values entered by the user. */
    private static String escSql(String s) {
        return s == null ? "" : s.replace("'", "''");
    }
}
