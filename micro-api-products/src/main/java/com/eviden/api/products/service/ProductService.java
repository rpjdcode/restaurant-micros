package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.model.Product;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ProductService {
	
	Flux<Product> getAllProducts();
	Mono<Product> getProductById(String id);
	Mono<Product> getProductByProductCode(String code);
	Mono<Product> createProduct(ProductDTO product);
	Mono<Product> updateProduct(String id, ProductDTO updateData);
	Mono<Void> deleteProductById(String id);
	Mono<Void> deleteProductByCode(String code);
	
}
