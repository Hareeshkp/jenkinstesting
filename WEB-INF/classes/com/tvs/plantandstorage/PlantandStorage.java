package com.tvs.plantandstorage;

public class PlantandStorage {
	
	
	Integer mdmCode;//
	String materialcode;//
	String materialcodedesc;//
	
	
	String materialtypecode;
	String materialtypedesc;//
	
	String plantcode;
	String plantdesc;
	
	Integer minshelf;
	Integer totalshelf;
	
	String profitcentrecode;
	String profitcentredesc;
	
	String storagebin;
	
	String  unitofissue;
	String unitofissuedesc;
	
	
String Serial_Number_Profile_code;
String Serial_Number_Profile_Description;
String status;
String createdby;
Object createddate;
String modifiedby;
Object modifieddate;
String approvedby;
Object approveddate;
String regionforedit;

String basicuom;
Integer version;
String approvalprocess;
String reasonforrejection;






public String getApprovalprocess() {
	return approvalprocess;
}

public void setApprovalprocess(String approvalprocess) {
	this.approvalprocess = approvalprocess;
}

public String getReasonforrejection() {
	return reasonforrejection;
}

public void setReasonforrejection(String reasonforrejection) {
	this.reasonforrejection = reasonforrejection;
}

public PlantandStorage(Integer mdmCode, String materialcode, String materialcodedesc, String materialtypedesc,
		String basicuom, Integer version,String plantcode,String status,String approvalprocess) {
	super();
	this.mdmCode = mdmCode;
	this.materialcode = materialcode;
	this.materialcodedesc = materialcodedesc;
	this.materialtypedesc = materialtypedesc;
	this.basicuom = basicuom;
	this.version = version;
	this.plantcode=plantcode;
	this.status= status;
	this.approvalprocess=approvalprocess;
}

public String getBasicuom() {
	return basicuom;
}

public void setBasicuom(String basicuom) {
	this.basicuom = basicuom;
}

public Integer getVersion() {
	return version;
}

public void setVersion(Integer version) {
	this.version = version;
}

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

public String getRegionforedit() {
	return regionforedit;
}

public void setRegionforedit(String regionforedit) {
	this.regionforedit = regionforedit;
}


public Integer getMdmCode() {
	return mdmCode;
}

public void setMdmCode(Integer mdmCode) {
	this.mdmCode = mdmCode;
}

public String getMaterialcode() {
	return materialcode;
}

public void setMaterialcode(String materialcode) {
	this.materialcode = materialcode;
}

public String getMaterialcodedesc() {
	return materialcodedesc;
}

public void setMaterialcodedesc(String materialcodedesc) {
	this.materialcodedesc = materialcodedesc;
}

public String getPlantcode() {
	return plantcode;
}

public void setPlantcode(String plantcode) {
	this.plantcode = plantcode;
}

public String getPlantdesc() {
	return plantdesc;
}

public void setPlantdesc(String plantdesc) {
	this.plantdesc = plantdesc;
}

public Integer getMinshelf() {
	return minshelf;
}

public void setMinshelf(Integer minshelf) {
	this.minshelf = minshelf;
}

public Integer getTotalshelf() {
	return totalshelf;
}

public void setTotalshelf(Integer totalshelf) {
	this.totalshelf = totalshelf;
}

public String getProfitcentrecode() {
	return profitcentrecode;
}

public void setProfitcentrecode(String profitcentrecode) {
	this.profitcentrecode = profitcentrecode;
}

public String getProfitcentredesc() {
	return profitcentredesc;
}

public void setProfitcentredesc(String profitcentredesc) {
	this.profitcentredesc = profitcentredesc;
}

public String getStoragebin() {
	return storagebin;
}

public void setStoragebin(String storagebin) {
	this.storagebin = storagebin;
}

public String getUnitofissue() {
	return unitofissue;
}

public void setUnitofissue(String unitofissue) {
	this.unitofissue = unitofissue;
}

public String getUnitofissuedesc() {
	return unitofissuedesc;
}

public void setUnitofissuedesc(String unitofissuedesc) {
	this.unitofissuedesc = unitofissuedesc;
}

public String getSerial_Number_Profile_code() {
	return Serial_Number_Profile_code;
}

public void setSerial_Number_Profile_code(String serial_Number_Profile_code) {
	Serial_Number_Profile_code = serial_Number_Profile_code;
}

public String getSerial_Number_Profile_Description() {
	return Serial_Number_Profile_Description;
}

public void setSerial_Number_Profile_Description(String serial_Number_Profile_Description) {
	Serial_Number_Profile_Description = serial_Number_Profile_Description;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public String getCreatedby() {
	return createdby;
}

public void setCreatedby(String createdby) {
	this.createdby = createdby;
}

public Object getCreateddate() {
	return createddate;
}

public void setCreateddate(Object createddate) {
	this.createddate = createddate;
}

public String getModifiedby() {
	return modifiedby;
}

public void setModifiedby(String modifiedby) {
	this.modifiedby = modifiedby;
}

public Object getModifieddate() {
	return modifieddate;
}

public void setModifieddate(Object modifieddate) {
	this.modifieddate = modifieddate;
}

public String getApprovedby() {
	return approvedby;
}

public void setApprovedby(String approvedby) {
	this.approvedby = approvedby;
}

public Object getApproveddate() {
	return approveddate;
}

public void setApproveddate(Object approveddate) {
	this.approveddate = approveddate;
}

public PlantandStorage() {
	super();
	// TODO Auto-generated constructor stub
}




	

}
