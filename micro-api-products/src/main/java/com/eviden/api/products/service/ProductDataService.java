package com.eviden.api.products.service;

import com.eviden.api.products.model.ProductData;
import com.eviden.api.products.model.ProductDataTypes;

import reactor.core.publisher.Mono;

public interface ProductDataService {


	Mono<ProductData> getProductDataByCode(String code);
	Mono<ProductData> getProductDataByCodeAndType(String code, ProductDataTypes type);
	Mono<ProductData> updateProductData(String code, ProductDataTypes type, ProductData update);
	Mono<ProductData> saveProductData(ProductData data);
}
