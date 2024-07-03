# Usar la imagen oficial de Apache Kafka de Docker Hub
FROM bitnami/kafka:3.7.1

# Establecer variables de entorno necesarias
ENV KAFKA_BROKER_ID=1
ENV KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181
ENV KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://host.docker.internal:9092
ENV KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT
ENV KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1

# Copiado del fichero de utilidades dentro del contenedor en caso de querer utilizarlo
COPY ./scripts/crear_topico.sh /utilidades/crear_topico.sh

USER root
RUN mkdir -p /utilidades
RUN chmod +x /utilidades/crear_topico.sh
USER 1001

EXPOSE 9092

CMD ["/opt/bitnami/scripts/kafka/run.sh"]