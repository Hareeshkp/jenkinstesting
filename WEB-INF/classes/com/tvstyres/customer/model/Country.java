package com.tvstyres.customer.model;

public class Country {
	
	private String countrycode;
	private String description;
	
	public String getCountrycode() {
		return countrycode;
	}
	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Country() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Country(String countrycode, String description) {
		super();
		this.countrycode = countrycode;
		this.description = description;
	}
	

}
