package com.tvstyres.vendor.model;

public class GSTFileing {
	
	private String gstfileing;
	private String desc;
	public String getGstfileing() {
		return gstfileing;
	}
	public void setGstfileing(String gstfileing) {
		this.gstfileing = gstfileing;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public GSTFileing(String gstfileing, String desc) {
		super();
		this.gstfileing = gstfileing;
		this.desc = desc;
	}
	public GSTFileing() {
		super();
		// TODO Auto-generated constructor stub
	}

	

}
