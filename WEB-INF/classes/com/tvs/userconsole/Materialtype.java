package com.tvs.userconsole;

public class Materialtype {

	String materialtypecode;
	String materialtypedesc;
	public String getMaterialtypecode() {
		return materialtypecode;
	}
	public void setMaterialtypecode(String materialtypecode) {
		this.materialtypecode = materialtypecode;
	}
	public String getMaterialtypedesc() {
		return materialtypedesc;
	}
	public void setMaterialtypedesc(String materialtypedesc) {
		this.materialtypedesc = materialtypedesc;
	}
	public Materialtype(String materialtypecode, String materialtypedesc) {
		super();
		this.materialtypecode = materialtypecode;
		this.materialtypedesc = materialtypedesc;
	}
	public Materialtype() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
		
}
