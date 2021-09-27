package com.tvs.Sales;

public class Sales {
	
	Integer mdmcode;
	String materialcode;
    String description;   
    String materialtypecode;
    String materialtypedesc;
	String plantcode;
	String plantdesc;	
	String slorgcode;
	String slorgdesc;    
    String dtchcode;
    String dtchdesc;   	  
	String mtlstatisticsgrpcode;
	String mtlstatisticsgrpdesc;
	String mtlpricegrpcode;
	String mtlpricegrpdesc;
	String Acassignmentgrpcode;
	String Acassignmentgrpdesc;
	String gencatgrpcode;
	String gencatgrpdesc;
	String itmcatgrpcode;
	String itmcatgrpdesc;
	String trngrpcode;
	String trngrpdesc;
	String lodgrpcode;
	String lodgrpdesc;
	String delplantcode;
	String delplantdesc;
	String reason;
	String status;	
	String createdby;
	Object createddate;	
	String modifiedby;
	Object modifieddate;
	Integer version;
	String uom;	
	String reasonforedit;	
	String approvalprocess;
	String reasonforrejection;
	//new fields
	String segmentcode;
	String segmentdescription;
	String applicationcode;
	String applicationdescription;
	String cccode;
	String ccdescription;
	String aspectratiocode;
	String aspectratiodescription;
	String polymercode;
	String polymerdescription;
	
	public String getsegmentcode()
	{
		return segmentcode;
	}	
	public void setsegmentcode(String segmentcode)
	{
		this.segmentcode = segmentcode;
	}
	
	public String getsegmentdescription()
	{
		return segmentdescription;
	}	
	public void setsegmentdescription(String segmentdescription)
	{
		this.segmentdescription = segmentdescription;
	}
	
	public String getapplicationcode()
	{
		return applicationcode;
	}	
	public void setapplicationcode(String applicationcode)
	{
		this.applicationcode = applicationcode;
	}
	
	public String getapplicationdescription()
	{
		return applicationdescription;
	}	
	public void setapplicationdescription(String applicationdescription)
	{
		this.applicationdescription = applicationdescription;
	}
	
	public String getcccode()
	{
		return cccode;
	}	
	public void setcccode(String cccode)
	{
		this.cccode = cccode;
	}
	public String getccdescription()
	{
		return ccdescription;
	}	
	public void setccdescription(String ccdescription)
	{
		this.ccdescription = ccdescription;
	}
	public String getaspectratiocode()
	{
		return aspectratiocode;
	}	
	public void setaspectratiocode(String aspectratiocode)
	{
		this.aspectratiocode = aspectratiocode;
	}
	public String getaspectratiodescription()
	{
		return aspectratiodescription;
	}	
	public void setaspectratiodescription(String aspectratiodescription)
	{
		this.aspectratiodescription = aspectratiodescription;
	}
	public String getpolymercode()
	{
		return polymercode;
	}	
	public void setpolymercode(String polymercode)
	{
		this.polymercode = polymercode;
	}
	public String getpolymerdescription()
	{
		return polymerdescription;
	}	
	public void setpolymerdescription(String polymerdescription)
	{
		this.polymerdescription = polymerdescription;
	}
	
	//new fields

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

	public Sales(Integer mdmcode, String materialcode, String description, String materialtypedesc, Integer version,
			String uom,String plantcode,String dtchcode,String status,String approvalprocess,String dtchdesc ) {
		super();
		this.mdmcode = mdmcode;
		this.materialcode = materialcode;
		this.description = description;
		this.materialtypedesc = materialtypedesc;
		this.version = version;
		this.uom = uom;
		this.plantcode=plantcode;
		this.dtchcode=dtchcode;
		this.status=status;
		this.approvalprocess=approvalprocess;
		this.dtchdesc=dtchdesc;
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
	public String getSlorgcode() {
		return slorgcode;
	}
	public void setSlorgcode(String slorgcode) {
		this.slorgcode = slorgcode;
	}
	public String getSlorgdesc() {
		return slorgdesc;
	}
	public void setSlorgdesc(String slorgdesc) {
		this.slorgdesc = slorgdesc;
	}
	public String getDtchcode() {
		return dtchcode;
	}
	public void setDtchcode(String dtchcode) {
		this.dtchcode = dtchcode;
	}
	public String getDtchdesc() {
		return dtchdesc;
	}
	public void setDtchdesc(String dtchdesc) {
		this.dtchdesc = dtchdesc;
	}
	public String getMtlstatisticsgrpcode() {
		return mtlstatisticsgrpcode;
	}
	public void setMtlstatisticsgrpcode(String mtlstatisticsgrpcode) {
		this.mtlstatisticsgrpcode = mtlstatisticsgrpcode;
	}
	public String getMtlstatisticsgrpdesc() {
		return mtlstatisticsgrpdesc;
	}
	public void setMtlstatisticsgrpdesc(String mtlstatisticsgrpdesc) {
		this.mtlstatisticsgrpdesc = mtlstatisticsgrpdesc;
	}
	public String getMtlpricegrpcode() {
		return mtlpricegrpcode;
	}
	public void setMtlpricegrpcode(String mtlpricegrpcode) {
		this.mtlpricegrpcode = mtlpricegrpcode;
	}
	public String getMtlpricegrpdesc() {
		return mtlpricegrpdesc;
	}
	public void setMtlpricegrpdesc(String mtlpricegrpdesc) {
		this.mtlpricegrpdesc = mtlpricegrpdesc;
	}
	public String getAcassignmentgrpcode() {
		return Acassignmentgrpcode;
	}
	public void setAcassignmentgrpcode(String acassignmentgrpcode) {
		Acassignmentgrpcode = acassignmentgrpcode;
	}
	public String getAcassignmentgrpdesc() {
		return Acassignmentgrpdesc;
	}
	public void setAcassignmentgrpdesc(String acassignmentgrpdesc) {
		Acassignmentgrpdesc = acassignmentgrpdesc;
	}
	public String getGencatgrpcode() {
		return gencatgrpcode;
	}
	public void setGencatgrpcode(String gencatgrpcode) {
		this.gencatgrpcode = gencatgrpcode;
	}
	public String getGencatgrpdesc() {
		return gencatgrpdesc;
	}
	public void setGencatgrpdesc(String gencatgrpdesc) {
		this.gencatgrpdesc = gencatgrpdesc;
	}
	public String getItmcatgrpcode() {
		return itmcatgrpcode;
	}
	public void setItmcatgrpcode(String itmcatgrpcode) {
		this.itmcatgrpcode = itmcatgrpcode;
	}
	public String getItmcatgrpdesc() {
		return itmcatgrpdesc;
	}
	public void setItmcatgrpdesc(String itmcatgrpdesc) {
		this.itmcatgrpdesc = itmcatgrpdesc;
	}
	public String getTrngrpcode() {
		return trngrpcode;
	}
	public void setTrngrpcode(String trngrpcode) {
		this.trngrpcode = trngrpcode;
	}
	public String getTrngrpdesc() {
		return trngrpdesc;
	}
	public void setTrngrpdesc(String trngrpdesc) {
		this.trngrpdesc = trngrpdesc;
	}
	public String getLodgrpcode() {
		return lodgrpcode;
	}
	public void setLodgrpcode(String lodgrpcode) {
		this.lodgrpcode = lodgrpcode;
	}
	public String getLodgrpdesc() {
		return lodgrpdesc;
	}
	public void setLodgrpdesc(String lodgrpdesc) {
		this.lodgrpdesc = lodgrpdesc;
	}
	public String getDelplantcode() {
		return delplantcode;
	}
	public void setDelplantcode(String delplantcode) {
		this.delplantcode = delplantcode;
	}
	public String getDelplantdesc() {
		return delplantdesc;
	}
	public void setDelplantdesc(String delplantdesc) {
		this.delplantdesc = delplantdesc;
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
	
	public Sales() {
		super();
		// TODO Auto-generated constructor stub
	}
}
