-- Add company_id column to invoice_columns so each company can have its own column settings
ALTER TABLE invoice_columns ADD COLUMN company_id VARCHAR(50) NOT NULL DEFAULT '';

-- Change primary key to include company_id
ALTER TABLE invoice_columns DROP PRIMARY KEY,
  ADD PRIMARY KEY (doc_type, col_key, company_id);

-- Copy existing default rows (company_id='') for each existing company
INSERT IGNORE INTO invoice_columns (doc_type, col_key, company_id, col_header, col_visible, col_order)
SELECT ic.doc_type, ic.col_key, c.companyID, ic.col_header, ic.col_visible, ic.col_order
FROM invoice_columns ic
CROSS JOIN company c
WHERE ic.company_id = '' AND c.companyID IS NOT NULL AND c.companyID != '';

-- Apply shop_type-based visibility for Pharmacy/Grocery companies (mfg_date, exp_date visible)
UPDATE invoice_columns ic
JOIN company c ON ic.company_id = c.companyID
SET ic.col_visible = 1
WHERE ic.col_key IN ('mfg_date', 'exp_date')
  AND ic.doc_type IN ('invoice', 'estimate')
  AND c.shop_type IN ('Pharmacy', 'Grocery');

-- Hide HSN and tax columns for Clothing companies
UPDATE invoice_columns ic
JOIN company c ON ic.company_id = c.companyID
SET ic.col_visible = 0
WHERE ic.col_key IN ('hsn', 'tax_pct', 'tax_amt')
  AND ic.doc_type IN ('invoice', 'estimate')
  AND c.shop_type = 'Clothing';

-- Show wholesale price for Clothing companies in purchase
UPDATE invoice_columns ic
JOIN company c ON ic.company_id = c.companyID
SET ic.col_visible = 1
WHERE ic.col_key = 'wprice'
  AND ic.doc_type = 'purchase'
  AND c.shop_type = 'Clothing';

-- Hide tax columns for Clothing in purchase and PO
UPDATE invoice_columns ic
JOIN company c ON ic.company_id = c.companyID
SET ic.col_visible = 0
WHERE ic.col_key IN ('tax_pct', 'tax_amt', 'hsn', 'tax_type')
  AND ic.doc_type IN ('purchase', 'po')
  AND c.shop_type = 'Clothing';
