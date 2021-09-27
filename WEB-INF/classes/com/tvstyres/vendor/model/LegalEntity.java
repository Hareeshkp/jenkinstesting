package com.tvstyres.vendor.model;

public class LegalEntity {
	
	private String legalentity;
	private String desc;
	public String getLegalentity() {
		return legalentity;
	}
	public void setLegalentity(String legalentity) {
		this.legalentity = legalentity;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public LegalEntity() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LegalEntity(String legalentity, String desc) {
		super();
		this.legalentity = legalentity;
		this.desc = desc;
	}
	

}
