package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.dto.ProductTypeDTO;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ProductService {
	
	Flux<ProductDTO> getAllProducts();
	Mono<ProductDTO> getProductById(String id);
	Mono<ProductDTO> createProduct(ProductDTO product);
	Mono<ProductDTO> updateProduct(String id, ProductDTO updateData);
	Mono<Void> deleteProductById(String id);
	
	Flux<ProductTypeDTO> getAllProductTypes();
	Mono<ProductTypeDTO> getProductTypeById(String id);
	Mono<ProductTypeDTO> createProductType(ProductTypeDTO productType);
	Mono<ProductTypeDTO> updateProductType(String id, ProductTypeDTO updateData);
	Mono<Void> deleteProductTypeById(String id);
}
