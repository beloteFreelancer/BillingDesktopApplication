-- Add Mfg Date and Exp Date as optional invoice columns (hidden by default)
INSERT IGNORE INTO `invoice_columns` (`doc_type`, `col_key`, `col_header`, `col_visible`, `col_order`)
VALUES
    ('invoice', 'mfg_date', 'MFG DATE', 0, 8),
    ('invoice', 'exp_date', 'EXP DATE', 0, 9);
