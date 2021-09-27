package com.tvs.scrbasic;

public class Approval {
	Integer talendcode;
	String approvalprocess;
	String reasonforrejection;
	String approvedby;
	Object approveddate;
	
	
	public Approval(Integer talendcode, String approvalprocess, String reasonforrejection, String approvedby,
			Object approveddate) {
		super();
		this.talendcode = talendcode;
		this.approvalprocess = approvalprocess;
		this.reasonforrejection = reasonforrejection;
		this.approvedby = approvedby;
		this.approveddate = approveddate;
	}
	public Object getApproveddate() {
		return approveddate;
	}
	public void setApproveddate(Object approveddate) {
		this.approveddate = approveddate;
	}
	
	public String getApprovedby() {
		return approvedby;
	}
	public Approval() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setApprovedby(String approvedby) {
		this.approvedby = approvedby;
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
	
	
}
