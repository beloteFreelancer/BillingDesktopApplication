-- Migration: Add company_id to transactional tables for per-company data isolation
-- Run this script once on existing databases

ALTER TABLE `sales`     ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `estimate`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `purchase`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `po_entry`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `cust_pay`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `cust_bal`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `ven_bal`   ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;

-- Indexes for performance on filter queries
CREATE INDEX IF NOT EXISTS `idx_sales_company`    ON `sales`    (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_estimate_company` ON `estimate` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_purchase_company` ON `purchase` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_po_company`       ON `po_entry` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_cust_pay_company` ON `cust_pay` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_cust_bal_company` ON `cust_bal` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_ven_bal_company`  ON `ven_bal`  (`company_id`);

-- Stock per-company isolation
ALTER TABLE `stock`       ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `stock_entry` ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `sreturn`     ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `preturn`     ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;
ALTER TABLE `ereturn`     ADD COLUMN IF NOT EXISTS `company_id` varchar(50) DEFAULT NULL;

-- Update stock unique keys to be company-aware (allow same item in multiple companies)
ALTER TABLE `stock` DROP INDEX IF EXISTS `ino`;
ALTER TABLE `stock` DROP INDEX IF EXISTS `stock_barcode`;
ALTER TABLE `stock` ADD UNIQUE KEY IF NOT EXISTS `stock_ino_company` (`ino`, `company_id`);
ALTER TABLE `stock` ADD UNIQUE KEY IF NOT EXISTS `stock_barcode_company` (`barcode`, `company_id`);

CREATE INDEX IF NOT EXISTS `idx_stock_entry_company` ON `stock_entry` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_sreturn_company`     ON `sreturn`     (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_preturn_company`     ON `preturn`     (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_ereturn_company`     ON `ereturn`     (`company_id`);

-- Per-company ID sequences: item, customer, vendor tables
ALTER TABLE `item`      ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `cust`      ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `vendor`    ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `ven_bill`  ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `ven_pay`   ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';
ALTER TABLE `cust_bill` ADD COLUMN IF NOT EXISTS `company_id` varchar(50) NOT NULL DEFAULT '';

-- Update item unique key to be company-aware (allow same barcode in multiple companies)
ALTER TABLE `item` DROP INDEX IF EXISTS `item_barcode`;
ALTER TABLE `item` ADD UNIQUE KEY IF NOT EXISTS `item_barcode_company` (`barcode`, `company_id`);

CREATE INDEX IF NOT EXISTS `idx_item_company`     ON `item`     (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_cust_company`     ON `cust`     (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_vendor_company`   ON `vendor`   (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_ven_bill_company` ON `ven_bill` (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_ven_pay_company`  ON `ven_pay`  (`company_id`);
CREATE INDEX IF NOT EXISTS `idx_cust_bill_company` ON `cust_bill` (`company_id`);
