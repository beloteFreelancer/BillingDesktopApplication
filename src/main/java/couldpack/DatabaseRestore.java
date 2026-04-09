package couldpack;

import Utils.ColorConstants;
import com.selrom.db.Database;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.Font;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.util.Properties;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JProgressBar;
import javax.swing.JTextField;
import javax.swing.SwingWorker;
import javax.swing.filechooser.FileNameExtensionFilter;

public class DatabaseRestore extends javax.swing.JInternalFrame {

    private JLabel titleLabel;
    private JTextField filePathField;
    private JButton browseButton;
    private JButton restoreButton;
    private JButton closeButton;
    private JProgressBar progressBar;
    private JLabel statusLabel;

    public DatabaseRestore() {
        initUI();
    }

    private void initUI() {
        setClosable(true);
        setTitle("Restore Database");
        setPreferredSize(new Dimension(520, 280));
        setSize(520, 280);
        getContentPane().setLayout(null);

        ImageIcon icon = ColorConstants.loadIcon("/images/icon.png");
        if (icon != null) {
            setFrameIcon(icon);
        }

        // Title
        titleLabel = new JLabel("<html><u>Restore Database from Backup</u></html>");
        titleLabel.setFont(new Font("Arial", Font.BOLD, 18));
        titleLabel.setBounds(10, 5, 400, 30);
        getContentPane().add(titleLabel);

        // File path label
        JLabel fileLabel = new JLabel("Backup File (.sql):");
        fileLabel.setFont(new Font("Segoe UI", Font.PLAIN, 14));
        fileLabel.setBounds(20, 50, 150, 25);
        getContentPane().add(fileLabel);

        // File path text field
        filePathField = new JTextField();
        filePathField.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        filePathField.setEditable(false);
        filePathField.setBounds(20, 78, 360, 32);
        getContentPane().add(filePathField);

        // Browse button
        browseButton = new JButton("Browse...");
        browseButton.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        browseButton.setBounds(390, 78, 100, 32);
        browseButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
        browseButton.addActionListener(e -> browseFile());
        getContentPane().add(browseButton);

        // Progress bar
        progressBar = new JProgressBar();
        progressBar.setIndeterminate(false);
        progressBar.setStringPainted(true);
        progressBar.setString("");
        progressBar.setBounds(20, 125, 470, 22);
        progressBar.setVisible(false);
        getContentPane().add(progressBar);

        // Status label
        statusLabel = new JLabel("");
        statusLabel.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        statusLabel.setBounds(20, 150, 470, 20);
        getContentPane().add(statusLabel);

        // Restore button
        restoreButton = new JButton("Restore Database");
        restoreButton.setFont(new Font("Segoe UI", Font.BOLD, 15));
        restoreButton.setBackground(new Color(255, 255, 204));
        restoreButton.setBounds(20, 180, 230, 45);
        restoreButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
        restoreButton.setIcon(ColorConstants.loadIcon("/icons/load45.jpg.png"));
        restoreButton.addActionListener(e -> restoreDatabase());
        getContentPane().add(restoreButton);

        // Close button
        closeButton = new JButton("Close");
        closeButton.setFont(new Font("Segoe UI", Font.PLAIN, 15));
        closeButton.setBackground(new Color(255, 255, 204));
        closeButton.setBounds(260, 180, 230, 45);
        closeButton.setCursor(new Cursor(Cursor.HAND_CURSOR));
        closeButton.setIcon(ColorConstants.loadIcon("/icons/close45.png"));
        closeButton.setMnemonic('o');
        closeButton.addActionListener(e -> dispose());
        getContentPane().add(closeButton);
    }

    private void browseFile() {
        JFileChooser chooser = new JFileChooser();
        chooser.setDialogTitle("Select Backup SQL File");
        chooser.setFileFilter(new FileNameExtensionFilter("SQL Backup Files (*.sql)", "sql"));
        chooser.setAcceptAllFileFilterUsed(false);

        int result = chooser.showOpenDialog(this);
        if (result == JFileChooser.APPROVE_OPTION) {
            File selected = chooser.getSelectedFile();
            filePathField.setText(selected.getAbsolutePath());
            statusLabel.setText("");
        }
    }

    private void restoreDatabase() {
        String filePath = filePathField.getText().trim();
        if (filePath.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Please select a backup SQL file first.",
                    "No File Selected", JOptionPane.WARNING_MESSAGE);
            return;
        }

        File backupFile = new File(filePath);
        if (!backupFile.exists() || !backupFile.isFile()) {
            JOptionPane.showMessageDialog(this, "Selected file does not exist.",
                    "File Not Found", JOptionPane.ERROR_MESSAGE);
            return;
        }

        int confirm = JOptionPane.showConfirmDialog(this,
                "<html><b>WARNING:</b> Restoring will replace ALL current data with the backup data.<br><br>"
                        + "File: " + backupFile.getName() + "<br>"
                        + "Size: " + String.format("%.2f", backupFile.length() / 1024.0) + " KB<br><br>"
                        + "Are you sure you want to continue?</html>",
                "Confirm Database Restore", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);

        if (confirm != JOptionPane.YES_OPTION) {
            return;
        }

        int confirm2 = JOptionPane.showConfirmDialog(this,
                "This action CANNOT be undone. Proceed with restore?",
                "Final Confirmation", JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE);

        if (confirm2 != JOptionPane.YES_OPTION) {
            return;
        }

        // Disable buttons during restore
        restoreButton.setEnabled(false);
        browseButton.setEnabled(false);
        closeButton.setEnabled(false);
        progressBar.setVisible(true);
        progressBar.setIndeterminate(true);
        progressBar.setString("Restoring...");
        statusLabel.setText("Restoring database, please do not close the application...");

        SwingWorker<Boolean, Void> worker = new SwingWorker<>() {
            String errorMessage = "";

            @Override
            protected Boolean doInBackground() {
                try {
                    Properties dbProps = Database.getInstance().loadConfig();
                    String dbUrl = dbProps.getProperty("db.url");
                    String dbUser = dbProps.getProperty("db.username");
                    String dbPass = dbProps.getProperty("db.password");

                    // Extract host, port and database name from JDBC URL
                    String urlPart = dbUrl.replace("jdbc:mysql://", "");
                    int qIdx = urlPart.indexOf('?');
                    if (qIdx > 0)
                        urlPart = urlPart.substring(0, qIdx);
                    int slashIdx = urlPart.indexOf('/');
                    String hostPort = (slashIdx > 0) ? urlPart.substring(0, slashIdx) : "localhost:3306";
                    String dbName = (slashIdx > 0) ? urlPart.substring(slashIdx + 1) : urlPart;
                    String host = hostPort.contains(":") ? hostPort.substring(0, hostPort.indexOf(':')) : hostPort;
                    String port = hostPort.contains(":") ? hostPort.substring(hostPort.indexOf(':') + 1) : "3306";

                    // Close existing connection before restore
                    Database.getInstance().closeConnection();

                    // Use mysql client to restore from SQL file
                    ProcessBuilder pb = new ProcessBuilder(
                            "mysql",
                            "-h", host,
                            "-P", port,
                            "-u", dbUser,
                            "--password=" + dbPass,
                            dbName);
                    pb.redirectInput(backupFile);
                    pb.redirectErrorStream(true);
                    Process process = pb.start();

                    // Read process output for error detection
                    StringBuilder output = new StringBuilder();
                    try (BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                        String line;
                        while ((line = reader.readLine()) != null) {
                            output.append(line).append("\n");
                        }
                    }

                    int exitCode = process.waitFor();
                    if (exitCode != 0) {
                        errorMessage = "mysql exited with code " + exitCode + ": " + output.toString().trim();
                        return false;
                    }

                    // Re-establish connection
                    Database.getInstance().getConnection();
                    return true;

                } catch (Exception ex) {
                    errorMessage = ex.getMessage();
                    return false;
                }
            }

            @Override
            protected void done() {
                progressBar.setIndeterminate(false);
                restoreButton.setEnabled(true);
                browseButton.setEnabled(true);
                closeButton.setEnabled(true);

                try {
                    if (get()) {
                        progressBar.setString("Restore Completed!");
                        progressBar.setValue(100);
                        statusLabel.setText("Database restored successfully.");
                        JOptionPane.showMessageDialog(DatabaseRestore.this,
                                "<html><h2>Database Restored Successfully!</h2>"
                                        + "<br>Please restart the application for changes to take full effect.</html>",
                                "Restore Complete", JOptionPane.INFORMATION_MESSAGE);
                    } else {
                        progressBar.setString("Restore Failed");
                        progressBar.setValue(0);
                        statusLabel.setText("Error: " + errorMessage);
                        JOptionPane.showMessageDialog(DatabaseRestore.this,
                                "<html><b>Restore Failed</b><br><br>" + errorMessage + "</html>",
                                "Restore Error", JOptionPane.ERROR_MESSAGE);
                    }
                } catch (Exception ex) {
                    progressBar.setString("Error");
                    statusLabel.setText("Error: " + ex.getMessage());
                }
            }
        };
        worker.execute();
    }
}
