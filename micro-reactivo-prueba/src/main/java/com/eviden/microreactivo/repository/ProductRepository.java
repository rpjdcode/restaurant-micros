package com.eviden.microreactivo.repository;

import org.springframework.data.mongodb.repository.ReactiveMongoRepository;
import org.springframework.stereotype.Repository;

import com.eviden.microreactivo.model.Product;

@Repository
public interface ProductRepository extends ReactiveMongoRepository<Product, String> {
}