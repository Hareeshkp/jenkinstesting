package com.tvs.Purchase;

public class Model {
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
	public Model() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Model(String code, String description) {
		super();
		this.code = code;
		this.description = description;
	}
	

}
