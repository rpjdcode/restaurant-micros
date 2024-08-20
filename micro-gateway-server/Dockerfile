FROM openjdk:21
COPY target/micro-gateway-server-0.0.1-SNAPSHOT.jar micro-gateway-server.jar
COPY /src/main/resources/keystore.p12 /etc/ssl/keystore.p12
COPY /src/main/resources/public.crt /public.crt
USER root
RUN keytool -import -trustcacerts -alias evidenmicros -file /public.crt -keystore $JAVA_HOME/lib/security/cacerts -storepass changeit -noprompt

EXPOSE 8081
ENTRYPOINT ["java", "-jar", "/micro-gateway-server.jar"]