
# 1. Definir openssl.conf

# Generar la clave privada y la solicitud de certificado (CSR)
openssl genrsa -out server.key 2048
openssl req -new -key server.key -out server.csr -config openssl.conf

# Generar el certificado autofirmado
openssl x509 -req -in server.csr -signkey server.key -out server.crt -days 365 -extfile openssl.conf -extensions v3_req

# Generación del archivo .p12 y luego .jks con contraseña
openssl pkcs12 -export -inkey server.key -in server.crt -out server.p12 -name "localhost" -passout pass:micros123

# Convertir el archivo .p12 a .jks:
keytool -importkeystore -srckeystore server.p12 -srcstoretype pkcs12 -destkeystore server.jks -deststoretype JKS

keytool -genkeypair -alias evidenmicros -keyalg RSA -keysize 2048 -validity 365 -keystore keystoreTest2.p12 -storetype PKCS12 -storepass micros123 -dname "CN=localhost, OU=Development, O=MyApp, L=Tegueste, ST=Santa Cruz de Tenerife, C=ES" -ext "SAN=dns:localhost,dns:keycloak.local,ip:127.0.0.1"
keytool -exportcert -alias evidenmicros -keystore keystoreTest2.p12 -file public.cert -rfc -storepass micros123