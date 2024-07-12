package com.eviden.api.products.exceptions;


public class ProductTypeNotFoundException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public ProductTypeNotFoundException(String message) {
		super(message);
	}
}
