package com.tvstyres.vendor.model;

public class Incoterm {
	
	String code;
	String Description;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public Incoterm() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Incoterm(String code, String description) {
		super();
		this.code = code;
		Description = description;
	}
	

}
