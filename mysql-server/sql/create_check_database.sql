CREATE DATABASE IF NOT EXISTS healthcheck
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'healthcheck'@'%' IDENTIFIED BY 'healthcheck';
GRANT SELECT ON healthcheck.* TO 'healthcheck'@'%';
FLUSH PRIVILEGES;