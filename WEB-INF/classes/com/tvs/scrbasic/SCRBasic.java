package com.tvs.scrbasic;

public class SCRBasic {

	Integer talendcode;	
	String materialtype;
	String materialtypedesc;	
	String materialgroup;
	String materialgroupdesc;	
	String materialcode;
    String description;    
    String basicuom;
    String basicuomdesc;    
	String altuom;
	String altuomdesc;	
	Float numerator;
	Float denominator;	
	Float gross;
	Float net;
	Integer version;
	String hsncode;	
	String unitweight;
	String unitweightdesc;	
	Boolean block;
	String reason;
	String status;	
	String createdby;
	Object createddate;	
	String modifiedby;
	Object modifieddate;
	String approvalprocess;
	String reasonforrejection;
	String approvalstatus;
	String reasonforedit;
	//Newly Added Fields
	String Volume;
	String VolumeUnit;
	String volumeunitcode;
	String volumeunitdesc;

	
	public SCRBasic(String materialcode, String description) {
		super();
		this.materialcode = materialcode;
		this.description = description;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getReasonforedit() {
	return reasonforedit;
	}
	public void setReasonforedit(String reasonforedit) {
		this.reasonforedit = reasonforedit;
	}
	public String getApprovalstatus() {
		return approvalstatus;
	}
	public void setApprovalstatus(String approvalstatus) {
		this.approvalstatus = approvalstatus;
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
	public String getMaterialtypedesc() {
		return materialtypedesc;
	}
	public void setMaterialtypedesc(String materialtypedesc) {
		this.materialtypedesc = materialtypedesc;
	}
	public String getMaterialgroup() {
		return materialgroup;
	}
	public void setMaterialgroup(String materialgroup) {
		this.materialgroup = materialgroup;
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
	//newly added set functions for new fields
	public void setVolume(String Volume)
	{
		this.Volume = Volume;
	}
	public void setVolumeUnit(String VolumeUnit)
	{
		this.VolumeUnit = VolumeUnit;
	}
	public void setvolumeunitcode(String volumeunitcode)
	{
		this.volumeunitcode = volumeunitcode;
	}
	public void setvolumeunitdesc(String volumeunitdesc)
	{
		this.volumeunitdesc = volumeunitdesc;
	}
	// =======================================
	//newly added get functions for new fields 
	public String getVolume()
	{
		return Volume;
	}
	public String getVolumeUnit()
	{
		return VolumeUnit;
	}
	public String getvolumeunitcode()
	{
		return volumeunitcode;
	}
	public String getvolumeunitdesc()
	{
		return volumeunitdesc;
	}
	// ======================================
	public String getBasicuom() {
		return basicuom;
	}
	public void setBasicuom(String basicuom) {
		this.basicuom = basicuom;
	}
	public String getBasicuomdesc() {
		return basicuomdesc;
	}
	public void setBasicuomdesc(String basicuomdesc) {
		this.basicuomdesc = basicuomdesc;
	}
	public String getAltuom() {
		return altuom;
	}
	public void setAltuom(String altuom) {
		this.altuom = altuom;
	}
	public String getAltuomdesc() {
		return altuomdesc;
	}
	public void setAltuomdesc(String altuomdesc) {
		this.altuomdesc = altuomdesc;
	}
	public Float getNumerator() {
		return numerator;
	}
	public void setNumerator(Float numerator) {
		this.numerator = numerator;
	}
	public Float getDenominator() {
		return denominator;
	}
	public void setDenominator(Float denominator) {
		this.denominator = denominator;
	}
	public Float getGross() {
		return gross;
	}
	public void setGross(Float gross) {
		this.gross = gross;
	}
	public Float getNet() {
		return net;
	}
	public void setNet(Float net) {
		this.net = net;
	}
	
	public String getHsncode() {
		return hsncode;
	}
	public void setHsncode(String hsncode) {
		this.hsncode = hsncode;
	}
	public String getUnitweight() {
		return unitweight;
	}
	public void setUnitweight(String unitweight) {
		this.unitweight = unitweight;
	}
	public String getUnitweightdesc() {
		return unitweightdesc;
	}
	public void setUnitweightdesc(String unitweightdesc) {
		this.unitweightdesc = unitweightdesc;
	}
	public Boolean getBlock() {
		return block;
	}
	public void setBlock(Boolean block) {
		this.block = block;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
	public SCRBasic() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SCRBasic(Integer talendcode, String materialtypedesc, String materialcode, String description,
			String basicuom, Integer version,String status,String approvalstatus) {
		super();
		this.talendcode = talendcode;
		this.materialtypedesc = materialtypedesc;
		this.materialcode = materialcode;
		this.description = description;
		this.basicuom = basicuom;
		this.version = version;
		this.status = status;
		this.approvalstatus=approvalstatus;
	}
	
		
}
