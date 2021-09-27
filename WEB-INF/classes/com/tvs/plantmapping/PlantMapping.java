package com.tvs.plantmapping;

public class PlantMapping {
	
	Integer talendcode;
	String materialcode;
	String description;
	String materialtype;
	String materialtypedesc;
	String uom;
	Integer version;
	String materialgroup;
	String reasonforedit;
	String plant[];
	String createdby;
	String modifiedby;	
	String materialgroupdesc;
		
	//String createdby;
	//String modifiedby;
	String status;
	
	Object createddate;	
	Object modifieddate;
	String approvalprocess;
	String reasonforrejection;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Object getCreateddate() {
		return createddate;
	}
	public void setCreateddate(Object createddate) {
		this.createddate = createddate;
	}
	public Object getModifieddate() {
		return modifieddate;
	}
	public void setModifieddate(Object modifieddate) {
		this.modifieddate = modifieddate;
	}
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
	
	
	public String getReasonforedit() {
		return reasonforedit;
	}
	public void setReasonforedit(String reasonforedit) {
		this.reasonforedit = reasonforedit;
	}
	
	
	
	
	public PlantMapping(Integer talendcode, String materialcode, String description, String materialtypedesc,
			String uom, Integer version,String status,String approvalprocess) {
		super();
		this.talendcode = talendcode;
		this.materialcode = materialcode;
		this.description = description;
		this.materialtypedesc = materialtypedesc;
		this.uom = uom;
		this.version = version;
		this.status= status;
		this.approvalprocess=approvalprocess;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getCreatedby() {
		return createdby;
	}
	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	public String getModifiedby() {
		return modifiedby;
	}
	public void setModifiedby(String modifiedby) {
		this.modifiedby = modifiedby;
	}
	public String[] getPlant() {
		return plant;
	}
	public void setPlant(String[] plant) {
		this.plant = plant;
	}
	public Integer getTalendcode() {
		return talendcode;
	}
	public void setTalendcode(Integer talendcode) {
		this.talendcode = talendcode;
	}
	public String getMaterialtype() {
		return materialtype;
	}
	public void setMaterialtype(String materialtype) {
		this.materialtype = materialtype;
	}
	public String getMaterialgroup() {
		return materialgroup;
	}
	public void setMaterialgroup(String materialgroup) {
		this.materialgroup = materialgroup;
	}
	public String getMaterialtypedesc() {
		return materialtypedesc;
	}
	public void setMaterialtypedesc(String materialtypedesc) {
		this.materialtypedesc = materialtypedesc;
	}
	public String getMaterialgroupdesc() {
		return materialgroupdesc;
	}
	public void setMaterialgroupdesc(String materialgroupdesc) {
		this.materialgroupdesc = materialgroupdesc;
	}
	public String getMaterialcode() {
		return materialcode;
	}
	public void setMaterialcode(String materialcode) {
		this.materialcode = materialcode;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public PlantMapping() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PlantMapping(Integer talendcode, String materialtype, String materialgroup, String materialtypedesc,
			String materialgroupdesc, String materialcode, String description) {
		super();
		this.talendcode = talendcode;
		this.materialtype = materialtype;
		this.materialgroup = materialgroup;
		this.materialtypedesc = materialtypedesc;
		this.materialgroupdesc = materialgroupdesc;
		this.materialcode = materialcode;
		this.description = description;
	}
	
	
	

}
