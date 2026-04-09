-- Add tax_amt and unit as shop-type-controlled invoice columns
-- tax_amt: visible by default (hidden for Clothing via seedColumnsForShopType)
-- unit: hidden by default (shown for Pharmacy/Grocery/Hardware via seedColumnsForShopType)
INSERT IGNORE INTO `invoice_columns` (`doc_type`, `col_key`, `col_header`, `col_visible`, `col_order`)
VALUES
    ('invoice', 'tax_amt', 'TAX AMT', 1, 10),
    ('invoice', 'unit',    'UNIT',    0, 11);
