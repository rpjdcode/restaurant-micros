package com.eviden.api.products.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Document(collection = "productData")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductData {

	@Id
	private String id;
	private String productCode;
	private ProductDataTypes dataType;
	private String fileName;
	private byte[] data;
}
