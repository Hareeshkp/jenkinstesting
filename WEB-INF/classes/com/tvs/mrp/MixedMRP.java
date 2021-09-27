package com.tvs.mrp;

public class MixedMRP {
	public MixedMRP(Integer mrpcode, String mrpdesc) {
		super();
		this.mrpcode = mrpcode;
		this.mrpdesc = mrpdesc;
	}
	Integer mrpcode;
	String mrpdesc;
	public Integer getMrpcode() {
		return mrpcode;
	}
	public void setMrpcode(Integer mrpcode) {
		this.mrpcode = mrpcode;
	}
	public String getMrpdesc() {
		return mrpdesc;
	}
	public void setMrpdesc(String mrpdesc) {
		this.mrpdesc = mrpdesc;
	}
	
	
}
