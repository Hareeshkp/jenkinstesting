package com.tvstyres.customer.model;

public class CustStatsGroup {
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
	public CustStatsGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CustStatsGroup(String code, String description) {
		super();
		this.code = code;
		Description = description;
	}
	

}
