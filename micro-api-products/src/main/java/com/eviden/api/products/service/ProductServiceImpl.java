package com.eviden.api.products.service;

import org.springframework.stereotype.Service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.model.Product;
import com.eviden.api.products.model.ProductMapper;
import com.eviden.api.products.model.ProductType;
import com.eviden.api.products.repository.ProductRepository;
import com.eviden.api.products.repository.ProductTypeRepository;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class ProductServiceImpl implements ProductService {

	private final ProductRepository productRepository;
	private final ProductTypeRepository productTypeRepository;

	public ProductServiceImpl(ProductRepository repository, ProductTypeRepository typeRepository) {
		this.productRepository = repository;
		this.productTypeRepository = typeRepository;
	}

	@Override
	public Mono<ProductDTO> getProductById(String id) {
		return productRepository.findById(id).map(ProductMapper::productToDTO);
	}

	@Override
	public Flux<ProductDTO> getAllProducts() {
		return productRepository.findAll().map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<ProductDTO> createProduct(ProductDTO dto) {
		Product product = new Product(dto.getId(), dto.getName(), dto.getPrice(), dto.getActive(), dto.getProductType());
		return productRepository.save(product).map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<Void> deleteProductById(String id) {
		return productRepository.deleteById(id);
	}

	@Override
	public Mono<ProductType> getProductTypeById(String id) {
		return productTypeRepository.findById(id);
	}

	@Override
	public Flux<ProductType> getAllProductTypes() {
		return productTypeRepository.findAll();
	}

	@Override
	public Mono<ProductType> createProductType(ProductType productType) {
		return productTypeRepository.save(productType);
	}

	@Override
	public Mono<Void> deleteProductTypeById(String id) {
		return productTypeRepository.deleteById(id);
	}

	@Override
	public Mono<ProductDTO> updateProduct(String id, ProductDTO updateData) {
		return productRepository.findById(id).flatMap(existingProduct -> {
			existingProduct.setName(updateData.getName());
			existingProduct.setPrice(updateData.getPrice());
			return productRepository.save(existingProduct).map(ProductMapper::productToDTO);
		});

	}

}
