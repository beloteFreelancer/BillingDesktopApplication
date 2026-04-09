-- ================================
-- LOYALTY POINTS REDEMPTION UPDATE
-- ================================
-- This script adds redemption functionality to existing POS installations
-- Run this script on your existing database to enable points redemption

-- 1. Add redemption configuration columns to setting_points table
ALTER TABLE setting_points 
ADD COLUMN IF NOT EXISTS min_redemption int NOT NULL DEFAULT 100,
ADD COLUMN IF NOT EXISTS conversion_rate decimal(5,2) NOT NULL DEFAULT 1.00,
ADD COLUMN IF NOT EXISTS redemption_enabled varchar(5) NOT NULL DEFAULT 'Yes';

-- 2. Create points_redemption table for tracking cash redemptions
CREATE TABLE IF NOT EXISTS points_redemption (
  redemption_id int NOT NULL AUTO_INCREMENT,
  dat date NOT NULL,
  tim varchar(15) NOT NULL,
  cid int NOT NULL,
  cname varchar(100) NOT NULL,
  mobile varchar(15) NOT NULL,
  points_redeemed double NOT NULL,
  cash_amount decimal(10,2) NOT NULL,
  conversion_rate decimal(5,2) NOT NULL,
  redemption_type varchar(20) DEFAULT 'CASH',
  user varchar(15) NOT NULL,
  last varchar(25) NOT NULL,
  company_id varchar(50) DEFAULT '',
  PRIMARY KEY (redemption_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 3. Update existing setting_points record (if exists) with default redemption values
UPDATE setting_points 
SET min_redemption = 100, 
    conversion_rate = 1.00, 
    redemption_enabled = 'Yes' 
WHERE points_option IS NOT NULL;

-- 4. Insert default settings if no record exists
INSERT IGNORE INTO setting_points (points_option, hmuch, pfor, min_redemption, conversion_rate, redemption_enabled)
VALUES ('Yes', 2, 100, 100, 1.00, 'Yes');

-- 5. Add loyalty_points column to sales table for payment tracking
ALTER TABLE sales 
ADD COLUMN IF NOT EXISTS loyalty_points varchar(10) DEFAULT '0.00';

-- ================================
-- VERIFICATION QUERIES
-- ================================
-- Run these to verify the update was successful:

-- Check setting_points structure
-- SELECT * FROM setting_points;

-- Check points_redemption table
-- DESCRIBE points_redemption;

-- Check sales table has loyalty_points column  
-- DESCRIBE sales;

-- ================================
-- NOTES FOR ADMINISTRATORS
-- ================================
-- 1. Default Settings:
--    - Minimum redemption: 100 points
--    - Conversion rate: 1 point = ₹1.00
--    - Redemption enabled: Yes
--
-- 2. To customize settings:
--    - Open "Loyalty Points & Redemption Setting" from menu
--    - Or update setting_points table directly
--
-- 3. Menu Access:
--    - New menu item: "🎁 Points Redemption (Cash)"
--    - Located in Loyalty menu section
--
-- 4. Permission Requirements:
--    - Same as existing loyalty features
--    - No additional permissions needed