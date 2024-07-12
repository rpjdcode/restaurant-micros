package com.eviden.api.products.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.api.products.model.ProductData;

import reactor.core.publisher.Mono;

@Repository
public interface ProductDataRepository extends ReactiveMongoRepository<ProductData, String> {
	
	Mono<ProductData> findByFileName(String fileName);
	Mono<ProductData> findByProductCode(String code);
	Mono<ProductData> findByProductCodeAndDataType(String code, String type);

}
