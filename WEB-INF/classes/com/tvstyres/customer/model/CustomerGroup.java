package com.tvstyres.customer.model;

public class CustomerGroup {
	
	String customertype;
	String customercode;
	String description;
	public String getCustomertype() {
		return customertype;
	}
	public void setCustomertype(String customertype) {
		this.customertype = customertype;
	}
	public String getCustomercode() {
		return customercode;
	}
	public void setCustomercode(String customercode) {
		this.customercode = customercode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public CustomerGroup(String customertype, String customercode, String description) {
		super();
		this.customertype = customertype;
		this.customercode = customercode;
		this.description = description;
	}
	public CustomerGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
