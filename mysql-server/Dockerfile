# MySQL 8.0.36
FROM mysql:8.0.36

# Opcional: Establecer la base de datos predeterminada
#ENV MYSQL_DATABASE=my-database

# Opcional: Establecer el usuario y contraseña
#ENV MYSQL_USER=mysql
#ENV MYSQL_PASSWORD=mysql123

# Scripts de inicialización de BD
COPY ./sql/create_keycloak_database.sql /docker-entrypoint-initdb.d/
COPY ./sql/create_check_database.sql /docker-entrypoint-initdb.d/
COPY ./conf/my.cnf /etc/mysql/my.cnf

EXPOSE 3307