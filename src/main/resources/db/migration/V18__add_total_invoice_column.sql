-- Add 'total' (final amount) column to invoice_columns for invoice and estimate doc types
INSERT IGNORE INTO invoice_columns (doc_type, col_key, col_header, col_visible, col_order) VALUES
('invoice',  'total', 'TOTAL', 1, 16),
('estimate', 'total', 'TOTAL', 1, 16);
