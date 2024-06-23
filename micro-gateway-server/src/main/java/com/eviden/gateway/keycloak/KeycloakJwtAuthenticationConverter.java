package com.eviden.gateway.keycloak;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.core.convert.converter.Converter;
import org.springframework.lang.NonNull;
import org.springframework.security.authentication.AbstractAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationToken;
import org.springframework.security.oauth2.server.resource.authentication.JwtGrantedAuthoritiesConverter;

import reactor.core.publisher.Mono;

/**
 * Converter de token de autenticación Jwt proporcionado por Keycloak.
 * 
 * Esta clase es utilizada para extraer información del toke (info de usuario, roles, etc...)
 */
public class KeycloakJwtAuthenticationConverter implements Converter<Jwt, Mono<AbstractAuthenticationToken>>  {

	@Override
	public Mono<AbstractAuthenticationToken> convert(@NonNull Jwt source) {

		return 	Mono.just(new JwtAuthenticationToken(
				source,
				Stream.concat(new JwtGrantedAuthoritiesConverter().convert(source).stream(),
						extractResourceRoles(source).stream()).collect(Collectors.toSet())
				));
	}

	private Collection<? extends GrantedAuthority> extractResourceRoles(Jwt jwt) {
		var resourceAccess = new HashMap<>(jwt.getClaim("resource_access"));
		@SuppressWarnings("unchecked")
		var eternal = (Map<String, List<String>>) resourceAccess.get("account");
		var roles = eternal.get("roles");
		
		return roles.stream()
				.map(role -> new SimpleGrantedAuthority("ROLE_" + role.replace("-", "_")))
				.collect(Collectors.toSet());
	}
}
