package com.tvs.mrp;

public class Individualcoll {
		
	String Individualcode;
	String desc;
	public Individualcoll(String individualcode, String desc) {
		super();
		Individualcode = individualcode;
		this.desc = desc;
	}
	public String getIndividualcode() {
		return Individualcode;
	}
	public void setIndividualcode(String individualcode) {
		Individualcode = individualcode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	

}
