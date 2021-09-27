package com.tvs.userconsole;

public class Customer_CustomerGroup {
	private String rolename;
	private String customergroupcode;
	private String customergrouptype;
	private String customergroupdesc;
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getCustomergroupcode() {
		return customergroupcode;
	}
	public void setCustomergroupcode(String customergroupcode) {
		this.customergroupcode = customergroupcode;
	}
	public String getCustomergrouptype() {
		return customergrouptype;
	}
	public void setCustomergrouptype(String customergrouptype) {
		this.customergrouptype = customergrouptype;
	}
	public String getCustomergroupdesc() {
		return customergroupdesc;
	}
	public void setCustomergroupdesc(String customergroupdesc) {
		this.customergroupdesc = customergroupdesc;
	}
	public Customer_CustomerGroup(String rolename, String customergroupcode, String customergrouptype,
			String customergroupdesc) {
		super();
		this.rolename = rolename;
		this.customergroupcode = customergroupcode;
		this.customergrouptype = customergrouptype;
		this.customergroupdesc = customergroupdesc;
	}
	public Customer_CustomerGroup(String customergroupcode, String customergrouptype, String customergroupdesc) {
		super();
		this.customergroupcode = customergroupcode;
		this.customergrouptype = customergrouptype;
		this.customergroupdesc = customergroupdesc;
	}
	public Customer_CustomerGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
