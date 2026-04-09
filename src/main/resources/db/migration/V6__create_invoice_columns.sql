CREATE TABLE IF NOT EXISTS `invoice_columns` (
  `doc_type`    VARCHAR(10)  NOT NULL DEFAULT 'invoice' COMMENT 'invoice or estimate',
  `col_key`     VARCHAR(20)  NOT NULL,
  `col_header`  VARCHAR(50)  NOT NULL,
  `col_visible` TINYINT(1)   NOT NULL DEFAULT 1,
  `col_order`   INT          NOT NULL DEFAULT 0,
  PRIMARY KEY (`doc_type`, `col_key`)
);

INSERT IGNORE INTO `invoice_columns` (`doc_type`, `col_key`, `col_header`, `col_visible`, `col_order`) VALUES
('invoice',  'sno',          '#',      1, 1),
('invoice',  'product_name', 'ITEMS',  1, 2),
('invoice',  'hsn',          'HSN',    1, 3),
('invoice',  'qty',          'QTY',    1, 4),
('invoice',  'rate',         'RATE',   1, 5),
('invoice',  'tax',          'TAX',    1, 6),
('invoice',  'amount',       'AMOUNT', 1, 7),
('estimate', 'sno',          '#',      1, 1),
('estimate', 'product_name', 'ITEMS',  1, 2),
('estimate', 'mrp',          'MRP',    1, 3),
('estimate', 'qty',          'QTY',    1, 4),
('estimate', 'rate',         'RATE',   1, 5),
('estimate', 'amount',       'AMOUNT', 1, 6);
