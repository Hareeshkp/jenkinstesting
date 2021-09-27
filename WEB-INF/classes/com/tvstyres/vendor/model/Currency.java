package com.tvstyres.vendor.model;

public class Currency {
	
	
	private String currency;
	private String description;
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Currency() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Currency(String currency, String description) {
		super();
		this.currency = currency;
		this.description = description;
	}
	

}
