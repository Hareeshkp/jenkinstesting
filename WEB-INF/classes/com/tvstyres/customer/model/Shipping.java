package com.tvstyres.customer.model;
public class Shipping {
	
	String code;
	String description;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Shipping(String code, String description) {
		super();
		this.code = code;
		this.description = description;
	}
	public Shipping() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
