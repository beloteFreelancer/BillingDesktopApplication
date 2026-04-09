-- Change user_valid_date and create_date from date to varchar(500) to store AES encrypted values
ALTER TABLE `setting_user` MODIFY COLUMN `user_valid_date` varchar(500) DEFAULT NULL;
ALTER TABLE `setting_user` MODIFY COLUMN `create_date` varchar(500) DEFAULT NULL;
