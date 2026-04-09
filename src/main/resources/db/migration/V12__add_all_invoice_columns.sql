-- Add all sales form columns to invoice_columns for per-shop-type visibility management
INSERT IGNORE INTO `invoice_columns` (`doc_type`, `col_key`, `col_header`, `col_visible`, `col_order`)
VALUES
    ('invoice', 'mrp',       'MRP',       1, 13),
    ('invoice', 'net_rate',  'NET RATE',  1, 14),
    ('invoice', 'price',     'PRICE',     0, 15),
    ('invoice', 'disc',      'DISC %',    0, 16),
    ('invoice', 'disc_amt',  'DISC AMT',  1, 17),
    ('invoice', 'sub_total', 'SUB TOTAL', 1, 18),
    ('invoice', 'tax_pct',   'TAX %',     0, 19);
