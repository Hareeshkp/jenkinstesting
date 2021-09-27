package com.tvstyres.vendor.model;

public class Vendorclass {

	
	String vendorclass;
	String description;
	public String getVendorclass() {
		return vendorclass;
	}
	public void setVendorclass(String vendorclass) {
		this.vendorclass = vendorclass;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Vendorclass() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vendorclass(String vendorclass, String description) {
		super();
		this.vendorclass = vendorclass;
		this.description = description;
	}
	
}
