package com.tvs.mrp;

public class Procurementtype {
	String procurementtype;
	String pdesc;
	public String getProcurementtype() {
		return procurementtype;
	}
	public void setProcurementtype(String procurementtype) {
		this.procurementtype = procurementtype;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Procurementtype() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Procurementtype(String procurementtype, String pdesc) {
		super();
		this.procurementtype = procurementtype;
		this.pdesc = pdesc;
	}

}
