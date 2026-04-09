-- Align estimate invoice_columns to match invoice columns exactly.
-- Remove old 'rate' key and add missing columns: net_rate, price, tax_pct, mfg_date, exp_date.

-- Remove the old 'rate' key (replaced by 'net_rate')
DELETE FROM invoice_columns WHERE doc_type = 'estimate' AND col_key = 'rate';

-- Insert missing estimate columns
INSERT IGNORE INTO invoice_columns (doc_type, col_key, col_header, col_visible, col_order) VALUES
('estimate', 'net_rate', 'NET RATE', 1,  5),
('estimate', 'price',    'PRICE',    0,  6),
('estimate', 'tax_pct',  'TAX %',    0, 10),
('estimate', 'mfg_date', 'MFG DATE', 0, 14),
('estimate', 'exp_date', 'EXP DATE', 0, 15);

-- Re-order estimate columns to match invoice layout
UPDATE invoice_columns SET col_order = 1  WHERE doc_type = 'estimate' AND col_key = 'sno';
UPDATE invoice_columns SET col_order = 2  WHERE doc_type = 'estimate' AND col_key = 'product_name';
UPDATE invoice_columns SET col_order = 3  WHERE doc_type = 'estimate' AND col_key = 'qty';
UPDATE invoice_columns SET col_order = 4  WHERE doc_type = 'estimate' AND col_key = 'mrp';
UPDATE invoice_columns SET col_order = 5  WHERE doc_type = 'estimate' AND col_key = 'net_rate';
UPDATE invoice_columns SET col_order = 6  WHERE doc_type = 'estimate' AND col_key = 'price';
UPDATE invoice_columns SET col_order = 7  WHERE doc_type = 'estimate' AND col_key = 'disc';
UPDATE invoice_columns SET col_order = 8  WHERE doc_type = 'estimate' AND col_key = 'disc_amt';
UPDATE invoice_columns SET col_order = 9  WHERE doc_type = 'estimate' AND col_key = 'sub_total';
UPDATE invoice_columns SET col_order = 10 WHERE doc_type = 'estimate' AND col_key = 'tax_pct';
UPDATE invoice_columns SET col_order = 11 WHERE doc_type = 'estimate' AND col_key = 'tax_amt';
UPDATE invoice_columns SET col_order = 12 WHERE doc_type = 'estimate' AND col_key = 'amount';
UPDATE invoice_columns SET col_order = 13 WHERE doc_type = 'estimate' AND col_key = 'hsn';
UPDATE invoice_columns SET col_order = 14 WHERE doc_type = 'estimate' AND col_key = 'mfg_date';
UPDATE invoice_columns SET col_order = 15 WHERE doc_type = 'estimate' AND col_key = 'exp_date';

-- Ensure estimate compulsory columns are visible
UPDATE invoice_columns SET col_visible = 1
WHERE doc_type = 'estimate'
  AND col_key IN ('qty', 'mrp', 'net_rate', 'disc', 'disc_amt', 'tax_amt', 'sub_total');

-- Hide 'amount' (Total) for estimate — it was set visible in V6 but should be hidden
UPDATE invoice_columns SET col_visible = 0
WHERE doc_type = 'estimate' AND col_key = 'amount';
