package com.tvs.plantandstorage;

public class Serialnoprofile {
	String serialno;
	String des;
	public Serialnoprofile() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Serialnoprofile(String serialno, String des) {
		super();
		this.serialno = serialno;
		this.des = des;
	}
	public String getDes() {
		return des;
	}
	public String getSerialno() {
		return serialno;
	}
	public void setSerialno(String serialno) {
		this.serialno = serialno;
	}
	public void setDes(String des) {
		this.des = des;
	}
	

}
