package com.eviden.api.products.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.exceptions.ProductTypeNotFoundException;
import com.eviden.api.products.service.ProductTypeDTOService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/products/types")
public class ProductTypeController {

	private final ProductTypeDTOService service;
	
	public ProductTypeController(ProductTypeDTOService service) {
		this.service = service;
	}
	
    @GetMapping
    public Flux<ProductTypeDTO> getAllProductTypes() {
        return service.getAllProductTypes();
    }
    
    @GetMapping("/{code}")
    public Mono<ResponseEntity<ProductTypeDTO>> getProductTypeByProductCode(@PathVariable("code") String code) {
        return service.getProductTypeByTypeCode(code)
        		.map(ResponseEntity::ok)
        		.onErrorResume(ProductTypeNotFoundException.class, exception -> Mono.just(ResponseEntity.status(HttpStatus.NOT_FOUND).build()));
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Mono<ProductTypeDTO> createProductType(@RequestBody ProductTypeDTO data) {
        return service.createProductType(data);
    }


    @DeleteMapping("/{code}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public Mono<ResponseEntity<Void>> deleteProductType(@PathVariable("code") String code) {
        return service.deleteProductTypeByCode(code)
        		.map(deleted -> ResponseEntity.noContent().<Void>build())
        		.onErrorResume(ProductTypeNotFoundException.class, exception -> Mono.just(ResponseEntity.status(HttpStatus.NOT_FOUND).<Void>build()));
    }
    
    @PutMapping("/{code}")
    public Mono<ProductTypeDTO> updateProductType(@PathVariable("code") String code, @RequestBody ProductTypeDTO updateData) {
        return service.updateProductType(code, updateData);
    }
	
}
