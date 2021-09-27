package com.tvstyres.customer.model;
public class Pricegroup {

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
	public Pricegroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Pricegroup(String code, String description) {
		super();
		this.code = code;
		this.description = description;
	}
	
}
