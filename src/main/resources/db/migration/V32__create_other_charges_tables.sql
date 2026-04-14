-- ============================================================
-- V32: Other charges master + detail tables for Sales & Estimate
-- ============================================================

-- Master list of charge types (user-manageable per company)
CREATE TABLE IF NOT EXISTS other_charges_master (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    charge_name VARCHAR(100) NOT NULL,
    company_id  VARCHAR(20) NOT NULL DEFAULT '',
    UNIQUE KEY uk_name_company (charge_name, company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed default charge names for every existing company
INSERT IGNORE INTO other_charges_master (charge_name, company_id)
SELECT t.charge_name, c.companyID
FROM (SELECT 'Packing Charges' AS charge_name
      UNION ALL SELECT 'Freight'
      UNION ALL SELECT 'Loading Charges'
      UNION ALL SELECT 'Installation'
      UNION ALL SELECT 'Insurance'
      UNION ALL SELECT 'Labour Charges'
      UNION ALL SELECT 'Transport'
      UNION ALL SELECT 'Other') t
CROSS JOIN company c;

-- Detail table: charges per sales bill
CREATE TABLE IF NOT EXISTS sales_other_charges (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    billno      INT NOT NULL,
    charge_name VARCHAR(100) NOT NULL,
    amount      DOUBLE NOT NULL DEFAULT 0,
    company_id  VARCHAR(20) NOT NULL DEFAULT '',
    KEY idx_soc_billno_company (billno, company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Detail table: charges per estimate bill
CREATE TABLE IF NOT EXISTS estimate_other_charges (
    id          INT AUTO_INCREMENT PRIMARY KEY,
    billno      INT NOT NULL,
    charge_name VARCHAR(100) NOT NULL,
    amount      DOUBLE NOT NULL DEFAULT 0,
    company_id  VARCHAR(20) NOT NULL DEFAULT '',
    KEY idx_eoc_billno_company (billno, company_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
