package com.eviden.api.products.service;

import com.eviden.api.products.dto.ProductTypeDTO;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

public interface ProductTypeDTOService {

	Flux<ProductTypeDTO> getAllProductTypes();
	Mono<ProductTypeDTO> getProductTypeById(String id);
	Mono<ProductTypeDTO> getProductTypeByName(String name);
	Mono<ProductTypeDTO> getProductTypeByTypeCode(String code);
	Mono<ProductTypeDTO> createProductType(ProductTypeDTO productType);
	Mono<ProductTypeDTO> updateProductType(String code, ProductTypeDTO updateData);
	Mono<Void> deleteProductTypeById(String id);
	Mono<Void> deleteProductTypeByCode(String code);
}
