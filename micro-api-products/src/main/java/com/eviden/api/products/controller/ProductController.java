package com.eviden.api.products.controller;


import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.service.ProductDTOService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/products")
public class ProductController {
    
    private final ProductDTOService dtoService;
    
    public ProductController(ProductDTOService dtoService) {
    	this.dtoService = dtoService;
    }

    @GetMapping
    public Flux<ProductDTO> getProducts() {
    	
        return dtoService.getAllProducts();
    }

    @GetMapping("/{code}")
    public Mono<ProductDTO> getProductByProductCode(@PathVariable("code") String code) {
        return dtoService.getProductByProductCode(code);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Mono<ProductDTO> createProduct(@RequestBody ProductDTO data) {
        return dtoService.createProduct(data);
    }

    @PutMapping("/{code}")
    public Mono<ProductDTO> updateProduct(@PathVariable("code") String code, @RequestBody ProductDTO updateData) {
        return dtoService.updateProduct(code, updateData);
    }

    @DeleteMapping("/{code}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public Mono<Void> deleteProduct(@PathVariable("code") String code) {
        return dtoService.deleteProductByCode(code);
    }
    
    
}