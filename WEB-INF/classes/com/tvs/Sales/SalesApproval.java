package com.tvs.Sales;

public class SalesApproval {
	Integer talendcode;
	String approvalprocess;
	String reasonforrejection;
	String approvedby;
	Object approveddate;
	String plantcode;
	String distchannelcode;
	String distchanneldesc;

	public String getDistchannelcode() {
		return distchannelcode;
	}
	public void setDistchannelcode(String distchannelcode) {
		this.distchannelcode = distchannelcode;
	}
	public String getDistchanneldesc() {
		return distchanneldesc;
	}
	public void setDistchanneldesc(String distchanneldesc) {
		this.distchanneldesc = distchanneldesc;
	}
	public String getPlantcode() {
		return plantcode;
	}
	public void setPlantcode(String plantcode) {
		this.plantcode = plantcode;
	}
	public SalesApproval() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SalesApproval(Integer talendcode, String approvalprocess, String reasonforrejection, String approvedby,
			Object approveddate,String plantcode,String distchannelcode,String distchanneldesc) {
		super();
		this.talendcode = talendcode;
		this.approvalprocess = approvalprocess;
		this.reasonforrejection = reasonforrejection;
		this.approvedby = approvedby;
		this.approveddate = approveddate;
		this.plantcode=plantcode;
		this.distchannelcode=distchannelcode;
		this.distchanneldesc=distchanneldesc;
	}
	
	
	public Integer getTalendcode() {
		return talendcode;
	}
	public void setTalendcode(Integer talendcode) {
		this.talendcode = talendcode;
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
