FROM openjdk:21
COPY target/micro-eureka-discovery-server-0.0.1-SNAPSHOT.jar micro-eureka-discovery-server.jar
COPY entrypoint.sh entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 8761

ENTRYPOINT ["java", "-jar", "/micro-eureka-discovery-server.jar"]
#ENTRYPOINT ["/entrypoint.sh"]