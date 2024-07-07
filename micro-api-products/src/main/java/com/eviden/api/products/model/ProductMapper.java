package com.eviden.api.products.model;

import com.eviden.api.products.dto.ProductDTO;
import com.eviden.api.products.dto.ProductTypeDTO;

public class ProductMapper {

    public static ProductDTO productToDTO(Product product) {
        return new ProductDTO(product);
    }
    
    public static ProductTypeDTO productTypeToDTO(ProductType type) {
    	return new ProductTypeDTO(type);
    }
    
    private ProductMapper() {}
}
