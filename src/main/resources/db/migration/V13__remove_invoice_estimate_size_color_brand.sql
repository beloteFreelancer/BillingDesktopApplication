-- Size/Color/Brand are permanently hidden in invoice & estimate tables
-- (shown inside Description column brackets instead). Remove stale rows.
DELETE FROM invoice_columns
WHERE doc_type IN ('invoice', 'estimate')
  AND col_key IN ('size', 'color', 'brand');
