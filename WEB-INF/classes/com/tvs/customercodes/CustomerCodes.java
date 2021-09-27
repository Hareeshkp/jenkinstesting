package com.tvs.customercodes;

public class CustomerCodes {
	
	Integer customercode;
	String custtype;
	

	public String getCusttype() {
		return custtype;
	}

	public void setCusttype(String custtype) {
		this.custtype = custtype;
	}

	public CustomerCodes(Integer customercode, String custtype) {
		super();
		this.customercode = customercode;
		this.custtype = custtype;
	}

	public Integer getCustomercode() {
		return customercode;
	}

	public void setCustomercode(Integer customercode) {
		this.customercode = customercode;
	}

	public CustomerCodes() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CustomerCodes(Integer customercode) {
		super();
		this.customercode = customercode;
	}

	
	

}
