package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductDTO;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

/**
 * El servicio de producto DTO será el utilizado por el controlador,
 * ya que devolverá los datos listos para presentación.
 * Se aplicará esta estrategia con todos los microservicios:
 * Controller -> Servicio DTO -> Servicio de entidad de BBDD
 */
public interface ProductDTOService {
	
	Flux<ProductDTO> getAllProducts();
	Mono<ProductDTO> getProductById(String id);
	Mono<ProductDTO> getProductByProductCode(String code);
	Mono<ProductDTO> createProduct(ProductDTO product);
	Mono<ProductDTO> updateProduct(String code, ProductDTO updateData);
	Mono<Void> deleteProductByCode(String code);
}
