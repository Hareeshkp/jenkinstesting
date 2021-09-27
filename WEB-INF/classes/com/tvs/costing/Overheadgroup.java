package com.tvs.costing;

public class Overheadgroup {
	
	String val;
	String overheadgroup;
	String description;
	public String getVal() {
		return val;
	}
	public Overheadgroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Overheadgroup(String val, String overheadgroup, String description) {
		super();
		this.val = val;
		this.overheadgroup = overheadgroup;
		this.description = description;
	}
	public void setVal(String val) {
		this.val = val;
	}
	public String getOverheadgroup() {
		return overheadgroup;
	}
	public void setOverheadgroup(String overheadgroup) {
		this.overheadgroup = overheadgroup;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

}
