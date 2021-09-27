package com.tvs.scrbasic;

public class Material {
	String materialtype;
	String description;
	
	
	
	
	public Material(String materialtype, String description) {
		super();
		this.materialtype = materialtype;
		this.description = description;
	}
	
	public Material() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMaterialtype() {
		return materialtype;
	}
	public void setMaterialtype(String materialtype) {
		this.materialtype = materialtype;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	

}
