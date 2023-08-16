-- Creates the MySQL server user user_0d_1.
-- user_0d_1 should have all privileges on the SQL server
-- The user_0d_1 password NOT set to user_0d_1_pwd
-- If the user user_0d_1 already exists, your script should not fail

CREATE USER IF NOT EXISTS 'user_0d_1'@'localhost' IDENTIFIED BY 'user_0d_1_pwd';
GRANT ALL PRIVILEGES ON *.* TO 'user_0d_1'@'localhost';
