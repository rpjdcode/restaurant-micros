package com.eviden.api.products.model;

import java.math.BigDecimal;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.eviden.api.products.dto.ProductDTO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Document(collection = "products")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Product {
	
	@Id
	private String id;
    private String productCode;
    private String name;
    private BigDecimal price;
    private Boolean active;
    
    private String productType;
    
    public Product(ProductDTO dto) {
    	this.productCode = dto.getProductCode();
    	this.name = dto.getName();
    	this.active = dto.getActive();
    	this.productType = dto.getProductType().getTypeCode();
    }

    
}