package com.tvs.costing;

public class CostingApproval {
	Integer talendcode;
	String approvalprocess;
	String reasonforrejection;
	String approvedby;
	Object approveddate;
	String plantcode;
	
	public String getPlantcode() {
		return plantcode;
	}
	public void setPlantcode(String plantcode) {
		this.plantcode = plantcode;
	}
	public CostingApproval() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CostingApproval(Integer talendcode, String approvalprocess, String reasonforrejection, String approvedby,
			Object approveddate,String plantcode) {
		super();
		this.talendcode = talendcode;
		this.approvalprocess = approvalprocess;
		this.reasonforrejection = reasonforrejection;
		this.approvedby = approvedby;
		this.approveddate = approveddate;
		this.plantcode=plantcode;
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
