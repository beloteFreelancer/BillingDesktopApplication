package loyaltypack;

import Utils.ColorConstants;
import com.selrom.db.DataUtil;
import java.awt.HeadlessException;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

/**
 *
 * @author K.SELVAKUMAR, copyrights K.SELVAKUMAR, +91 99427 32229,
 *         mysoft.java@gmail.com
 */
public final class points_setting extends javax.swing.JInternalFrame {

    DataUtil util = null;

    final void button_short() {
        closebutton.setText("<html><b>Close</b><br>(Alt+O)</h6><html>");
        savebutton.setText("<html><b>Save</b><br>(Alt+S)</h6><html>");
        titlelablel.setText("<html><u>Loyalty Points & Redemption Setting</u></html>");
        setTitle("Loyalty Points & Redemption Setting");
        this.setSize(550, 420);
        ImageIcon icon = ColorConstants.loadIcon("/images/icon.png");
        if (icon != null) {
            this.setFrameIcon(icon);
        }
    }

    void get_display() {
        try {
            ResultSet r;
            String query = "select points_option,hmuch,pfor,min_redemption,conversion_rate,redemption_enabled from setting_points";
            r = util.doQuery(query);
            while (r.next()) {
                h1.setSelectedItem(r.getString(1));
                h2.setText(r.getString(2));
                h3.setText(r.getString(3));
                h4.setText(r.getString(4));
                h5.setText(r.getString(5));
                h6.setSelectedItem(r.getString(6));
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
    }

    public points_setting(DataUtil util) {
        initComponents();
        button_short();
        this.util = util;
        get_display();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated
    // Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        closebutton = new javax.swing.JButton();
        titlelablel = new javax.swing.JLabel();
        savebutton = new javax.swing.JButton();
        h1 = new javax.swing.JComboBox<>();
        jLabel9 = new javax.swing.JLabel();
        h3 = new javax.swing.JTextField();
        h2 = new javax.swing.JTextField();
        jLabel12 = new javax.swing.JLabel();
        jLabel13 = new javax.swing.JLabel();
        jLabel14 = new javax.swing.JLabel();
        h4 = new javax.swing.JTextField();
        jLabel15 = new javax.swing.JLabel();
        h5 = new javax.swing.JTextField();
        jLabel16 = new javax.swing.JLabel();
        h6 = new javax.swing.JComboBox<>();
        jSeparator1 = new javax.swing.JSeparator();
        jLabel17 = new javax.swing.JLabel();

        setClosable(true);
        getContentPane().setLayout(null);

        closebutton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        closebutton.setIcon(ColorConstants.loadIcon("/icons/close45.png")); // NOI18N
        closebutton.setMnemonic('o');
        closebutton.setText("Close");
        closebutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                closebuttonActionPerformed(evt);
            }
        });
        getContentPane().add(closebutton);
        closebutton.setBounds(390, 320, 130, 50);

        titlelablel.setFont(new java.awt.Font("Arial", 1, 18)); // NOI18N
        titlelablel.setText("Loyalty Points & Redemption Setting");
        getContentPane().add(titlelablel);
        titlelablel.setBounds(10, 0, 350, 30);

        savebutton.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        savebutton.setIcon(ColorConstants.loadIcon("/icons/save45.png")); // NOI18N
        savebutton.setMnemonic('s');
        savebutton.setText("Save");
        savebutton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                savebuttonActionPerformed(evt);
            }
        });
        getContentPane().add(savebutton);
        savebutton.setBounds(260, 320, 130, 50);

        h1.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        h1.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "No", "Yes" }));
        getContentPane().add(h1);
        h1.setBounds(160, 50, 150, 30);

        jLabel9.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel9.setText("Points for Amount (₹)");
        getContentPane().add(jLabel9);
        jLabel9.setBounds(20, 110, 130, 30);

        h3.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        getContentPane().add(h3);
        h3.setBounds(160, 110, 150, 30);

        h2.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        getContentPane().add(h2);
        h2.setBounds(160, 80, 150, 30);

        jLabel12.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel12.setText("Points Option");
        getContentPane().add(jLabel12);
        jLabel12.setBounds(20, 50, 130, 30);

        jLabel13.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel13.setText("How Many Points");
        getContentPane().add(jLabel13);
        jLabel13.setBounds(20, 80, 130, 30);

        jLabel14.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel14.setText("Min. Redemption");
        getContentPane().add(jLabel14);
        jLabel14.setBounds(20, 180, 130, 30);

        h4.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        h4.setText("100");
        getContentPane().add(h4);
        h4.setBounds(160, 180, 150, 30);

        jLabel15.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel15.setText("Conversion Rate (₹)");
        getContentPane().add(jLabel15);
        jLabel15.setBounds(20, 210, 130, 30);

        h5.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        h5.setText("1.00");
        getContentPane().add(h5);
        h5.setBounds(160, 210, 150, 30);

        jLabel16.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        jLabel16.setText("Redemption Enabled");
        getContentPane().add(jLabel16);
        jLabel16.setBounds(20, 240, 130, 30);

        h6.setFont(new java.awt.Font("Arial", 0, 14)); // NOI18N
        h6.setModel(new javax.swing.DefaultComboBoxModel<>(new String[] { "No", "Yes" }));
        h6.setSelectedIndex(1);
        getContentPane().add(h6);
        h6.setBounds(160, 240, 150, 30);

        jSeparator1.setOrientation(javax.swing.SwingConstants.HORIZONTAL);
        getContentPane().add(jSeparator1);
        jSeparator1.setBounds(20, 150, 500, 10);

        jLabel17.setFont(new java.awt.Font("Arial", 1, 14)); // NOI18N
        jLabel17.setForeground(new java.awt.Color(0, 102, 204));
        jLabel17.setText("🎁 REDEMPTION SETTINGS");
        getContentPane().add(jLabel17);
        jLabel17.setBounds(160, 155, 200, 20);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void savebuttonActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_savebuttonActionPerformed
        if (h2.getText().equals("")) {
            h2.setText(".");
        }
        if (h3.getText().equals("")) {
            h3.setText(".");
        }
        if (h4.getText().equals("")) {
            h4.setText("100");
        }
        if (h5.getText().equals("")) {
            h5.setText("1.00");
        }
        try {
            boolean selva = false;
            String query = "select points_option from setting_points";
            ResultSet r = util.doQuery(query);
            while (r.next()) {
                selva = true;
            }
            if (selva == false) {
                query = "insert into setting_points (points_option, hmuch, pfor, min_redemption, conversion_rate, redemption_enabled) values ('"
                        + h1.getSelectedItem() + "','" + h2.getText() + "','" + h3.getText() + "','" + h4.getText()
                        + "','" + h5.getText() + "','" + h6.getSelectedItem() + "')";
            } else {
                query = "update setting_points set points_option='" + h1.getSelectedItem() + "', hmuch='" + h2.getText()
                        + "',pfor='" + h3.getText() + "',min_redemption='" + h4.getText() + "',conversion_rate='"
                        + h5.getText() + "',redemption_enabled='" + h6.getSelectedItem() + "'";
            }
            int a = util.doManipulation(query);
            if (a > 0) {
                JOptionPane.showMessageDialog(this, "Saved /Updated Successfully", "Saved", JOptionPane.PLAIN_MESSAGE);
            }
        } catch (HeadlessException | ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }// GEN-LAST:event_savebuttonActionPerformed

    private void closebuttonActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_closebuttonActionPerformed
        this.dispose();
    }// GEN-LAST:event_closebuttonActionPerformed

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton closebutton;
    private javax.swing.JComboBox<String> h1;
    private javax.swing.JTextField h2;
    private javax.swing.JTextField h3;
    private javax.swing.JTextField h4;
    private javax.swing.JTextField h5;
    private javax.swing.JComboBox<String> h6;
    private javax.swing.JLabel jLabel12;
    private javax.swing.JLabel jLabel13;
    private javax.swing.JLabel jLabel14;
    private javax.swing.JLabel jLabel15;
    private javax.swing.JLabel jLabel16;
    private javax.swing.JLabel jLabel17;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JButton savebutton;
    private javax.swing.JLabel titlelablel;
    // End of variables declaration//GEN-END:variables
}
