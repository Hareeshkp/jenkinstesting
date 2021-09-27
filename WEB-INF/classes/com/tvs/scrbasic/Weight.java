package com.tvs.scrbasic;

public class Weight {
	String unit;
	String description;
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Weight(String unit, String description) {
		super();
		this.unit = unit;
		this.description = description;
	}
	public Weight() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
