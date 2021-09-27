package com.tvs.costing;

public class Costing {
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
	public String getOverheadcode() {
		return overheadcode;
	}
	public void setOverheadcode(String overheadcode) {
		this.overheadcode = overheadcode;
	}
	public String getOverheaddesc() {
		return overheaddesc;
	}
	public void setOverheaddesc(String overheaddesc) {
		this.overheaddesc = overheaddesc;
	}
	public Boolean getMateriaCosted() {
		return materiaCosted;
	}
	public void setMateriaCosted(Boolean materiaCosted) {
		this.materiaCosted = materiaCosted;
	}
	public String getVariancecode() {
		return variancecode;
	}
	public void setVariancecode(String variancecode) {
		this.variancecode = variancecode;
	}
	public String getVariancepdesc() {
		return variancepdesc;
	}
	public void setVariancepdesc(String variancepdesc) {
		this.variancepdesc = variancepdesc;
	}
	public String getCostlotsize() {
		return costlotsize;
	}
	public void setCostlotsize(String costlotsize) {
		this.costlotsize = costlotsize;
	}
	public Boolean getMaterelated() {
		return materelated;
	}
	public void setMaterelated(Boolean materelated) {
		this.materelated = materelated;
	}
	public String getOrigingroup() {
		return origingroup;
	}
	public void setOrigingroup(String origingroup) {
		this.origingroup = origingroup;
	}
	public String getOrigingroupdesc() {
		return origingroupdesc;
	}
	public void setOrigingroupdesc(String origingroupdesc) {
		this.origingroupdesc = origingroupdesc;
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
	Integer mdmcode;
	String materialcode;
    String description; 
    
    String materialtypecode;
    String materialtypedesc;
    String uom;
    Integer version;
    
    
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
	String plantcode;
	String plantdesc;	
	String overheadcode;
	String overheaddesc;    
    Boolean materiaCosted;       	  
	String variancecode;
	String variancepdesc;	
	
	String costlotsize;
	Boolean materelated;	
	String origingroup;	
	String origingroupdesc;
	String reasonforedit ;
	String status;	
	String createdby;
	Object createddate;	
	String modifiedby;
	Object modifieddate;
	String approvalprocess;
	String reasonforrejection;
	//new fields from form2
	String valuationclassdesc;
	Integer valuationclasscode;
	String pricecontrolcode;
	String pricecontroldesc;
	String valuationcatcode;
	String valuationcatdesc;
	String hsnw;
	String pricedetermination;
	String multiselectvalc;
	String specialprocurementcostcode;
	String specialprocurementcostdesc;
	Boolean donotcost;
	public String getspecialprocurementcostdesc()
	{
		return specialprocurementcostdesc;
	}
	public void setspecialprocurementcostdesc(String specialprocurementcostdesc)
	{
		this.specialprocurementcostdesc = specialprocurementcostdesc;
	}
	public String getspecialprocurementcostcode()
	{
		return specialprocurementcostcode;
	}
	public void setspecialprocurementcostcode(String specialprocurementcostcode)
	{
		this.specialprocurementcostcode = specialprocurementcostcode;
	}
	public Boolean getdonotcost()
	{
		return donotcost;
	}
	public void setdonotcost(Boolean donotcost)
	{
		 this.donotcost = donotcost;
	}
	public String getvaluationclassdesc()
	{
		return valuationclassdesc;
	}
	public void setvaluationclassdesc(String valuationclassdesc)
	{
		this.valuationclassdesc = valuationclassdesc;
	}
	public Integer getvaluationclasscode()
	{
		return valuationclasscode;
	}
	public void setvaluationclasscode(Integer valuationclasscode)
	{
		this.valuationclasscode = valuationclasscode;
	}
	public String getpricecontrolcode()
	{
		return pricecontrolcode;
	}
	public void setpricecontrolcode(String pricecontrolcode)
	{
		this.pricecontrolcode = pricecontrolcode;
	}
	public String getpricecontroldesc()
	{
		return pricecontroldesc;
	}
	public void setpricecontroldesc(String pricecontroldesc)
	{
		this.pricecontroldesc = pricecontroldesc;
	}
	public String getvaluationcatcode()
	{
		return valuationcatcode;
	}
	public void setvaluationcatcode(String valuationcatcode)
	{
		this.valuationcatcode = valuationcatcode;
	}
	public String getvaluationcatdesc()
	{
		return valuationcatdesc;
	}
	public void setvaluationcatdesc(String valuationcatdesc)
	{
		this.valuationcatdesc = valuationcatdesc;
	}
	public String gethsnw()
	{
		return hsnw;
	}
	public void sethsnw(String hsnw)
	{
		this.hsnw = hsnw;
	}
	public String getpricedetermination()
	{
		return pricedetermination;
	}
	public void setpricedetermination(String pricedetermination)
	{
		this.pricedetermination = pricedetermination;
	}
	public String getmultiselectvalc()
	{
		return multiselectvalc;
	}
	public void setmultiselectvalc(String multiselectvalc)
	{
		this.multiselectvalc = multiselectvalc;
	}
	//new fields from form 2
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
	public Costing(Integer mdmcode, String materialcode, String description, String materialtypedesc, String uom,
			Integer version,String plantcode, String status,String approvalprocess) {
		super();
		this.mdmcode = mdmcode;
		this.materialcode = materialcode;
		this.description = description;
		this.materialtypedesc = materialtypedesc;
		this.uom = uom;
		this.version = version;
		this.plantcode=plantcode;
		this.status=status;
		this.approvalprocess=approvalprocess;
	}
	public Costing() {
		super();
		// TODO Auto-generated constructor stub
	}
}
