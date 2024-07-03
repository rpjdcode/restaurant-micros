#!/bin/bash

# Script con las utilidades básicas de kafka a modo de tutorial

# Crear un nuevo tema
kafka-topics.sh --create --topic mi_tema --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1

# Verificar la creación del tema | Listar todos los tópicos dentro del broker
kafka-topics.sh --list --bootstrap-server localhost:9092

# Describir el tema
kafka-topics.sh --describe --topic mi_tema --bootstrap-server localhost:9092

# Ver mensajes de un topic (consumidor)
kafka-console-consumer.sh --topic mi_tema --bootstrap-server localhost:9092

# Enviar mensaje a un topic (productor/proveedor)
kafka-console-producer.sh --broker-list localhost:9092 --topic mi_tema