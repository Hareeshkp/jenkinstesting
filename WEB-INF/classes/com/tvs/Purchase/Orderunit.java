package com.tvs.Purchase;

public class Orderunit {
	
	
	
	String measureunit;
	String text;
	public String getMeasureunit() {
		return measureunit;
	}
	public void setMeasureunit(String measureunit) {
		this.measureunit = measureunit;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Orderunit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orderunit(String measureunit, String text) {
		super();
		this.measureunit = measureunit;
		this.text = text;
	}
	

}
