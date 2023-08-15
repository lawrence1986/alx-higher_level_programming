-- This creates a table called first_table in the current db in your MySQL server.
-- If first_table  already exists, script should not fail
-- The database name will be passed as an argument of the mysql command
-- SELECT or SHOW statements NOT ALLOWED
-- first_table atttributes: id INT; name VARCHAR(256)

CREATE TABLE IF NOT EXISTS first_table (
    id INT,
    name VARCHAR(256)
);
