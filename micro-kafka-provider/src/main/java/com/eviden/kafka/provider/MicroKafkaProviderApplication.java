package com.eviden.kafka.provider;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.kafka.core.KafkaTemplate;

@SpringBootApplication
public class MicroKafkaProviderApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroKafkaProviderApplication.class, args);
	}
	
	@Bean
	CommandLineRunner init(KafkaTemplate<String, String> kafkaTemplate) {
		return args -> kafkaTemplate.send("ejemplo-topico-springboot", "Este es mi mensaje enviado en springboot");
	}

}
