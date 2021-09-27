package com.tvs.mrp;

public class Mrpcontroller {
	
	
	public String getMrpdesc() {
		return mrpdesc;
	}
	public void setMrpdesc(String mrpdesc) {
		this.mrpdesc = mrpdesc;
	}
	String mrpcontroller;
	String mrpdesc;
	
	public String getMrpcontroller() {
		return mrpcontroller;
	}
	public void setMrpcontroller(String mrpcontroller) {
		this.mrpcontroller = mrpcontroller;
	}
	
	public Mrpcontroller(String mrpcontroller, String mrpdesc) {
		super();
		this.mrpcontroller = mrpcontroller;
		this.mrpdesc = mrpdesc;
	}
	public Mrpcontroller() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
