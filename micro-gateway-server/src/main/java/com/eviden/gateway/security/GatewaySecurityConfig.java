package com.eviden.gateway.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.reactive.EnableWebFluxSecurity;
import org.springframework.security.config.web.server.ServerHttpSecurity;
import org.springframework.security.web.server.SecurityWebFilterChain;
import org.springframework.web.cors.reactive.CorsConfigurationSource;
import org.springframework.web.cors.reactive.CorsWebFilter;

import com.eviden.gateway.keycloak.KeycloakJwtAuthenticationConverter;

@Configuration
@EnableWebFluxSecurity
public class GatewaySecurityConfig {

	@Bean
    SecurityWebFilterChain securityWebFilterChain(ServerHttpSecurity http, CorsConfigurationSource corsConfigSource) {
        http
        	.cors(cors -> cors.configurationSource(corsConfigSource))
        	//.csrf(CsrfSpec::disable)
        	
            .authorizeExchange(exchanges -> exchanges
            	.pathMatchers(HttpMethod.OPTIONS).permitAll()
                .pathMatchers("/products/**").authenticated()
                .pathMatchers("/dishes/**").authenticated()
                .pathMatchers("/sales/**").authenticated()
                .pathMatchers("/beverages/**").authenticated()
                .anyExchange().permitAll())
            .oauth2ResourceServer(oauth2 -> {
            	oauth2.jwt(token -> token.jwtAuthenticationConverter(new KeycloakJwtAuthenticationConverter()));
            });
        return http.build();
    }
	
    @Bean
    CorsWebFilter corsWebFilter(CorsConfigurationSource corsConfigurationSource) {
        return new CorsWebFilter(corsConfigurationSource);
    }
}
