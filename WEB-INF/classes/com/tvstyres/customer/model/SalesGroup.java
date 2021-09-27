package com.tvstyres.customer.model;

public class SalesGroup {
	
	String salesoffice;
	String salesgroup;
	String description;
	
	public String getSalesoffice() {
		return salesoffice;
	}
	public void setSalesoffice(String salesoffice) {
		this.salesoffice = salesoffice;
	}
	public String getSalesgroup() {
		return salesgroup;
	}
	public void setSalesgroup(String salesgroup) {
		this.salesgroup = salesgroup;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public SalesGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesGroup(String salesgroup, String description) {
		super();
		this.salesgroup = salesgroup;
		this.description = description;
	}
	

}
