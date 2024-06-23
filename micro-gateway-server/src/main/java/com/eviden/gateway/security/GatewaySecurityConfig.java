package com.eviden.gateway.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;

import com.eviden.gateway.keycloak.KeycloakJwtAuthenticationConverter;

@Configuration
@EnableWebFluxSecurity
public class GatewaySecurityConfig {

	@Bean
    SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http) {
        http
        	.cors(Customizer.withDefaults())
        	.csrf(csrf -> csrf.disable())
        	
            .authorizeExchange(exchanges -> exchanges
                .pathMatchers("/products/**").authenticated()
                .pathMatchers("/service2/**").authenticated()
                .anyExchange().permitAll())
            .oauth2ResourceServer(oauth2 -> {
            	oauth2.jwt(token -> token.jwtAuthenticationConverter(new KeycloakJwtAuthenticationConverter()));
            });
        return http.build();
    }
}
