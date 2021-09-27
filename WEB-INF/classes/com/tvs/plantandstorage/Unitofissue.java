package com.tvs.plantandstorage;

public class Unitofissue {

	

	String measureunit;
	String text;
	public Unitofissue() {
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
	public Unitofissue(String measureunit, String text) {
		super();
		this.measureunit = measureunit;
		this.text = text;
	}
	public void setText(String text) {
		this.text = text;
	}
}
