package estimatepack;

import com.selrom.db.DataUtil;
import com.selrom.db.disable_warnigs;
import com.selrom.utils.JasperReportCompiler;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.MediaPrintableArea;
import javax.print.attribute.standard.MediaSize;
import javax.print.attribute.standard.MediaSizeName;
import menupack.AmountInWords;
import menupack.SelRomJasper;
import menupack.UserSession;
import Utils.OtherChargesDialog;
import net.sf.jasperreports.engine.JRBand;
import net.sf.jasperreports.engine.JRElement;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.design.JRDesignElement;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

public class print_estimate_a4 {

    JasperViewer jasperViewer;
    int num = 0;
    String rupe = "";
    int hmany = 2, hmany2 = 3;
    DataUtil util;

    public void Report(DataUtil util, String billno, String drive, String folder, String billformat) {
        this.util = util;
        try {

            Map<String, Object> parameters = new HashMap<>();

            String add1 = "", add2 = "", add3 = "", add4 = "", add5 = "", sname = "", scode = "", letter = "",
                    head = "", sms1 = "", sms2 = "", sms3 = "", sms4 = "", logoPath = "", estimateTerms = "";
            String companyWhere = UserSession.hasSelectedCompany()
                    ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            String query = "select cname,add1,add2,add3,add4,state,scode,ehead,sms1,sms2,sms3,sms4,letter,hmany,logo_path,IFNULL(estimate_terms,'') from company"
                    + companyWhere;
            ResultSet r = util.doQuery(query);
            while (r.next()) {
                logoPath = r.getString("logo_path");
                add1 = r.getString(1);
                add2 = r.getString(2);
                add3 = r.getString(3);
                add4 = r.getString(4);
                add5 = r.getString(5);
                sname = r.getString(6);
                scode = r.getString(7);
                head = r.getString(8);
                sms1 = r.getString(9);
                sms2 = r.getString(10);
                sms3 = r.getString(11);
                sms4 = r.getString(12);
                letter = r.getString(13);
                hmany = r.getInt(14);
                estimateTerms = r.getString(16);
            }
            // Set Company Details
            parameters.put("CompanyName", add1);
            parameters.put("CompanyAddress", (add2 + (add3.length() > 1 ? ", " + add3 : "")
                    + (add4.length() > 1 ? ", " + add4 : "") + (add5.length() > 1 ? ", " + add5 : "")));
            parameters.put("CompanyGST", add5);
            parameters.put("logo_path", logoPath);

            // Fetch customer and invoice details from estimate table
            String cname = "", mobile = "", billno1 = "", date = "";
            double sub = 0, net = 0, taxamt = 0, addamt = 0;
            query = "select cname, mobile, billno, date_format(dat,'%d/%m/%Y'), sub, net, taxamt, addamt from estimate where billno='"
                    + billno + "'";
            r = util.doQuery(query);
            if (r == null) {
                throw new SQLException("Query failed or returned null ResultSet: " + query);
            }
            if (r.next()) {
                cname = r.getString(1);
                mobile = r.getString(2);
                billno1 = r.getString(3);
                date = r.getString(4);
                sub = r.getDouble(5);
                net = r.getDouble(6);
                taxamt = r.getDouble(7);
                addamt = r.getDouble(8);
            } else {
                throw new SQLException("No estimate found for billno: " + billno);
            }

            num = (int) Math.round(net);
            num();

            // Set Customer Details
            parameters.put("CustomerName", cname);
            parameters.put("CustomerPhone", mobile);
            parameters.put("CustomerAddress", ""); // No address fields in estimate table
            parameters.put("CustomerGSTIN", ""); // No GSTIN field in estimate table

            // Set Invoice Details
            parameters.put("InvoiceNo", billno1);
            parameters.put("InvoiceDate", date);
            parameters.put("SalesMan", sname);

            // Set Amounts (formatted as string for display)
            parameters.put("TotalAmountBeforeTax", sub);
            parameters.put("TotalAmountBeforeTaxStr", String.format("%,.2f", sub));
            parameters.put("GrandTotal", net);
            parameters.put("GrandTotalStr", String.format("%,.2f", net));
            parameters.put("AmountInWords", "Rupees " + rupe + " Only");
            parameters.put("TermsAndConditions", estimateTerms);

            // ==================== OTHER CHARGES ====================
            String companyId = UserSession.hasSelectedCompany() ? UserSession.getSelectedCompanyID() : "";
            java.util.List<String[]> otherCharges = OtherChargesDialog.loadCharges(util, "estimate_other_charges",
                    billno, companyId);
            String otherChargesStr = OtherChargesDialog.buildChargesDisplayString(otherCharges, hmany);
            parameters.put("OtherChargesStr", otherChargesStr);
            parameters.put("OtherChargesTotalStr", addamt > 0 ? String.format("%,." + hmany + "f", addamt) : "");

            parameters.put("CGSTAmount", taxamt / 2);
            parameters.put("SGSTAmount", taxamt / 2);
            parameters.put("IGSTAmount", 0.0);
            parameters.put("CGSTAmountStr", String.format("%,.2f", taxamt / 2));
            parameters.put("SGSTAmountStr", String.format("%,.2f", taxamt / 2));
            parameters.put("IGSTAmountStr", "0.00");
            parameters.put("TaxAmountGST", taxamt);
            parameters.put("TaxAmountGSTStr", String.format("%,.2f", taxamt));

            // Prepare product list for JRBeanCollectionDataSource
            ArrayList<SelRomJasper> k = new ArrayList<>();
            int serial = 1;
            String companyFilter = UserSession.hasSelectedCompany()
                    ? " AND company_id='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            query = "select iname1,quan,price,amount,disp,disamt,sub,taxp,taxamt,total,udes,hsn,mrp from estimate_items where billno='"
                    + billno + "'" + companyFilter;
            r = util.doQuery(query);
            while (r.next()) {
                SelRomJasper selRomJasper = new SelRomJasper();
                String iname = r.getString(1);
                double quan = r.getDouble(2);
                double price = r.getDouble(3);
                double amount = r.getDouble(4);
                double item_disp = r.getDouble(5);
                double item_disamt = r.getDouble(6);
                double item_sub = r.getDouble(7);
                double item_taxp = r.getDouble(8);
                double item_taxamt = r.getDouble(9);
                double item_total = r.getDouble(10);
                String item_hsn = r.getString(12);
                double item_mrp = r.getDouble(13);
                String quan2 = String.format("%." + hmany2 + "f", quan);
                String[] spli3 = quan2.split("\\.");
                int wha3 = Integer.parseInt(spli3[1]);
                if (wha3 <= 0) {
                    quan2 = spli3[0];
                }
                String price2 = String.format("%." + hmany + "f", price);
                String amount2 = String.format("%." + hmany + "f", amount);
                String mrp2 = String.format("%." + hmany + "f", item_mrp);
                selRomJasper.setSno(String.valueOf(serial));
                selRomJasper.setProduct_name(iname);
                selRomJasper.setMrp(mrp2);
                selRomJasper.setRate(price2);
                selRomJasper.setNet_rate(price2);
                selRomJasper.setQty(quan2);
                selRomJasper.setAmount(amount2);
                selRomJasper.setHsn(item_hsn != null ? item_hsn : "");
                selRomJasper.setDisc_pct(String.format("%." + hmany + "f", item_disp));
                selRomJasper.setDisc_amt(String.format("%." + hmany + "f", item_disamt));
                selRomJasper.setTax_pct(String.format("%." + hmany + "f", item_taxp));
                selRomJasper.setTax_amt(String.format("%." + hmany + "f", item_taxamt));
                selRomJasper.setSub_total(String.format("%." + hmany + "f", item_sub));
                selRomJasper.setTotal(String.format("%." + hmany + "f", item_total));
                selRomJasper.setMfg_date("");
                selRomJasper.setExp_date("");
                k.add(selRomJasper);
                serial++;
            }
            disable_warnigs.disableAccessWarnings();

            // ── Column header/visibility settings ──
            // Read shop_type to set correct defaults before DB override
            String shopType = "General";
            try {
                String stWhere = UserSession.hasSelectedCompany()
                        ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                        : "";
                ResultSet stRs = util.doQuery("SELECT shop_type FROM company" + stWhere + " LIMIT 1");
                if (stRs != null && stRs.next()) {
                    String st = stRs.getString("shop_type");
                    if (st != null && !st.isEmpty())
                        shopType = st;
                }
            } catch (Exception ignored) {
            }
            boolean isPharmacyOrGrocery = shopType.equals("Pharmacy") || shopType.equals("Grocery");
            boolean isClothing = shopType.equals("Clothing");
            // Set shop_type-based defaults (DB rows override these if they exist)
            parameters.put("Col_Mfg_Show", isPharmacyOrGrocery);
            parameters.put("Col_Exp_Show", isPharmacyOrGrocery);
            parameters.put("Col_Hsn_Show", !isClothing);
            parameters.put("Col_TaxPct_Show", false);
            parameters.put("Col_Price_Show", false);
            parameters.put("Col_Amt_Show", false);
            try {
                String colCompanyFilter = UserSession.hasSelectedCompany()
                        ? " AND company_id='" + UserSession.getSelectedCompanyID() + "'"
                        : " AND company_id=''";
                ResultSet colRs = util.doQuery(
                        "SELECT col_key, col_header, col_visible FROM invoice_columns " +
                                "WHERE doc_type='estimate'" + colCompanyFilter + " ORDER BY col_order");
                while (colRs != null && colRs.next()) {
                    String key = colRs.getString("col_key");
                    String header = colRs.getString("col_header");
                    boolean visible = colRs.getInt("col_visible") == 1;
                    switch (key) {
                        case "sno":
                            parameters.put("Col_Sno_Header", header);
                            break;
                        case "product_name":
                            parameters.put("Col_Item_Header", header);
                            break;
                        case "hsn":
                            parameters.put("Col_Hsn_Header", header);
                            parameters.put("Col_Hsn_Show", visible);
                            break;
                        case "qty":
                            parameters.put("Col_Qty_Header", header);
                            break;
                        case "mrp":
                            parameters.put("Col_MRP_Header", header);
                            break;
                        case "price":
                            parameters.put("Col_Price_Header", header);
                            parameters.put("Col_Price_Show", visible);
                            break;
                        case "amount":
                            parameters.put("Col_Amt_Header", header);
                            parameters.put("Col_Amt_Show", visible);
                            break;
                        case "disc":
                            parameters.put("Col_DisPct_Header", header);
                            break;
                        case "disc_amt":
                            parameters.put("Col_DisAmt_Header", header);
                            break;
                        case "tax_pct":
                            parameters.put("Col_TaxPct_Header", header);
                            parameters.put("Col_TaxPct_Show", visible);
                            break;
                        case "tax_amt":
                            parameters.put("Col_TaxAmt_Header", header);
                            break;
                        case "net_rate":
                            parameters.put("Col_NetRate_Header", header);
                            break;
                        case "sub_total":
                            parameters.put("Col_SubTotal_Header", header);
                            break;
                        case "mfg_date":
                            parameters.put("Col_Mfg_Header", header);
                            parameters.put("Col_Mfg_Show", visible);
                            break;
                        case "exp_date":
                            parameters.put("Col_Exp_Header", header);
                            parameters.put("Col_Exp_Show", visible);
                            break;
                    }
                }
            } catch (Exception ignored) {
                // Fall back to JRXML defaults if table not yet migrated
            }

            JasperReport jasperReport;
            if (billformat.equals("A5") || billformat.equals("Estimate A5")) {
                jasperReport = JasperReportCompiler.compileReport("/JasperFiles/A4_Estimate/A5_Estimate.jrxml");
            } else if ("Estimate Half Page".equals(billformat) || "A4-Half".equals(billformat)) {
                jasperReport = JasperReportCompiler.compileReport("/JasperFiles/A4_Half/Estimate_Half.jrxml");
            } else {
                boolean dHsn = !Boolean.FALSE.equals(parameters.get("Col_Hsn_Show"));
                boolean dMfg = Boolean.TRUE.equals(parameters.get("Col_Mfg_Show"));
                boolean dExp = Boolean.TRUE.equals(parameters.get("Col_Exp_Show"));
                boolean dPrice = Boolean.TRUE.equals(parameters.get("Col_Price_Show"));
                boolean dAmt = Boolean.TRUE.equals(parameters.get("Col_Amt_Show"));
                boolean dTaxPct = Boolean.TRUE.equals(parameters.get("Col_TaxPct_Show"));
                jasperReport = buildDynamicA4Report(dHsn, dMfg, dExp, dPrice, dAmt, dTaxPct);
            }

            JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(k);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);

            com.selrom.utils.ReportPreview.showPreview(jasperPrint, drive, folder);

        } catch (ClassNotFoundException | SQLException | JRException e) {
            System.err.println("ERRor :" + e.getMessage());
        }

    }

    void num() {
        try {
            AmountInWords a1 = new AmountInWords();
            a1.input(num);
            rupe = a1.convertToWords(num);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }

    /**
     * Builds a JasperReport from A4_Estimate.jrxml with column widths dynamically
     * adjusted: when an optional column is hidden its pixel-width is absorbed by
     * the nearest preceding visible column so no blank gaps are left.
     */
    private static JasperReport buildDynamicA4Report(
            boolean showHsn, boolean showMfg, boolean showExp,
            boolean showPrice, boolean showAmt, boolean showTaxPct) throws JRException {

        // Column base X and W matching A4_Estimate.jrxml (total 555 px)
        final int[] BASE_X = { 0, 15, 85, 120, 148, 181, 214, 252, 288, 325, 364, 385, 418, 439, 472, 512 };
        final int[] BASE_W = { 15, 70, 35, 28, 33, 33, 35, 36, 37, 39, 21, 33, 21, 33, 40, 43 };
        final boolean[] SHOW = {
                true, true, showHsn, true, showMfg, showExp,
                true, true, showPrice, showAmt, true, true, showTaxPct, true, true, true
        };

        // Absorb each hidden column's width into its left neighbour
        int[] newW = BASE_W.clone();
        int lastVisible = -1;
        for (int i = 0; i < SHOW.length; i++) {
            if (SHOW[i]) {
                lastVisible = i;
            } else if (lastVisible >= 0) {
                newW[lastVisible] += BASE_W[i];
            }
        }

        InputStream in = JasperReportCompiler.class.getResourceAsStream(
                "/JasperFiles/A4_Estimate/A4_Estimate.jrxml");
        if (in == null)
            throw new JRException("Report template not found: A4_Estimate.jrxml");
        JasperDesign design = JRXmlLoader.load(in);

        patchBandWidths(design.getColumnHeader(), BASE_X, BASE_W, newW);
        for (JRBand band : design.getDetailSection().getBands()) {
            patchBandWidths(band, BASE_X, BASE_W, newW);
        }

        return JasperCompileManager.compileReport(design);
    }

    /**
     * Iterates every element in the band and updates its width when matched by
     * original (x, width) – the dual match avoids touching background rectangles
     * or separator lines that share an x=0 origin.
     */
    private static void patchBandWidths(JRBand band, int[] BASE_X, int[] BASE_W, int[] newW) {
        if (band == null)
            return;
        for (JRElement el : band.getElements()) {
            int ex = el.getX(), ew = el.getWidth();
            for (int i = 0; i < BASE_X.length; i++) {
                if (BASE_X[i] == ex && BASE_W[i] == ew) {
                    ((JRDesignElement) el).setWidth(newW[i]);
                    break;
                }
            }
        }
    }

    void ruppes(String rupee) {
        rupe = rupee;
    }

}