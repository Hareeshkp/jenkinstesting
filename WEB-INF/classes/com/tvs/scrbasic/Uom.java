package com.tvs.scrbasic;

public class Uom {
	String measureunit;
	String text;
	public Uom() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	public Uom(String measureunit, String text) {
		super();
		this.measureunit = measureunit;
		this.text = text;
	}
	

}
