#!/bin/sh
export KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED=true
export KEYCLOAK_IMPORT=/opt/keycloak/data/import/restaurant-realm.json

# Mostrar variables de entorno para verificar su configuración
echo "Variables de entorno configuradas:"
echo "KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED=$KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED"
echo "KEYCLOAK_IMPORT=$KEYCLOAK_IMPORT"

/opt/keycloak/bin/kc.sh start-dev --spi-upload-scripts-enabled=true --import-realm --verbose &

# Esperar a que Keycloak se inicie completamente
until curl -s http://localhost:8080; do
    echo "Esperando a que Keycloak se inicie..."
    sleep 10
done

# Importar el realm
#/opt/keycloak/bin/kc.sh import --file /opt/keycloak/data/import/restaurant-realm.json

# Mantener el contenedor en ejecución
tail -f /dev/null