package com.eviden.microreactivo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.eviden.commons.eureka", "com.eviden.microreactivo"})
public class MicroReactivoPruebaApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroReactivoPruebaApplication.class, args);
	}

}
