package com.eviden.api.products.dto;

import java.math.BigDecimal;

import com.eviden.api.products.model.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {

    private String id;
    private String name;
    private BigDecimal price;
    private Boolean active;
    private String productType;
    
    public ProductDTO(Product product) {
    	id = product.getId();
    	name = product.getName();
    	price = product.getPrice();
    	active = product.getActive();
    	productType = product.getProductType();
    }
}
