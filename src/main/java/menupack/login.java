package menupack;

import ActivationPack.AES;
import ActivationPack.trial_version_expired;
import Utils.ColorConstants;
import com.selrom.db.DataUtil;
import com.selrom.db.Database;

import java.awt.Color;
import java.awt.HeadlessException;
import java.awt.Toolkit;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import org.apache.poi.hpsf.Variant;
import com.sun.jna.platform.win32.*;
import com.sun.jna.ptr.PointerByReference;
import java.util.ArrayList;
import java.util.List;

public final class login extends javax.swing.JFrame {
    DataUtil util = null;
    menu_form me = null;
    String drive = "C";
    String folder = "Retail_POS_Files";
    final String secretKey = "!@#$%^&*()_+;.,|";
    int days_left = 0;
    String what_version = ".";

    public String authenticate(String username, String password) throws SQLException, ClassNotFoundException {
        Connection con = Database.getInstance().getConnection();
        String query = "select utype, pass from users where LOWER(`user`)=LOWER(?)";
        try (PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedHash = rs.getString("pass");
                    if (Utils.PasswordUtils.verifyPassword(password, storedHash)) {
                        return rs.getString("utype");
                    }
                }
            }
        }
        return null;
    }

    void get_defaults() {
        javax.swing.ImageIcon icon = ColorConstants.loadIcon("/images/icon.png");
        if (icon != null) {
            setIconImage(icon.getImage());
        }
    }

    void get_login() {
        try {
            if (h1.getText().equals("")) {
                JOptionPane.showMessageDialog(this, "Enter User Name ?", "User Name", JOptionPane.ERROR_MESSAGE);
                h1.requestFocus();
                return;
            }
            if (h2.getText().equals("")) {
                JOptionPane.showMessageDialog(this, "Enter Password ?", "Password", JOptionPane.ERROR_MESSAGE);
                h2.requestFocus();
                return;
            }
            boolean selva = false;
            String utype = "";

            String authenticatedUtype = authenticate(h1.getText(), h2.getText());
            System.out.println("Authenticated User Type: " + authenticatedUtype);
            if (authenticatedUtype != null) {
                selva = true;
                utype = authenticatedUtype;
                System.out.println("User Type: " + utype);
            }
            if (selva == false) {
                JOptionPane.showMessageDialog(this, "Invalid User Name or Password!", "Invalid",
                        JOptionPane.ERROR_MESSAGE);
                h1.requestFocus();
            } else {
                // Check licence expiry before allowing login
                if (isLicenceExpired()) {
                    JOptionPane.showMessageDialog(this,
                            "Your Licence has Expired! Please contact support to renew.",
                            "Licence Expired", JOptionPane.ERROR_MESSAGE);
                    return;
                }

                // Initialize menu_form only when login is successful
                if (me == null) {
                    me = new menu_form();
                }

                Properties prop = new Properties();
                prop.setProperty("utype", utype);
                prop.setProperty("user", h1.getText());
                prop.store(new FileOutputStream(drive + ":/" + folder + "/Config_Files/userlog.properties"), null);
                this.dispose();
                me.get_user_details(utype, h1.getText());
                me.getUsername();
                me.getUserType();
                me.setVisible(true);
            }
        } catch (HeadlessException | IOException | ClassNotFoundException | SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    boolean isLicenceExpired() {
        try {
            DataUtil u = new DataUtil();
            // Try user_valid_date first (encrypted), then fall back to encrypted dat
            String query = "select user_valid_date, dat from setting_user";
            ResultSet rs = u.doQuery(query);
            if (rs == null)
                return false;
            while (rs.next()) {
                String encValidDate = rs.getString(1);
                if (encValidDate != null && !encValidDate.trim().isEmpty()) {
                    String decrypted = AES.decrypt(encValidDate, secretKey);
                    if (decrypted != null && !decrypted.trim().isEmpty()) {
                        Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(decrypted);
                        return expiryDate.before(new Date());
                    }
                }
                // Fallback: decrypt dat column
                String encDate = rs.getString(2);
                if (encDate != null && !encDate.trim().isEmpty()) {
                    String decrypted = AES.decrypt(encDate, secretKey);
                    if (decrypted != null && !decrypted.trim().isEmpty()) {
                        Date expiryDate = new SimpleDateFormat("yyyy-MM-dd").parse(decrypted);
                        return expiryDate.before(new Date());
                    }
                }
            }
        } catch (Exception e) {
            System.out.println("Licence check error: " + e.getMessage());
        }
        return false;
    }

    public static String get_hard_disc_Id() {
        String serial = "";
        try {
            String line;
            Process process = Runtime.getRuntime().exec("cmd /c vol C:");
            try (BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()))) {
                while ((line = in.readLine()) != null) {
                    if (line.toLowerCase().contains("serial number")) {
                        String[] strings = line.split(" ");
                        serial = strings[strings.length - 1];
                    }
                }
            }
            // System.out.println("Hard Disc Serial No: "+serial);
        } catch (IOException e) {
            System.out.println(e.toString());
        }
        return serial;
    }

    public static String getMotherboardIdFixed() {
        try {
            File vbs = File.createTempFile("mbserial", ".vbs");
            vbs.deleteOnExit();

            String script = """
                    Set objWMIService = GetObject("winmgmts:\\\\.\\root\\cimv2")
                    Set colItems = objWMIService.ExecQuery("SELECT * FROM Win32_BaseBoard")
                    For Each objItem in colItems
                        WScript.Echo objItem.SerialNumber
                    Next
                    """;

            try (var fw = new java.io.FileWriter(vbs)) {
                fw.write(script);
            }

            Process p = Runtime.getRuntime().exec("cscript //nologo \"" + vbs.getAbsolutePath() + "\"");
            var reader = new java.io.BufferedReader(new java.io.InputStreamReader(p.getInputStream()));

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line.trim());
            }

            return sb.toString().trim();

        } catch (Exception e) {
            return "Error: " + e.getMessage();

        }
    }

    public static String get_mother_board_id() {
        String result = "";
        try {
            File file = File.createTempFile("GetMBSerial", ".vbs");
            file.deleteOnExit();
            try (FileWriter fw = new FileWriter(file)) {
                String vbs = "Set objWMIService = GetObject(\"winmgmts:\\\\.\\root\\cimv2\")\n"
                        + "Set colItems = objWMIService.ExecQuery _ \n"
                        + "   (\"Select * from Win32_ComputerSystemProduct\") \n"
                        + "For Each objItem in colItems \n"
                        + "    Wscript.Echo objItem.IdentifyingNumber \n"
                        + "Next \n";

                fw.write(vbs);
            }
            Process gWMI = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());
            try (BufferedReader input = new BufferedReader(new InputStreamReader(gWMI.getInputStream()))) {
                String line;
                while ((line = input.readLine()) != null) {
                    result += line;
                }
            }
            // System.out.println("Mother Board ID: "+result);
        } catch (IOException e) {
            System.out.println(e.toString());
        }
        return result;
    }

    /*
     * public static String get_mother_board_id() {
     * String result = "";
     * try {
     * File file = File.createTempFile("GetMBSerial", ".vbs");
     * file.deleteOnExit();
     * try (FileWriter fw = new FileWriter(file)) {
     * String vbs =
     * "Set objWMIService = GetObject(\"winmgmts:\\\\.\\root\\cimv2\")\n"
     * + "Set colItems = objWMIService.ExecQuery _ \n"
     * + "   (\"Select * from Win32_ComputerSystemProduct\") \n"
     * + "For"
     * + "3 Each objItem in colItems \n"
     * + "    Wscript.Echo objItem.IdentifyingNumber \n"
     * + "Next \n";
     * 
     * fw.write(vbs);
     * }
     * Process gWMI = Runtime.getRuntime().exec("cscript //NoLogo " +
     * file.getPath());
     * try (BufferedReader input = new BufferedReader(new
     * InputStreamReader(gWMI.getInputStream()))) {
     * String line;
     * while ((line = input.readLine()) != null) {
     * result += line;
     * }
     * }
     * // System.out.println("Mother Board ID: "+result);
     * } catch (IOException e) {
     * System.out.println(e.toString());
     * }
     * return result;
     * }
     */
    void get_license() {
        try {
            String ip = "localhost";
            if (ip.equalsIgnoreCase("localhost")) {
                boolean fresh = false;
                String status = "Not", date = "", version = "", hard = "", mother = "", key1 = "";
                String query = "select status,dat,vname,hname,mname,uname from setting_user";
                ResultSet r = util.doQuery(query);
                while (r.next()) {
                    fresh = true;
                    status = r.getString(1);
                    date = r.getString(2);
                    version = r.getString(3);
                    hard = r.getString(4);
                    mother = r.getString(5);
                    key1 = r.getString(6);
                }
                if (fresh == false) {
                    this.dispose();
                    new ActivationPack.activation_home().setVisible(true);
                    return;
                }
                String mother1 = get_mother_board_id();
                String hard1 = get_hard_disc_Id();
                status = AES.decrypt(status, secretKey);
                date = AES.decrypt(date, secretKey);
                version = AES.decrypt(version, secretKey);
                hard = AES.decrypt(hard, secretKey);
                mother = AES.decrypt(mother, secretKey);
                if (!status.equals("Activated")) {
                    this.dispose();
                    new ActivationPack.activation_home().setVisible(true);
                    return;
                }

                if (status.equals("Activated") && version.equals("Trial Version")) {
                    if (!mother1.equals(mother) && !hard1.equals(hard)) {
                        this.dispose();
                        new ActivationPack.activation_home().setVisible(true);
                        return;
                    }
                    what_version = "Trial Version";
                    Date d = new Date();
                    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                    String end_date = format.format(d);
                    Date d1 = format.parse(date);
                    Date d2 = format.parse(end_date);
                    long diff = d2.getTime() - d1.getTime();
                    long diffDays = diff / (24 * 60 * 60 * 1000);
                    if (diffDays > 15) {
                        this.dispose();
                        new trial_version_expired().setVisible(true);
                        return;
                    } // days greaterthan 15
                    else {
                        days_left = 15 - (int) diffDays;
                        new login().setVisible(true);
                    }
                    return;
                } // trial version ends here

                if (status.equals("Activated") && version.equals("Full Version")) {
                    what_version = "Full Version";
                    key1 = AES.decrypt(key1, secretKey);

                    String fmother = "", fhard = "", fkey = "";
                    String filePath = drive + ":/" + folder + "/Drafts/Drafts/Drafts_Logs.drafts";
                    System.out.println("File Path: " + filePath);
                    System.out.println("Motherboard ID: " + mother1);
                    System.out.println("Hard Disk ID: " + hard1);

                    File draftsFile = new File(filePath);
                    System.err.println("Drafts File Exists: " + draftsFile.exists());

                    if (draftsFile.exists()) {
                        try (FileInputStream m = new FileInputStream(filePath)) {
                            Properties p = new Properties(null);
                            p.load(m);
                            fmother = p.getProperty("last_moth");
                            fhard = p.getProperty("last_hard");
                            fkey = p.getProperty("last_ke");
                        }
                        fmother = AES.decrypt(fmother, secretKey);
                        fhard = AES.decrypt(fhard, secretKey);
                        fkey = AES.decrypt(fkey, secretKey);
                    }
                    System.out.println("File Motherboard ID: " + fmother);
                    System.out.println("File Hard Disk ID: " + fhard);
                    System.out.println("File Key ID: " + fkey);
                    System.out.println("Database Motherboard ID: " + mother);
                    System.out.println("Database Hard Disk ID: " + hard);
                    System.out.println("Database Key ID: " + key1);
                    System.out.println("Motherboard : " + mother1);
                    System.out.println("Hard Disk : " + hard1);
                    System.out.println("Motherboard Match: " + mother1.equals(mother));
                    System.out.println("Hard Disk Match: " + hard1.equals(hard));

                    if (mother1.equals(mother) && hard1.equals(hard)) {
                        if (draftsFile.exists() && fmother.equals(mother) && fhard.equals(hard) && fkey.equals(key1)) {
                            new login().setVisible(true);
                        } else if (!draftsFile.exists()) {
                            new login().setVisible(true);
                        } else {
                            this.dispose();
                            new trial_version_expired().setVisible(true);
                        }
                    } // motherbaord & harddisc is equan /matching
                } // full version ends here
            } // Local Host Ends
            else { // IP Not Local Host starts
                new login().setVisible(true);
            } // IP not Local Host

        } catch (IOException | ClassNotFoundException | SQLException | ParseException e) {
            System.out.println(e);
        }
    }

    public login() {
        initComponents();
        util = new DataUtil();
        get_defaults();
        setLocationRelativeTo(null); // center on screen
        setResizable(false);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated
    // Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        // === SLIDE DATA ===
        final String[] slideTitles = { "Smart Billing System", "Inventory Management", "Business Analytics" };
        final String[] slideSubtitles = {
                "Fast & accurate billing for your retail business",
                "Track and manage stock in real time",
                "Powerful reports & data-driven insights"
        };
        final java.awt.Color[][] slideColors = {
                { new java.awt.Color(8, 90, 110), new java.awt.Color(14, 158, 185) },
                { new java.awt.Color(18, 85, 155), new java.awt.Color(28, 135, 210) },
                { new java.awt.Color(45, 25, 120), new java.awt.Color(85, 45, 190) }
        };
        slideIndex = 0;

        // ── LEFT SLIDER PANEL ──────────────────────────────────────────────────
        sliderPanel = new javax.swing.JPanel() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                super.paintComponent(g);
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                // gradient background
                java.awt.GradientPaint gp = new java.awt.GradientPaint(
                        0, 0, slideColors[slideIndex][0],
                        0, getHeight(), slideColors[slideIndex][1]);
                g2.setPaint(gp);
                g2.fillRect(0, 0, getWidth(), getHeight());
                // decorative translucent circles
                g2.setColor(new java.awt.Color(255, 255, 255, 22));
                g2.fillOval(-80, -80, 320, 320);
                g2.setColor(new java.awt.Color(255, 255, 255, 14));
                g2.fillOval(getWidth() - 220, getHeight() - 220, 340, 340);
                g2.setColor(new java.awt.Color(255, 255, 255, 10));
                g2.fillOval(getWidth() - 70, -50, 220, 220);
                g2.setColor(new java.awt.Color(255, 255, 255, 8));
                g2.fillOval(40, getHeight() - 140, 160, 160);
                g2.dispose();
            }
        };
        sliderPanel.setLayout(null);
        sliderPanel.setPreferredSize(new java.awt.Dimension(560, 640));

        // drag-to-move (undecorated window) via slider panel
        java.awt.event.MouseAdapter dragAdapter = new java.awt.event.MouseAdapter() {
            private java.awt.Point dragStart;

            @Override
            public void mousePressed(java.awt.event.MouseEvent e) {
                dragStart = e.getLocationOnScreen();
            }

            @Override
            public void mouseDragged(java.awt.event.MouseEvent e) {
                if (dragStart != null) {
                    java.awt.Point now = e.getLocationOnScreen();
                    java.awt.Point loc = getLocation();
                    setLocation(loc.x + now.x - dragStart.x, loc.y + now.y - dragStart.y);
                    dragStart = now;
                }
            }
        };
        sliderPanel.addMouseListener(dragAdapter);
        sliderPanel.addMouseMotionListener(dragAdapter);

        // brand name & tagline at top of slider
        javax.swing.JLabel sliderBrandLabel = new javax.swing.JLabel("Swayam Billing Software");
        sliderBrandLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 22));
        sliderBrandLabel.setForeground(java.awt.Color.WHITE);
        sliderBrandLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sliderPanel.add(sliderBrandLabel);
        sliderBrandLabel.setBounds(30, 20, 500, 36);

        javax.swing.JLabel sliderTagline = new javax.swing.JLabel("Smart Retail & Billing Solutions");
        sliderTagline.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 13));
        sliderTagline.setForeground(new java.awt.Color(180, 240, 220));
        sliderTagline.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sliderPanel.add(sliderTagline);
        sliderTagline.setBounds(30, 58, 500, 22);

        // large custom logo centred on slider
        sliderImageLabel = new javax.swing.JLabel() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setRenderingHint(java.awt.RenderingHints.KEY_TEXT_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
                int w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2 - 6;
                int cx = w / 2, cy = h / 2;
                // outer glow rings
                for (int i = 4; i >= 0; i--) {
                    g2.setColor(new java.awt.Color(255, 255, 255, 5 + i * 6));
                    g2.fillOval(cx - r - i * 7, cy - r - i * 7, (r + i * 7) * 2, (r + i * 7) * 2);
                }
                // radial gradient fill
                java.awt.RadialGradientPaint rg = new java.awt.RadialGradientPaint(
                        new java.awt.geom.Point2D.Float(cx - r / 3f, cy - r / 3f), r,
                        new float[] { 0f, 1f },
                        new java.awt.Color[] { new java.awt.Color(80, 230, 180), new java.awt.Color(8, 140, 105) });
                g2.setPaint(rg);
                g2.fillOval(cx - r, cy - r, r * 2, r * 2);
                // white border
                g2.setColor(new java.awt.Color(255, 255, 255, 200));
                g2.setStroke(new java.awt.BasicStroke(3.5f));
                g2.drawOval(cx - r, cy - r, r * 2, r * 2);
                // 'SBS' text
                g2.setColor(java.awt.Color.WHITE);
                g2.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, (int) (r * 0.65)));
                java.awt.FontMetrics fm = g2.getFontMetrics();
                String s = "SBS";
                g2.drawString(s, cx - fm.stringWidth(s) / 2, cy + fm.getAscent() / 2 - 3);
                g2.dispose();
            }
        };
        sliderImageLabel.setOpaque(false);
        sliderPanel.add(sliderImageLabel);
        sliderImageLabel.setBounds(185, 92, 190, 190);

        // slide title
        sliderTitleLabel = new javax.swing.JLabel(slideTitles[0]);
        sliderTitleLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 26));
        sliderTitleLabel.setForeground(java.awt.Color.WHITE);
        sliderTitleLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sliderPanel.add(sliderTitleLabel);
        sliderTitleLabel.setBounds(30, 308, 500, 42);

        // slide subtitle
        sliderSubLabel = new javax.swing.JLabel(slideSubtitles[0]);
        sliderSubLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 15));
        sliderSubLabel.setForeground(new java.awt.Color(190, 218, 255));
        sliderSubLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sliderPanel.add(sliderSubLabel);
        sliderSubLabel.setBounds(30, 358, 500, 28);

        // dot indicators
        dotLabels = new javax.swing.JLabel[slideTitles.length];
        javax.swing.JPanel dotPanel = new javax.swing.JPanel(
                new java.awt.FlowLayout(java.awt.FlowLayout.CENTER, 8, 2));
        dotPanel.setOpaque(false);
        for (int i = 0; i < slideTitles.length; i++) {
            final int idx = i;
            dotLabels[i] = new javax.swing.JLabel() {
                @Override
                protected void paintComponent(java.awt.Graphics g) {
                    java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                    g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                            java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                    if (idx == slideIndex) {
                        g2.setColor(java.awt.Color.WHITE);
                        g2.fillRoundRect(0, 3, 28, 10, 8, 8);
                    } else {
                        g2.setColor(new java.awt.Color(255, 255, 255, 110));
                        g2.fillOval(3, 3, 10, 10);
                    }
                    g2.dispose();
                }
            };
            dotLabels[i].setPreferredSize(new java.awt.Dimension(36, 18));
            dotPanel.add(dotLabels[i]);
        }
        sliderPanel.add(dotPanel);
        dotPanel.setBounds(150, 404, 260, 26);

        // auto-slide timer (3.5 s)
        slideTimer = new javax.swing.Timer(3500, e -> {
            slideIndex = (slideIndex + 1) % slideTitles.length;
            sliderTitleLabel.setText(slideTitles[slideIndex]);
            sliderSubLabel.setText(slideSubtitles[slideIndex]);
            sliderPanel.repaint();
            for (javax.swing.JLabel dot : dotLabels)
                dot.repaint();
        });
        slideTimer.start();

        // powered-by label at bottom of slider
        javax.swing.JLabel poweredLabel = new javax.swing.JLabel("Powered by Swayam Billing Software");
        poweredLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 11));
        poweredLabel.setForeground(new java.awt.Color(180, 210, 255));
        poweredLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        sliderPanel.add(poweredLabel);
        poweredLabel.setBounds(30, 598, 500, 20);

        // ── RIGHT LOGIN PANEL ──────────────────────────────────────────────────
        rightPanel = new javax.swing.JPanel();
        rightPanel.setBackground(java.awt.Color.WHITE);
        rightPanel.setLayout(null);
        rightPanel.setPreferredSize(new java.awt.Dimension(440, 640));

        // thin left accent bar
        javax.swing.JPanel accentBar = new javax.swing.JPanel() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setPaint(new java.awt.GradientPaint(0, 0, new java.awt.Color(120, 15, 160),
                        0, getHeight(), new java.awt.Color(22, 100, 180)));
                g2.fillRect(0, 0, getWidth(), getHeight());
                g2.dispose();
            }
        };
        rightPanel.add(accentBar);
        accentBar.setBounds(0, 0, 4, 640);

        // small close (✕) button – top-right corner
        javax.swing.JButton btnClose = new javax.swing.JButton("✕");
        btnClose.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 14));
        btnClose.setForeground(new java.awt.Color(130, 130, 160));
        btnClose.setBackground(java.awt.Color.WHITE);
        btnClose.setBorder(javax.swing.BorderFactory.createEmptyBorder(4, 8, 4, 8));
        btnClose.setFocusPainted(false);
        btnClose.setContentAreaFilled(false);
        btnClose.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnClose.setToolTipText("Exit");
        btnClose.addActionListener(e -> System.exit(0));
        btnClose.addMouseListener(new java.awt.event.MouseAdapter() {
            @Override
            public void mouseEntered(java.awt.event.MouseEvent e) {
                btnClose.setForeground(new java.awt.Color(204, 0, 60));
            }

            @Override
            public void mouseExited(java.awt.event.MouseEvent e) {
                btnClose.setForeground(new java.awt.Color(130, 130, 160));
            }
        });
        rightPanel.add(btnClose);
        btnClose.setBounds(398, 8, 36, 28);

        // company logo – custom painted 'S' circle
        logoLabel = new javax.swing.JLabel() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setRenderingHint(java.awt.RenderingHints.KEY_TEXT_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_TEXT_ANTIALIAS_ON);
                int w = getWidth(), h = getHeight(), r = Math.min(w, h) / 2 - 3;
                int cx = w / 2, cy = h / 2;
                // soft outer glow
                g2.setColor(new java.awt.Color(20, 185, 145, 45));
                g2.fillOval(cx - r - 5, cy - r - 5, (r + 5) * 2, (r + 5) * 2);
                // radial gradient fill
                java.awt.RadialGradientPaint rg = new java.awt.RadialGradientPaint(
                        new java.awt.geom.Point2D.Float(cx - r / 3f, cy - r / 3f), r,
                        new float[] { 0f, 1f },
                        new java.awt.Color[] { new java.awt.Color(50, 218, 165), new java.awt.Color(8, 130, 100) });
                g2.setPaint(rg);
                g2.fillOval(cx - r, cy - r, r * 2, r * 2);
                // white border
                g2.setColor(new java.awt.Color(255, 255, 255, 170));
                g2.setStroke(new java.awt.BasicStroke(2.0f));
                g2.drawOval(cx - r, cy - r, r * 2, r * 2);
                // 'S' letter
                g2.setColor(java.awt.Color.WHITE);
                g2.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, (int) (r * 1.1)));
                java.awt.FontMetrics fm = g2.getFontMetrics();
                String s = "S";
                g2.drawString(s, cx - fm.stringWidth(s) / 2, cy + fm.getAscent() / 2 - 2);
                g2.dispose();
            }
        };
        logoLabel.setOpaque(false);
        rightPanel.add(logoLabel);
        logoLabel.setBounds(184, 62, 72, 72);

        // company name
        companyLabel = new javax.swing.JLabel("Swayam Billing Software");
        companyLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 20));
        companyLabel.setForeground(new java.awt.Color(8, 118, 90));
        companyLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        rightPanel.add(companyLabel);
        companyLabel.setBounds(20, 148, 400, 34);

        // welcome subtitle
        welcomeLabel = new javax.swing.JLabel("Welcome Back !  Please sign in.");
        welcomeLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 14));
        welcomeLabel.setForeground(new java.awt.Color(110, 110, 150));
        welcomeLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        rightPanel.add(welcomeLabel);
        welcomeLabel.setBounds(20, 188, 400, 24);

        // separator
        javax.swing.JSeparator sep = new javax.swing.JSeparator();
        sep.setForeground(new java.awt.Color(220, 220, 238));
        rightPanel.add(sep);
        sep.setBounds(50, 226, 340, 2);

        // ── User Name ──────────────────────
        jLabel4 = new javax.swing.JLabel("User Name");
        jLabel4.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 13));
        jLabel4.setForeground(new java.awt.Color(80, 80, 130));
        rightPanel.add(jLabel4);
        jLabel4.setBounds(50, 248, 200, 22);

        h1 = new javax.swing.JTextField();
        h1.setBackground(new java.awt.Color(245, 246, 252));
        h1.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 16));
        h1.setForeground(new java.awt.Color(25, 25, 60));
        h1.setBorder(javax.swing.BorderFactory.createCompoundBorder(
                javax.swing.BorderFactory.createLineBorder(new java.awt.Color(185, 190, 225), 1, true),
                javax.swing.BorderFactory.createEmptyBorder(8, 14, 8, 14)));
        h1.addActionListener(evt -> h1ActionPerformed(evt));
        rightPanel.add(h1);
        h1.setBounds(50, 274, 340, 46);

        // ── Password ──────────────────────
        jLabel1 = new javax.swing.JLabel("Password");
        jLabel1.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 13));
        jLabel1.setForeground(new java.awt.Color(80, 80, 130));
        rightPanel.add(jLabel1);
        jLabel1.setBounds(50, 336, 200, 22);

        h2 = new javax.swing.JPasswordField();
        h2.setBackground(new java.awt.Color(245, 246, 252));
        h2.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 16));
        h2.setForeground(new java.awt.Color(25, 25, 60));
        h2.setBorder(javax.swing.BorderFactory.createCompoundBorder(
                javax.swing.BorderFactory.createLineBorder(new java.awt.Color(185, 190, 225), 1, true),
                javax.swing.BorderFactory.createEmptyBorder(8, 14, 8, 14)));
        h2.addActionListener(evt -> h2ActionPerformed(evt));
        rightPanel.add(h2);
        h2.setBounds(50, 362, 340, 46);

        // ── Login Button ──────────────────
        closebutton = new javax.swing.JButton() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                java.awt.Color base = getModel().isPressed() ? new java.awt.Color(80, 10, 120)
                        : getModel().isRollover() ? new java.awt.Color(140, 22, 180)
                                : new java.awt.Color(115, 15, 158);
                java.awt.GradientPaint gp = new java.awt.GradientPaint(
                        0, 0, base.brighter(), 0, getHeight(), base);
                g2.setPaint(gp);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        closebutton.setContentAreaFilled(false);
        closebutton.setOpaque(false);
        closebutton.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 17));
        closebutton.setForeground(java.awt.Color.WHITE);
        closebutton.setIcon(ColorConstants.loadIcon("/icons/login50.png"));
        closebutton.setIconTextGap(10);
        closebutton.setMnemonic('l');
        closebutton.setText("Login");
        closebutton.setBorder(javax.swing.BorderFactory.createEmptyBorder(10, 20, 10, 20));
        closebutton.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closebutton.setFocusPainted(false);
        closebutton.addActionListener(evt -> closebuttonActionPerformed(evt));
        rightPanel.add(closebutton);
        closebutton.setBounds(50, 430, 340, 54);

        // ── Cancel Button ─────────────────
        closebutton1 = new javax.swing.JButton() {
            @Override
            protected void paintComponent(java.awt.Graphics g) {
                java.awt.Graphics2D g2 = (java.awt.Graphics2D) g.create();
                g2.setRenderingHint(java.awt.RenderingHints.KEY_ANTIALIASING,
                        java.awt.RenderingHints.VALUE_ANTIALIAS_ON);
                java.awt.Color bg = getModel().isPressed() ? new java.awt.Color(200, 200, 216)
                        : getModel().isRollover() ? new java.awt.Color(226, 226, 242)
                                : new java.awt.Color(243, 243, 252);
                g2.setColor(bg);
                g2.fillRoundRect(0, 0, getWidth(), getHeight(), 12, 12);
                g2.setColor(new java.awt.Color(190, 190, 220));
                g2.drawRoundRect(0, 0, getWidth() - 1, getHeight() - 1, 12, 12);
                g2.dispose();
                super.paintComponent(g);
            }
        };
        closebutton1.setContentAreaFilled(false);
        closebutton1.setOpaque(false);
        closebutton1.setFont(new java.awt.Font("Segoe UI", java.awt.Font.BOLD, 15));
        closebutton1.setForeground(new java.awt.Color(80, 80, 130));
        closebutton1.setIcon(ColorConstants.loadIcon("/icons/exit45.png"));
        closebutton1.setIconTextGap(10);
        closebutton1.setMnemonic('c');
        closebutton1.setText("Cancel");
        closebutton1.setBorder(javax.swing.BorderFactory.createEmptyBorder(8, 20, 8, 20));
        closebutton1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        closebutton1.setFocusPainted(false);
        closebutton1.addActionListener(evt -> closebutton1ActionPerformed(evt));
        rightPanel.add(closebutton1);
        closebutton1.setBounds(50, 498, 340, 48);

        // version info
        versionLabel = new javax.swing.JLabel("© Swayam Billing Software  |  Secure Login");
        versionLabel.setFont(new java.awt.Font("Segoe UI", java.awt.Font.PLAIN, 11));
        versionLabel.setForeground(new java.awt.Color(170, 170, 195));
        versionLabel.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        rightPanel.add(versionLabel);
        versionLabel.setBounds(20, 604, 410, 20);

        // ── labels kept for legacy compatibility (unused visually) ──
        jLabel2 = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        jPanel2 = new javax.swing.JPanel();

        // ── ASSEMBLE MAIN FRAME ────────────────────────────────────────────────
        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setUndecorated(true);
        getContentPane().setLayout(new java.awt.BorderLayout());
        getContentPane().add(sliderPanel, java.awt.BorderLayout.WEST);
        getContentPane().add(rightPanel, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void closebuttonActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_closebuttonActionPerformed
        get_login();
    }// GEN-LAST:event_closebuttonActionPerformed

    private void closebutton1ActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_closebutton1ActionPerformed
        this.dispose();
    }// GEN-LAST:event_closebutton1ActionPerformed

    private void h1ActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_h1ActionPerformed
        h2.requestFocus();
    }// GEN-LAST:event_h1ActionPerformed

    private void h2ActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_h2ActionPerformed
        get_login();
    }// GEN-LAST:event_h2ActionPerformed

    public static void main(String args[]) {

        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException
                | javax.swing.UnsupportedLookAndFeelException ex)

        {
            System.out.println("Look and Feel: " + ex);
            java.util.logging.Logger.getLogger(login.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        UIManager.put("nimbusFocus", new Color(153, 0, 153, 255));
        UIManager.put("nimbusSelectionBackground", new Color(153, 0, 153, 255));
        UIManager.put("nimbusBase", new Color(153, 0, 153, 225));
        UIManager.put("control", new Color(255, 255, 255, 255));

        java.awt.EventQueue.invokeLater(() -> {

            System.out.println("Starting Login...");
            // new login();
            new login().get_license();

        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton closebutton;
    private javax.swing.JButton closebutton1;
    private javax.swing.JTextField h1;
    private javax.swing.JPasswordField h2;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    // Slider components
    private javax.swing.JPanel sliderPanel;
    private javax.swing.JPanel rightPanel;
    private javax.swing.JLabel sliderImageLabel;
    private javax.swing.JLabel sliderTitleLabel;
    private javax.swing.JLabel sliderSubLabel;
    private javax.swing.JLabel[] dotLabels;
    private javax.swing.Timer slideTimer;
    private int slideIndex;
    // Login panel components
    private javax.swing.JLabel logoLabel;
    private javax.swing.JLabel companyLabel;
    private javax.swing.JLabel welcomeLabel;
    private javax.swing.JLabel versionLabel;
    // End of variables declaration//GEN-END:variables
}
