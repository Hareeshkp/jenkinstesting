package com.tvs.userconsole;

public class Vendor_VendorGroup {
	
	private String rolename;
	private String vendorgroupcode;
	private String vendorgrouptype;
	private String vendorgroupdesc;
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getVendorgroupcode() {
		return vendorgroupcode;
	}
	public void setVendorgroupcode(String vendorgroupcode) {
		this.vendorgroupcode = vendorgroupcode;
	}
	public String getVendorgrouptype() {
		return vendorgrouptype;
	}
	public void setVendorgrouptype(String vendorgrouptype) {
		this.vendorgrouptype = vendorgrouptype;
	}
	public String getVendorgroupdesc() {
		return vendorgroupdesc;
	}
	public void setVendorgroupdesc(String vendorgroupdesc) {
		this.vendorgroupdesc = vendorgroupdesc;
	}
	public Vendor_VendorGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Vendor_VendorGroup(String rolename, String vendorgroupcode, String vendorgrouptype, String vendorgroupdesc) {
		super();
		this.rolename = rolename;
		this.vendorgroupcode = vendorgroupcode;
		this.vendorgrouptype = vendorgrouptype;
		this.vendorgroupdesc = vendorgroupdesc;
	}
	public Vendor_VendorGroup(String vendorgroupcode, String vendorgrouptype, String vendorgroupdesc) {
		super();
		this.vendorgroupcode = vendorgroupcode;
		this.vendorgrouptype = vendorgrouptype;
		this.vendorgroupdesc = vendorgroupdesc;
	}
	
}
