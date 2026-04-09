package venpack;

import com.selrom.db.DataUtil;
import com.selrom.db.disable_warnigs;
import com.selrom.utils.JasperReportCompiler;
import java.awt.print.PrinterException;
import java.awt.print.PrinterJob;
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
import javax.print.attribute.standard.MediaSizeName;
import menupack.AmountInWords;
import menupack.menu_form;
import menupack.UserSession;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.data.JRMapCollectionDataSource;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.export.JRPrintServiceExporter;
import net.sf.jasperreports.export.SimpleExporterInput;
import net.sf.jasperreports.export.SimplePrintServiceExporterConfiguration;
import net.sf.jasperreports.view.JasperViewer;

/*
 * @author selvagates, ©Selrom Software, www.selromsoft.in, Ph: +91 9942732229, Email: mysoft.java@gmail.com
 */
public class ven_pay_receipt_print {

    JasperViewer jasperViewer;
    int num = 0, hmany = 2;
    String rupe = "";
    DataUtil util;

    public void Report(String sno, String billnos, DataUtil util1) throws Exception {
        this.util = util1;

        JasperReport jasperReport;
        JasperPrint jasperPrint;
        try {
            Map<String, Object> parameters = new HashMap<>();

            parameters.put("parameter1", "");
            parameters.put("parameter2", "");
            parameters.put("parameter3", "");
            parameters.put("parameter4", "");
            parameters.put("parameter5", "");
            parameters.put("parameter6", "");

            String line1 = "", line2 = "", line3 = "", line4 = "", line5 = "";
            String companyWhere = UserSession.hasSelectedCompany()
                    ? " WHERE companyID='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            String query = "select cname,add1,add2,add3,add4,hmany from company" + companyWhere;
            ResultSet r = util.doQuery(query);
            while (r.next()) {
                line1 = r.getString(1);
                line2 = r.getString(2);
                line3 = r.getString(3);
                line4 = r.getString(4);
                line5 = r.getString(5);
                hmany = r.getInt(6);
            }

            if (line1.length() > 1) {
                parameters.put("parameter1", "" + line1.trim());
                parameters.put("parameter17", "For " + line1.trim());
            }
            if (line2.length() > 1) {
                parameters.put("parameter2", "" + line2.trim());
            }
            if (line3.length() > 1) {
                parameters.put("parameter3", "" + line3.trim());
            }
            if (line4.length() > 1) {
                parameters.put("parameter4", "" + line4.trim());
            }
            if (line5.length() > 1) {
                parameters.put("parameter5", "" + line5.trim());
            }

            String date = "", cname = "", pby = "";
            double paid = 0;

            String companyAnd = UserSession.hasSelectedCompany()
                    ? " AND company_id='" + UserSession.getSelectedCompanyID() + "'"
                    : "";
            query = "select distinct dat,cname,net,pby from ven_pay where sno='" + sno + "'" + companyAnd;
            r = util.doQuery(query);
            while (r.next()) {
                date = r.getString(1);
                cname = r.getString(2);
                paid = r.getDouble(3);
                pby = r.getString(4);
            }

            parameters.put("parameter7", "Payment No: " + sno);
            parameters.put("parameter8", "Date: " + date);
            parameters.put("parameter9", "" + cname.toUpperCase());

            int paid1 = (int) paid;
            num = paid1;
            num();
            parameters.put("parameter11", " Rupees " + rupe + " Only.");

            String paid2 = String.format("%." + hmany + "f", paid);
            parameters.put("parameter10", "" + paid2);
            parameters.put("parameter12", "" + pby + "");

            parameters.put("parameter13", "" + billnos + "");

            double vbal = 0;
            query = "select sum(tot-paid) from ven_bal where cname='" + cname + "'" + companyAnd;
            r = util.doQuery(query);
            while (r.next()) {
                vbal = r.getDouble(1);
            }
            double old_bal = vbal + paid;

            String old_bal2 = String.format("%." + hmany + "f", old_bal);
            String vbal2 = String.format("%." + hmany + "f", vbal);

            parameters.put("parameter14", "" + old_bal2);
            parameters.put("parameter15", "" + paid2);
            parameters.put("parameter16", "" + vbal2);

            ArrayList billData = new ArrayList();
            query = "select billno, amount from ven_pay where sno='" + sno + "'" + companyAnd;
            r = util.doQuery(query);
            while (r.next()) {
                HashMap row = new HashMap();
                row.put("billno", r.getString(1));
                double amt = r.getDouble(2);
                row.put("amount", String.format("%." + hmany + "f", amt));
                billData.add(row);
            }

            disable_warnigs.disableAccessWarnings();
            jasperReport = JasperReportCompiler.compileReport("/JasperFiles/Payment_Receipt/A4-Half_Receipt.jrxml");

            jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,
                    new JRMapCollectionDataSource(billData));
            PrinterJob job = PrinterJob.getPrinterJob();
            PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
            int selectedService = 0;
            for (int i = 0; i < services.length; i++) {
                if (services[i].getName().toUpperCase().contains("pos")) {
                    selectedService = i;
                }
            }
            job.setPrintService(services[selectedService]);
            PrintRequestAttributeSet printRequestAttributeSet = new HashPrintRequestAttributeSet();
            printRequestAttributeSet.add(MediaSizeName.ISO_A4);
            printRequestAttributeSet.add(new Copies(1));
            JRPrintServiceExporter exporter = new JRPrintServiceExporter();
            exporter.setExporterInput(new SimpleExporterInput(jasperPrint));
            SimplePrintServiceExporterConfiguration configuration = new SimplePrintServiceExporterConfiguration();
            configuration.setPrintService(services[selectedService]);
            configuration.setPrintServiceAttributeSet(services[selectedService].getAttributes());
            configuration.setPrintRequestAttributeSet(printRequestAttributeSet);
            configuration.setDisplayPageDialog(false);
            configuration.setDisplayPrintDialog(true);
            exporter.setConfiguration(configuration);
            exporter.exportReport();

        } catch (PrinterException | ClassNotFoundException | SQLException | JRException e) {
            System.out.println(e.getMessage());
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
