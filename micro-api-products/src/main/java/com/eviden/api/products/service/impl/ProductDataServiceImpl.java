package com.eviden.api.products.service.impl;

import org.springframework.stereotype.Service;

import com.eviden.api.products.model.ProductData;
import com.eviden.api.products.model.ProductDataTypes;
import com.eviden.api.products.repository.ProductDataRepository;
import com.eviden.api.products.service.ProductDataService;

import reactor.core.publisher.Mono;

@Service
public class ProductDataServiceImpl implements ProductDataService {
	
	private final ProductDataRepository repository;

	public ProductDataServiceImpl(ProductDataRepository repository) {
		this.repository = repository;
	}

	@Override
	public Mono<ProductData> getProductDataByCode(String code) {
		return repository.findByProductCode(code);
	}

	@Override
	public Mono<ProductData> saveProductData(ProductData data) {
		return repository.save(data);
	}

	@Override
	public Mono<ProductData> getProductDataByCodeAndType(String code, ProductDataTypes type) {
		return repository.findByProductCodeAndDataType(code, type.getValue());
	}

	@Override
	public Mono<ProductData> updateProductData(String code, ProductDataTypes type, ProductData update) {
		return getProductDataByCodeAndType(code, type).flatMap(existingData -> {
			existingData.setFileName(update.getFileName());
			existingData.setData(update.getData());
			return repository.save(existingData);
		});
	}
	
	
}
