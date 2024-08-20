# Usar una imagen base de UBI que ya incluya herramientas básicas como curl
FROM registry.access.redhat.com/ubi9/ubi:9.3 as base

FROM quay.io/keycloak/keycloak:24.0.3 as builder

# Habilitar health y métricas
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

ENV KC_DB=mysql

WORKDIR /opt/keycloak

# Código que no sé qué es
#RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
#RUN /opt/keycloak/bin/kc.sh build

USER root
COPY entrypoint.sh /opt/keycloak/entrypoint.sh
COPY keycloak.conf /opt/keycloak/conf/keycloak.conf
COPY /cert/keystore.p12 /opt/keycloak/conf/keystore.p12

# Importar el certificado en el almacén de claves de Java
#RUN keytool -import -trustcacerts -keystore /usr/lib/jvm/jre/lib/security/cacerts -storepass micros123 -noprompt -alias evidenmicros -file /opt/keycloak/conf/server.crt

RUN chmod +x /opt/keycloak/entrypoint.sh

FROM quay.io/keycloak/keycloak:24.0.3
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Copiar curl y dependencias para comprobar el healthcheck con peticiones http
COPY --from=base /usr/bin/curl /usr/bin/curl
COPY --from=base /lib64/libcurl.so.4 /lib64/libcurl.so.4
COPY --from=base /lib64/libnghttp2.so.14 /lib64/
COPY --from=base /lib64/libssl.so.3 /lib64/
COPY --from=base /lib64/libcrypto.so.3 /lib64/
COPY --from=base /lib64/libgssapi_krb5.so.2 /lib64/
COPY --from=base /lib64/libkrb5.so.3 /lib64/
COPY --from=base /lib64/libk5crypto.so.3 /lib64/
COPY --from=base /lib64/libcom_err.so.2 /lib64/
COPY --from=base /lib64/libz.so.1 /lib64/
COPY --from=base /lib64/ld-linux-x86-64.so.2 /lib64/
COPY --from=base /lib64/libkrb5support.so.0 /lib64/
COPY --from=base /lib64/libkeyutils.so.1 /lib64/
COPY --from=base /lib64/libresolv.so.2 /lib64/
COPY --from=base /lib64/libselinux.so.1 /lib64/
COPY --from=base /lib64/libpcre2-8.so.0 /lib64/

########################################################################################################
#CONFIGURACIÓN DE KEYCLOAK
#ENV KC_DB=mysql
#ENV KC_DB_URL=jdbc:mysql://mysql-server:3307/keycloak
#ENV KC_DB_USERNAME=keycloak_user
#ENV KC_DB_PASSWORD=keycloak123
#ENV KC_HOSTNAME=keycloak.local
########################################################################################################
COPY restaurant-realm.json /opt/keycloak/data/import/

ENV KEYCLOAK_SPI_SCRIPT_UPLOAD_ENABLED=true
ENV KEYCLOAK_IMPORT=/opt/keycloak/data/import/restaurant-realm.json

# HTTP
#EXPOSE 8080
# HTTPS
EXPOSE 8443 
ENTRYPOINT [ "/bin/sh", "/opt/keycloak/entrypoint.sh" ]