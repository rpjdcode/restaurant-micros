package com.eviden.gateway.beans;

import java.util.Arrays;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.reactive.CorsWebFilter;
import org.springframework.web.cors.reactive.UrlBasedCorsConfigurationSource;

@Configuration
public class BeansConfig {

	@Bean
	CorsWebFilter corsFilter() {
		final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
		final CorsConfiguration config = new CorsConfiguration();
		config.setAllowCredentials(true);
		config.setAllowedOrigins(Arrays.asList("http://localhost:4200", "https://localhost:4200"));
		config.setAllowedHeaders(Arrays.asList(
				HttpHeaders.ORIGIN,
				HttpHeaders.CONTENT_TYPE,
				HttpHeaders.ACCEPT,
				HttpHeaders.AUTHORIZATION
				));
		
		config.setAllowedMethods(Arrays.asList(
				"GET",
				"POST",
				"DELETE",
				"PUT",
				"PATCH",
				"OPTIONS"
				));
		
		source.registerCorsConfiguration("/**", config);
		
		return new CorsWebFilter(source);
	}
}
