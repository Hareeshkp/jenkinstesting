package com.tvstyres.vendor.model;

public class Countries {
	
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
	public Countries() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Countries(String countrycode, String description) {
		super();
		this.countrycode = countrycode;
		this.description = description;
	}
	

}
