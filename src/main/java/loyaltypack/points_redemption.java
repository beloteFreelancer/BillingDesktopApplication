package loyaltypack;

import Utils.ColorConstants;
import Utils.POSWeighing;
import com.selrom.db.DataUtil;
import custpack.cust_master;
import menupack.UserSession;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.swing.*;

public class points_redemption extends javax.swing.JInternalFrame {

    DataUtil util = null;
    String username = "Admin";
    private boolean canRedeem = false;
    private double conversionRate = 1.0;
    private int minRedemption = 100;

    public points_redemption(DataUtil util) {
        this.util = util;
        initComponents();

        // Set frame icon safely
        try {
            ImageIcon frameIcon = ColorConstants.loadIcon("/icons/trophy.png");
            if (frameIcon != null) {
                this.setFrameIcon(frameIcon);
            }
        } catch (Exception e) {
            System.err.println("Could not load frame icon: " + e.getMessage());
        }

        get_redemption_settings();
        t1.requestFocus();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        t1 = new javax.swing.JTextField();
        t2 = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        t3 = new javax.swing.JTextField();
        jLabel4 = new javax.swing.JLabel();
        t4 = new javax.swing.JTextField();
        jLabel5 = new javax.swing.JLabel();
        t5 = new javax.swing.JTextField();
        jLabel6 = new javax.swing.JLabel();
        t6 = new javax.swing.JTextField();
        jLabel7 = new javax.swing.JLabel();
        t7 = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        t8 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        jSeparator1 = new javax.swing.JSeparator();

        setClosable(true);
        setIconifiable(true);
        setMaximizable(true);
        setResizable(true);
        setTitle("🎁 Loyalty Points Redemption");
        setPreferredSize(new java.awt.Dimension(650, 550));

        jLabel1.setFont(new java.awt.Font("Arial", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(0, 102, 204));
        jLabel1.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel1.setText("🎁 LOYALTY POINTS REDEMPTION");

        jLabel2.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel2.setText("Customer ID:");

        t1.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        t1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                t1ActionPerformed(evt);
            }
        });
        t1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                t1KeyReleased(evt);
            }
        });

        t2.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        t2.setEditable(false);
        t2.setBackground(new java.awt.Color(240, 240, 240));

        jLabel3.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel3.setText("Customer Name:");

        t3.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        t3.setEditable(false);
        t3.setBackground(new java.awt.Color(240, 240, 240));

        jLabel4.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel4.setText("Mobile:");

        t4.setFont(new java.awt.Font("Arial", 1, 16)); // NOI18N
        t4.setForeground(new java.awt.Color(0, 153, 51));
        t4.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        t4.setEditable(false);
        t4.setBackground(new java.awt.Color(245, 255, 245));

        jLabel5.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel5.setText("Available Points:");

        t5.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        t5.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        t5.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                t5KeyReleased(evt);
            }
        });

        jLabel6.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel6.setText("Points to Redeem:");

        t6.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        t6.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        t6.setEditable(false);
        t6.setBackground(new java.awt.Color(240, 240, 240));

        jLabel7.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel7.setText("Conversion Rate (₹):");

        t7.setFont(new java.awt.Font("Arial", 1, 16)); // NOI18N
        t7.setForeground(new java.awt.Color(255, 102, 0));
        t7.setHorizontalAlignment(javax.swing.JTextField.RIGHT);
        t7.setEditable(false);
        t7.setBackground(new java.awt.Color(255, 250, 240));

        jLabel8.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel8.setText("Cash Amount (₹):");

        t8.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N

        jButton1.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jButton1.setIcon(ColorConstants.loadIcon("/icons/search.png"));
        jButton1.setText("Search Customer");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jButton2.setIcon(ColorConstants.loadIcon("/icons/money.png"));
        jButton2.setText("Redeem Points");
        jButton2.setBackground(new java.awt.Color(0, 153, 51));
        jButton2.setForeground(Color.WHITE);
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jButton3.setIcon(ColorConstants.loadIcon("/icons/clear.png"));
        jButton3.setText("Clear");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jButton4.setIcon(ColorConstants.loadIcon("/icons/close.png"));
        jButton4.setText("Close");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        jLabel9.setFont(new java.awt.Font("Arial", 0, 12)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(102, 102, 102));
        jLabel9.setText("Minimum redemption:");

        jLabel10.setFont(new java.awt.Font("Arial", 1, 12)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(153, 0, 0));
        jLabel10.setText("100 points");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(20, 20, 20)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jLabel1, javax.swing.GroupLayout.DEFAULT_SIZE, 600,
                                                Short.MAX_VALUE)
                                        .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout
                                                        .createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                150, javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                120, javax.swing.GroupLayout.PREFERRED_SIZE))
                                                .addGap(10, 10, 10)
                                                .addGroup(layout
                                                        .createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                                        .addGroup(layout.createSequentialGroup()
                                                                .addComponent(t1,
                                                                        javax.swing.GroupLayout.PREFERRED_SIZE, 150,
                                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addGap(10, 10, 10)
                                                                .addComponent(jButton1))
                                                        .addComponent(t2, javax.swing.GroupLayout.PREFERRED_SIZE, 300,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t3, javax.swing.GroupLayout.PREFERRED_SIZE, 200,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t4, javax.swing.GroupLayout.PREFERRED_SIZE, 150,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t5, javax.swing.GroupLayout.PREFERRED_SIZE, 150,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t6, javax.swing.GroupLayout.PREFERRED_SIZE, 150,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t7, javax.swing.GroupLayout.PREFERRED_SIZE, 150,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(t8, javax.swing.GroupLayout.PREFERRED_SIZE, 200,
                                                                javax.swing.GroupLayout.PREFERRED_SIZE)))
                                        .addComponent(jSeparator1)
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(jLabel9)
                                                .addGap(10, 10, 10)
                                                .addComponent(jLabel10))
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 140,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(20, 20, 20)
                                                .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 100,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(20, 20, 20)
                                                .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 100,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addGap(20, 20, 20)));
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(20, 20, 20)
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 40,
                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(20, 20, 20)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel2, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t1, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jButton1, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel3, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t2, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel4, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t3, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel5, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t4, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(15, 15, 15)
                                .addComponent(jSeparator1, javax.swing.GroupLayout.PREFERRED_SIZE, 10,
                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel6, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t5, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel7, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t6, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel8, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(t7, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(10, 10, 10)
                                .addComponent(t8, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(20, 20, 20)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel9)
                                        .addComponent(jLabel10))
                                .addGap(20, 20, 20)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jButton2, javax.swing.GroupLayout.PREFERRED_SIZE, 35,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jButton3, javax.swing.GroupLayout.PREFERRED_SIZE, 35,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jButton4, javax.swing.GroupLayout.PREFERRED_SIZE, 35,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addContainerGap(20, Short.MAX_VALUE)));

        pack();
    }// </editor-fold>

    private void get_redemption_settings() {
        try {
            // First try with new columns, fall back to defaults if columns don't exist yet
            String query = "SELECT min_redemption, conversion_rate, redemption_enabled FROM setting_points";
            ResultSet rs = util.doQuery(query);
            if (rs.next()) {
                minRedemption = rs.getInt("min_redemption");
                conversionRate = rs.getDouble("conversion_rate");
                canRedeem = rs.getString("redemption_enabled").equalsIgnoreCase("Yes");
            } else {
                // No settings exist yet — use safe defaults
                minRedemption = 100;
                conversionRate = 1.0;
                canRedeem = true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Columns may not exist yet in older installs — use defaults silently
            System.out.println("Redemption settings not yet configured, using defaults.");
            minRedemption = 100;
            conversionRate = 1.0;
            canRedeem = true;

            // Try to add missing columns automatically (MySQL-compatible, no IF NOT EXISTS)
            try {
                java.sql.Connection conn2 = util.getConnection();
                java.sql.DatabaseMetaData meta = conn2.getMetaData();
                String[][] cols = {
                        { "min_redemption", "int NOT NULL DEFAULT 100" },
                        { "conversion_rate", "decimal(5,2) NOT NULL DEFAULT 1.00" },
                        { "redemption_enabled", "varchar(5) NOT NULL DEFAULT 'Yes'" }
                };
                for (String[] col : cols) {
                    try (java.sql.ResultSet rs = meta.getColumns(conn2.getCatalog(), null, "setting_points", col[0])) {
                        if (!rs.next()) {
                            util.doManipulation("ALTER TABLE setting_points ADD COLUMN " + col[0] + " " + col[1]);
                        }
                    }
                }
            } catch (Exception ex) {
                System.out.println("Auto-migration skipped: " + ex.getMessage());
            }
        }

        jLabel10.setText(minRedemption + " points");
        t6.setText(String.format("%.2f", conversionRate));

        if (!canRedeem) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Points Redemption is Currently Disabled</h2>" +
                            "<p>Please contact administrator to enable this feature.</p></html>",
                    "Feature Disabled", JOptionPane.WARNING_MESSAGE);
        }
    }

    private void get_customer_details() {
        if (t1.getText().trim().isEmpty()) {
            return;
        }

        try {
            String query = "SELECT c.cname, c.mobile, COALESCE(p.points, 0) as points " +
                    "FROM cust c LEFT JOIN cust_points p ON c.cid = p.cid " +
                    "WHERE c.cid = '" + t1.getText().trim() + "'";

            ResultSet rs = util.doQuery(query);
            if (rs.next()) {
                t2.setText(rs.getString("cname"));
                t3.setText(rs.getString("mobile"));
                t4.setText(String.format("%.0f", rs.getDouble("points")));
                t5.setText(""); // Clear points to redeem
                calculate_amounts();
            } else {
                clear_customer_details();
                JOptionPane.showMessageDialog(this,
                        "<html><h2>Customer Not Found!</h2>" +
                                "<p>Customer ID: " + t1.getText() + " does not exist.</p></html>",
                        "Not Found", JOptionPane.ERROR_MESSAGE);
            }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Error getting customer details: " + e.getMessage());
            clear_customer_details();
        }
    }

    private void clear_customer_details() {
        t2.setText("");
        t3.setText("");
        t4.setText("0");
        t5.setText("");
        t7.setText("0.00");
        t8.setText("");
    }

    private void calculate_amounts() {
        try {
            double pointsToRedeem = Double.parseDouble(t5.getText().isEmpty() ? "0" : t5.getText());
            double availablePoints = Double.parseDouble(t4.getText().isEmpty() ? "0" : t4.getText());

            if (pointsToRedeem > availablePoints) {
                t7.setText("0.00");
                t8.setText("Insufficient Points!");
                return;
            }

            double cashAmount = pointsToRedeem * conversionRate;
            t7.setText(String.format("%.2f", cashAmount));
            t8.setText(String.format("%.2f", cashAmount));

        } catch (NumberFormatException e) {
            t7.setText("0.00");
            t8.setText("Invalid Input");
        }
    }

    private void redeem_points() {
        if (!canRedeem) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Points Redemption is Disabled</h2></html>",
                    "Feature Disabled", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Validate inputs
        if (t1.getText().trim().isEmpty() || t2.getText().trim().isEmpty()) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Please select a customer first!</h2></html>",
                    "Customer Required", JOptionPane.WARNING_MESSAGE);
            return;
        }

        if (t5.getText().trim().isEmpty() || Double.parseDouble(t5.getText()) <= 0) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Please enter points to redeem!</h2></html>",
                    "Points Required", JOptionPane.WARNING_MESSAGE);
            return;
        }

        double pointsToRedeem = Double.parseDouble(t5.getText());
        double availablePoints = Double.parseDouble(t4.getText());

        // Validate minimum redemption
        if (pointsToRedeem < minRedemption) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Minimum " + minRedemption + " points required for redemption!</h2>" +
                            "<p>You entered: " + (int) pointsToRedeem + " points</p></html>",
                    "Minimum Not Met", JOptionPane.WARNING_MESSAGE);
            return;
        }

        // Validate sufficient points
        if (pointsToRedeem > availablePoints) {
            JOptionPane.showMessageDialog(this,
                    "<html><h2>Insufficient Points!</h2>" +
                            "<p>Available: " + (int) availablePoints + " points</p>" +
                            "<p>Requested: " + (int) pointsToRedeem + " points</p></html>",
                    "Insufficient Points", JOptionPane.ERROR_MESSAGE);
            return;
        }

        double cashAmount = pointsToRedeem * conversionRate;

        // Confirm redemption
        int confirm = JOptionPane.showConfirmDialog(this,
                "<html><h2>Confirm Points Redemption</h2>" +
                        "<p><b>Customer:</b> " + t2.getText() + "</p>" +
                        "<p><b>Points to Redeem:</b> " + (int) pointsToRedeem + " points</p>" +
                        "<p><b>Cash Amount:</b> ₹" + String.format("%.2f", cashAmount) + "</p>" +
                        "<p><b>Remaining Points:</b> " + (int) (availablePoints - pointsToRedeem) + " points</p>" +
                        "</html>",
                "Confirm Redemption", JOptionPane.YES_NO_OPTION);

        if (confirm != JOptionPane.YES_OPTION) {
            return;
        }

        // Process redemption
        try {
            String currentDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            String currentTime = new SimpleDateFormat("HH:mm:ss").format(new Date());
            String timestamp = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss a").format(new Date());

            ArrayList<String> queries = new ArrayList<>();

            // 1. Record in points_redemption table
            String redemptionQuery = "INSERT INTO points_redemption " +
                    "(dat, tim, cid, cname, mobile, points_redeemed, cash_amount, conversion_rate, redemption_type, user, last, company_id) "
                    +
                    "VALUES ('" + currentDate + "', '" + currentTime + "', '" + t1.getText() + "', '" +
                    t2.getText().replace("'", "''") + "', '" + t3.getText() + "', " + pointsToRedeem + ", " +
                    cashAmount + ", " + conversionRate + ", 'CASH', '" + username + "', '" + timestamp + "', '" +
                    UserSession.getSelectedCompanyID() + "')";
            queries.add(redemptionQuery);

            // 2. Record in cust_points1 (transaction history)
            String historyQuery = "INSERT INTO cust_points1 " +
                    "(sno, dat, tim, cid, mobile, points, remarks, user, last) " +
                    "VALUES ((SELECT COALESCE(MAX(sno), 0) + 1 FROM cust_points1 alias), '" +
                    currentDate + "', '" + currentTime + "', '" + t1.getText() + "', '" + t3.getText() +
                    "', " + pointsToRedeem + ", 'Points Redemption - Cash ₹" + String.format("%.2f", cashAmount) +
                    "', '" + username + "', '" + timestamp + "')";
            queries.add(historyQuery);

            // 3. Deduct points from customer balance
            String deductQuery = "UPDATE cust_points SET points = points - " + pointsToRedeem +
                    " WHERE cid = '" + t1.getText() + "'";
            queries.add(deductQuery);

            // Execute all queries as batch
            int result = util.doManipulation_Batch(queries);

            if (result == 1) {
                JOptionPane.showMessageDialog(this,
                        "<html><h1>✅ Redemption Successful!</h1>" +
                                "<p><b>Points Redeemed:</b> " + (int) pointsToRedeem + " points</p>" +
                                "<p><b>Cash Paid:</b> ₹" + String.format("%.2f", cashAmount) + "</p>" +
                                "<p><b>Remaining Points:</b> " + (int) (availablePoints - pointsToRedeem)
                                + " points</p>" +
                                "</html>",
                        "Success", JOptionPane.INFORMATION_MESSAGE);

                // Refresh customer details to show updated balance
                get_customer_details();
                t5.setText("");
                t7.setText("0.00");
                t8.setText("");

            } else {
                JOptionPane.showMessageDialog(this,
                        "<html><h2>❌ Redemption Failed!</h2>" +
                                "<p>Please try again or contact administrator.</p></html>",
                        "Error", JOptionPane.ERROR_MESSAGE);
            }

        } catch (Exception e) {
            System.out.println("Error processing redemption: " + e.getMessage());
            JOptionPane.showMessageDialog(this,
                    "<html><h2>❌ Error Processing Redemption!</h2>" +
                            "<p>" + e.getMessage() + "</p></html>",
                    "Database Error", JOptionPane.ERROR_MESSAGE);
        }
    }

    private void t1ActionPerformed(java.awt.event.ActionEvent evt) {
        get_customer_details();
    }

    private void t1KeyReleased(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            get_customer_details();
        }
    }

    private void t5KeyReleased(java.awt.event.KeyEvent evt) {
        calculate_amounts();
    }

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
        try {
            cust_master instance = new cust_master(util);
            instance.setVisible(true);
        } catch (Exception e) {
            System.out.println("Error opening customer master: " + e.getMessage());
        }
    }

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {
        redeem_points();
    }

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {
        // Clear all fields
        t1.setText("");
        clear_customer_details();
        t1.requestFocus();
    }

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {
        this.dispose();
    }

    // Variables declaration - do not modify
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JTextField t1;
    private javax.swing.JTextField t2;
    private javax.swing.JTextField t3;
    private javax.swing.JTextField t4;
    private javax.swing.JTextField t5;
    private javax.swing.JTextField t6;
    private javax.swing.JTextField t7;
    private javax.swing.JTextField t8;
    // End of variables declaration
}