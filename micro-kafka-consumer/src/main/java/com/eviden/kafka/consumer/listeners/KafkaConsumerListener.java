package com.eviden.kafka.consumer.listeners;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.kafka.annotation.KafkaListener;

@Configuration
public class KafkaConsumerListener {

	private Logger LOG = LoggerFactory.getLogger(KafkaConsumerListener.class);
	
	@KafkaListener(topics = { "ejemplo-topico-springboot", "mi_tema" }, groupId = "grupo-ejemplo")
	public void listener(String msg) {
		LOG.info(String.format("Mensaje recibido de Kafka: %s", msg));
	}
}
