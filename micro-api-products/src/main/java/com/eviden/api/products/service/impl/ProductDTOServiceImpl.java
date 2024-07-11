package com.eviden.api.products.service.impl;

import org.springframework.stereotype.Service;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.model.ProductMapper;
import com.eviden.api.products.service.ProductDTOService;
import com.eviden.api.products.service.ProductService;
import com.eviden.api.products.service.ProductTypeService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@Service
public class ProductDTOServiceImpl implements ProductDTOService{

	private final ProductService productService;
	private final ProductTypeService productTypeService;
	
	public ProductDTOServiceImpl(ProductService productService, ProductTypeService productTypeService) {
		this.productService = productService;
		this.productTypeService = productTypeService;
	}
	
	@Override
	public Flux<ProductDTO> getAllProducts() {
	    return productService.getAllProducts().flatMap(prod -> 
	        productTypeService.getProductTypeByTypeCode(prod.getProductType())
            .map(productType -> {
                ProductDTO dto = new ProductDTO(prod);
                dto.setProductType(new ProductTypeDTO(productType));
                return dto;
            })
	    
	    );
	}

	@Override
	public Mono<ProductDTO> getProductById(String id) {
		return productService.getProductById(id).map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<ProductDTO> getProductByProductCode(String code) {
		return productService.getProductByProductCode(code).map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<ProductDTO> createProduct(ProductDTO product) {
		return productService.createProduct(product).map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<ProductDTO> updateProduct(String code, ProductDTO updateData) {
		return productService.updateProduct(code, updateData).map(ProductMapper::productToDTO);
	}

	@Override
	public Mono<Void> deleteProductByCode(String code) {
		
		return productService.deleteProductByCode(code);
	}
	
	


}
