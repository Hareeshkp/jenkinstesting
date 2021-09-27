package com.tvstyres.vendor.model;

public class Bankkey {
	
	private String bankkey;
	private String bankname;
	public String getBankkey() {
		return bankkey;
	}
	public void setBankkey(String bankkey) {
		this.bankkey = bankkey;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public Bankkey() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Bankkey(String bankkey, String bankname) {
		super();
		this.bankkey = bankkey;
		this.bankname = bankname;
	}
	

}
