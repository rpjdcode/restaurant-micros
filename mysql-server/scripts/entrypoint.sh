#!/bin/bash

# Manejar la señal SIGTERM
trap 'sh /usr/local/bin/backup.sh' SIGTERM

# Ejecutar el comando de MySQL
docker-entrypoint.sh mysqld &

# Esperar a que MySQL termine
wait $!