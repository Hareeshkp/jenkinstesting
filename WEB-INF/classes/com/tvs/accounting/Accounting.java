package com.tvs.accounting;

public class Accounting {
	
	
	String plantcode;
	String plantdesc;	
	Integer valuationcode;
	String valuationdesc;
	String valuationCatcode;
	String valuationCatdesc;
	String priceControlcode;	
	String priceControldesc;	
	String priceDeterminationcode;	
	String priceDeterminationdesc;	
	String hsncode;	
	String status;	
	String createdby;
	Object createddate;	
	String modifiedby;
	Object modifieddate;
	String reasonforedit;
	Integer mdmcode;
	String materialcode;
    String description;  
    Integer version;
    String uom;
    String materialtypecode;
    String materialtypedesc;
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
	public Integer getMdmcode() {
		return mdmcode;
	}
	public void setMdmcode(Integer mdmcode) {
		this.mdmcode = mdmcode;
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
	public Integer getValuationcode() {
		return valuationcode;
	}
	public void setValuationcode(Integer valuationcode) {
		this.valuationcode = valuationcode;
	}
	public String getValuationdesc() {
		return valuationdesc;
	}
	public void setValuationdesc(String valuationdesc) {
		this.valuationdesc = valuationdesc;
	}
	public String getValuationCatcode() {
		return valuationCatcode;
	}
	public void setValuationCatcode(String valuationCatcode) {
		this.valuationCatcode = valuationCatcode;
	}
	public String getValuationCatdesc() {
		return valuationCatdesc;
	}
	public void setValuationCatdesc(String valuationCatdesc) {
		this.valuationCatdesc = valuationCatdesc;
	}
	public String getPriceControlcode() {
		return priceControlcode;
	}
	public void setPriceControlcode(String priceControlcode) {
		this.priceControlcode = priceControlcode;
	}
	public String getPriceControldesc() {
		return priceControldesc;
	}
	public void setPriceControldesc(String priceControldesc) {
		this.priceControldesc = priceControldesc;
	}
	public String getPriceDeterminationcode() {
		return priceDeterminationcode;
	}
	public void setPriceDeterminationcode(String priceDeterminationcode) {
		this.priceDeterminationcode = priceDeterminationcode;
	}
	public String getPriceDeterminationdesc() {
		return priceDeterminationdesc;
	}
	public void setPriceDeterminationdesc(String priceDeterminationdesc) {
		this.priceDeterminationdesc = priceDeterminationdesc;
	}
	public String getHsncode() {
		return hsncode;
	}
	public void setHsncode(String hsncode) {
		this.hsncode = hsncode;
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
	
	
	public Accounting() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Accounting(Integer mdmcode, String materialcode, String description, Integer version, String uom,
			String materialtypedesc,String plantcode,String status,String approvalprocess) {
		super();
		this.mdmcode = mdmcode;
		this.materialcode = materialcode;
		this.description = description;
		this.version = version;
		this.uom = uom;
		this.materialtypedesc = materialtypedesc;
		this.plantcode=plantcode;
		this.status=status;
		this.approvalprocess=approvalprocess;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getUom() {
		return uom;
	}
	public void setUom(String uom) {
		this.uom = uom;
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
	
	public String getReasonforedit() {
		return reasonforedit;
	}
	public void setReasonforedit(String reasonforedit) {
		this.reasonforedit = reasonforedit;
	}
	
}
