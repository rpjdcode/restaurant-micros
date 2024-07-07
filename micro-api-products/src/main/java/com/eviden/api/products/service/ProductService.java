package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.model.ProductType;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ProductService {

	Mono<ProductType> getProductTypeById(String id);
	Flux<ProductType> getAllProductTypes();
	Mono<ProductType> createProductType(ProductType productType);
	Mono<Void> deleteProductTypeById(String id);
	
	Mono<ProductDTO> getProductById(String id);
	Flux<ProductDTO> getAllProducts();
	Mono<ProductDTO> createProduct(ProductDTO product);
	Mono<ProductDTO> updateProduct(String id, ProductDTO updateData);
	Mono<Void> deleteProductById(String id);
}
