package com.eviden.api.products.service.impl;

import org.springframework.stereotype.Service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.model.Product;
import com.eviden.api.products.repository.ProductRepository;
import com.eviden.api.products.service.ProductService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class ProductServiceImpl implements ProductService {

	private final ProductRepository productRepository;

	public ProductServiceImpl(ProductRepository repository) {
		this.productRepository = repository;
	}

	@Override
	public Flux<Product> getAllProducts() {
		return productRepository.findAll();
	}

	@Override
	public Mono<Product> getProductById(String id) {
		return productRepository.findById(id);
	}

	@Override
	public Mono<Product> getProductByProductCode(String code) {
		return productRepository.findByProductCode(code);
	}

	@Override
	public Mono<Product> createProduct(ProductDTO prod) {
		Product product = new Product(prod);
		return productRepository.save(product);
	}

	@Override
	public Mono<Product> updateProduct(String code, ProductDTO updateData) {
		return productRepository.findByProductCode(code).flatMap(existingProduct -> {
			existingProduct.setName(updateData.getName());
			existingProduct.setPrice(updateData.getPrice());
			existingProduct.setActive(updateData.getActive());
			existingProduct.setProductType(updateData.getProductType().getTypeCode());
			return productRepository.save(existingProduct);
		});

	}

	@Override
	public Mono<Void> deleteProductById(String id) {
		return productRepository.deleteById(id);
	}

	@Override
	public Mono<Void> deleteProductByCode(String code) {
		return productRepository.deleteProductByProductCode(code);
	}

}
