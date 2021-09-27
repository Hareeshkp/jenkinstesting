package com.tvs.Sales;

public class SalesOrganization {
	
	String salesorganization;
	String name;
	public String getSalesorganization() {
		return salesorganization;
	}
	public void setSalesorganization(String salesorganization) {
		this.salesorganization = salesorganization;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public SalesOrganization(String salesorganization, String name) {
		super();
		this.salesorganization = salesorganization;
		this.name = name;
	}
	public SalesOrganization() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
