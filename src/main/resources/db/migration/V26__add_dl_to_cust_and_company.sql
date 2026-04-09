-- Add Drug Licence (DL) field to cust and company tables for Pharmacy shop type
ALTER TABLE cust ADD COLUMN dl varchar(50) NOT NULL DEFAULT '';
ALTER TABLE company ADD COLUMN dl varchar(100) NOT NULL DEFAULT '';
