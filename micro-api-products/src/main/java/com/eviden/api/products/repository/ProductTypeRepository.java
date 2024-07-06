package com.eviden.api.products.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.api.products.model.ProductType;

@Repository
public interface ProductTypeRepository extends ReactiveMongoRepository<ProductType, String> {
}
