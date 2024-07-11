package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.model.ProductType;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ProductTypeService {

	Flux<ProductType> getAllProductTypes();
	Mono<ProductType> getProductTypeById(String id);
	Mono<ProductType> getProductTypeByName(String name);
	Mono<ProductType> getProductTypeByTypeCode(String code);
	Mono<ProductType> createProductType(ProductTypeDTO productType);
	Mono<ProductType> updateProductType(String code, ProductTypeDTO updateData);
	Mono<Void> deleteProductTypeById(String id);
	Mono<Void> deleteProductTypeByCode(String code);
}
