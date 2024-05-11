#!/bin/bash
# Espera hasta que el Config Server esté disponible
while ! curl -s http://micro-config-server:9000/actuator/health | grep 'UP'; do
  echo "Esperando al Config Server..."
  sleep 5
done

# Ahora inicia el servidor Eureka
java -jar /micro-eureka-discovery-server.jar