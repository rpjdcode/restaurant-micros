package com.eviden.api.products.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.api.products.model.Product;

@Repository
public interface ProductRepository extends ReactiveMongoRepository<Product, String> {
}
