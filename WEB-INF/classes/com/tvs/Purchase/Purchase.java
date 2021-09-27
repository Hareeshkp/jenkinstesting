package com.tvs.Purchase;

public class Purchase {
	
	
	String plantcode;
	String plantcodecodedesc;
	String purchasegroup;
	String purchasegroupdesc;
	Integer grprocessingtime;
	String purchasekeyvalue;
	String orderunit;
	String orderunitdesc;
	String potext;
	String modeldesc;
    String status;
    String materialtypecode;
  String reasonforedit;
  String createdby;
	Object createddate;
	String modifierby;
	Object modifieddate;
	String approvedby;
	Object approveddate;
	String model;
	
	//view feild
	Integer mdmcode;
	String materialcode;
	String materialcodedesc;
	String materialtypedesc;

	Integer version;
	String uom;
	String approvalprocess;
	String reasonforrejection;
	//New parameters from form 2
	Integer minshelf;
	Integer totalshelf;
	String storagebin;
	String profitcentercode;
	String profitcenterdesc;
	String serialnoprofile;
	String serialnoprofiledesc;
	String unitofissue;
	String unitofissuedesc;
	String profitdesc;
	public Integer getminshelf()
	{
		return minshelf;
	}
	public void setminshelf(Integer minshelf)
	{
		this.minshelf = minshelf;
	}	
	public Integer gettotalshelf()
	{
		return totalshelf;
	}
	public void settotalshelf(Integer totalshelf)
	{
		this.totalshelf = totalshelf;
	}
	public String getstoragebin()
	{
		return storagebin;
	}
	public void setstoragebin(String storagebin)
	{
		this.storagebin = storagebin;
	}
	public String getprofitcentercode()
	{
		return profitcentercode;
	}
	public void setprofitcentercode(String profitcentercode)
	{
		this.profitcentercode = profitcentercode;
	}
	public String getprofitcenterdesc()
	{
		return profitcenterdesc;
	}
	public void setprofitcenterdesc(String profitcenterdesc)
	{
		this.profitcenterdesc = profitcenterdesc;
	}
	public String getserialnoprofile()
	{
		return serialnoprofile;
	}
	public void setserialnoprofile(String serialnoprofile)
	{
		this.serialnoprofile = serialnoprofile;
	}
	public String getserialnoprofiledesc()
	{
		return serialnoprofiledesc;
	}
	public void setserialnoprofiledesc(String serialnoprofiledesc)
	{
		this.serialnoprofiledesc = serialnoprofiledesc;
	}
	public String getunitofissue()
	{
		return unitofissue;
	}
	public void setunitofissue(String unitofissue)
	{
		this.unitofissue = unitofissue;
	}
	public String getsunitofissuedesc()
	{
		return unitofissuedesc;
	}
	public void setunitofissuedesc(String unitofissuedesc)
	{
		this.unitofissuedesc = unitofissuedesc;
	}
	public String getprofitdesc()
	{
		return profitdesc;
	}
	public void setprofitdesc(String profitdesc)
	{
		this.profitdesc = profitdesc;
	}
	// new variables from form 2
	
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
	
	
	
	public Purchase(Integer mdmcode, String materialcode, String materialcodedesc, String materialtypedesc,
			Integer version, String uom,String plantcode,String status,String approvalprocess) {
		super();
		this.mdmcode = mdmcode;
		this.materialcode = materialcode;
		this.materialcodedesc = materialcodedesc;
		this.materialtypedesc = materialtypedesc;
		this.version = version;
		this.uom = uom;
		this.plantcode=plantcode;
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
	public String getModeldesc() {
		return modeldesc;
	}
	public void setModeldesc(String modeldesc) {
		this.modeldesc = modeldesc;
	}
	
	public Purchase() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getPlantcodecodedesc() {
		return plantcodecodedesc;
	}
	public void setPlantcodecodedesc(String plantcodecodedesc) {
		this.plantcodecodedesc = plantcodecodedesc;
	}
	public String getPurchasegroup() {
		return purchasegroup;
	}
	public void setPurchasegroup(String purchasegroup) {
		this.purchasegroup = purchasegroup;
	}
	public String getPurchasegroupdesc() {
		return purchasegroupdesc;
	}
	public void setPurchasegroupdesc(String purchasegroupdesc) {
		this.purchasegroupdesc = purchasegroupdesc;
	}
	public Integer getGrprocessingtime() {
		return grprocessingtime;
	}
	public void setGrprocessingtime(Integer grprocessingtime) {
		this.grprocessingtime = grprocessingtime;
	}
	public String getPurchasekeyvalue() {
		return purchasekeyvalue;
	}
	public void setPurchasekeyvalue(String purchasekeyvalue) {
		this.purchasekeyvalue = purchasekeyvalue;
	}
	public String getOrderunit() {
		return orderunit;
	}
	public void setOrderunit(String orderunit) {
		this.orderunit = orderunit;
	}
	public String getOrderunitdesc() {
		return orderunitdesc;
	}
	public void setOrderunitdesc(String orderunitdesc) {
		this.orderunitdesc = orderunitdesc;
	}
	public String getPotext() {
		return potext;
	}
	public void setPotext(String potext) {
		this.potext = potext;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
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
	public String getModifierby() {
		return modifierby;
	}
	public void setModifierby(String modifierby) {
		this.modifierby = modifierby;
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
	
}
