# Usar la imagen oficial de Apache Kafka de Docker Hub
FROM bitnami/kafka:latest

# Establecer variables de entorno necesarias
ENV KAFKA_BROKER_ID=1
ENV KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092
ENV KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT
ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1

# Exponer el puerto
EXPOSE 9092

# Iniciar Kafka
CMD ["/opt/bitnami/scripts/kafka/run.sh"]