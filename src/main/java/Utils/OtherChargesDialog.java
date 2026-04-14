package Utils;

import com.selrom.db.DataUtil;
import menupack.UserSession;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Modal dialog to manage a list of other-charge line items for a bill.
 * Shared by sales and estimate screens.
 */
public class OtherChargesDialog extends JDialog {

    private final DataUtil util;
    private final String companyId;
    private final DefaultTableModel model;
    private final JTable table;
    private final JLabel totalLabel;
    private boolean confirmed = false;
    private final List<String> masterChargeNames = new ArrayList<>();

    public OtherChargesDialog(Frame owner, DataUtil util) {
        super(owner, "Other Charges", true);
        this.util = util;
        this.companyId = UserSession.hasSelectedCompany() ? UserSession.getSelectedCompanyID() : "";

        setSize(460, 380);
        setLocationRelativeTo(owner);
        setLayout(new BorderLayout(5, 5));

        loadMasterChargeNames();

        // ── Table ──
        model = new DefaultTableModel(new Object[] { "Charge Name", "Amount" }, 0) {
            @Override
            public Class<?> getColumnClass(int col) {
                return col == 1 ? Double.class : String.class;
            }

            @Override
            public boolean isCellEditable(int row, int col) {
                return true;
            }
        };
        table = new JTable(model);
        table.setRowHeight(28);
        table.setFont(new Font("Arial", Font.PLAIN, 13));
        table.getTableHeader().setFont(new Font("Arial", Font.BOLD, 13));

        // Charge Name column: editable combo
        JComboBox<String> nameCombo = new JComboBox<>();
        nameCombo.setEditable(true);
        for (String name : masterChargeNames) {
            nameCombo.addItem(name);
        }
        table.getColumnModel().getColumn(0).setCellEditor(new DefaultCellEditor(nameCombo));
        table.getColumnModel().getColumn(0).setPreferredWidth(260);
        table.getColumnModel().getColumn(1).setPreferredWidth(120);

        JScrollPane scrollPane = new JScrollPane(table);
        add(scrollPane, BorderLayout.CENTER);

        // ── Buttons panel ──
        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 8, 4));
        JButton addBtn = new JButton("Add");
        JButton removeBtn = new JButton("Remove");
        JButton newChargeBtn = new JButton("New Charge Type");
        addBtn.addActionListener(e -> addRow());
        removeBtn.addActionListener(e -> removeSelectedRow());
        newChargeBtn.addActionListener(e -> addNewChargeType());
        btnPanel.add(addBtn);
        btnPanel.add(removeBtn);
        btnPanel.add(newChargeBtn);

        // ── Bottom panel: total + OK/Cancel ──
        JPanel bottomPanel = new JPanel(new BorderLayout(8, 4));
        totalLabel = new JLabel("Total: 0.00", SwingConstants.RIGHT);
        totalLabel.setFont(new Font("Arial", Font.BOLD, 14));
        totalLabel.setBorder(BorderFactory.createEmptyBorder(4, 8, 4, 8));

        JPanel okCancelPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 8, 4));
        JButton okBtn = new JButton("OK");
        JButton cancelBtn = new JButton("Cancel");
        okBtn.addActionListener(e -> {
            confirmed = true;
            dispose();
        });
        cancelBtn.addActionListener(e -> {
            confirmed = false;
            dispose();
        });
        okCancelPanel.add(okBtn);
        okCancelPanel.add(cancelBtn);

        bottomPanel.add(totalLabel, BorderLayout.WEST);
        bottomPanel.add(okCancelPanel, BorderLayout.EAST);

        JPanel southPanel = new JPanel(new BorderLayout());
        southPanel.add(btnPanel, BorderLayout.NORTH);
        southPanel.add(bottomPanel, BorderLayout.SOUTH);
        add(southPanel, BorderLayout.SOUTH);

        // Recalculate total on any cell edit
        model.addTableModelListener(e -> recalcTotal());

        // Close on ESC
        getRootPane().registerKeyboardAction(
                e -> {
                    confirmed = false;
                    dispose();
                },
                KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0),
                JComponent.WHEN_IN_FOCUSED_WINDOW);
        getRootPane().setDefaultButton(okBtn);
    }

    // ── Public API ──

    /** Set the initial charge list (for editing an existing bill). */
    public void setCharges(List<String[]> charges) {
        model.setRowCount(0);
        for (String[] row : charges) {
            model.addRow(new Object[] { row[0], Double.parseDouble(row[1]) });
        }
        recalcTotal();
    }

    /** Get current charges as list of [name, amount] pairs. */
    public List<String[]> getCharges() {
        stopEditing();
        List<String[]> list = new ArrayList<>();
        for (int i = 0; i < model.getRowCount(); i++) {
            String name = model.getValueAt(i, 0) != null ? model.getValueAt(i, 0).toString().trim() : "";
            double amt = 0;
            try {
                amt = Double.parseDouble(model.getValueAt(i, 1).toString());
            } catch (Exception ignored) {
            }
            if (!name.isEmpty() && amt != 0) {
                list.add(new String[] { name, String.valueOf(amt) });
            }
        }
        return list;
    }

    /** Get total of all charges. */
    public double getTotal() {
        double total = 0;
        for (int i = 0; i < model.getRowCount(); i++) {
            try {
                total += Double.parseDouble(model.getValueAt(i, 1).toString());
            } catch (Exception ignored) {
            }
        }
        return total;
    }

    /** Whether the user clicked OK. */
    public boolean isConfirmed() {
        return confirmed;
    }

    // ── Internal methods ──

    private void addRow() {
        model.addRow(new Object[] { "", 0.0 });
        int newRow = model.getRowCount() - 1;
        table.editCellAt(newRow, 0);
        table.changeSelection(newRow, 0, false, false);
    }

    private void removeSelectedRow() {
        int row = table.getSelectedRow();
        if (row >= 0) {
            model.removeRow(row);
        }
    }

    private void recalcTotal() {
        double total = getTotal();
        totalLabel.setText(String.format("Total: %.2f", total));
    }

    private void stopEditing() {
        if (table.isEditing()) {
            table.getCellEditor().stopCellEditing();
        }
    }

    private void loadMasterChargeNames() {
        try {
            String filter = companyId.isEmpty() ? "" : " WHERE company_id='" + companyId + "'";
            ResultSet rs = util
                    .doQuery("SELECT charge_name FROM other_charges_master" + filter + " ORDER BY charge_name");
            while (rs.next()) {
                masterChargeNames.add(rs.getString(1));
            }
        } catch (Exception e) {
            // Table may not exist yet — use defaults
            masterChargeNames.add("Packing Charges");
            masterChargeNames.add("Freight");
            masterChargeNames.add("Loading Charges");
            masterChargeNames.add("Installation");
            masterChargeNames.add("Insurance");
            masterChargeNames.add("Labour Charges");
            masterChargeNames.add("Transport");
            masterChargeNames.add("Other");
        }
    }

    private void addNewChargeType() {
        String name = JOptionPane.showInputDialog(this, "Enter new charge type name:", "New Charge Type",
                JOptionPane.PLAIN_MESSAGE);
        if (name == null || name.trim().isEmpty())
            return;
        name = name.trim();
        try {
            Connection conn = util.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT IGNORE INTO other_charges_master (charge_name, company_id) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setString(2, companyId);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error adding charge type: " + e.getMessage());
        }
        // Refresh combo
        if (!masterChargeNames.contains(name)) {
            masterChargeNames.add(name);
            JComboBox<String> nameCombo = new JComboBox<>();
            nameCombo.setEditable(true);
            for (String n : masterChargeNames) {
                nameCombo.addItem(n);
            }
            table.getColumnModel().getColumn(0).setCellEditor(new DefaultCellEditor(nameCombo));
        }
        // Add a row with the new charge
        model.addRow(new Object[] { name, 0.0 });
    }

    // ── Static helpers for saving/loading charges ──

    /** Save charges for a bill. Deletes old rows first. */
    public static void saveCharges(Connection conn, String tableName, int billno,
            List<String[]> charges, String companyId) throws SQLException {
        PreparedStatement psDel = conn.prepareStatement(
                "DELETE FROM " + tableName + " WHERE billno=? AND company_id=?");
        psDel.setInt(1, billno);
        psDel.setString(2, companyId);
        psDel.executeUpdate();

        if (charges != null && !charges.isEmpty()) {
            PreparedStatement psIns = conn.prepareStatement(
                    "INSERT INTO " + tableName + " (billno, charge_name, amount, company_id) VALUES (?,?,?,?)");
            for (String[] row : charges) {
                psIns.setInt(1, billno);
                psIns.setString(2, row[0]);
                psIns.setDouble(3, Double.parseDouble(row[1]));
                psIns.setString(4, companyId);
                psIns.addBatch();
            }
            psIns.executeBatch();
        }
    }

    /** Load charges for a bill. */
    public static List<String[]> loadCharges(DataUtil util, String tableName, String billno, String companyId) {
        List<String[]> list = new ArrayList<>();
        try {
            String companyFilter = companyId.isEmpty() ? "" : " AND company_id='" + companyId + "'";
            ResultSet rs = util.doQuery("SELECT charge_name, amount FROM " + tableName
                    + " WHERE billno='" + billno + "'" + companyFilter + " ORDER BY id");
            while (rs.next()) {
                list.add(new String[] { rs.getString(1), String.valueOf(rs.getDouble(2)) });
            }
        } catch (Exception e) {
            System.out.println("Error loading charges: " + e.getMessage());
        }
        return list;
    }

    /** Delete charges for a bill. */
    public static void deleteCharges(Connection conn, String tableName, int billno, String companyId)
            throws SQLException {
        PreparedStatement ps = conn.prepareStatement(
                "DELETE FROM " + tableName + " WHERE billno=? AND company_id=?");
        ps.setInt(1, billno);
        ps.setString(2, companyId);
        ps.executeUpdate();
    }

    /** Build a formatted string of charges for display on printed invoices. */
    public static String buildChargesDisplayString(List<String[]> charges, int decimalPlaces) {
        if (charges == null || charges.isEmpty())
            return "";
        StringBuilder sb = new StringBuilder();
        for (String[] row : charges) {
            double amt = Double.parseDouble(row[1]);
            sb.append(row[0]).append(" : ").append(String.format("%." + decimalPlaces + "f", amt)).append("\n");
        }
        return sb.toString().trim();
    }
}
