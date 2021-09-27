package com.tvs.mrp;

public class Availabilitycheck {
	
	String checkcode;
	String desc;
	public String getCheckcode() {
		return checkcode;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Availabilitycheck(String checkcode, String desc) {
		super();
		this.checkcode = checkcode;
		this.desc = desc;
	}
}
