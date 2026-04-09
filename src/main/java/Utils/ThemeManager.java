package Utils;

import java.awt.*;
import javax.swing.*;
import javax.swing.plaf.basic.BasicButtonUI;
import javax.swing.plaf.basic.BasicComboBoxUI;
import javax.swing.plaf.basic.BasicMenuItemUI;
import javax.swing.plaf.basic.BasicMenuUI;
import javax.swing.table.*;

/**
 * Central theme manager — applies the modern dark-purple / blue design to
 * every Swing component tree, matching the login-form aesthetic throughout
 * the whole application.
 *
 * Usage:
 * 1. Call ThemeManager.applyGlobalUIManager() once (before any UI is created)
 * so that all NEW components automatically inherit the theme.
 * 2. For JInternalFrames already built by NetBeans' initComponents(), call
 * ThemeManager.applyTheme(frame.getContentPane()) to retroactively style
 * the whole component tree.
 */
public class ThemeManager {

    // ── Palette (Light theme — pale lavender backgrounds, dark text, vivid
    // accents) ──
    public static final Color BG_DARK = new Color(230, 225, 248); // desktop bg — pale lavender
    public static final Color BG_PANEL = new Color(248, 246, 255); // panel bg — near-white lavender
    public static final Color BG_LIGHTER = new Color(237, 231, 252); // hover / selected panel bg
    public static final Color ACCENT_PURPLE = new Color(103, 36, 175); // vivid medium purple
    public static final Color ACCENT_BLUE = new Color(37, 108, 210); // medium blue
    public static final Color FG_WHITE = Color.WHITE;
    public static final Color FG_LIGHT = new Color(25, 12, 55); // primary dark text
    public static final Color FG_MUTED = new Color(110, 90, 145); // muted / secondary text
    public static final Color INPUT_BG = Color.WHITE; // text-field background
    public static final Color INPUT_BORDER = new Color(170, 135, 215); // soft purple border
    public static final Color TH_BG = new Color(103, 36, 175); // table-header (vivid purple)
    public static final Color TR_ALT = new Color(239, 234, 254); // alternate table row — light lavender
    public static final Color BTN_DANGER = new Color(195, 35, 55);
    public static final Color BTN_WARN = new Color(190, 110, 15);
    public static final Color BTN_SUCCESS = new Color(25, 135, 65);
    public static final Color BTN_INFO = new Color(37, 108, 210);
    public static final Color BTN_DEFAULT = new Color(103, 36, 175);

    // ── Global UIManager settings ─────────────────────────────────────────────

    /**
     * Writes all UIManager keys that make every NEW Swing component inherit the
     * dark-purple theme. Call this before any form is constructed.
     */
    public static void applyGlobalUIManager() {

        // InternalFrame title bar
        UIManager.put("InternalFrame.titleFont", new Font("Segoe UI", Font.BOLD, 13));
        UIManager.put("InternalFrame.activeTitleBackground", TH_BG);
        UIManager.put("InternalFrame.activeTitleForeground", FG_WHITE);
        UIManager.put("InternalFrame.inactiveTitleBackground", new Color(195, 185, 230));
        UIManager.put("InternalFrame.inactiveTitleForeground", new Color(80, 60, 110));
        UIManager.put("InternalFrame.background", BG_PANEL);
        UIManager.put("InternalFrame.borderColor", new Color(175, 145, 220));

        // Desktop pane — pale lavender
        UIManager.put("Desktop.background", BG_DARK);

        // Panel / basic containers
        UIManager.put("Panel.background", BG_PANEL);
        UIManager.put("Panel.foreground", FG_LIGHT);

        // Label
        UIManager.put("Label.foreground", FG_LIGHT);
        UIManager.put("Label.font", new Font("Segoe UI", Font.PLAIN, 13));

        // TextField
        UIManager.put("TextField.background", INPUT_BG);
        UIManager.put("TextField.foreground", FG_LIGHT);
        UIManager.put("TextField.caretForeground", ACCENT_PURPLE);
        UIManager.put("TextField.selectionBackground", ACCENT_PURPLE);
        UIManager.put("TextField.selectionForeground", FG_WHITE);
        UIManager.put("TextField.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("TextField.border",
                BorderFactory.createCompoundBorder(
                        BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                        BorderFactory.createEmptyBorder(4, 8, 4, 8)));

        // PasswordField
        UIManager.put("PasswordField.background", INPUT_BG);
        UIManager.put("PasswordField.foreground", FG_LIGHT);
        UIManager.put("PasswordField.caretForeground", ACCENT_PURPLE);
        UIManager.put("PasswordField.selectionBackground", ACCENT_PURPLE);
        UIManager.put("PasswordField.selectionForeground", FG_WHITE);
        UIManager.put("PasswordField.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("PasswordField.border",
                BorderFactory.createCompoundBorder(
                        BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                        BorderFactory.createEmptyBorder(4, 8, 4, 8)));

        // TextArea
        UIManager.put("TextArea.background", INPUT_BG);
        UIManager.put("TextArea.foreground", FG_LIGHT);
        UIManager.put("TextArea.caretForeground", ACCENT_PURPLE);
        UIManager.put("TextArea.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("TextArea.selectionBackground", ACCENT_PURPLE);
        UIManager.put("TextArea.selectionForeground", FG_WHITE);

        // Button
        UIManager.put("Button.background", ACCENT_PURPLE);
        UIManager.put("Button.foreground", FG_WHITE);
        UIManager.put("Button.font", new Font("Segoe UI", Font.BOLD, 13));
        UIManager.put("Button.focus", new Color(0, 0, 0, 0));
        UIManager.put("Button.select", new Color(75, 20, 140));
        UIManager.put("Button.rollover", Boolean.TRUE);

        // ToggleButton
        UIManager.put("ToggleButton.background", BG_LIGHTER);
        UIManager.put("ToggleButton.foreground", FG_LIGHT);
        UIManager.put("ToggleButton.font", new Font("Segoe UI", Font.BOLD, 13));

        // CheckBox
        UIManager.put("CheckBox.background", BG_PANEL);
        UIManager.put("CheckBox.foreground", FG_LIGHT);
        UIManager.put("CheckBox.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("CheckBox.focus", new Color(0, 0, 0, 0));

        // RadioButton
        UIManager.put("RadioButton.background", BG_PANEL);
        UIManager.put("RadioButton.foreground", FG_LIGHT);
        UIManager.put("RadioButton.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("RadioButton.focus", new Color(0, 0, 0, 0));

        // ComboBox
        UIManager.put("ComboBox.background", INPUT_BG);
        UIManager.put("ComboBox.foreground", FG_LIGHT);
        UIManager.put("ComboBox.selectionBackground", ACCENT_PURPLE);
        UIManager.put("ComboBox.selectionForeground", FG_WHITE);
        UIManager.put("ComboBox.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("ComboBox.buttonBackground", new Color(237, 231, 252));
        UIManager.put("ComboBox.disabledBackground", BG_LIGHTER);
        UIManager.put("ComboBox.disabledForeground", FG_MUTED);
        UIManager.put("ComboBox.border", BorderFactory.createLineBorder(INPUT_BORDER, 1));

        // List
        UIManager.put("List.background", INPUT_BG);
        UIManager.put("List.foreground", FG_LIGHT);
        UIManager.put("List.selectionBackground", ACCENT_PURPLE);
        UIManager.put("List.selectionForeground", FG_WHITE);
        UIManager.put("List.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("List.cellHeight", 30);
        UIManager.put("List.focusCellHighlightBorder", BorderFactory.createLineBorder(ACCENT_PURPLE, 1, true));

        // ComboBox popup extras
        UIManager.put("ComboBox.popupBackground", INPUT_BG);
        UIManager.put("ComboBox.focusCellHighlightBorder",
                BorderFactory.createLineBorder(ACCENT_PURPLE, 2, true));

        // Table
        UIManager.put("Table.background", INPUT_BG);
        UIManager.put("Table.foreground", FG_LIGHT);
        UIManager.put("Table.selectionBackground", ACCENT_PURPLE);
        UIManager.put("Table.selectionForeground", FG_WHITE);
        UIManager.put("Table.gridColor", new Color(200, 185, 230));
        UIManager.put("Table.font", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("Table.focusCellBackground", new Color(220, 205, 248));
        UIManager.put("Table.focusCellForeground", FG_LIGHT);
        UIManager.put("TableHeader.background", TH_BG);
        UIManager.put("TableHeader.foreground", FG_WHITE);
        UIManager.put("TableHeader.font", new Font("Segoe UI", Font.BOLD, 13));
        UIManager.put("TableHeader.cellBorder",
                BorderFactory.createCompoundBorder(
                        BorderFactory.createMatteBorder(0, 0, 1, 1, new Color(140, 100, 200)),
                        BorderFactory.createEmptyBorder(3, 6, 3, 6)));

        // ScrollPane / ScrollBar
        UIManager.put("ScrollPane.background", BG_PANEL);
        UIManager.put("ScrollPane.border", BorderFactory.createLineBorder(new Color(190, 170, 225), 1));
        UIManager.put("ScrollBar.background", new Color(220, 212, 242));
        UIManager.put("ScrollBar.thumb", new Color(155, 110, 210));
        UIManager.put("ScrollBar.thumbHighlight", new Color(185, 145, 235));
        UIManager.put("ScrollBar.thumbDarkShadow", new Color(120, 80, 170));
        UIManager.put("ScrollBar.thumbShadow", new Color(140, 95, 190));
        UIManager.put("ScrollBar.track", new Color(220, 212, 242));
        UIManager.put("ScrollBar.trackHighlight", new Color(230, 224, 248));

        // TabbedPane
        UIManager.put("TabbedPane.background", BG_PANEL);
        UIManager.put("TabbedPane.foreground", FG_LIGHT);
        UIManager.put("TabbedPane.selected", BG_LIGHTER);
        UIManager.put("TabbedPane.selectedForeground", ACCENT_PURPLE);
        UIManager.put("TabbedPane.contentAreaColor", BG_PANEL);
        UIManager.put("TabbedPane.borderHightlightColor", ACCENT_PURPLE);
        UIManager.put("TabbedPane.font", new Font("Segoe UI", Font.BOLD, 13));

        // Spinner
        UIManager.put("Spinner.background", INPUT_BG);
        UIManager.put("Spinner.foreground", FG_LIGHT);
        UIManager.put("Spinner.font", new Font("Segoe UI", Font.PLAIN, 13));

        // Slider
        UIManager.put("Slider.background", BG_PANEL);
        UIManager.put("Slider.foreground", ACCENT_PURPLE);

        // ProgressBar
        UIManager.put("ProgressBar.background", new Color(215, 205, 240));
        UIManager.put("ProgressBar.foreground", ACCENT_PURPLE);
        UIManager.put("ProgressBar.selectionForeground", FG_WHITE);
        UIManager.put("ProgressBar.selectionBackground", FG_LIGHT);
        UIManager.put("ProgressBar.font", new Font("Segoe UI", Font.BOLD, 12));

        // Separator
        UIManager.put("Separator.foreground", new Color(190, 165, 225));
        UIManager.put("Separator.background", BG_PANEL);

        // ToolBar
        UIManager.put("ToolBar.background", new Color(240, 236, 255));
        UIManager.put("ToolBar.foreground", FG_LIGHT);
        UIManager.put("ToolBar.font", new Font("Segoe UI", Font.BOLD, 13));

        // ToolTip — dark tip on light theme for contrast
        UIManager.put("ToolTip.background", new Color(55, 20, 100));
        UIManager.put("ToolTip.foreground", FG_WHITE);
        UIManager.put("ToolTip.border", BorderFactory.createLineBorder(ACCENT_PURPLE, 1));
        UIManager.put("ToolTip.font", new Font("Segoe UI", Font.PLAIN, 12));

        // OptionPane / dialogs
        UIManager.put("OptionPane.background", BG_PANEL);
        UIManager.put("OptionPane.messageForeground", FG_LIGHT);
        UIManager.put("OptionPane.messageFont", new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("OptionPane.buttonFont", new Font("Segoe UI", Font.BOLD, 13));

        // FileChooser
        UIManager.put("FileChooser.background", BG_PANEL);
        UIManager.put("FileChooser.foreground", FG_LIGHT);

        // Tree
        UIManager.put("Tree.background", INPUT_BG);
        UIManager.put("Tree.foreground", FG_LIGHT);
        UIManager.put("Tree.selectionBackground", ACCENT_PURPLE);
        UIManager.put("Tree.selectionForeground", FG_WHITE);
        UIManager.put("Tree.font", new Font("Segoe UI", Font.PLAIN, 13));

        // ── Menu bar ─────────────────────────────────────────────────────────
        // Transparent so the custom gradient painted in menu_form shows through
        UIManager.put("MenuBar.background",       new Color(50, 8, 100));
        UIManager.put("MenuBar.foreground",       FG_WHITE);
        UIManager.put("MenuBar.border",           BorderFactory.createEmptyBorder(2, 4, 2, 4));

        // Remove the checkbox "□" icon and arrow that Swing puts before JMenu titles
        UIManager.put("Menu.checkIcon",           null);
        UIManager.put("Menu.arrowIcon",           null);
        UIManager.put("MenuItem.checkIcon",       null);
        UIManager.put("Menu.background",          new Color(50, 8, 100));
        UIManager.put("Menu.foreground",          FG_WHITE);
        UIManager.put("Menu.selectionBackground", new Color(255, 255, 255, 45));
        UIManager.put("Menu.selectionForeground", FG_WHITE);
        UIManager.put("Menu.font",                new Font("Segoe UI", Font.BOLD, 13));
        UIManager.put("Menu.borderPainted",       Boolean.FALSE);
        UIManager.put("Menu.opaque",              Boolean.FALSE);
        UIManager.put("Menu.margin",              new Insets(4, 10, 4, 10));

        // Drop-down popup menu
        UIManager.put("MenuItem.background",           new Color(24, 5, 52));
        UIManager.put("MenuItem.foreground",           new Color(228, 218, 248));
        UIManager.put("MenuItem.selectionBackground",  new Color(118, 38, 195));
        UIManager.put("MenuItem.selectionForeground",  FG_WHITE);
        UIManager.put("MenuItem.font",                 new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("MenuItem.borderPainted",        Boolean.FALSE);
        UIManager.put("MenuItem.border",               BorderFactory.createEmptyBorder(7, 18, 7, 18));
        UIManager.put("MenuItem.acceleratorForeground",new Color(195, 165, 238));
        UIManager.put("MenuItem.acceleratorFont",      new Font("Segoe UI", Font.PLAIN, 11));
        UIManager.put("CheckBoxMenuItem.background",   new Color(24, 5, 52));
        UIManager.put("CheckBoxMenuItem.foreground",   new Color(228, 218, 248));
        UIManager.put("CheckBoxMenuItem.selectionBackground", new Color(118, 38, 195));
        UIManager.put("CheckBoxMenuItem.font",         new Font("Segoe UI", Font.PLAIN, 13));
        UIManager.put("PopupMenu.background",          new Color(24, 5, 52));
        UIManager.put("PopupMenu.border",
                BorderFactory.createCompoundBorder(
                        BorderFactory.createLineBorder(new Color(155, 65, 238, 210), 1, true),
                        BorderFactory.createEmptyBorder(5, 0, 5, 0)));
        UIManager.put("Separator.foreground",          new Color(145, 55, 215, 160));
        UIManager.put("Separator.background",          new Color(24, 5, 52));
    }

    // ── Recursive component styling ───────────────────────────────────────────

    /**
     * Recursively applies the dark-purple theme to all components in the given
     * container. Call this on a JInternalFrame's contentPane after the frame's
     * initComponents() has completed.
     */
    public static void applyTheme(Container container) {
        container.setBackground(BG_PANEL);
        applyRecursive(container);
    }

    /**
     * Applies a glass-pill hover UI to every JMenu title in the given JMenuBar.
     * Must be called AFTER SwingUtilities.updateComponentTreeUI(bar) so the custom
     * BasicMenuUI is not discarded by the tree update.
     */
    // Distinct colors cycled across menu-bar items for the dot icon
    private static final Color[] MENU_DOT_COLORS = {
        new Color(255, 100, 120),  // coral-red
        new Color(255, 165,  60),  // amber
        new Color(100, 220, 120),  // mint-green
        new Color( 80, 190, 255),  // sky-blue
        new Color(200, 120, 255),  // violet
        new Color(255, 210,  60),  // gold
        new Color( 80, 230, 200),  // teal
        new Color(255, 120, 180),  // pink
        new Color(130, 210, 255),  // light blue
        new Color(180, 255, 130),  // lime
    };

    /** Returns a small filled-circle icon in the given color. */
    private static Icon createMenuDotIcon(Color c) {
        return new Icon() {
            @Override public int getIconWidth()  { return 8; }
            @Override public int getIconHeight() { return 8; }
            @Override public void paintIcon(Component comp, Graphics g, int x, int y) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setColor(c);
                g2.fillOval(x, y + 1, 7, 7);
                g2.setColor(new Color(255, 255, 255, 90));
                g2.fillOval(x + 1, y + 1, 3, 3);  // gloss highlight
                g2.dispose();
            }
        };
    }

    public static void applyMenuBarTheme(JMenuBar bar) {
        // ── Style each JMenu ──────────────────────────────────────────────────
        int menuCount = bar.getMenuCount();
        int dotIndex = 0;  // separate counter so separators don't advance it
        for (int i = 0; i < menuCount; i++) {
            JMenu menu = bar.getMenu(i);
            if (menu == null) continue;

            // Assign a distinct colored dot icon (cycles through palette)
            menu.setIcon(createMenuDotIcon(MENU_DOT_COLORS[dotIndex % MENU_DOT_COLORS.length]));
            menu.setIconTextGap(5);
            dotIndex++;

            menu.setOpaque(false);
            menu.setForeground(FG_WHITE);
            menu.setFont(new Font("Segoe UI", Font.BOLD, 13));
            menu.setUI(new BasicMenuUI() {
                @Override
                protected void paintBackground(Graphics g, JMenuItem mi, Color bgColor) {
                    boolean armed    = mi.getModel().isArmed();
                    boolean selected = mi.getModel().isSelected();
                    if (armed || selected) {
                        Graphics2D g2 = (Graphics2D) g.create();
                        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                                RenderingHints.VALUE_ANTIALIAS_ON);
                        // Semi-transparent white pill
                        g2.setColor(new Color(255, 255, 255, 55));
                        g2.fillRoundRect(3, 2, mi.getWidth() - 6, mi.getHeight() - 4, 14, 14);
                        // Top gloss stripe
                        g2.setColor(new Color(255, 255, 255, 30));
                        g2.fillRoundRect(3, 2, mi.getWidth() - 6, (mi.getHeight() - 4) / 2, 14, 14);
                        // Bottom accent line
                        g2.setColor(new Color(210, 130, 255, 150));
                        g2.setStroke(new BasicStroke(1.5f));
                        g2.drawLine(10, mi.getHeight() - 3, mi.getWidth() - 10, mi.getHeight() - 3);
                        g2.dispose();
                    }
                    // No opaque fill — gradient background shows through
                }
                @Override
                public void installUI(JComponent c) {
                    super.installUI(c);
                    checkIcon = null;  // removes □ reserved space
                    arrowIcon = null;
                    ((JMenu) c).setOpaque(false);
                }
            });
        }

        // ── Insert thin vertical separators between menus ─────────────────────
        JMenu[] menus = new JMenu[menuCount];
        for (int i = 0; i < menuCount; i++) {
            menus[i] = bar.getMenu(i);
        }
        bar.removeAll();
        for (int i = 0; i < menus.length; i++) {
            if (menus[i] == null) continue;
            bar.add(menus[i]);
            if (i < menus.length - 1) {
                bar.add(createMenuBarSeparator());
            }
        }
        bar.revalidate();
        bar.repaint();
    }

    private static JComponent createMenuBarSeparator() {
        JComponent sep = new JComponent() {
            @Override
            protected void paintComponent(Graphics g) {
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                int cx = getWidth() / 2;
                int pad = 6;
                g2.setColor(new Color(255, 255, 255, 55));
                g2.setStroke(new BasicStroke(1f));
                g2.drawLine(cx, pad, cx, getHeight() - pad);
                g2.dispose();
            }
        };
        sep.setPreferredSize(new Dimension(8, 32));
        sep.setOpaque(false);
        return sep;
    }

    private static void applyRecursive(Container c) {
        for (Component comp : c.getComponents()) {
            styleComponent(comp);
            if (comp instanceof Container) {
                applyRecursive((Container) comp);
            }
        }
    }

    @SuppressWarnings("unchecked")
    private static void styleComponent(Component comp) {

        // ── JMenuBar ─────────────────────────────────────────────────────────
        if (comp instanceof JMenuBar) {
            JMenuBar bar = (JMenuBar) comp;
            bar.setOpaque(false);  // gradient is painted by the custom paintComponent
            bar.setBorder(BorderFactory.createEmptyBorder(2, 4, 2, 4));

        // ── JMenu ─────────────────────────────────────────────────────────────
        } else if (comp instanceof JMenu) {
            JMenu menu = (JMenu) comp;
            menu.setOpaque(false);
            menu.setForeground(Color.WHITE);
            menu.setFont(new Font("Segoe UI", Font.BOLD, 13));
            menu.setBorder(BorderFactory.createEmptyBorder(4, 10, 4, 10));
            // Custom UI: paint a glass-pill highlight on hover/selected
            menu.setUI(new BasicMenuUI() {
                @Override
                protected void paintBackground(Graphics g, JMenuItem mi, Color bgColor) {
                    boolean armed    = mi.getModel().isArmed();
                    boolean selected = mi.getModel().isSelected();
                    if (armed || selected) {
                        Graphics2D g2 = (Graphics2D) g.create();
                        g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                                RenderingHints.VALUE_ANTIALIAS_ON);
                        // White semi-transparent pill
                        g2.setColor(new Color(255, 255, 255, 50));
                        g2.fillRoundRect(3, 2, mi.getWidth() - 6, mi.getHeight() - 4, 14, 14);
                        // Top gloss stripe
                        g2.setColor(new Color(255, 255, 255, 30));
                        g2.fillRoundRect(3, 2, mi.getWidth() - 6, (mi.getHeight() - 4) / 2, 14, 14);
                        // Bottom accent line
                        g2.setColor(new Color(180, 100, 255, 120));
                        g2.setStroke(new BasicStroke(1.5f));
                        g2.drawLine(10, mi.getHeight() - 3, mi.getWidth() - 10, mi.getHeight() - 3);
                        g2.dispose();
                    }
                    // Always draw text on transparent bg — no opaque fill
                }
                @Override
                public void installUI(JComponent c) {
                    super.installUI(c);
                    checkIcon = null;  // removes the □ reserved column space
                    arrowIcon = null;  // removes arrow indicator from menu-bar items
                    ((JMenu) c).setOpaque(false);
                }
            });

        // ── JMenuItem ─────────────────────────────────────────────────────────
        } else if (comp instanceof JMenuItem && !(comp instanceof JMenu)) {
            JMenuItem mi = (JMenuItem) comp;
            // Override UI to eliminate the checkbox reserved column
            mi.setUI(new BasicMenuItemUI() {
                @Override
                public void installUI(JComponent c) {
                    super.installUI(c);
                    checkIcon = null;  // removes the left checkbox/icon column space
                }
            });
            mi.setBackground(new Color(32, 8, 65));
            mi.setForeground(new Color(225, 215, 245));
            mi.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            mi.setBorder(BorderFactory.createEmptyBorder(6, 16, 6, 16));

        // ── JTable ──────────────────────────────────────────────────────────
        if (comp instanceof JTable) {
            JTable tbl = (JTable) comp;
            tbl.setBackground(INPUT_BG);
            tbl.setForeground(FG_LIGHT);
            tbl.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            tbl.setSelectionBackground(ACCENT_PURPLE);
            tbl.setSelectionForeground(FG_WHITE);
            tbl.setGridColor(new Color(200, 185, 230));
            tbl.setRowHeight(Math.max(tbl.getRowHeight(), 26));
            tbl.setShowGrid(true);
            tbl.setIntercellSpacing(new Dimension(1, 1));

            JTableHeader th = tbl.getTableHeader();
            if (th != null) {
                th.setBackground(TH_BG);
                th.setForeground(FG_WHITE);
                th.setFont(new Font("Segoe UI", Font.BOLD, 13));
                th.setPreferredSize(new Dimension(th.getPreferredSize().width, 30));
                th.setDefaultRenderer(new DefaultTableCellRenderer() {
                    @Override
                    public Component getTableCellRendererComponent(JTable t, Object val,
                            boolean sel, boolean focus, int row, int col) {
                        super.getTableCellRendererComponent(t, val, sel, focus, row, col);
                        setBackground(TH_BG);
                        setForeground(FG_WHITE);
                        setFont(new Font("Segoe UI", Font.BOLD, 13));
                        setHorizontalAlignment(CENTER);
                        setBorder(BorderFactory.createCompoundBorder(
                                BorderFactory.createMatteBorder(0, 0, 1, 1, new Color(140, 100, 200)),
                                BorderFactory.createEmptyBorder(3, 6, 3, 6)));
                        return this;
                    }
                });
            }
            tbl.setDefaultRenderer(Object.class, new DefaultTableCellRenderer() {
                @Override
                public Component getTableCellRendererComponent(JTable t, Object val,
                        boolean sel, boolean focus, int row, int col) {
                    super.getTableCellRendererComponent(t, val, sel, focus, row, col);
                    if (sel) {
                        setBackground(ACCENT_PURPLE);
                        setForeground(FG_WHITE);
                    } else {
                        setBackground(row % 2 == 0 ? INPUT_BG : TR_ALT);
                        setForeground(FG_LIGHT);
                    }
                    setFont(new Font("Segoe UI", Font.PLAIN, 13));
                    setBorder(BorderFactory.createEmptyBorder(2, 6, 2, 6));
                    return this;
                }
            });

            // ── JTextField ───────────────────────────────────────────────────────
        } else if (comp instanceof JPasswordField) {
            // must check JPasswordField BEFORE JTextField (it extends it)
            JPasswordField pf = (JPasswordField) comp;
            pf.setBackground(INPUT_BG);
            pf.setForeground(FG_LIGHT);
            pf.setCaretColor(ACCENT_PURPLE);
            pf.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            pf.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                    BorderFactory.createEmptyBorder(4, 8, 4, 8)));

        } else if (comp instanceof JTextField) {
            JTextField tf = (JTextField) comp;
            tf.setBackground(INPUT_BG);
            tf.setForeground(FG_LIGHT);
            tf.setCaretColor(ACCENT_PURPLE);
            tf.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            tf.setSelectionColor(ACCENT_PURPLE);
            tf.setSelectedTextColor(FG_WHITE);
            tf.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                    BorderFactory.createEmptyBorder(4, 8, 4, 8)));

            // ── JTextArea ────────────────────────────────────────────────────────
        } else if (comp instanceof JTextArea) {
            JTextArea ta = (JTextArea) comp;
            ta.setBackground(INPUT_BG);
            ta.setForeground(FG_LIGHT);
            ta.setCaretColor(ACCENT_PURPLE);
            ta.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            ta.setSelectionColor(ACCENT_PURPLE);
            ta.setSelectedTextColor(FG_WHITE);

            // ── JButton ──────────────────────────────────────────────────────────
        } else if (comp instanceof JButton) {
            styleButton((JButton) comp);

            // ── JComboBox ────────────────────────────────────────────────────────
        } else if (comp instanceof JComboBox<?>) {
            JComboBox<?> cb = (JComboBox<?>) comp;
            // Custom UI: styled purple arrow button
            cb.setUI(new BasicComboBoxUI() {
                @Override
                protected JButton createArrowButton() {
                    JButton btn = new JButton() {
                        @Override
                        protected void paintComponent(Graphics g) {
                            Graphics2D g2 = (Graphics2D) g.create();
                            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                                    RenderingHints.VALUE_ANTIALIAS_ON);
                            // Purple pill background
                            g2.setColor(ACCENT_PURPLE);
                            g2.fillRoundRect(2, 2, getWidth() - 4, getHeight() - 4, 8, 8);
                            // White downward chevron
                            int cx = getWidth() / 2;
                            int cy = getHeight() / 2;
                            g2.setColor(Color.WHITE);
                            g2.setStroke(new BasicStroke(2.2f, BasicStroke.CAP_ROUND,
                                    BasicStroke.JOIN_ROUND));
                            g2.drawLine(cx - 5, cy - 2, cx, cy + 3);
                            g2.drawLine(cx, cy + 3, cx + 5, cy - 2);
                            g2.dispose();
                        }
                    };
                    btn.setPreferredSize(new Dimension(28, 28));
                    btn.setBorderPainted(false);
                    btn.setContentAreaFilled(false);
                    btn.setFocusPainted(false);
                    btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                    return btn;
                }
            });
            cb.setBackground(INPUT_BG);
            cb.setForeground(FG_LIGHT);
            cb.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            cb.setMaximumRowCount(10);
            cb.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                    BorderFactory.createEmptyBorder(2, 6, 2, 6)));
            cb.setRenderer(new DefaultListCellRenderer() {
                @Override
                public Component getListCellRendererComponent(JList<?> list, Object value,
                        int index, boolean isSelected, boolean cellHasFocus) {
                    super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
                    if (index == -1) {
                        // Closed face — just show clean text
                        setBackground(INPUT_BG);
                        setForeground(FG_LIGHT);
                        setFont(new Font("Segoe UI", Font.PLAIN, 13));
                        setBorder(BorderFactory.createEmptyBorder(3, 6, 3, 6));
                    } else if (isSelected) {
                        setBackground(ACCENT_PURPLE);
                        setForeground(FG_WHITE);
                        setFont(new Font("Segoe UI", Font.BOLD, 13));
                        setBorder(BorderFactory.createCompoundBorder(
                                BorderFactory.createMatteBorder(0, 4, 0, 0, new Color(180, 140, 230)),
                                BorderFactory.createEmptyBorder(5, 10, 5, 10)));
                    } else {
                        setBackground(index % 2 == 0 ? INPUT_BG : TR_ALT);
                        setForeground(FG_LIGHT);
                        setFont(new Font("Segoe UI", Font.PLAIN, 13));
                        setBorder(BorderFactory.createEmptyBorder(5, 14, 5, 10));
                    }
                    setPreferredSize(new java.awt.Dimension(getPreferredSize().width, 30));
                    return this;
                }
            });
            // Focus glow border
            cb.addFocusListener(new java.awt.event.FocusAdapter() {
                @Override
                public void focusGained(java.awt.event.FocusEvent e) {
                    cb.setBorder(BorderFactory.createCompoundBorder(
                            BorderFactory.createLineBorder(ACCENT_PURPLE, 2, true),
                            BorderFactory.createEmptyBorder(1, 5, 1, 5)));
                }

                @Override
                public void focusLost(java.awt.event.FocusEvent e) {
                    cb.setBorder(BorderFactory.createCompoundBorder(
                            BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                            BorderFactory.createEmptyBorder(2, 6, 2, 6)));
                }
            });

            // ── JCheckBox ────────────────────────────────────────────────────────
        } else if (comp instanceof JCheckBox) {
            JCheckBox c2 = (JCheckBox) comp;
            c2.setBackground(BG_PANEL);
            c2.setForeground(FG_LIGHT);
            c2.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            c2.setFocusPainted(false);

            // ── JRadioButton ─────────────────────────────────────────────────────
        } else if (comp instanceof JRadioButton) {
            JRadioButton rb = (JRadioButton) comp;
            rb.setBackground(BG_PANEL);
            rb.setForeground(FG_LIGHT);
            rb.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            rb.setFocusPainted(false);

            // ── JLabel ───────────────────────────────────────────────────────────
        } else if (comp instanceof JLabel) {
            JLabel lbl = (JLabel) comp;
            lbl.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            // Override label color only if it still carries the default black foreground
            Color fg = lbl.getForeground();
            if (fg != null && fg.getRed() < 80 && fg.getGreen() < 80 && fg.getBlue() < 80) {
                lbl.setForeground(FG_LIGHT);
            }

            // ── JPanel ───────────────────────────────────────────────────────────
        } else if (comp instanceof JPanel) {
            JPanel p = (JPanel) comp;
            Color bg = p.getBackground();
            // Re-color panels that are default grey (unused custom colours are left alone)
            if (bg != null && bg.getRed() >= 200 && bg.getGreen() >= 200 && bg.getBlue() >= 200) {
                p.setBackground(BG_PANEL);
            }

            // ── JScrollPane ───────────────────────────────────────────────────────
        } else if (comp instanceof JScrollPane) {
            JScrollPane sp = (JScrollPane) comp;
            sp.setBackground(BG_PANEL);
            sp.getViewport().setBackground(INPUT_BG);
            sp.setBorder(BorderFactory.createLineBorder(new Color(190, 170, 225), 1));

            // ── JSpinner ──────────────────────────────────────────────────────────
        } else if (comp instanceof JSpinner) {
            JSpinner sp = (JSpinner) comp;
            sp.setBackground(INPUT_BG);
            sp.setForeground(FG_LIGHT);
            sp.setFont(new Font("Segoe UI", Font.PLAIN, 13));

            // ── JList ────────────────────────────────────────────────────────────
        } else if (comp instanceof JList<?>) {
            JList<?> lst = (JList<?>) comp;
            lst.setBackground(INPUT_BG);
            lst.setForeground(FG_LIGHT);
            lst.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            lst.setSelectionBackground(ACCENT_PURPLE);
            lst.setSelectionForeground(FG_WHITE);
            lst.setFixedCellHeight(30);
            lst.setBorder(BorderFactory.createCompoundBorder(
                    BorderFactory.createLineBorder(INPUT_BORDER, 1, true),
                    BorderFactory.createEmptyBorder(4, 0, 4, 0)));
            lst.setCellRenderer(new DefaultListCellRenderer() {
                @Override
                public Component getListCellRendererComponent(JList<?> list, Object value,
                        int index, boolean isSelected, boolean cellHasFocus) {
                    super.getListCellRendererComponent(list, value, index, isSelected, cellHasFocus);
                    if (isSelected) {
                        setBackground(ACCENT_PURPLE);
                        setForeground(FG_WHITE);
                        setFont(new Font("Segoe UI", Font.BOLD, 13));
                        setBorder(BorderFactory.createCompoundBorder(
                                BorderFactory.createMatteBorder(0, 4, 0, 0, new Color(180, 140, 230)),
                                BorderFactory.createEmptyBorder(4, 10, 4, 10)));
                    } else {
                        setBackground(index % 2 == 0 ? INPUT_BG : TR_ALT);
                        setForeground(FG_LIGHT);
                        setFont(new Font("Segoe UI", Font.PLAIN, 13));
                        setBorder(BorderFactory.createEmptyBorder(4, 14, 4, 10));
                    }
                    return this;
                }
            });
        }
        } // close JMenuItem else-if
    }

    /**
     * Installs a modern gradient-painted UI on a single JButton.
     * Color is chosen automatically from the button's text content.
     * Safe to call multiple times — tagged buttons are skipped.
     */
    public static void styleButton(JButton btn) {
        if (Boolean.TRUE.equals(btn.getClientProperty("tm.themed")))
            return;
        btn.putClientProperty("tm.themed", Boolean.TRUE);

        btn.setForeground(Color.WHITE);
        btn.setFocusPainted(false);
        btn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        btn.setOpaque(false);
        btn.setContentAreaFilled(false);
        btn.setBorderPainted(false);

        boolean hasIcon = btn.getIcon() != null;
        if (hasIcon) {
            // ── Scale icon to 30×30 ───────────────────────────────────────────────
            Icon ic = btn.getIcon();
            if (ic instanceof ImageIcon) {
                java.awt.Image img = ((ImageIcon) ic).getImage()
                        .getScaledInstance(30, 30, java.awt.Image.SCALE_SMOOTH);
                btn.setIcon(new ImageIcon(img));
            }

            // ── Extract name + shortcut from HTML text ────────────────────────────
            String raw = btn.getText() == null ? "" : btn.getText();
            // Extract shortcut like (Alt+S) or (Alt+N)
            java.util.regex.Matcher shortcutMatcher =
                    java.util.regex.Pattern.compile("\\((Alt\\+[^)]+)\\)", java.util.regex.Pattern.CASE_INSENSITIVE)
                                          .matcher(raw);
            String shortcut = shortcutMatcher.find() ? shortcutMatcher.group(1) : "";

            // Strip HTML & shortcut to get clean name
            String name = raw.replaceAll("<[^>]+>", " ")
                             .replaceAll("\\(.*?\\)", "")
                             .replaceAll("\\s+", " ").trim();

            if (!name.isEmpty()) {
                if (!shortcut.isEmpty()) {
                    // Two-line HTML: bold name + small grey shortcut
                    btn.setText("<html><center><b>" + name + "</b>"
                            + "<br><font size='1' color='#ddd8ff'>" + shortcut + "</font></center></html>");
                } else {
                    btn.setText(name);
                }
            }

            // ── Icon LEFT, text RIGHT (side-by-side) ─────────────────────────────
            btn.setVerticalTextPosition(SwingConstants.CENTER);
            btn.setHorizontalTextPosition(SwingConstants.RIGHT);
            btn.setVerticalAlignment(SwingConstants.CENTER);
            btn.setHorizontalAlignment(SwingConstants.LEFT);
            btn.setIconTextGap(8);
            btn.setFont(new Font("Segoe UI", Font.PLAIN, 13));
            btn.setBorder(BorderFactory.createEmptyBorder(6, 14, 6, 18));
        } else {
            btn.setFont(new Font("Segoe UI", Font.BOLD, 13));
            btn.setBorder(BorderFactory.createEmptyBorder(9, 20, 10, 20));
        }

        // Strip HTML tags so keywords match reliably
        String rawText = btn.getText() == null ? "" : btn.getText();
        String text = rawText.replaceAll("<[^>]+>", " ").replaceAll("\\s+", " ")
                .toLowerCase().trim();

        final Color base;
        if (text.contains("close") || text.contains("exit") || text.contains("cancel"))
            base = new Color(210, 35, 55); // vivid red
        else if (text.contains("delete") || text.contains("remove"))
            base = new Color(195, 60, 10); // deep orange-red
        else if (text.contains("clear"))
            base = new Color(200, 115, 10); // amber-orange
        else if (text.contains("save") || text.contains("update") || text.contains("add"))
            base = new Color(25, 110, 215); // bright blue
        else if (text.contains("tender"))
            base = new Color(120, 30, 195); // bright violet
        else if (text.contains("apply") || text.contains("retrive") || text.contains("retrieve"))
            base = new Color(25, 145, 65); // vivid green
        else if (text.contains("excel") || text.contains("export"))
            base = new Color(20, 140, 60); // green
        else if (text.contains("draft") || text.contains("load"))
            base = new Color(80, 45, 200); // deep indigo-blue
        else if (text.contains("hold"))
            base = new Color(175, 90, 10); // gold-amber
        else if (text.contains("next") || text.contains("last") || text.contains("entry")
                || text.contains("pre") || text.contains("prev"))
            base = new Color(55, 55, 190); // indigo
        else if (text.contains("view") || text.contains("print") || text.contains("generate"))
            base = new Color(155, 105, 10); // gold
        else
            base = BTN_DEFAULT; // vivid purple fallback

        final Color hoverBase = new Color(
                Math.min(base.getRed() + 55, 255),
                Math.min(base.getGreen() + 40, 255),
                Math.min(base.getBlue() + 55, 255));
        final Color pressBase = base.darker().darker();

        btn.setUI(new BasicButtonUI() {
            @Override
            public void paint(Graphics g, JComponent c) {
                AbstractButton b = (AbstractButton) c;
                boolean pressed = b.getModel().isPressed();
                boolean rollover = b.getModel().isRollover();
                boolean focused = b.isFocusOwner();
                int w = c.getWidth(), h = c.getHeight();
                int arc = 20;

                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                g2.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
                g2.setRenderingHint(RenderingHints.KEY_STROKE_CONTROL, RenderingHints.VALUE_STROKE_PURE);

                // Tactile press: shift content down 2 px
                if (pressed)
                    g2.translate(0, 2);

                // ── Color-tinted layered drop shadow ────────────────────────────
                if (!pressed) {
                    // Outer glow (color-tinted, wide)
                    g2.setColor(new Color(base.getRed() / 3, base.getGreen() / 3,
                            base.getBlue() / 3, 35));
                    g2.fillRoundRect(2, 5, w - 4, h + 2, arc, arc);
                    // Close shadow
                    g2.setColor(new Color(0, 0, 0, 30));
                    g2.fillRoundRect(1, 3, w - 2, h, arc, arc);
                }

                // ── Main gradient: +80 bright top → vivid base at 80% ───────────
                Color fill = pressed ? pressBase : rollover ? hoverBase : base;
                g2.setPaint(new GradientPaint(
                        0, 0, lighten(fill, 80),
                        0, h * 0.80f, fill));
                g2.fillRoundRect(0, 0, w, h - (pressed ? 0 : 3), arc, arc);

                // ── Bottom edge ledge ────────────────────────────────────────────
                if (!pressed) {
                    g2.setColor(new Color(0, 0, 0, 50));
                    g2.fillRoundRect(0, h - 5, w, 5, arc / 2, arc / 2);
                    g2.setColor(new Color(255, 255, 255, 40));
                    g2.setStroke(new BasicStroke(1f));
                    g2.drawLine(arc / 2, h - 4, w - arc / 2, h - 4);
                }

                // ── Glass gloss: top 40% white-to-transparent ────────────────────
                int glassH = (int) (h * 0.42);
                g2.setPaint(new GradientPaint(
                        0, 0, new Color(255, 255, 255, 140),
                        0, glassH, new Color(255, 255, 255, 0)));
                g2.fillRoundRect(1, 1, w - 2, glassH, arc - 2, arc - 2);

                // ── Icon halo tray (icon buttons only) ──────────────────────────
                if (hasIcon) {
                    int iw = c.getWidth() - 16;
                    int ih = (int) (h * 0.62);
                    g2.setColor(new Color(255, 255, 255, 38));
                    g2.fillOval(8, 4, iw, ih);
                }

                // ── Pressed inset shadow ─────────────────────────────────────────
                if (pressed) {
                    g2.setPaint(new GradientPaint(
                            0, 0, new Color(0, 0, 0, 65),
                            0, h * 0.35f, new Color(0, 0, 0, 0)));
                    g2.fillRoundRect(0, 0, w, (int) (h * 0.35), arc, arc);
                }

                // ── Outer border stroke (1px lighter tint of base) ───────────────
                if (!pressed) {
                    g2.setColor(new Color(255, 255, 255, 70));
                    g2.setStroke(new BasicStroke(1.2f));
                    g2.drawRoundRect(0, 0, w - 1, h - 4, arc, arc);
                }

                // ── Hover glow ring ──────────────────────────────────────────────
                if (rollover && !pressed) {
                    g2.setColor(new Color(255, 255, 255, 145));
                    g2.setStroke(new BasicStroke(2f));
                    g2.drawRoundRect(1, 1, w - 3, h - 5, arc - 2, arc - 2);
                    g2.setColor(new Color(fill.getRed(), fill.getGreen(), fill.getBlue(), 70));
                    g2.setStroke(new BasicStroke(3f));
                    g2.drawRoundRect(-2, -2, w + 3, h + 1, arc + 4, arc + 4);
                }

                // ── Keyboard focus dashed ring ───────────────────────────────────
                if (focused) {
                    g2.setColor(new Color(ACCENT_PURPLE.getRed(),
                            ACCENT_PURPLE.getGreen(), ACCENT_PURPLE.getBlue(), 210));
                    g2.setStroke(new BasicStroke(2.5f, BasicStroke.CAP_ROUND,
                            BasicStroke.JOIN_ROUND, 0, new float[] { 4, 3 }, 0));
                    g2.drawRoundRect(-3, -3, w + 5, h + 4, arc + 6, arc + 6);
                }

                g2.dispose();
                super.paint(g, c);
            }
        });
    }

    /** Returns a colour lightened by {@code amount} points on each RGB channel. */
    private static Color lighten(Color c, int amount) {
        return new Color(
                Math.min(c.getRed() + amount, 255),
                Math.min(c.getGreen() + amount, 255),
                Math.min(c.getBlue() + amount, 255));
    }
}
