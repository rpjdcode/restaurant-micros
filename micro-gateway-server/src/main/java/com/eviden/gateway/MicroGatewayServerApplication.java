package com.eviden.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.eviden.commons.eureka", "com.eviden.gateway"})
public class MicroGatewayServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroGatewayServerApplication.class, args);
	}

}
