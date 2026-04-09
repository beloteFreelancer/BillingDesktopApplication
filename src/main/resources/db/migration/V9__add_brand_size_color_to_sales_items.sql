-- Add brand column to item table (size and color already exist from V8)
ALTER TABLE `item` ADD COLUMN IF NOT EXISTS `brand` varchar(100) DEFAULT NULL AFTER `color`;

-- Add size, color, brand columns to sales_items for invoice line persistence
ALTER TABLE `sales_items` ADD COLUMN IF NOT EXISTS `size`  varchar(50)  DEFAULT NULL;
ALTER TABLE `sales_items` ADD COLUMN IF NOT EXISTS `color` varchar(50)  DEFAULT NULL;
ALTER TABLE `sales_items` ADD COLUMN IF NOT EXISTS `brand` varchar(100) DEFAULT NULL;
