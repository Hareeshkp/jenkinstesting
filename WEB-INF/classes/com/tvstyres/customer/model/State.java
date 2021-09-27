package com.tvstyres.customer.model;

public class State {
	private String countrycode;
	private String statecode;
	private String description;
	
	public String getCountrycode() {
		return countrycode;
	}
	public void setCountrycode(String countrycode) {
		this.countrycode = countrycode;
	}
	public String getStatecode() {
		return statecode;
	}
	public void setStatecode(String statecode) {
		this.statecode = statecode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public State(String countrycode, String statecode, String description) {
		super();
		this.countrycode = countrycode;
		this.statecode = statecode;
		this.description = description;
	}
	public State() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
