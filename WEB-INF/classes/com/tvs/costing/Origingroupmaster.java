package com.tvs.costing;

public class Origingroupmaster {
	
	String companycode;
	String origin;
	String origindesc;
	public String getCompanycode() {
		return companycode;
	}
	public void setCompanycode(String companycode) {
		this.companycode = companycode;
	}
	public String getOrigin() {
		return origin;
	}
	public Origingroupmaster() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Origingroupmaster(String companycode, String origin, String origindesc) {
		super();
		this.companycode = companycode;
		this.origin = origin;
		this.origindesc = origindesc;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	public String getOrigindesc() {
		return origindesc;
	}
	public void setOrigindesc(String origindesc) {
		this.origindesc = origindesc;
	}

}
