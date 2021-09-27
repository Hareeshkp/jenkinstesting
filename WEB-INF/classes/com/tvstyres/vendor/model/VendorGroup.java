package com.tvstyres.vendor.model;

public class VendorGroup {
	
	private String vendortype;
	private String vendorcode;
	private String description;
	
	public String getVendortype() {
		return vendortype;
	}
	public void setVendortype(String vendortype) {
		this.vendortype = vendortype;
	}
	public String getVendorcode() {
		return vendorcode;
	}
	public void setVendorcode(String vendorcode) {
		this.vendorcode = vendorcode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public VendorGroup(String vendortype, String vendorcode, String description) {
		super();
		this.vendortype = vendortype;
		this.vendorcode = vendorcode;
		this.description = description;
	}
	public VendorGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

}
