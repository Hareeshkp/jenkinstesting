package com.tvstyres.customer.model;

public class Customer {
	
	private Integer mdm_customer_code;
	private String sap_customer_code;
	private String customer_group_code;
	private String customer_group_desc;
	private String customer_group_type;
	private String title_code;
	private String title_desc;
	private String name;
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
	private String distchannel_code;
	private String distchannel_desc;
	private String division_code;
	private String division_desc;
	private String salesdist_code;
	private String salesdict_desc;
	private String accountassigngrp_code;
	private String accountassigngrp_desc;
	private String custpriceproc_code;
	private String custpriceproc_desc;
	private String custstatsgrp_code;
	private String custstatsgrp_desc;
	private String incoterm_code;
	private String incoterm_desc;
	private String inco_location1;
	private String delivery_priority_code;
	private String delivery_priority_desc;
	private String shipping_cond_code;
	private String shipping_cond_desc;
	private String pricegrp_code;
	private String pricegrp_desc;
	private String pricelist_code;
	private String pricelist_desc;
	private String salesoffice_code;
	private String salesoffice_desc;
	private String salesgroup_code;
	private String salesgroup_desc;
	private String currency_code;
	private String currency_desc;
	private String custemer_clasific_code;
	private String custemer_clasific_desc;
	private String activity_code_code;
	private String activity_code_desc;
	private String payment_term_code;
	private String payment_term_desc;
	private String gstno;
	private String panno;
	private String glcode;
	
	private String customer_group1_code;
	private String customer_group1_desc;
	private String customer_group2_code;
	private String customer_group2_desc;
	private String customer_group3_code;
	private String customer_group3_desc;
	private String customer_group4_code;
	private String customer_group4_desc;
	private String customer_group5_code;
	private String customer_group5_desc;
	private String customer_group6_code;
	private String customer_group6_desc;
	
	private String condition_group1_code;
	private String condition_group1_desc;
	private String condition_group2_code;
	private String condition_group2_desc;
	private String condition_group3_code;
	private String condition_group3_desc;
	private String condition_group4_code;
	private String condition_group4_desc;
	private String condition_group5_code;
	private String condition_group5_desc;
	private String continent_code;
	private String continent_desc;
	private String attribute2_code;
	private String attribute2_desc;
	private String attribute3_code;
	private String attribute3_desc;
	private String attribute4_code;
	private String attribute4_desc;
	private String attribute5_code;
	private String attribute5_desc;
	private String attribute6_code;
	private String attribute6_desc;
	private String attribute7_code;
	private String attribute7_desc;
	private String attribute8_code;
	private String attribute8_desc;
	private String attribute9_code;
	private String attribute9_desc;
	private String attribute10_code;
	private String attribute10_desc;
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
	
	private String created_date;
	private String modified_date;
	private String reviewed_date;
	private String approved_date;
	
	
	
	public String getCreated_date() {
		return created_date;
	}
	public void setCreated_date(String created_date) {
		this.created_date = created_date;
	}
	public String getModified_date() {
		return modified_date;
	}
	public void setModified_date(String modified_date) {
		this.modified_date = modified_date;
	}
	public String getReviewed_date() {
		return reviewed_date;
	}
	public void setReviewed_date(String reviewed_date) {
		this.reviewed_date = reviewed_date;
	}
	public String getApproved_date() {
		return approved_date;
	}
	public void setApproved_date(String approved_date) {
		this.approved_date = approved_date;
	}
	public Customer(Integer mdm_customer_code, String sap_customer_code, String customer_group_desc, String title_desc,
			String name, String name2, String legalname, String country_desc, String state_desc, String houseno,
			String street, String street1, String street2, String pincode, String city, String fax_number,
			String mobile_no, String telephone_no, String emailid, String distchannel_desc, String division_desc,
			String salesdict_desc, String accountassigngrp_desc, String custpriceproc_desc, String custstatsgrp_desc,
			String incoterm_desc, String inco_location1, String delivery_priority_desc, String shipping_cond_desc,
			String pricegrp_desc, String pricelist_desc, String salesoffice_desc, String salesgroup_desc,
			String currency_desc, String custemer_clasific_desc, String activity_code_desc, String payment_term_desc,
			String gstno, String panno, String glcode, String customer_group1_desc, String customer_group2_desc,
			String customer_group3_desc, String customer_group4_desc, String customer_group5_desc,
			String customer_group6_desc, String condition_group1_desc, String condition_group2_desc,
			String condition_group3_desc, String condition_group4_desc, String condition_group5_desc,
			String continent_desc, String attribute2_desc, String attribute3_desc, String attribute4_desc,
			String attribute5_desc, String attribute6_desc, String attribute7_desc, String attribute8_desc,
			String attribute9_desc, String attribute10_desc, String status, String created_by, String modified_by,
			String reviewed_by, String approved_by, String approval_status, String reason_for_edit,
			String reason_for_reject, String reason_for_block, Boolean block, Integer version,
			String reviewerusername,String created_date,String modified_date,String reviewed_date,String approved_date) {
		super();
		this.mdm_customer_code = mdm_customer_code;
		this.sap_customer_code = sap_customer_code;
		this.customer_group_desc = customer_group_desc;
		this.title_desc = title_desc;
		this.name = name;
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
		this.distchannel_desc = distchannel_desc;
		this.division_desc = division_desc;
		this.salesdict_desc = salesdict_desc;
		this.accountassigngrp_desc = accountassigngrp_desc;
		this.custpriceproc_desc = custpriceproc_desc;
		this.custstatsgrp_desc = custstatsgrp_desc;
		this.incoterm_desc = incoterm_desc;
		this.inco_location1 = inco_location1;
		this.delivery_priority_desc = delivery_priority_desc;
		this.shipping_cond_desc = shipping_cond_desc;
		this.pricegrp_desc = pricegrp_desc;
		this.pricelist_desc = pricelist_desc;
		this.salesoffice_desc = salesoffice_desc;
		this.salesgroup_desc = salesgroup_desc;
		this.currency_desc = currency_desc;
		this.custemer_clasific_desc = custemer_clasific_desc;
		this.activity_code_desc = activity_code_desc;
		this.payment_term_desc = payment_term_desc;
		this.gstno = gstno;
		this.panno = panno;
		this.glcode = glcode;
		this.customer_group1_desc = customer_group1_desc;
		this.customer_group2_desc = customer_group2_desc;
		this.customer_group3_desc = customer_group3_desc;
		this.customer_group4_desc = customer_group4_desc;
		this.customer_group5_desc = customer_group5_desc;
		this.customer_group6_desc = customer_group6_desc;
		this.condition_group1_desc = condition_group1_desc;
		this.condition_group2_desc = condition_group2_desc;
		this.condition_group3_desc = condition_group3_desc;
		this.condition_group4_desc = condition_group4_desc;
		this.condition_group5_desc = condition_group5_desc;
		this.continent_desc = continent_desc;
		this.attribute2_desc = attribute2_desc;
		this.attribute3_desc = attribute3_desc;
		this.attribute4_desc = attribute4_desc;
		this.attribute5_desc = attribute5_desc;
		this.attribute6_desc = attribute6_desc;
		this.attribute7_desc = attribute7_desc;
		this.attribute8_desc = attribute8_desc;
		this.attribute9_desc = attribute9_desc;
		this.attribute10_desc = attribute10_desc;
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
		this.created_date=created_date;
		this.modified_date=modified_date;
		this.reviewed_date=reviewed_date;
		this.approved_date=approved_date;
	}
	public Customer(Integer mdm_customer_code, String sap_customer_code, String customer_group_desc, String name,
			String status, String approval_status, Integer version) {
		super();
		this.mdm_customer_code = mdm_customer_code;
		this.sap_customer_code = sap_customer_code;
		this.customer_group_desc = customer_group_desc;
		this.name = name;
		this.status = status;
		this.approval_status = approval_status;
		this.version = version;
	}
	public Customer(String reviewerusername) {
		super();
		this.reviewerusername = reviewerusername;
	}
	public String getCustomer_group1_desc() {
		return customer_group1_desc;
	}
	public void setCustomer_group1_desc(String customer_group1_desc) {
		this.customer_group1_desc = customer_group1_desc;
	}
	public String getCustomer_group2_desc() {
		return customer_group2_desc;
	}
	public void setCustomer_group2_desc(String customer_group2_desc) {
		this.customer_group2_desc = customer_group2_desc;
	}
	public String getCustomer_group3_desc() {
		return customer_group3_desc;
	}
	public void setCustomer_group3_desc(String customer_group3_desc) {
		this.customer_group3_desc = customer_group3_desc;
	}
	public String getCustomer_group4_desc() {
		return customer_group4_desc;
	}
	public void setCustomer_group4_desc(String customer_group4_desc) {
		this.customer_group4_desc = customer_group4_desc;
	}
	public String getCustomer_group5_desc() {
		return customer_group5_desc;
	}
	public void setCustomer_group5_desc(String customer_group5_desc) {
		this.customer_group5_desc = customer_group5_desc;
	}
	public String getCustomer_group6_desc() {
		return customer_group6_desc;
	}
	public void setCustomer_group6_desc(String customer_group6_desc) {
		this.customer_group6_desc = customer_group6_desc;
	}
	public String getPayment_term_code() {
		return payment_term_code;
	}
	public void setPayment_term_code(String payment_term_code) {
		this.payment_term_code = payment_term_code;
	}
	
	
	public String getPayment_term_desc() {
		return payment_term_desc;
	}
	public void setPayment_term_desc(String payment_term_desc) {
		this.payment_term_desc = payment_term_desc;
	}
	public Integer getMdm_customer_code() {
		return mdm_customer_code;
	}
	public void setMdm_customer_code(Integer mdm_customer_code) {
		this.mdm_customer_code = mdm_customer_code;
	}
	public String getSap_customer_code() {
		return sap_customer_code;
	}
	public void setSap_customer_code(String sap_customer_code) {
		this.sap_customer_code = sap_customer_code;
	}
	public String getCustomer_group_code() {
		return customer_group_code;
	}
	public void setCustomer_group_code(String customer_group_code) {
		this.customer_group_code = customer_group_code;
	}
	public String getCustomer_group_desc() {
		return customer_group_desc;
	}
	public void setCustomer_group_desc(String customer_group_desc) {
		this.customer_group_desc = customer_group_desc;
	}
	public String getCustomer_group_type() {
		return customer_group_type;
	}
	public void setCustomer_group_type(String customer_group_type) {
		this.customer_group_type = customer_group_type;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getDistchannel_code() {
		return distchannel_code;
	}
	public void setDistchannel_code(String distchannel_code) {
		this.distchannel_code = distchannel_code;
	}
	public String getDistchannel_desc() {
		return distchannel_desc;
	}
	public void setDistchannel_desc(String distchannel_desc) {
		this.distchannel_desc = distchannel_desc;
	}
	public String getDivision_code() {
		return division_code;
	}
	public void setDivision_code(String division_code) {
		this.division_code = division_code;
	}
	public String getDivision_desc() {
		return division_desc;
	}
	public void setDivision_desc(String division_desc) {
		this.division_desc = division_desc;
	}
	public String getSalesdist_code() {
		return salesdist_code;
	}
	public void setSalesdist_code(String salesdist_code) {
		this.salesdist_code = salesdist_code;
	}
	public String getSalesdict_desc() {
		return salesdict_desc;
	}
	public void setSalesdict_desc(String salesdict_desc) {
		this.salesdict_desc = salesdict_desc;
	}
	public String getAccountassigngrp_code() {
		return accountassigngrp_code;
	}
	public void setAccountassigngrp_code(String accountassigngrp_code) {
		this.accountassigngrp_code = accountassigngrp_code;
	}
	public String getAccountassigngrp_desc() {
		return accountassigngrp_desc;
	}
	public void setAccountassigngrp_desc(String accountassigngrp_desc) {
		this.accountassigngrp_desc = accountassigngrp_desc;
	}
	public String getCustpriceproc_code() {
		return custpriceproc_code;
	}
	public void setCustpriceproc_code(String custpriceproc_code) {
		this.custpriceproc_code = custpriceproc_code;
	}
	public String getCustpriceproc_desc() {
		return custpriceproc_desc;
	}
	public void setCustpriceproc_desc(String custpriceproc_desc) {
		this.custpriceproc_desc = custpriceproc_desc;
	}
	public String getCuststatsgrp_code() {
		return custstatsgrp_code;
	}
	public void setCuststatsgrp_code(String custstatsgrp_code) {
		this.custstatsgrp_code = custstatsgrp_code;
	}
	public String getCuststatsgrp_desc() {
		return custstatsgrp_desc;
	}
	public void setCuststatsgrp_desc(String custstatsgrp_desc) {
		this.custstatsgrp_desc = custstatsgrp_desc;
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
	public String getInco_location1() {
		return inco_location1;
	}
	public void setInco_location1(String inco_location1) {
		this.inco_location1 = inco_location1;
	}
	public String getDelivery_priority_code() {
		return delivery_priority_code;
	}
	public void setDelivery_priority_code(String delivery_priority_code) {
		this.delivery_priority_code = delivery_priority_code;
	}
	public String getDelivery_priority_desc() {
		return delivery_priority_desc;
	}
	public void setDelivery_priority_desc(String delivery_priority_desc) {
		this.delivery_priority_desc = delivery_priority_desc;
	}
	public String getShipping_cond_code() {
		return shipping_cond_code;
	}
	public void setShipping_cond_code(String shipping_cond_code) {
		this.shipping_cond_code = shipping_cond_code;
	}
	public String getShipping_cond_desc() {
		return shipping_cond_desc;
	}
	public void setShipping_cond_desc(String shipping_cond_desc) {
		this.shipping_cond_desc = shipping_cond_desc;
	}
	public String getPricegrp_code() {
		return pricegrp_code;
	}
	public void setPricegrp_code(String pricegrp_code) {
		this.pricegrp_code = pricegrp_code;
	}
	public String getPricegrp_desc() {
		return pricegrp_desc;
	}
	public void setPricegrp_desc(String pricegrp_desc) {
		this.pricegrp_desc = pricegrp_desc;
	}
	public String getPricelist_code() {
		return pricelist_code;
	}
	public void setPricelist_code(String pricelist_code) {
		this.pricelist_code = pricelist_code;
	}
	public String getPricelist_desc() {
		return pricelist_desc;
	}
	public void setPricelist_desc(String pricelist_desc) {
		this.pricelist_desc = pricelist_desc;
	}
	public String getSalesoffice_code() {
		return salesoffice_code;
	}
	public void setSalesoffice_code(String salesoffice_code) {
		this.salesoffice_code = salesoffice_code;
	}
	public String getSalesoffice_desc() {
		return salesoffice_desc;
	}
	public void setSalesoffice_desc(String salesoffice_desc) {
		this.salesoffice_desc = salesoffice_desc;
	}
	public String getSalesgroup_code() {
		return salesgroup_code;
	}
	public void setSalesgroup_code(String salesgroup_code) {
		this.salesgroup_code = salesgroup_code;
	}
	public String getSalesgroup_desc() {
		return salesgroup_desc;
	}
	public void setSalesgroup_desc(String salesgroup_desc) {
		this.salesgroup_desc = salesgroup_desc;
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
	public String getCustemer_clasific_code() {
		return custemer_clasific_code;
	}
	public void setCustemer_clasific_code(String custemer_clasific_code) {
		this.custemer_clasific_code = custemer_clasific_code;
	}
	public String getCustemer_clasific_desc() {
		return custemer_clasific_desc;
	}
	public void setCustemer_clasific_desc(String custemer_clasific_desc) {
		this.custemer_clasific_desc = custemer_clasific_desc;
	}
	public String getActivity_code_code() {
		return activity_code_code;
	}
	public void setActivity_code_code(String activity_code_code) {
		this.activity_code_code = activity_code_code;
	}
	public String getActivity_code_desc() {
		return activity_code_desc;
	}
	public void setActivity_code_desc(String activity_code_desc) {
		this.activity_code_desc = activity_code_desc;
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
	public String getCustomer_group1_code() {
		return customer_group1_code;
	}
	public void setCustomer_group1_code(String customer_group1_code) {
		this.customer_group1_code = customer_group1_code;
	}
	
	public String getCustomer_group2_code() {
		return customer_group2_code;
	}
	public void setCustomer_group2_code(String customer_group2_code) {
		this.customer_group2_code = customer_group2_code;
	}
	
	public String getCustomer_group3_code() {
		return customer_group3_code;
	}
	public void setCustomer_group3_code(String customer_group3_code) {
		this.customer_group3_code = customer_group3_code;
	}
	
	public String getCustomer_group4_code() {
		return customer_group4_code;
	}
	public void setCustomer_group4_code(String customer_group4_code) {
		this.customer_group4_code = customer_group4_code;
	}
	
	public String getCustomer_group5_code() {
		return customer_group5_code;
	}
	public void setCustomer_group5_code(String customer_group5_code) {
		this.customer_group5_code = customer_group5_code;
	}
	
	public String getCustomer_group6_code() {
		return customer_group6_code;
	}
	public void setCustomer_group6_code(String customer_group6_code) {
		this.customer_group6_code = customer_group6_code;
	}
	
	public String getCondition_group1_code() {
		return condition_group1_code;
	}
	public void setCondition_group1_code(String condition_group1_code) {
		this.condition_group1_code = condition_group1_code;
	}
	public String getCondition_group1_desc() {
		return condition_group1_desc;
	}
	public void setCondition_group1_desc(String condition_group1_desc) {
		this.condition_group1_desc = condition_group1_desc;
	}
	public String getCondition_group2_code() {
		return condition_group2_code;
	}
	public void setCondition_group2_code(String condition_group2_code) {
		this.condition_group2_code = condition_group2_code;
	}
	public String getCondition_group2_desc() {
		return condition_group2_desc;
	}
	public void setCondition_group2_desc(String condition_group2_desc) {
		this.condition_group2_desc = condition_group2_desc;
	}
	public String getCondition_group3_code() {
		return condition_group3_code;
	}
	public void setCondition_group3_code(String condition_group3_code) {
		this.condition_group3_code = condition_group3_code;
	}
	public String getCondition_group3_desc() {
		return condition_group3_desc;
	}
	public void setCondition_group3_desc(String condition_group3_desc) {
		this.condition_group3_desc = condition_group3_desc;
	}
	public String getCondition_group4_code() {
		return condition_group4_code;
	}
	public void setCondition_group4_code(String condition_group4_code) {
		this.condition_group4_code = condition_group4_code;
	}
	public String getCondition_group4_desc() {
		return condition_group4_desc;
	}
	public void setCondition_group4_desc(String condition_group4_desc) {
		this.condition_group4_desc = condition_group4_desc;
	}
	public String getCondition_group5_code() {
		return condition_group5_code;
	}
	public void setCondition_group5_code(String condition_group5_code) {
		this.condition_group5_code = condition_group5_code;
	}
	public String getCondition_group5_desc() {
		return condition_group5_desc;
	}
	public void setCondition_group5_desc(String condition_group5_desc) {
		this.condition_group5_desc = condition_group5_desc;
	}
	public String getContinent_code() {
		return continent_code;
	}
	public void setContinent_code(String continent_code) {
		this.continent_code = continent_code;
	}
	public String getContinent_desc() {
		return continent_desc;
	}
	public void setContinent_desc(String continent_desc) {
		this.continent_desc = continent_desc;
	}
	public String getAttribute2_code() {
		return attribute2_code;
	}
	public void setAttribute2_code(String attribute2_code) {
		this.attribute2_code = attribute2_code;
	}
	public String getAttribute2_desc() {
		return attribute2_desc;
	}
	public void setAttribute2_desc(String attribute2_desc) {
		this.attribute2_desc = attribute2_desc;
	}
	public String getAttribute3_code() {
		return attribute3_code;
	}
	public void setAttribute3_code(String attribute3_code) {
		this.attribute3_code = attribute3_code;
	}
	public String getAttribute3_desc() {
		return attribute3_desc;
	}
	public void setAttribute3_desc(String attribute3_desc) {
		this.attribute3_desc = attribute3_desc;
	}
	public String getAttribute4_code() {
		return attribute4_code;
	}
	public void setAttribute4_code(String attribute4_code) {
		this.attribute4_code = attribute4_code;
	}
	public String getAttribute4_desc() {
		return attribute4_desc;
	}
	public void setAttribute4_desc(String attribute4_desc) {
		this.attribute4_desc = attribute4_desc;
	}
	public String getAttribute5_code() {
		return attribute5_code;
	}
	public void setAttribute5_code(String attribute5_code) {
		this.attribute5_code = attribute5_code;
	}
	public String getAttribute5_desc() {
		return attribute5_desc;
	}
	public void setAttribute5_desc(String attribute5_desc) {
		this.attribute5_desc = attribute5_desc;
	}
	public String getAttribute6_code() {
		return attribute6_code;
	}
	public void setAttribute6_code(String attribute6_code) {
		this.attribute6_code = attribute6_code;
	}
	public String getAttribute6_desc() {
		return attribute6_desc;
	}
	public void setAttribute6_desc(String attribute6_desc) {
		this.attribute6_desc = attribute6_desc;
	}
	public String getAttribute7_code() {
		return attribute7_code;
	}
	public void setAttribute7_code(String attribute7_code) {
		this.attribute7_code = attribute7_code;
	}
	public String getAttribute7_desc() {
		return attribute7_desc;
	}
	public void setAttribute7_desc(String attribute7_desc) {
		this.attribute7_desc = attribute7_desc;
	}
	public String getAttribute8_code() {
		return attribute8_code;
	}
	public void setAttribute8_code(String attribute8_code) {
		this.attribute8_code = attribute8_code;
	}
	public String getAttribute8_desc() {
		return attribute8_desc;
	}
	public void setAttribute8_desc(String attribute8_desc) {
		this.attribute8_desc = attribute8_desc;
	}
	public String getAttribute9_code() {
		return attribute9_code;
	}
	public void setAttribute9_code(String attribute9_code) {
		this.attribute9_code = attribute9_code;
	}
	public String getAttribute9_desc() {
		return attribute9_desc;
	}
	public void setAttribute9_desc(String attribute9_desc) {
		this.attribute9_desc = attribute9_desc;
	}
	public String getAttribute10_code() {
		return attribute10_code;
	}
	public void setAttribute10_code(String attribute10_code) {
		this.attribute10_code = attribute10_code;
	}
	public String getAttribute10_desc() {
		return attribute10_desc;
	}
	public void setAttribute10_desc(String attribute10_desc) {
		this.attribute10_desc = attribute10_desc;
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
	public String getReviewerusername() {
		return reviewerusername;
	}
	public void setReviewerusername(String reviewerusername) {
		this.reviewerusername = reviewerusername;
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
