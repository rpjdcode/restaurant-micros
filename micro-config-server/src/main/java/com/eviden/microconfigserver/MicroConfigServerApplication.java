package com.eviden.microconfigserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.cloud.vault.config.VaultAutoConfiguration;

@EnableConfigServer
@SpringBootApplication(exclude = VaultAutoConfiguration.class)
public class MicroConfigServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroConfigServerApplication.class, args);
	}

}
