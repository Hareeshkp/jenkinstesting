package com.tvstyres.customer.model;

public class Customerapproval {
	private Integer mdm_customer_code;
	private String rejected_by;
	private String reason_for_reject;
	private Object approved_date;
	private String approved_by;
	private Object reviewed_date;
	private String reviewed_by;
	private String approval_status;
	
	
	
	public String getRejected_by() {
		return rejected_by;
	}
	public void setRejected_by(String rejected_by) {
		this.rejected_by = rejected_by;
	}
	public Object getReviewed_date() {
		return reviewed_date;
	}
	public void setReviewed_date(Object reviewed_date) {
		this.reviewed_date = reviewed_date;
	}
	public String getReviewed_by() {
		return reviewed_by;
	}
	public void setReviewed_by(String reviewed_by) {
		this.reviewed_by = reviewed_by;
	}
	

	
	public Integer getMdm_customer_code() {
		return mdm_customer_code;
	}
	public void setMdm_customer_code(Integer mdm_customer_code) {
		this.mdm_customer_code = mdm_customer_code;
	}
	public String getReason_for_reject() {
		return reason_for_reject;
	}
	public void setReason_for_reject(String reason_for_reject) {
		this.reason_for_reject = reason_for_reject;
	}
	public Object getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(Object approved_date) {
		this.approved_date = approved_date;
	}
	public String getApproved_by() {
		return approved_by;
	}
	public void setApproved_by(String approved_by) {
		this.approved_by = approved_by;
	}
	public String getApproval_status() {
		return approval_status;
	}
	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}
	public Customerapproval() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
