package com.eviden.api.products.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.api.products.model.ProductType;

import reactor.core.publisher.Mono;


@Repository
public interface ProductTypeRepository extends ReactiveMongoRepository<ProductType, String> {
	Mono<ProductType> findByName(String name);
	Mono<ProductType> findByTypeCode(String code);
	Mono<Void> deleteByTypeCode(String code);
}
