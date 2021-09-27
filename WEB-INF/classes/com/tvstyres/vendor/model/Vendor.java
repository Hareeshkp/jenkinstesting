package com.tvstyres.vendor.model;

public class Vendor {
	private Integer mdm_vendor_code;
	private String sap_vendor_code;
	private String vendor_group_code;
	private String vendor_group_desc;
	private String vendor_group_type;
	private String title_code;
	private String title_desc;
	private String firstname;
	private String lastname;
	private String name2;
	private String legalname;
	private String country_code;
	private String country_desc;
	private String state_code;
	private String state_desc;
	private String houseno;
	private String street;
	private String street1;
	private String street2;
	private String pincode;
	private String city;
	private String fax_number;
	private String mobile_no;
	private String telephone_no;
	private String emailid;
	private String gst_fileing_code;
	private String gst_fileing_desc;
	private String material_type_code;
	private String material_type_desc;
	private String sales_person;
	private String sales_person_tele_no;
	private String bankkey;
	private String bankname;
	private String bankaccountno;
	private String incoterm_code;
	private String incoterm_desc;
	private String currency_code;
	private String currency_desc;
	private String payment_methods;
	private String vendorclass_code;
	private String vendorclass_desc;
	private String gstno;
	private String panno;
	private String glcode;
	private String legal_entity_code;
	private String legal_entity_desc;
	private String id_type_code;
	private String id_type_desc;
	private String identification_no;
	private String payment_block_code;
	private String payment_block_desc;
	private String actual_qm_sys_code;
	private String actual_qm_sys_desc;
	private String inco_location1;
	private String status;
	private String created_by;
	private String modified_by;
	private String reviewed_by;
	private String approved_by;
	private String approval_status;
	private String reason_for_edit;
	private String reason_for_reject;
	private String reason_for_block;
	private Boolean block;
	private Integer version;
	private String reviewerusername;
	//new fields
	private String paymentterm_code;
	private String paymentterm_desc;
	private String adhaarno;
	
	private String createdbydate;
	private String modifiedbydate;
	private String reviewedbydate;
	private String approvedbydate;
	
	
	
	
	
	public String getCreatedbydate() {
		return createdbydate;
	}

	public void setCreatedbydate(String createdbydate) {
		this.createdbydate = createdbydate;
	}

	public String getModifiedbydate() {
		return modifiedbydate;
	}

	public void setModifiedbydate(String modifiedbydate) {
		this.modifiedbydate = modifiedbydate;
	}

	public String getReviewedbydate() {
		return reviewedbydate;
	}

	public void setReviewedbydate(String reviewedbydate) {
		this.reviewedbydate = reviewedbydate;
	}

	public String getApprovedbydate() {
		return approvedbydate;
	}

	public void setApprovedbydate(String approvedbydate) {
		this.approvedbydate = approvedbydate;
	}

	public String getPaymentterm_code() {
		return paymentterm_code;
	}

	public void setPaymentterm_code(String paymentterm_code) {
		this.paymentterm_code = paymentterm_code;
	}

	public String getPaymentterm_desc() {
		return paymentterm_desc;
	}

	public void setPaymentterm_desc(String paymentterm_desc) {
		this.paymentterm_desc = paymentterm_desc;
	}

	public Vendor(Integer mdm_vendor_code, String sap_vendor_code, String vendor_group_desc, String title_desc,
			String firstname, String lastname, String name2, String legalname, String country_desc, String state_desc,
			String houseno, String street, String street1, String street2, String pincode, String city,
			String fax_number, String mobile_no, String telephone_no, String emailid, String gst_fileing_desc,
			String material_type_desc, String sales_person, String sales_person_tele_no, String bankkey,
			String bankname, String bankaccountno, String incoterm_desc, String currency_desc, String payment_methods,
			String vendorclass_desc, String gstno, String panno, String glcode, String legal_entity_desc,
			String id_type_desc, String identification_no, String payment_block_desc, String actual_qm_sys_desc,
			String inco_location1, String status, String created_by, String modified_by, String reviewed_by,
			String approved_by, String approval_status, String reason_for_edit, String reason_for_reject,
			String reason_for_block, Boolean block, Integer version, String reviewerusername, String paymentterm_desc,
			String adhaarno,String createdbydate,String modifiedbydate,String reviewedbydate,String approvedbydate) {
		super();
		this.mdm_vendor_code = mdm_vendor_code;
		this.sap_vendor_code = sap_vendor_code;
		this.vendor_group_desc = vendor_group_desc;
		this.title_desc = title_desc;
		this.firstname = firstname;
		this.lastname = lastname;
		this.name2 = name2;
		this.legalname = legalname;
		this.country_desc = country_desc;
		this.state_desc = state_desc;
		this.houseno = houseno;
		this.street = street;
		this.street1 = street1;
		this.street2 = street2;
		this.pincode = pincode;
		this.city = city;
		this.fax_number = fax_number;
		this.mobile_no = mobile_no;
		this.telephone_no = telephone_no;
		this.emailid = emailid;
		this.gst_fileing_desc = gst_fileing_desc;
		this.material_type_desc = material_type_desc;
		this.sales_person = sales_person;
		this.sales_person_tele_no = sales_person_tele_no;
		this.bankkey = bankkey;
		this.bankname = bankname;
		this.bankaccountno = bankaccountno;
		this.incoterm_desc = incoterm_desc;
		this.currency_desc = currency_desc;
		this.payment_methods = payment_methods;
		this.vendorclass_desc = vendorclass_desc;
		this.gstno = gstno;
		this.panno = panno;
		this.glcode = glcode;
		this.legal_entity_desc = legal_entity_desc;
		this.id_type_desc = id_type_desc;
		this.identification_no = identification_no;
		this.payment_block_desc = payment_block_desc;
		this.actual_qm_sys_desc = actual_qm_sys_desc;
		this.inco_location1 = inco_location1;
		this.status = status;
		this.created_by = created_by;
		this.modified_by = modified_by;
		this.reviewed_by = reviewed_by;
		this.approved_by = approved_by;
		this.approval_status = approval_status;
		this.reason_for_edit = reason_for_edit;
		this.reason_for_reject = reason_for_reject;
		this.reason_for_block = reason_for_block;
		this.block = block;
		this.version = version;
		this.reviewerusername = reviewerusername;
		this.paymentterm_desc = paymentterm_desc;
		this.adhaarno = adhaarno;
		this.createdbydate=createdbydate;
		this.modifiedbydate=modifiedbydate;
		this.reviewedbydate=reviewedbydate;
		this.approvedbydate=approvedbydate;
		
	}

	public Vendor(String reviewerusername) {
		super();
		this.reviewerusername = reviewerusername;
	}

	public String getReviewerusername() {
		return reviewerusername;
	}

	public void setReviewerusername(String reviewerusername) {
		this.reviewerusername = reviewerusername;
	}

	public Vendor(Integer mdm_vendor_code, String sap_vendor_code, String vendor_group_desc, String status,
			String approval_status, Integer version,String firstname) {
		super();
		this.mdm_vendor_code = mdm_vendor_code;
		this.sap_vendor_code = sap_vendor_code;
		this.vendor_group_desc = vendor_group_desc;
		this.status = status;
		this.approval_status = approval_status;
		this.version = version;
		this.firstname=firstname;
	}
	
	public Vendor(Integer mdm_vendor_code, String sap_vendor_code, String vendor_group_desc, String status,
			String approval_status, Integer version) {
		super();
		this.mdm_vendor_code = mdm_vendor_code;
		this.sap_vendor_code = sap_vendor_code;
		this.vendor_group_desc = vendor_group_desc;
		this.status = status;
		this.approval_status = approval_status;
		this.version = version;
		
	}
	public Integer getMdm_vendor_code() {
		return mdm_vendor_code;
	}
	public void setMdm_vendor_code(Integer mdm_vendor_code) {
		this.mdm_vendor_code = mdm_vendor_code;
	}
	public String getSap_vendor_code() {
		return sap_vendor_code;
	}
	public void setSap_vendor_code(String sap_vendor_code) {
		this.sap_vendor_code = sap_vendor_code;
	}
	public String getVendor_group_code() {
		return vendor_group_code;
	}
	public void setVendor_group_code(String vendor_group_code) {
		this.vendor_group_code = vendor_group_code;
	}
	public String getVendor_group_desc() {
		return vendor_group_desc;
	}
	public void setVendor_group_desc(String vendor_group_desc) {
		this.vendor_group_desc = vendor_group_desc;
	}
	public String getVendor_group_type() {
		return vendor_group_type;
	}
	public void setVendor_group_type(String vendor_group_type) {
		this.vendor_group_type = vendor_group_type;
	}
	public String getTitle_code() {
		return title_code;
	}
	public void setTitle_code(String title_code) {
		this.title_code = title_code;
	}
	public String getTitle_desc() {
		return title_desc;
	}
	public void setTitle_desc(String title_desc) {
		this.title_desc = title_desc;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getLegalname() {
		return legalname;
	}
	public void setLegalname(String legalname) {
		this.legalname = legalname;
	}
	public String getCountry_code() {
		return country_code;
	}
	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}
	public String getCountry_desc() {
		return country_desc;
	}
	public void setCountry_desc(String country_desc) {
		this.country_desc = country_desc;
	}
	public String getState_code() {
		return state_code;
	}
	public void setState_code(String state_code) {
		this.state_code = state_code;
	}
	public String getState_desc() {
		return state_desc;
	}
	public void setState_desc(String state_desc) {
		this.state_desc = state_desc;
	}
	public String getHouseno() {
		return houseno;
	}
	public void setHouseno(String houseno) {
		this.houseno = houseno;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getStreet1() {
		return street1;
	}
	public void setStreet1(String street1) {
		this.street1 = street1;
	}
	public String getStreet2() {
		return street2;
	}
	public void setStreet2(String street2) {
		this.street2 = street2;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFax_number() {
		return fax_number;
	}
	public void setFax_number(String fax_number) {
		this.fax_number = fax_number;
	}
	public String getMobile_no() {
		return mobile_no;
	}
	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}
	public String getTelephone_no() {
		return telephone_no;
	}
	public void setTelephone_no(String telephone_no) {
		this.telephone_no = telephone_no;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	
	public String getGst_fileing_code() {
		return gst_fileing_code;
	}
	public void setGst_fileing_code(String gst_fileing_code) {
		this.gst_fileing_code = gst_fileing_code;
	}
	public String getGst_fileing_desc() {
		return gst_fileing_desc;
	}
	public void setGst_fileing_desc(String gst_fileing_desc) {
		this.gst_fileing_desc = gst_fileing_desc;
	}
	public String getMaterial_type_code() {
		return material_type_code;
	}
	public void setMaterial_type_code(String material_type_code) {
		this.material_type_code = material_type_code;
	}
	public String getMaterial_type_desc() {
		return material_type_desc;
	}
	public void setMaterial_type_desc(String material_type_desc) {
		this.material_type_desc = material_type_desc;
	}
	public String getSales_person() {
		return sales_person;
	}
	public void setSales_person(String sales_person) {
		this.sales_person = sales_person;
	}
	public String getSales_person_tele_no() {
		return sales_person_tele_no;
	}
	public void setSales_person_tele_no(String sales_person_tele_no) {
		this.sales_person_tele_no = sales_person_tele_no;
	}
	public String getBankkey() {
		return bankkey;
	}
	public void setBankkey(String bankkey) {
		this.bankkey = bankkey;
	}
	public String getBankname() {
		return bankname;
	}
	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	public String getBankaccountno() {
		return bankaccountno;
	}
	public void setBankaccountno(String bankaccountno) {
		this.bankaccountno = bankaccountno;
	}
	public String getIncoterm_code() {
		return incoterm_code;
	}
	public void setIncoterm_code(String incoterm_code) {
		this.incoterm_code = incoterm_code;
	}
	public String getIncoterm_desc() {
		return incoterm_desc;
	}
	public void setIncoterm_desc(String incoterm_desc) {
		this.incoterm_desc = incoterm_desc;
	}
	public String getCurrency_code() {
		return currency_code;
	}
	public void setCurrency_code(String currency_code) {
		this.currency_code = currency_code;
	}
	public String getCurrency_desc() {
		return currency_desc;
	}
	public void setCurrency_desc(String currency_desc) {
		this.currency_desc = currency_desc;
	}
	public String getPayment_methods() {
		return payment_methods;
	}
	public void setPayment_methods(String payment_methods) {
		this.payment_methods = payment_methods;
	}
	public String getVendorclass_code() {
		return vendorclass_code;
	}
	public void setVendorclass_code(String vendorclass_code) {
		this.vendorclass_code = vendorclass_code;
	}
	public String getVendorclass_desc() {
		return vendorclass_desc;
	}
	public void setVendorclass_desc(String vendorclass_desc) {
		this.vendorclass_desc = vendorclass_desc;
	}
	public String getGstno() {
		return gstno;
	}
	public void setGstno(String gstno) {
		this.gstno = gstno;
	}
	public String getPanno() {
		return panno;
	}
	public void setPanno(String panno) {
		this.panno = panno;
	}
	public String getGlcode() {
		return glcode;
	}
	public void setGlcode(String glcode) {
		this.glcode = glcode;
	}
	public String getLegal_entity_code() {
		return legal_entity_code;
	}
	public void setLegal_entity_code(String legal_entity_code) {
		this.legal_entity_code = legal_entity_code;
	}
	public String getLegal_entity_desc() {
		return legal_entity_desc;
	}
	public void setLegal_entity_desc(String legal_entity_desc) {
		this.legal_entity_desc = legal_entity_desc;
	}
	public String getId_type_code() {
		return id_type_code;
	}
	public void setId_type_code(String id_type_code) {
		this.id_type_code = id_type_code;
	}
	public String getId_type_desc() {
		return id_type_desc;
	}
	public void setId_type_desc(String id_type_desc) {
		this.id_type_desc = id_type_desc;
	}
	public String getIdentification_no() {
		return identification_no;
	}
	public void setIdentification_no(String identification_no) {
		this.identification_no = identification_no;
	}
	public String getPayment_block_code() {
		return payment_block_code;
	}
	public void setPayment_block_code(String payment_block_code) {
		this.payment_block_code = payment_block_code;
	}
	public String getPayment_block_desc() {
		return payment_block_desc;
	}
	public void setPayment_block_desc(String payment_block_desc) {
		this.payment_block_desc = payment_block_desc;
	}
	public String getActual_qm_sys_code() {
		return actual_qm_sys_code;
	}
	public void setActual_qm_sys_code(String actual_qm_sys_code) {
		this.actual_qm_sys_code = actual_qm_sys_code;
	}
	public String getActual_qm_sys_desc() {
		return actual_qm_sys_desc;
	}
	public void setActual_qm_sys_desc(String actual_qm_sys_desc) {
		this.actual_qm_sys_desc = actual_qm_sys_desc;
	}
	public String getInco_location1() {
		return inco_location1;
	}
	public void setInco_location1(String inco_location1) {
		this.inco_location1 = inco_location1;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCreated_by() {
		return created_by;
	}
	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}
	public String getModified_by() {
		return modified_by;
	}
	public void setModified_by(String modified_by) {
		this.modified_by = modified_by;
	}
	public String getReviewed_by() {
		return reviewed_by;
	}
	public void setReviewed_by(String reviewed_by) {
		this.reviewed_by = reviewed_by;
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
	public String getReason_for_edit() {
		return reason_for_edit;
	}
	public void setReason_for_edit(String reason_for_edit) {
		this.reason_for_edit = reason_for_edit;
	}
	public String getReason_for_reject() {
		return reason_for_reject;
	}
	public void setReason_for_reject(String reason_for_reject) {
		this.reason_for_reject = reason_for_reject;
	}
	public String getReason_for_block() {
		return reason_for_block;
	}
	public void setReason_for_block(String reason_for_block) {
		this.reason_for_block = reason_for_block;
	}
	public Boolean getBlock() {
		return block;
	}
	public void setBlock(Boolean block) {
		this.block = block;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	//new fields
	public String getPaymenttermCode()
	{
		return paymentterm_code;
	}
	public void setPaymenttermCode(String paymenttermcode)
	{
		this.paymentterm_code =  paymenttermcode;
		
	}
	public String getPaymenttermDesc()
	{
		return paymentterm_desc;
	}
	public void setPaymenttermDesc(String paymenttermdesc)
	{
		this.paymentterm_desc = paymenttermdesc;
		
	}
	public String getAdhaarno()
	{
		return adhaarno;
	}
	public void setAdhaarno(String adhaarno)
	{
		this.adhaarno = adhaarno;
	}
	
	
	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
