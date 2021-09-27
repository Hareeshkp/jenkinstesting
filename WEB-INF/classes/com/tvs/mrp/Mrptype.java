package com.tvs.mrp;

public class Mrptype {
	String mrptype;
	String mrpdesc;
	public String getMrptype() {
		return mrptype;
	}
	public void setMrptype(String mrptype) {
		this.mrptype = mrptype;
	}
	public String getMrpdesc() {
		return mrpdesc;
	}
	public void setMrpdesc(String mrpdesc) {
		this.mrpdesc = mrpdesc;
	}
	public Mrptype(String mrptype, String mrpdesc) {
		super();
		this.mrptype = mrptype;
		this.mrpdesc = mrpdesc;
	}
	public Mrptype() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
