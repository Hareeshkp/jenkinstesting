package com.tvs.scrbasic;

public class MaterialGroup {

	
	String materialgroup;
	String mgdescription;
	public MaterialGroup(String materialgroup, String mgdescription) {
		super();
		this.materialgroup = materialgroup;
		this.mgdescription = mgdescription;
	}
	public MaterialGroup() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMaterialgroup() {
		return materialgroup;
	}
	public void setMaterialgroup(String materialgroup) {
		this.materialgroup = materialgroup;
	}
	public String getMgdescription() {
		return mgdescription;
	}
	public void setMgdescription(String mgdescription) {
		this.mgdescription = mgdescription;
	}
	
}
