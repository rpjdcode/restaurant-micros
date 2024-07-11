package com.eviden.api.products.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.api.products.model.Product;

import reactor.core.publisher.Mono;

@Repository
public interface ProductRepository extends ReactiveMongoRepository<Product, String> {
	Mono<Product> findByProductCode(String code);
	Mono<Void> deleteProductByProductCode(String code);
}
