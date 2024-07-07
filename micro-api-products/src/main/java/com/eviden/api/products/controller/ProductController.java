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
import com.eviden.api.products.dto.ProductTypeDTO;
import com.eviden.api.products.service.ProductService;

import reactor.core.publisher.Flux;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("/products")
public class ProductController {
    
    private final ProductService productService;
    
    public ProductController(ProductService service) {
    	this.productService = service;
    }

    @GetMapping
    public Flux<ProductDTO> getAllProducts() {
        return productService.getAllProducts();
    }

    @GetMapping("/{id}")
    public Mono<ProductDTO> getProductById(@PathVariable String id) {
        return productService.getProductById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Mono<ProductDTO> createProduct(@RequestBody ProductDTO data) {
        return productService.createProduct(data);
    }

    @PutMapping("/{id}")
    public Mono<ProductDTO> updateProduct(@PathVariable String id, @RequestBody ProductDTO updateData) {
        return productService.updateProduct(id, updateData);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public Mono<Void> deleteProduct(@PathVariable String id) {
        return productService.deleteProductById(id);
    }
    
    @GetMapping("/types")
    public Flux<ProductTypeDTO> getAllProductTypes() {
        return productService.getAllProductTypes();
    }
    
    @GetMapping("/types/{id}")
    public Mono<ProductTypeDTO> getProductTypeById(@PathVariable String id) {
        return productService.getProductTypeById(id);
    }

    @PostMapping("/types")
    @ResponseStatus(HttpStatus.CREATED)
    public Mono<ProductTypeDTO> createProductType(@RequestBody ProductTypeDTO data) {
        return productService.createProductType(data);
    }


    @DeleteMapping("/types/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public Mono<Void> deleteProductType(@PathVariable String id) {
        return productService.deleteProductTypeById(id);
    }
    
    @PutMapping("/types/{id}")
    public Mono<ProductTypeDTO> updateProductType(@PathVariable String id, @RequestBody ProductTypeDTO updateData) {
        return productService.updateProductType(id, updateData);
    }
    
    
}