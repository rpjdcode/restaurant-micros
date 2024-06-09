# Usa la imagen oficial de MongoDB de Docker Hub
FROM mongo:latest

# Crea un directorio para almacenar los datos de MongoDB
RUN mkdir -p /data/db

# Establece el directorio de trabajo
WORKDIR /data

COPY mongo-init.js /docker-entrypoint-initdb.d/

# Expone el puerto de MongoDB
EXPOSE 27017

# Comando para ejecutar MongoDB
CMD ["mongod", "--auth"]