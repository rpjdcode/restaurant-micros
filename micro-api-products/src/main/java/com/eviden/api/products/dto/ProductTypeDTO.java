package com.eviden.api.products.dto;

import com.eviden.api.products.model.ProductType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductTypeDTO {

    private String typeCode;
    private String name;
    
    public ProductTypeDTO(ProductType type) {
    	typeCode = type.getTypeCode();
    	name = type.getName();
    }
}
