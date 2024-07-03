package com.eviden.kafka.provider.config;

import java.util.HashMap;
import java.util.Map;

import org.apache.kafka.clients.admin.NewTopic;
import org.apache.kafka.common.config.TopicConfig;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.config.TopicBuilder;

@Configuration
public class KafkaTopicConfig {
	
	@Bean
	NewTopic generarTopicoEjemplo() {
		Map<String, String> configuraciones = new HashMap<>();
		// Política de limpieza con delete. Cuando ya no se necesite el mensaje, se borra
		// compact: Mantiene el mensaje más actual
		configuraciones.put(TopicConfig.CLEANUP_POLICY_CONFIG, TopicConfig.CLEANUP_POLICY_DELETE);
		// Cantidad de tiempo que se mantienen los mensajes en el topic (1 día actualmente)
		configuraciones.put(TopicConfig.RETENTION_MS_CONFIG, "86400000");
		// Tamaño máximo que pueden tener los segmentos dentro del tópico
		// (1 gigabyte ahora mismo, lo pongo por claridad, ya que este es el valor por defecto)
		configuraciones.put(TopicConfig.SEGMENT_BYTES_CONFIG, "1073741824");
		// Tamaño máximo de cada mensaje (por defecto 1 MB)
		configuraciones.put(TopicConfig.MAX_MESSAGE_BYTES_CONFIG, "1000012");
		
		return TopicBuilder
				.name("ejemplo-topico-springboot")
				.partitions(2)
				.replicas(1)
				.configs(configuraciones)
				.build();
	}
}
