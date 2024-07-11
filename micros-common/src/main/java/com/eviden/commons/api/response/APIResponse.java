package com.eviden.commons.api.response;

import java.util.ArrayList;
import java.util.List;

public class APIResponse {

	private List<String> errors;
	private String message;
	private Object data;
	
	public APIResponse(List<String> errors, String message, Object data) {
		setErrors(errors);
		this.message = message;
		this.data = data;	
	}
	
	public void addError(String error) {
		errors.add(error);
	}
	
	public List<String> getErrors() {
		return errors;
	}
	
	public void setErrors(List<String> errors) {
		if (errors != null) {
			this.errors = errors;
		} else {
			this.errors = new ArrayList<>();
		}
		
	}
	
	public String getMessage() {
		return message;
	}
	
	public void setMessage(String message) {
		this.message = message;
	}
	
	public Object getData() {
		return data;
	}
	
	public void setData(Object data) {
		this.data = data;
	}
	
	
	
}
