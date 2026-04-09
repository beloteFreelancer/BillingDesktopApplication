package menupack;

import com.selrom.db.DataUtil;
import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.SwingUtilities;
import javax.swing.event.InternalFrameAdapter;
import javax.swing.event.InternalFrameEvent;
import javax.swing.table.DefaultTableModel;

/**
 * Company Management - shows all company records from the company table.
 *
 * @author K.SELVAKUMAR
 */
public class CompanyManagement extends JInternalFrame {

    private final DataUtil util;
    private JTable table;
    private DefaultTableModel tableModel;

    private static final String[] COLUMNS = {
            "Company ID", "Company Name", "Address 1", "Address 2", "Address 3",
            "Address 4", "State", "State Code", "Tax Type", "Bill Prefix",
            "Bill Format", "Bill Head", "Estimate Head", "Currency", "Currency Symbol",
            "UPI ID", "R.Price", "W.Price", "Stock Bill", "Less P.Rate",
            "Cust. Details", "Default Sales", "Batch/Size", "Exp Date", "Mfg Date",
            "Weighing Button", "Decimal Places", "Round", "Last Updated", "Logo Path"
    };

    private static final String QUERY = "SELECT companyID, cname, add1, add2, add3, add4, state, scode, ttype, letter, "
            +
            "bformat, bhead, ehead, cur_name, cur_symbol, upi_id, rprice, wprice, " +
            "stock_bill, less_prate, cust_details, dsales, batch, exp, mfg, " +
            "weighing_button, hmany, round, last, logo_path FROM company";

    public CompanyManagement(DataUtil util) {
        super("Company Management", true, true, true, true);
        this.util = util;
        initUI();
        loadData();
    }

    private void initUI() {
        setSize(1100, 520);
        setLayout(new BorderLayout(0, 4));

        java.net.URL iconUrl = ClassLoader.getSystemResource("images/icon.png");
        if (iconUrl != null) {
            setFrameIcon(new ImageIcon(iconUrl));
        }

        // North panel: title + toolbar
        JPanel northPanel = new JPanel(new BorderLayout());
        JLabel title = new JLabel("Company Management");
        title.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 18));
        title.setHorizontalAlignment(SwingConstants.CENTER);
        title.setBorder(BorderFactory.createEmptyBorder(6, 0, 4, 0));
        northPanel.add(title, BorderLayout.NORTH);

        JPanel toolbar = new JPanel(new FlowLayout(FlowLayout.LEFT, 10, 4));
        toolbar.setBorder(BorderFactory.createEmptyBorder(0, 4, 2, 0));
        JButton newCompanyBtn = new JButton("New Company");
        newCompanyBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        newCompanyBtn.setBackground(new java.awt.Color(51, 153, 255));
        newCompanyBtn.setForeground(java.awt.Color.WHITE);
        newCompanyBtn.setPreferredSize(new Dimension(160, 34));
        newCompanyBtn.addActionListener(e -> openNewCompanyForm());
        toolbar.add(newCompanyBtn);

        JButton editCompanyBtn = new JButton("Edit");
        editCompanyBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        editCompanyBtn.setBackground(new java.awt.Color(255, 153, 0));
        editCompanyBtn.setForeground(java.awt.Color.WHITE);
        editCompanyBtn.setPreferredSize(new Dimension(120, 34));
        editCompanyBtn.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row < 0) {
                javax.swing.JOptionPane.showMessageDialog(this,
                        "Please select a company to edit.", "No Selection",
                        javax.swing.JOptionPane.WARNING_MESSAGE);
                return;
            }
            Object val = tableModel.getValueAt(row, 0);
            if (val == null || val.toString().isEmpty())
                return;
            openEditCompanyForm(val.toString());
        });
        toolbar.add(editCompanyBtn);

        JButton deleteCompanyBtn = new JButton("Delete");
        deleteCompanyBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        deleteCompanyBtn.setBackground(new java.awt.Color(220, 53, 69));
        deleteCompanyBtn.setForeground(java.awt.Color.WHITE);
        deleteCompanyBtn.setPreferredSize(new Dimension(120, 34));
        deleteCompanyBtn.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row < 0) {
                javax.swing.JOptionPane.showMessageDialog(this,
                        "Please select a company to delete.", "No Selection",
                        javax.swing.JOptionPane.WARNING_MESSAGE);
                return;
            }
            Object idVal = tableModel.getValueAt(row, 0);
            Object nameVal = tableModel.getValueAt(row, 1);
            if (idVal == null || idVal.toString().isEmpty())
                return;
            deleteCompany(idVal.toString(), nameVal != null ? nameVal.toString() : "");
        });
        toolbar.add(deleteCompanyBtn);

        JButton termsBtn = new JButton("Terms & Conditions");
        termsBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        termsBtn.setBackground(new java.awt.Color(0, 153, 76));
        termsBtn.setForeground(java.awt.Color.WHITE);
        termsBtn.setPreferredSize(new Dimension(180, 34));
        termsBtn.addActionListener(e -> {
            int row = table.getSelectedRow();
            if (row < 0) {
                JOptionPane.showMessageDialog(this,
                        "Please select a company first.", "No Selection",
                        JOptionPane.WARNING_MESSAGE);
                return;
            }
            Object val = tableModel.getValueAt(row, 0);
            if (val == null || val.toString().isEmpty())
                return;
            openTermsDialog(val.toString());
        });
        toolbar.add(termsBtn);

        northPanel.add(toolbar, BorderLayout.SOUTH);

        add(northPanel, BorderLayout.NORTH);

        // Table
        tableModel = new DefaultTableModel(COLUMNS, 0) {
            @Override
            public boolean isCellEditable(int row, int col) {
                return false;
            }
        };
        table = new JTable(tableModel);
        table.setFont(new java.awt.Font("Arial", java.awt.Font.PLAIN, 13));
        table.getTableHeader().setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        table.setRowHeight(24);
        table.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
        table.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);

        // Set preferred column widths
        int[] widths = {
                90, 200, 180, 150, 150, 120, 100, 80, 130, 70,
                160, 150, 150, 80, 80, 180, 80, 80, 80, 80,
                80, 100, 70, 70, 70, 100, 80, 60, 160, 220
        };
        for (int i = 0; i < widths.length && i < table.getColumnCount(); i++) {
            table.getColumnModel().getColumn(i).setPreferredWidth(widths[i]);
        }

        JScrollPane scrollPane = new JScrollPane(table,
                JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED,
                JScrollPane.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        add(scrollPane, BorderLayout.CENTER);

        // Button panel
        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 6));

        JButton refreshBtn = new JButton("Refresh");
        refreshBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        refreshBtn.setPreferredSize(new Dimension(110, 34));
        refreshBtn.addActionListener(e -> loadData());
        btnPanel.add(refreshBtn);

        JButton closeBtn = new JButton("Close");
        closeBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        closeBtn.setPreferredSize(new Dimension(110, 34));
        closeBtn.addActionListener(e -> dispose());
        btnPanel.add(closeBtn);

        add(btnPanel, BorderLayout.SOUTH);
    }

    private void openTermsDialog(String companyID) {
        java.awt.Window parentWindow = SwingUtilities.getWindowAncestor(this);
        JDialog dialog = new JDialog(
                parentWindow instanceof java.awt.Frame ? (java.awt.Frame) parentWindow : null,
                "Terms & Conditions - Company " + companyID, true);
        dialog.setSize(500, 420);
        dialog.setLocationRelativeTo(parentWindow);
        dialog.setLayout(new BorderLayout(8, 8));

        JTabbedPane tabbedPane = new JTabbedPane();
        tabbedPane.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));

        JTextArea salesArea = new JTextArea();
        salesArea.setFont(new java.awt.Font("Arial", java.awt.Font.PLAIN, 13));
        salesArea.setLineWrap(true);
        salesArea.setWrapStyleWord(true);
        tabbedPane.addTab("Sales Invoice", new JScrollPane(salesArea));

        JTextArea estimateArea = new JTextArea();
        estimateArea.setFont(new java.awt.Font("Arial", java.awt.Font.PLAIN, 13));
        estimateArea.setLineWrap(true);
        estimateArea.setWrapStyleWord(true);
        tabbedPane.addTab("Estimate", new JScrollPane(estimateArea));

        // Load existing terms
        try {
            PreparedStatement ps = util.getConnection().prepareStatement(
                    "SELECT IFNULL(sales_terms,''), IFNULL(estimate_terms,'') FROM company WHERE companyID = ?");
            ps.setString(1, companyID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                salesArea.setText(rs.getString(1));
                estimateArea.setText(rs.getString(2));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        dialog.add(tabbedPane, BorderLayout.CENTER);

        JPanel btnPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT, 10, 8));
        JButton saveBtn = new JButton("Save");
        saveBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        saveBtn.setBackground(new java.awt.Color(51, 153, 255));
        saveBtn.setForeground(java.awt.Color.WHITE);
        saveBtn.setPreferredSize(new Dimension(100, 34));
        saveBtn.addActionListener(ev -> {
            try {
                PreparedStatement ps = util.getConnection().prepareStatement(
                        "UPDATE company SET sales_terms = ?, estimate_terms = ? WHERE companyID = ?");
                ps.setString(1, salesArea.getText());
                ps.setString(2, estimateArea.getText());
                ps.setString(3, companyID);
                ps.executeUpdate();
                JOptionPane.showMessageDialog(dialog,
                        "Terms & Conditions saved successfully.", "Saved",
                        JOptionPane.INFORMATION_MESSAGE);
                dialog.dispose();
            } catch (Exception ex) {
                JOptionPane.showMessageDialog(dialog,
                        "Error saving: " + ex.getMessage(), "Error",
                        JOptionPane.ERROR_MESSAGE);
            }
        });
        btnPanel.add(saveBtn);

        JButton cancelBtn = new JButton("Cancel");
        cancelBtn.setFont(new java.awt.Font("Arial", java.awt.Font.BOLD, 13));
        cancelBtn.setPreferredSize(new Dimension(100, 34));
        cancelBtn.addActionListener(ev -> dialog.dispose());
        btnPanel.add(cancelBtn);

        dialog.add(btnPanel, BorderLayout.SOUTH);
        dialog.setVisible(true);
    }

    private void openNewCompanyForm() {
        java.awt.Window parentWindow = SwingUtilities.getWindowAncestor(this);

        // Build the setting_bill form and transfer its content pane into a
        // standalone JFrame so the window is a real OS-level window that can
        // be freely dragged anywhere on screen (not constrained to the desktop pane).
        setting_bill form = new setting_bill(util);

        // Clear data loaded by view() so the form opens blank for a new entry
        form.clear();

        // Auto-assign next companyID (max existing numeric value + 1)
        try {
            ResultSet idRs = util.doQuery(
                    "SELECT COALESCE(MAX(CAST(companyID AS UNSIGNED)), 0) + 1 FROM company");
            if (idRs.next()) {
                form.setCompanyID(idRs.getString(1));
            }
        } catch (Exception ignored) {
        }

        javax.swing.JFrame frame = new javax.swing.JFrame("Company Details");
        frame.setDefaultCloseOperation(javax.swing.JFrame.DISPOSE_ON_CLOSE);
        frame.setContentPane(form.getContentPane()); // transfers the scroll pane
        frame.setSize(890, 790);
        frame.setMinimumSize(new Dimension(640, 520));
        frame.setResizable(true);
        frame.setLocationRelativeTo(parentWindow);

        java.net.URL iconUrl = ClassLoader.getSystemResource("images/icon.png");
        if (iconUrl != null) {
            frame.setIconImage(new javax.swing.ImageIcon(iconUrl).getImage());
        }

        // When the JFrame window is closed, refresh the table.
        frame.addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosed(java.awt.event.WindowEvent e) {
                loadData();
            }
        });

        // Bridge the setting_bill Close button (calls form.dispose() → fires
        // INTERNAL_FRAME_CLOSED) to closing the JFrame.
        form.addInternalFrameListener(new InternalFrameAdapter() {
            @Override
            public void internalFrameClosed(InternalFrameEvent e) {
                frame.dispose();
            }
        });

        frame.setVisible(true);
    }

    private void openEditCompanyForm(String companyID) {
        java.awt.Window parentWindow = SwingUtilities.getWindowAncestor(this);
        setting_bill form = new setting_bill(util);
        form.clear();
        form.loadByCompanyID(companyID);

        javax.swing.JFrame frame = new javax.swing.JFrame("Edit Company - " + companyID);
        frame.setDefaultCloseOperation(javax.swing.JFrame.DISPOSE_ON_CLOSE);
        frame.setContentPane(form.getContentPane());
        frame.setSize(890, 790);
        frame.setMinimumSize(new Dimension(640, 520));
        frame.setResizable(true);
        frame.setLocationRelativeTo(parentWindow);

        java.net.URL iconUrl = ClassLoader.getSystemResource("images/icon.png");
        if (iconUrl != null) {
            frame.setIconImage(new javax.swing.ImageIcon(iconUrl).getImage());
        }

        frame.addWindowListener(new java.awt.event.WindowAdapter() {
            @Override
            public void windowClosed(java.awt.event.WindowEvent e) {
                loadData();
            }
        });

        form.addInternalFrameListener(new InternalFrameAdapter() {
            @Override
            public void internalFrameClosed(InternalFrameEvent e) {
                frame.dispose();
            }
        });

        frame.setVisible(true);
    }

    private void deleteCompany(String companyID, String companyName) {
        int confirm = javax.swing.JOptionPane.showConfirmDialog(this,
                "Delete company '" + companyName + "' (ID: " + companyID + ")?\nThis cannot be undone.",
                "Confirm Delete", javax.swing.JOptionPane.YES_NO_OPTION,
                javax.swing.JOptionPane.WARNING_MESSAGE);
        if (confirm != javax.swing.JOptionPane.YES_OPTION)
            return;
        try {
            PreparedStatement ps = util.getConnection().prepareStatement(
                    "DELETE FROM company WHERE companyID = ?");
            ps.setString(1, companyID);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                javax.swing.JOptionPane.showMessageDialog(this,
                        "Company deleted successfully.", "Deleted",
                        javax.swing.JOptionPane.INFORMATION_MESSAGE);
                loadData();
            }
        } catch (Exception e) {
            javax.swing.JOptionPane.showMessageDialog(this,
                    "Error deleting company: " + e.getMessage(), "Error",
                    javax.swing.JOptionPane.ERROR_MESSAGE);
        }
    }

    private void loadData() {
        tableModel.setRowCount(0);
        try {
            ResultSet rs = util.doQuery(QUERY);
            while (rs.next()) {
                Object[] row = new Object[COLUMNS.length];
                row[0] = rs.getString("companyID");
                row[1] = rs.getString("cname");
                row[2] = rs.getString("add1");
                row[3] = rs.getString("add2");
                row[4] = rs.getString("add3");
                row[5] = rs.getString("add4");
                row[6] = rs.getString("state");
                row[7] = rs.getString("scode");
                row[8] = rs.getString("ttype");
                row[9] = rs.getString("letter");
                row[10] = rs.getString("bformat");
                row[11] = rs.getString("bhead");
                row[12] = rs.getString("ehead");
                row[13] = rs.getString("cur_name");
                row[14] = rs.getString("cur_symbol");
                row[15] = rs.getString("upi_id");
                row[16] = rs.getString("rprice");
                row[17] = rs.getString("wprice");
                row[18] = rs.getString("stock_bill");
                row[19] = rs.getString("less_prate");
                row[20] = rs.getString("cust_details");
                row[21] = rs.getString("dsales");
                row[22] = rs.getString("batch");
                row[23] = rs.getBoolean("exp") ? "Yes" : "No";
                row[24] = rs.getBoolean("mfg") ? "Yes" : "No";
                row[25] = rs.getString("weighing_button");
                row[26] = rs.getString("hmany");
                row[27] = rs.getString("round");
                row[28] = rs.getString("last");
                row[29] = rs.getString("logo_path");
                tableModel.addRow(row);
            }
            if (tableModel.getRowCount() == 0) {
                tableModel.addRow(new Object[] { "-- No company records found --" });
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}
