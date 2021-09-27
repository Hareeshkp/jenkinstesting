package com.tvs.mrp;

public class Lotsize {
	
	String lotsizing;
	String lotdesc;
	public String getLotsizing() {
		return lotsizing;
	}
	public void setLotsizing(String lotsizing) {
		this.lotsizing = lotsizing;
	}
	public String getLotdesc() {
		return lotdesc;
	}
	public void setLotdesc(String lotdesc) {
		this.lotdesc = lotdesc;
	}
	public Lotsize(String lotsizing, String lotdesc) {
		super();
		this.lotsizing = lotsizing;
		this.lotdesc = lotdesc;
	}
	public Lotsize() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
