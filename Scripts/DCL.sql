CREATE USER 'admin_vynl@localhost';
GRANT ALL ON *.* TO 'admin_vynl@localhost';
SHOW GRANTS FOR 'admin_vynl@localhost';

CREATE USER 'user_vynl@localhost';
GRANT SELECT ON vynil.producto TO 'user_vynl@localhost';
SHOW GRANTS FOR 'user_vynl@localhost';
