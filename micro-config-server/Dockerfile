FROM openjdk:21
COPY target/micro-config-server-0.0.1-SNAPSHOT.jar micro-config-server.jar
EXPOSE 9000
ENTRYPOINT ["java", "-jar", "/micro-config-server.jar"]