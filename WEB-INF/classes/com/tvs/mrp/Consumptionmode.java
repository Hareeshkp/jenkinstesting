package com.tvs.mrp;

public class Consumptionmode {
	public String getConcode() {
		return concode;
	}
	public void setConcode(String concode) {
		this.concode = concode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Consumptionmode(String concode, String desc) {
		super();
		this.concode = concode;
		this.desc = desc;
	}
	String concode;
	String desc;
	
}
