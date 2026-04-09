-- Add color column to item table for clothing shop type
ALTER TABLE `item` ADD COLUMN IF NOT EXISTS `color` varchar(50) DEFAULT NULL AFTER `size`;
