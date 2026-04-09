-- Add unique constraint to prevent duplicate permission entries

-- First remove any existing duplicates (keep one copy of each)
CREATE TEMPORARY TABLE tmp_perms AS
  SELECT `user`, fname, option1
  FROM users_permissions
  GROUP BY `user`, fname;

DELETE FROM users_permissions;

INSERT INTO users_permissions (`user`, fname, option1)
  SELECT `user`, fname, option1 FROM tmp_perms;

DROP TEMPORARY TABLE tmp_perms;

-- Widen fname column to accommodate longer feature names
ALTER TABLE `users_permissions` MODIFY COLUMN `fname` varchar(50) NOT NULL;

-- Add unique constraint on (user, fname) to prevent duplicates
ALTER TABLE `users_permissions` ADD UNIQUE KEY `uk_user_fname` (`user`, `fname`);
