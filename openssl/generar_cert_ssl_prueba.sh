openssl req -newkey rsa:2048 -nodes -keyout ssl-key.key -x509 -days 365 -out ssl-cert.crt -config openssl.conf

openssl pkcs12 -export -in ssl-cert.crt -inkey ssl-key.key -out keystore.p12 -name evidenmicros -passout pass:micros123

# Java
keytool -importcert -file trustcert.pem -keystore micros_truststore.jks -alias micros-cert -storepass microstrust123
# Lo ultimo que use
keytool -importkeystore -srckeystore keystore.p12 -srcstoretype PKCS12 -destkeystore keystorePKCS_def.jks -deststoretype PKCS12 -deststorepass micros123 -srcstorepass micros123 -alias evidenmicros