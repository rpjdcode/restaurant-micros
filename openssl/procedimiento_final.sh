# Generar clave privada y certificado utilizando la configuración de openssl.conf definida
openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout selfsigned.key -out selfsigned.crt -config openssl.conf -extensions v3_req

# Almacenar certificado con clave privada en keystore de tipo PKCS12
openssl pkcs12 -export -in selfsigned.crt -inkey selfsigned.key -out keystore.p12 -name evidenmicros -password pass:micros123

# Exportar el .crt sin claves del keystore utilizado por keycloak para, posteriormente, importar este fichero public.crt en el almacén de confianza de Java
keytool -exportcert -alias evidenmicros -keystore keystore.p12 -storetype PKCS12 -rfc -file public.crt

