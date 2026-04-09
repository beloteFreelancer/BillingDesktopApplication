package menupack;

public class UserSession {

    private static String username;
    private static String userType;
    private static String serverIp;

    // Financial Year (Indian FY: Apr 1 – Mar 31)
    private static String financialYearLabel; // e.g. "2024-25"
    private static String financialYearStart; // e.g. "2024/04/01"
    private static String financialYearEnd; // e.g. "2025/03/31"

    // Prevent instantiation
    private UserSession() {
    }

    public static void setSession(String user, String type) {
        username = user;
        userType = type;
    }

    public static String getUsername() {
        return username;
    }

    public static String getUserType() {
        return userType;
    }

    public static boolean isLoggedIn() {
        return username != null && !username.isEmpty();
    }

    public static void setServerIp(String ip) {
        serverIp = ip;
    }

    public static String getServerIp() {
        return serverIp;
    }

    public static void clearSession() {
        username = null;
        userType = null;
    }

    // ── Financial Year ────────────────────────────────────────────────────────
    public static void setFinancialYear(String label, String start, String end) {
        financialYearLabel = label;
        financialYearStart = start;
        financialYearEnd = end;
    }

    public static String getFinancialYearLabel() {
        return financialYearLabel;
    }

    public static String getFinancialYearStart() {
        return financialYearStart;
    }

    public static String getFinancialYearEnd() {
        return financialYearEnd;
    }

    // ── Selected Company ──────────────────────────────────────────────────────
    private static String selectedCompanyID;
    private static String selectedCompanyName;

    public static void setSelectedCompany(String companyID, String companyName) {
        selectedCompanyID = companyID;
        selectedCompanyName = companyName;
    }

    public static void clearSelectedCompany() {
        selectedCompanyID = null;
        selectedCompanyName = null;
    }

    public static String getSelectedCompanyID() {
        return selectedCompanyID;
    }

    public static String getSelectedCompanyName() {
        return selectedCompanyName;
    }

    /** @return true when a specific company (not "All") is active */
    public static boolean hasSelectedCompany() {
        return selectedCompanyID != null && !selectedCompanyID.isEmpty();
    }

    // ── Privacy Mode ──────────────────────────────────────────────────────────
    private static boolean privacyMode = false;

    public static void setPrivacyMode(boolean enabled) {
        privacyMode = enabled;
    }

    public static boolean isPrivacyMode() {
        return privacyMode;
    }
}
