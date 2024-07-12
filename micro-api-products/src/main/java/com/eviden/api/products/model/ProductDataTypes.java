package com.eviden.api.products.model;

public enum ProductDataTypes {

	PRESENTATION("PRESENTATION"),
	OTHER("OTHER");
	
	private final String value;
	
	ProductDataTypes(String value) {
		this.value = value;
	}
	
	public String getValue() {
		return value;
	}
	
}
