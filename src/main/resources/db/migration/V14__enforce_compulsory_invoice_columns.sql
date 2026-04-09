-- Ensure compulsory columns are always visible for every shop type.
-- Fixes stale DB values where columns were hidden for certain shop types (e.g. Clothing).

-- Invoice compulsory columns
UPDATE invoice_columns SET col_visible = 1
WHERE doc_type = 'invoice'
  AND col_key IN ('qty', 'mrp', 'net_rate', 'disc', 'disc_amt', 'tax_amt', 'sub_total');

-- Add new estimate columns (disc, disc_amt, sub_total, tax_amt, hsn) if not present
INSERT IGNORE INTO invoice_columns (doc_type, col_key, col_header, col_visible, col_order) VALUES
('estimate', 'disc',      'DISC %',    1, 6),
('estimate', 'disc_amt',  'DISC AMT',  1, 7),
('estimate', 'sub_total', 'SUB TOTAL', 1, 8),
('estimate', 'tax_amt',   'TAX AMT',   1, 9),
('estimate', 'hsn',       'HSN',       0, 11);

-- Estimate compulsory columns
UPDATE invoice_columns SET col_visible = 1
WHERE doc_type = 'estimate'
  AND col_key IN ('qty', 'mrp', 'rate', 'disc', 'disc_amt', 'tax_amt', 'sub_total');
