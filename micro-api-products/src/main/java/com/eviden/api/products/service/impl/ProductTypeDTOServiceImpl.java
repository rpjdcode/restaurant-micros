package com.eviden.api.products.service.impl;

import org.springframework.stereotype.Service;

import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.model.ProductMapper;
import com.eviden.api.products.service.ProductTypeDTOService;
import com.eviden.api.products.service.ProductTypeService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class ProductTypeDTOServiceImpl implements ProductTypeDTOService {
	
	private final ProductTypeService productTypeService;
	
	public ProductTypeDTOServiceImpl(ProductTypeService service) {
		this.productTypeService = service;
	}

	@Override
	public Flux<ProductTypeDTO> getAllProductTypes() {
		return productTypeService.getAllProductTypes().map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<ProductTypeDTO> getProductTypeById(String id) {
		return productTypeService.getProductTypeById(id).map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<ProductTypeDTO> getProductTypeByName(String name) {
		return productTypeService.getProductTypeByName(name).map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<ProductTypeDTO> getProductTypeByTypeCode(String code) {
		return productTypeService.getProductTypeByTypeCode(code).map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<ProductTypeDTO> createProductType(ProductTypeDTO productType) {
		return productTypeService.createProductType(productType).map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<ProductTypeDTO> updateProductType(String code, ProductTypeDTO updateData) {
		return productTypeService.updateProductType(code, updateData).map(ProductMapper::productTypeToDTO);
	}

	@Override
	public Mono<Void> deleteProductTypeById(String id) {
		return productTypeService.deleteProductTypeById(id);
	}

	@Override
	public Mono<Void> deleteProductTypeByCode(String code) {

		// Tratar cuando no exista un producto, devolver un error para ser capturado por el endpoint
		return productTypeService.deleteProductTypeByCode(code);
	}

}
