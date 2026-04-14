-- Add unit column row for estimate doc_type (invoice already has it from V11)
INSERT IGNORE INTO `invoice_columns` (`doc_type`, `col_key`, `col_header`, `col_visible`, `col_order`)
VALUES
    ('estimate', 'unit', 'UNIT', 0, 11);

-- Enable unit column visibility for existing Hardware/Pharmacy/Grocery companies
UPDATE invoice_columns ic
  INNER JOIN company c ON ic.company_id = c.companyID
SET ic.col_visible = 1
WHERE ic.col_key = 'unit'
  AND ic.doc_type IN ('invoice', 'estimate')
  AND c.shop_type IN ('Hardware', 'Pharmacy', 'Grocery');
