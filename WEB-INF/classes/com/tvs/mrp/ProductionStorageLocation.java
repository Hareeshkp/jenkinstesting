package com.tvs.mrp;

public class ProductionStorageLocation {
	public String getStoreCode() {
		return storeCode;
	}
	public void setStoreCode(String storeCode) {
		this.storeCode = storeCode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public ProductionStorageLocation(String storeCode, String desc) {
		super();
		this.storeCode = storeCode;
		this.desc = desc;
	}
	String storeCode;
	String desc;
}
