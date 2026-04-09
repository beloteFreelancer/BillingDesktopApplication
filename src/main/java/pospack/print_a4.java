package pospack;

import com.selrom.db.DataUtil;
import com.selrom.db.disable_warnigs;
import com.selrom.utils.JasperReportCompiler;

import menupack.AmountInWords;
import menupack.SelRomJasper;
import menupack.UserSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.awt.image.BufferedImage;
import Utils.UpiQrGenerator;

public class print_a4 {

    int num = 0;
    String rupe = "";
    int hmany = 2, hmany1 = 3;
    DataUtil util;

    public void Report(DataUtil util, String billno, String drive, String folder, String billformat) {
        this.util = util;

        try {
            Map<String, Object> parameters = new HashMap<>();

            // ==================== SHOP SETTINGS ====================
            String add1 = "", add2 = "", add3 = "", add4 = "", add5 = "", sname = "", scode = "", letter = "",
                    head = "", sms1 = "", sms2 = "", sms3 = "", sms4 = "", logoPath = "", upiId = "", shopType = "",
                    salesTerms = "";
            String compBankName = "", compBankAccNo = "", compBankIfsc = "", compBankBranch = "", compBankHolder = "";
            String companyWhere = UserSession.hasSelectedCompany()
                    ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            ResultSet r = util.doQuery(
                    "select cname,add1,add2,add3,add4,state,scode,bhead,sms1,sms2,sms3,sms4,letter,hmany,logo_path,upi_id,IFNULL(shop_type,''),IFNULL(bank_name,''),IFNULL(bank_acc_no,''),IFNULL(bank_ifsc,''),IFNULL(bank_branch,''),IFNULL(bank_holder,''),IFNULL(sales_terms,'') from company"
                            + companyWhere);
            while (r.next()) {
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
                logoPath = r.getString(15);
                upiId = r.getString(16);
                shopType = r.getString(17);
                compBankName = r.getString(18);
                compBankAccNo = r.getString(19);
                compBankIfsc = r.getString(20);
                compBankBranch = r.getString(21);
                compBankHolder = r.getString(22);
                salesTerms = r.getString(23);
            }
            boolean isClothing = "Clothing".equalsIgnoreCase(shopType);

            // Company details
            String companyAddr = (add2.length() > 1 ? add2 : "")
                    + (add3.length() > 1 ? ", " + add3 : "")
                    + (add4.length() > 1 ? ", " + add4 : "")
                    + (add5.length() > 1 ? ", " + add5 : "");
            parameters.put("CompanyName", add1);
            parameters.put("CompanyAddress", companyAddr);
            parameters.put("CompanyGST", add5.length() > 1 ? add5 : "");
            parameters.put("logo_path", logoPath != null ? logoPath : "");

            // ==================== SALES HEADER ====================
            String date = "", quans = "", cid = "", tax = "", pby = "";
            double sub = 0, dis = 0, net = 0, taxamt = 0, paid = 0, bal = 0;

            r = util.doQuery(
                    "select date_format(dat,'%d/%m/%Y'),quans,sub,disamt,net,cid,taxamt,tax,pby,paid,bal from sales where billno='"
                            + billno + "'");
            while (r.next()) {
                date = r.getString(1);
                quans = r.getString(2);
                sub = r.getDouble(3);
                dis = r.getDouble(4);
                net = r.getDouble(5);
                cid = r.getString(6);
                taxamt = r.getDouble(7);
                tax = r.getString(8);
                pby = r.getString(9);
                paid = r.getDouble(10);
                bal = r.getDouble(11);
            }

            String billno1 = letter.equals(".") ? billno : letter + billno;

            // Invoice details
            parameters.put("InvoiceNo", billno1);
            parameters.put("InvoiceDate", date);
            parameters.put("SalesMan", sname + (scode.length() > 1 ? " (" + scode + ")" : ""));

            // Compute due date (30 days after invoice date)
            try {
                java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd/MM/yyyy");
                java.util.Date invoiceDate = sdf.parse(date);
                java.util.Calendar cal = java.util.Calendar.getInstance();
                cal.setTime(invoiceDate);
                cal.add(java.util.Calendar.DAY_OF_MONTH, 30);
                parameters.put("DueDate", sdf.format(cal.getTime()));
            } catch (Exception ignored) {
                parameters.put("DueDate", "");
            }

            // ==================== CUSTOMER ====================
            String cname = "", ad1 = "", ad2 = "", ad3 = "", area = "", mobile = "", phone = "", ctin = "";
            r = util.doQuery("select cname,add1,add2,add3,city,mobile,phone,gstno,sname,scode from cust where cid='"
                    + cid + "'");
            while (r.next()) {
                cname = r.getString(1);
                ad1 = r.getString(2);
                ad2 = r.getString(3);
                ad3 = r.getString(4);
                area = r.getString(5);
                mobile = r.getString(6);
                phone = r.getString(7);
                ctin = r.getString(8);
            }
            if (phone.length() > 1)
                mobile += ", " + phone;

            String custAddr = (ad1.length() > 1 ? ad1 : "")
                    + (ad2.length() > 1 ? ", " + ad2 : "")
                    + (ad3.length() > 1 ? ", " + ad3 : "")
                    + (area.length() > 1 ? ", " + area : "");

            parameters.put("CustomerName", cname.length() > 1 ? cname : "");
            parameters.put("CustomerPhone", mobile.length() > 1 ? mobile : "");
            parameters.put("CustomerAddress", custAddr);
            parameters.put("CustomerGSTIN", ctin.length() > 1 ? ctin : "");
            parameters.put("CustomerEmail", "");
            // Ship To = same as Bill To
            parameters.put("ShipToName", cname.length() > 1 ? cname : "");
            parameters.put("ShipToPhone", mobile.length() > 1 ? mobile : "");
            parameters.put("ShipToAddress", custAddr);

            // ==================== AMOUNTS ====================
            double taxamt_cgst = tax.equalsIgnoreCase("Local") ? taxamt / 2 : 0;
            double taxamt_igst = !tax.equalsIgnoreCase("Local") ? taxamt : 0;

            parameters.put("TotalAmountBeforeTax", sub);
            parameters.put("TotalAmountBeforeTaxStr", String.format("%,.2f", sub));
            parameters.put("CGSTAmount", taxamt_cgst);
            parameters.put("CGSTAmountStr", String.format("%,.2f", taxamt_cgst));
            parameters.put("SGSTAmount", taxamt_cgst);
            parameters.put("SGSTAmountStr", String.format("%,.2f", taxamt_cgst));
            parameters.put("IGSTAmount", taxamt_igst);
            parameters.put("IGSTAmountStr", String.format("%,.2f", taxamt_igst));
            parameters.put("TaxAmountGST", taxamt);
            parameters.put("TaxAmountGSTStr", String.format("%,.2f", taxamt));
            parameters.put("GrandTotal", net);
            parameters.put("GrandTotalStr", String.format("%,.2f", net));
            parameters.put("ReceivedAmountStr", String.format("%,.2f", paid));
            parameters.put("PreviousBalanceStr", "0.00");
            parameters.put("CurrentBalanceStr", String.format("%,.2f", bal));

            num = (int) net;
            num();
            parameters.put("AmountInWords", rupe + " Only");
            parameters.put("TermsAndConditions", salesTerms);

            // ==================== BANK DETAILS ====================
            String ano = compBankAccNo, aname = compBankHolder, bname = compBankName, ifsc = compBankIfsc,
                    branch = compBankBranch;
            // Fallback to legacy bank table if company has no bank details
            if (ano == null || ano.isEmpty()) {
                r = util.doQuery("select ano,aname,bank,branch,ifsc from bank");
                while (r.next()) {
                    ano = r.getString(1);
                    aname = r.getString(2);
                    bname = r.getString(3);
                    branch = r.getString(4);
                    ifsc = r.getString(5);
                }
            }
            parameters.put("AccountNo", ano != null && !ano.isEmpty() && !ano.equals(".") ? ano : "N/A");
            parameters.put("BankBranch", branch != null && !branch.isEmpty() && !branch.equals(".") ? branch
                    : (aname != null && !aname.isEmpty() && !aname.equals(".") ? aname : "Main Branch"));
            parameters.put("BankName", bname != null && !bname.isEmpty() && !bname.equals(".") ? bname : "N/A");
            parameters.put("IFSCCode", ifsc != null && !ifsc.isEmpty() && !ifsc.equals(".") ? ifsc : "N/A");

            // ==================== ITEMS ====================
            String companyFilter = UserSession.hasSelectedCompany()
                    ? " AND si.company_id='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            ArrayList<SelRomJasper> k = new ArrayList<>();
            int serial = 1;

            r = util.doQuery(
                    "select si.iname1,si.quan,si.price,si.amount,si.disp,si.disamt,si.sub,si.taxp,si.taxamt,si.total,si.udes,si.hsn,"
                            + "DATE_FORMAT(i.mfg_date,'%d-%m-%Y'),DATE_FORMAT(i.exp_date,'%d-%m-%Y'),"
                            + "IFNULL(si.size,''),IFNULL(si.color,''),IFNULL(si.brand,''),si.mrp,"
                            + "IFNULL(i.tax_inclusion,'') "
                            + "from sales_items si left join item i on si.ino=i.ino and si.company_id=i.company_id where si.billno='"
                            + billno + "'" + companyFilter);
            while (r.next()) {
                SelRomJasper item = new SelRomJasper();

                item.setSno(String.valueOf(serial));
                item.setProduct_name(r.getString(1));
                item.setHsn(r.getString(12) != null && !r.getString(12).equals(".") ? r.getString(12) : "");

                String quan2 = String.format("%." + hmany1 + "f", r.getDouble(2));
                String[] parts = quan2.split("\\.");
                if (parts.length > 1 && Integer.parseInt(parts[1]) <= 0) {
                    quan2 = parts[0];
                }
                item.setQty(quan2);
                item.setRate(String.format("%." + hmany + "f", r.getDouble(3)));

                double taxp = r.getDouble(8);
                double taxAmtItem = r.getDouble(9);
                item.setTax(String.format("%.2f (%.0f%%)", taxAmtItem, taxp));
                item.setAmount(String.format("%." + hmany + "f", r.getDouble(4)));

                // New fields for all-columns PDF
                String mrpVal = r.getString(18);
                item.setMrp(mrpVal != null && !mrpVal.equals(".")
                        ? String.format("%." + hmany + "f", Double.parseDouble(mrpVal))
                        : "");
                item.setDisc_pct(String.format("%.2f", r.getDouble(5)));
                item.setDisc_amt(String.format("%." + hmany + "f", r.getDouble(6)));
                item.setTax_pct(String.format("%.2f", taxp));
                item.setTax_amt(String.format("%." + hmany + "f", taxAmtItem));
                item.setSub_total(String.format("%." + hmany + "f", r.getDouble(7)));
                item.setTotal(String.format("%." + hmany + "f", r.getDouble(10)));

                // Net Rate = base price per unit (exclusive of tax for inclusive items)
                double priceVal = r.getDouble(3);
                String taxInclusion = r.getString(19);
                if (taxInclusion != null && (taxInclusion.equalsIgnoreCase("Inclusive of Tax")
                        || taxInclusion.equalsIgnoreCase("Inclusive Model-II"))) {
                    double netRateVal = priceVal / (1.0 + taxp / 100.0);
                    item.setNet_rate(String.format("%." + hmany + "f", netRateVal));
                } else {
                    item.setNet_rate(String.format("%." + hmany + "f", priceVal));
                }

                String itemSize2 = r.getString(15) != null ? r.getString(15) : "";
                String itemColor2 = r.getString(16) != null ? r.getString(16) : "";
                String itemBrand2 = r.getString(17) != null ? r.getString(17) : "";
                if (isClothing) {
                    StringBuilder extras = new StringBuilder();
                    if (!itemSize2.isEmpty())
                        extras.append(itemSize2);
                    if (!itemColor2.isEmpty()) {
                        if (extras.length() > 0)
                            extras.append("/");
                        extras.append(itemColor2);
                    }
                    if (!itemBrand2.isEmpty()) {
                        if (extras.length() > 0)
                            extras.append("/");
                        extras.append(itemBrand2);
                    }
                    if (extras.length() > 0)
                        item.setProduct_name(item.getProduct_name() + " (" + extras + ")");
                }
                item.setMfg_date(r.getString(13) != null ? r.getString(13) : "");
                item.setExp_date(r.getString(14) != null ? r.getString(14) : "");
                k.add(item);
                serial++;
            }

            // ==================== UPI QR CODE ====================
            BufferedImage qrImage = null;
            if ("UPI".equalsIgnoreCase(pby) && upiId != null && !upiId.trim().isEmpty()) {
                String upiUrl = "upi://pay?pa=" + upiId.trim() + "&am=" + String.format("%.2f", net) + "&cu=INR";
                qrImage = UpiQrGenerator.generateQRImage(upiUrl, 200, 200);
            }
            parameters.put("QRCodeImage", qrImage);

            // ── Column header/visibility settings ──
            // shopType already read from company table above
            if (shopType == null || shopType.isEmpty())
                shopType = "General";
            boolean isPharmacyOrGrocery = shopType.equals("Pharmacy") || shopType.equals("Grocery");
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
                                "WHERE doc_type='invoice'" + colCompanyFilter + " ORDER BY col_order");
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
                        case "size":
                        case "color":
                        case "brand":
                            parameters.put("Col_Size_Show", visible);
                            break;
                    }
                }
            } catch (Exception ignored) {
                // Fall back to JRXML defaults if table not yet migrated
            }

            // ==================== REPORT ====================
            disable_warnigs.disableAccessWarnings();
            JasperReport jasperReport;
            if ("Sales A5".equals(billformat)) {
                jasperReport = JasperReportCompiler.compileReport("/JasperFiles/A5/Sales_A5.jrxml");
            } else if ("Sales Half Page".equals(billformat) || (billformat != null && billformat.startsWith("A4-Half"))) {
                jasperReport = JasperReportCompiler.compileReport("/JasperFiles/A4_Half/Sales_Half.jrxml");
            } else {
                jasperReport = JasperReportCompiler.compileReport("/JasperFiles/A4/Sales_A4.jrxml");
            }
            JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(k);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);
            com.selrom.utils.ReportPreview.showPreview(jasperPrint, drive, folder);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
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
}