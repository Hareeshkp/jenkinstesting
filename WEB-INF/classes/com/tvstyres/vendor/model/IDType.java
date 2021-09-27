package com.tvstyres.vendor.model;

public class IDType {
	
	private String idtype;
	private String desc;
	public String getIdtype() {
		return idtype;
	}
	public void setIdtype(String idtype) {
		this.idtype = idtype;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public IDType() {
		super();
		// TODO Auto-generated constructor stub
	}
	public IDType(String idtype, String desc) {
		super();
		this.idtype = idtype;
		this.desc = desc;
	}
	

}
