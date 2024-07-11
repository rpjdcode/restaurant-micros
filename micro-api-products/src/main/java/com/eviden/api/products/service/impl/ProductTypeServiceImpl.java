package com.eviden.api.products.service.impl;

import org.springframework.stereotype.Service;

import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.model.ProductType;
import com.eviden.api.products.repository.ProductTypeRepository;
import com.eviden.api.products.service.ProductTypeService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class ProductTypeServiceImpl implements ProductTypeService {
	
	private final ProductTypeRepository productTypeRepository;
	
	public ProductTypeServiceImpl(ProductTypeRepository repositorio) {
		this.productTypeRepository = repositorio;
	}

	@Override
	public Flux<ProductType> getAllProductTypes() {
		return productTypeRepository.findAll();
	}
	
	@Override
	public Mono<ProductType> getProductTypeById(String id) {
		return productTypeRepository.findById(id);
	}

	@Override
	public Mono<ProductType> createProductType(ProductTypeDTO dto) {
		ProductType productType = new ProductType(dto.getTypeCode(), dto.getName());

		return productTypeRepository.save(productType);
	}

	@Override
	public Mono<Void> deleteProductTypeById(String id) {
		return productTypeRepository.deleteById(id);
	}
	
	@Override
	public Mono<ProductType> updateProductType(String code, ProductTypeDTO updateData) {
		return productTypeRepository.findByTypeCode(code).flatMap(existingType -> {
			existingType.setName(updateData.getName());
			return productTypeRepository.save(existingType);
		});
	}
	
	@Override
	public Mono<ProductType> getProductTypeByName(String name) {
		return productTypeRepository.findByName(name);
	}

	@Override
	public Mono<ProductType> getProductTypeByTypeCode(String code) {
		return productTypeRepository.findByTypeCode(code);
	}

	@Override
	public Mono<Void> deleteProductTypeByCode(String code) {
		return productTypeRepository.deleteByTypeCode(code);
	}

}
