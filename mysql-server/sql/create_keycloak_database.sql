CREATE DATABASE IF NOT EXISTS keycloak
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'keycloak_user'@'%' IDENTIFIED BY 'keycloak123';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloak_user'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;