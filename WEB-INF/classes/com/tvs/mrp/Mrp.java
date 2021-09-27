package com.tvs.mrp;

public class Mrp {
	
    Integer mdmcode;
	String materialcode;
	String materialcodedesc;
	String materialtypecode;
	String materialtypedesc;
	String uom;
	Integer version;

	
	String plantcode;
	String plantdesc;
	String mrpgroupcode;
	String mrpgroupcodedesc;
	String abcindicatorcode;
	String  abcindicatorcodedesc;
	String mrptypecode;
	String mrptypedesc;
	Integer reorderpoint;
	String mrpcontrollercode;
	String mrpcontrollercodedesc;
	String lotsizingcode;
	String lotsizingdesc;
	String minlotsize;
	String maximamstocklevel;
	
	Integer assemblyscrap;
	String procurementtypecode;
	String procurementtypecodedesc;
	
	String specialprocurementcode;
	String specialprocurementcodedesc;

	String productionstoragelocationcode;
	String productionstoragelocationdesc;
	
        String backflushcode;
        String backflushdesc;
        
        String inhouseproduction;
        
        Boolean coproduct;
        Boolean repetativemfg;
        
        public Boolean getCoproduct() {
			return coproduct;
		}
		public void setCoproduct(Boolean coproduct) {
			this.coproduct = coproduct;
		}
		public Boolean getRepetativemfg() {
			return repetativemfg;
		}
		public void setRepetativemfg(Boolean repetativemfg) {
			this.repetativemfg = repetativemfg;
		}

		String schedmarginkey;
        Integer planneddeliverytime;
        
        String saftystock;
        String minsaftystock;
        
        String strategygroupcode;
        String strategygroupdesc;

        
        Integer bwdconsumptionper;
        
        String consumptionmodecode;
        String consumptionmodedesc;
        
        String mixedmrpcode;
        String mixedmrpdesc;
        
        Integer forwardconsumptionper;
        
        Integer totalrepleadtime;
        
        String availabilitycheckcode;
        
        String availabilitycheckdesc;
        
        String individualcallcode;
        String individualcalldesc;
        
        Integer componenetscrap;
        String  remprofilecode;
        String remprofiledesc; 
        String status;

        String createdby;
        Object createddate;
        String modifiedby;
        Object modifieddate;
        String approvedby;
        Object approveddate;
        String reasonforedit;
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

		
public Mrp(Integer mdmcode, String materialcode, String materialcodedesc, String materialtypedesc, String uom,
				Integer version,String plantcode,String status,String approvalprocess) {
			super();
			this.mdmcode = mdmcode;
			this.materialcode = materialcode;
			this.materialcodedesc = materialcodedesc;
			this.materialtypedesc = materialtypedesc;
			this.uom = uom;
			this.version = version;
			this.plantcode=plantcode;
			this.status=status;
			this.approvalprocess=approvalprocess;
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
public String getPlantdesc() {
	return plantdesc;
}
public void setPlantdesc(String plantdesc) {
	this.plantdesc = plantdesc;
}
public String getMrpgroupcode() {
	return mrpgroupcode;
}
public void setMrpgroupcode(String mrpgroupcode) {
	this.mrpgroupcode = mrpgroupcode;
}
public String getMrpgroupcodedesc() {
	return mrpgroupcodedesc;
}
public void setMrpgroupcodedesc(String mrpgroupcodedesc) {
	this.mrpgroupcodedesc = mrpgroupcodedesc;
}
public String getAbcindicatorcode() {
	return abcindicatorcode;
}
public void setAbcindicatorcode(String abcindicatorcode) {
	this.abcindicatorcode = abcindicatorcode;
}
public String getAbcindicatorcodedesc() {
	return abcindicatorcodedesc;
}
public void setAbcindicatorcodedesc(String abcindicatorcodedesc) {
	this.abcindicatorcodedesc = abcindicatorcodedesc;
}
public String getMrptypecode() {
	return mrptypecode;
}
public void setMrptypecode(String mrptypecode) {
	this.mrptypecode = mrptypecode;
}
public String getMrptypedesc() {
	return mrptypedesc;
}
public void setMrptypedesc(String mrptypedesc) {
	this.mrptypedesc = mrptypedesc;
}
public Integer getReorderpoint() {
	return reorderpoint;
}
public void setReorderpoint(Integer reorderpoint) {
	this.reorderpoint = reorderpoint;
}
public String getMrpcontrollercode() {
	return mrpcontrollercode;
}
public void setMrpcontrollercode(String mrpcontrollercode) {
	this.mrpcontrollercode = mrpcontrollercode;
}
public String getMrpcontrollercodedesc() {
	return mrpcontrollercodedesc;
}
public void setMrpcontrollercodedesc(String mrpcontrollercodedesc) {
	this.mrpcontrollercodedesc = mrpcontrollercodedesc;
}
public String getLotsizingcode() {
	return lotsizingcode;
}
public void setLotsizingcode(String lotsizingcode) {
	this.lotsizingcode = lotsizingcode;
}
public String getLotsizingdesc() {
	return lotsizingdesc;
}
public void setLotsizingdesc(String lotsizingdesc) {
	this.lotsizingdesc = lotsizingdesc;
}
public String getMinlotsize() {
	return minlotsize;
}
public void setMinlotsize(String minlotsize) {
	this.minlotsize = minlotsize;
}
public String getMaximamstocklevel() {
	return maximamstocklevel;
}
public void setMaximamstocklevel(String maximamstocklevel) {
	this.maximamstocklevel = maximamstocklevel;
}
public Integer getAssemblyscrap() {
	return assemblyscrap;
}
public void setAssemblyscrap(Integer assemblyscrap) {
	this.assemblyscrap = assemblyscrap;
}
public String getProcurementtypecode() {
	return procurementtypecode;
}
public void setProcurementtypecode(String procurementtypecode) {
	this.procurementtypecode = procurementtypecode;
}
public String getProcurementtypecodedesc() {
	return procurementtypecodedesc;
}
public void setProcurementtypecodedesc(String procurementtypecodedesc) {
	this.procurementtypecodedesc = procurementtypecodedesc;
}
public String getSpecialprocurementcode() {
	return specialprocurementcode;
}
public void setSpecialprocurementcode(String specialprocurementcode) {
	this.specialprocurementcode = specialprocurementcode;
}
public String getSpecialprocurementcodedesc() {
	return specialprocurementcodedesc;
}
public void setSpecialprocurementcodedesc(String specialprocurementcodedesc) {
	this.specialprocurementcodedesc = specialprocurementcodedesc;
}
public String getProductionstoragelocationcode() {
	return productionstoragelocationcode;
}
public void setProductionstoragelocationcode(String productionstoragelocationcode) {
	this.productionstoragelocationcode = productionstoragelocationcode;
}
public String getProductionstoragelocationdesc() {
	return productionstoragelocationdesc;
}
public void setProductionstoragelocationdesc(String productionstoragelocationdesc) {
	this.productionstoragelocationdesc = productionstoragelocationdesc;
}
public String getBackflushcode() {
	return backflushcode;
}
public void setBackflushcode(String backflushcode) {
	this.backflushcode = backflushcode;
}
public String getBackflushdesc() {
	return backflushdesc;
}
public void setBackflushdesc(String backflushdesc) {
	this.backflushdesc = backflushdesc;
}
public String getInhouseproduction() {
	return inhouseproduction;
}
public void setInhouseproduction(String inhouseproduction) {
	this.inhouseproduction = inhouseproduction;
}


public   String  getSchedmarginkey() {
	return schedmarginkey;
}
public void setSchedmarginkey(  String schedmarginkey) {
	this.schedmarginkey = schedmarginkey;
}
public Integer getPlanneddeliverytime() {
	return planneddeliverytime;
}
public void setPlanneddeliverytime(Integer planneddeliverytime) {
	this.planneddeliverytime = planneddeliverytime;
}
public String getSaftystock() {
	return saftystock;
}
public void setSaftystock(String saftystock) {
	this.saftystock = saftystock;
}
public String getMinsaftystock() {
	return minsaftystock;
}
public void setMinsaftystock(String minsaftystock) {
	this.minsaftystock = minsaftystock;
}
public String getStrategygroupcode() {
	return strategygroupcode;
}
public void setStrategygroupcode(String strategygroupcode) {
	this.strategygroupcode = strategygroupcode;
}
public String getStrategygroupdesc() {
	return strategygroupdesc;
}
public void setStrategygroupdesc(String strategygroupdesc) {
	this.strategygroupdesc = strategygroupdesc;
}
public Integer getBwdconsumptionper() {
	return bwdconsumptionper;
}
public void setBwdconsumptionper(Integer bwdconsumptionper) {
	this.bwdconsumptionper = bwdconsumptionper;
}
public String getConsumptionmodecode() {
	return consumptionmodecode;
}
public void setConsumptionmodecode(String consumptionmodecode) {
	this.consumptionmodecode = consumptionmodecode;
}
public String getConsumptionmodedesc() {
	return consumptionmodedesc;
}
public void setConsumptionmodedesc(String consumptionmodedesc) {
	this.consumptionmodedesc = consumptionmodedesc;
}
public String getMixedmrpcode() {
	return mixedmrpcode;
}
public void setMixedmrpcode(String mixedmrpcode) {
	this.mixedmrpcode = mixedmrpcode;
}
public String getMixedmrpdesc() {
	return mixedmrpdesc;
}
public void setMixedmrpdesc(String mixedmrpdesc) {
	this.mixedmrpdesc = mixedmrpdesc;
}
public Integer getForwardconsumptionper() {
	return forwardconsumptionper;
}
public void setForwardconsumptionper(Integer forwardconsumptionper) {
	this.forwardconsumptionper = forwardconsumptionper;
}
public Integer getTotalrepleadtime() {
	return totalrepleadtime;
}
public void setTotalrepleadtime(Integer totalrepleadtime) {
	this.totalrepleadtime = totalrepleadtime;
}
public String getAvailabilitycheckcode() {
	return availabilitycheckcode;
}
public void setAvailabilitycheckcode(String availabilitycheckcode) {
	this.availabilitycheckcode = availabilitycheckcode;
}
public String getAvailabilitycheckdesc() {
	return availabilitycheckdesc;
}
public void setAvailabilitycheckdesc(String availabilitycheckdesc) {
	this.availabilitycheckdesc = availabilitycheckdesc;
}
public String getIndividualcallcode() {
	return individualcallcode;
}
public void setIndividualcallcode( String individualcallcode) {
	this.individualcallcode = individualcallcode;
}
public String getIndividualcalldesc() {
	return individualcalldesc;
}
public void setIndividualcalldesc(String individualcalldesc) {
	this.individualcalldesc = individualcalldesc;
}
public Integer getComponenetscrap() {
	return componenetscrap;
}
public void setComponenetscrap(Integer componenetscrap) {
	this.componenetscrap = componenetscrap;
}
public String getRemprofilecode() {
	return remprofilecode;
}
public void setRemprofilecode(String remprofilecode) {
	this.remprofilecode = remprofilecode;
}
public String getRemprofiledesc() {
	return remprofiledesc;
}
public void setRemprofiledesc(String  remprofiledesc) {
	this.remprofiledesc = remprofiledesc;
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
public String getReasonforedit() {
	return reasonforedit;
}
public void setReasonforedit(String reasonforedit) {
	this.reasonforedit = reasonforedit;
}
public Mrp() {
	super();
	// TODO Auto-generated constructor stub
}

        
        
        
        

	
	
	

	

}
