#!/bin/sh
export KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED=true
export KEYCLOAK_IMPORT=/opt/keycloak/data/import/restaurant-realm.json

# Mostrar variables de entorno para verificar su configuración
echo "Variables de entorno configuradas:"
echo "KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED=$KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED"
echo "KEYCLOAK_IMPORT=$KEYCLOAK_IMPORT"

/opt/keycloak/bin/kc.sh start --spi-upload-scripts-enabled=true --import-realm --verbose --https-key-store-file=/opt/keycloak/conf/keystore.p12 --https-key-store-password=micros123 &


# Esperar a que Keycloak se inicie completamente
#until curl -s http://localhost:8080; do
#    echo "Esperando a que Keycloak se inicie..."
#    sleep 10
#done
until curl -k -s https://localhost:8443; do
    echo "Esperando a que Keycloak se inicie..."
    sleep 10
done


# Importar el realm
#/opt/keycloak/bin/kc.sh import --file /opt/keycloak/data/import/restaurant-realm.json

# Mantener el contenedor en ejecución
tail -f /dev/null