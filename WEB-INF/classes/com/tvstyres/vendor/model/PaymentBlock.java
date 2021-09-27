package com.tvstyres.vendor.model;

public class PaymentBlock {
	
	private String code;
	private String desc;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public PaymentBlock(String code, String desc) {
		super();
		this.code = code;
		this.desc = desc;
	}
	public PaymentBlock() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
