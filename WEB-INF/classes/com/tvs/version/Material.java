package com.tvs.version;

public class Material {

	
	String sapcode;
	Integer mdmcode;
	String pre_value;
	String curr_value;
	String feildname;
	Integer version;
	String userid;
	Object date;
	String plant;
	String storageloc;
	
	public String getPlant() {
		return plant;
	}
	public void setPlant(String plant) {
		this.plant = plant;
	}
	public String getStorageloc() {
		return storageloc;
	}
	public void setStorageloc(String storageloc) {
		this.storageloc = storageloc;
	}
	public String getSapcode() {
		return sapcode;
	}
	public void setSapcode(String sapcode) {
		this.sapcode = sapcode;
	}
	public Integer getMdmcode() {
		return mdmcode;
	}
	public void setMdmcode(Integer mdmcode) {
		this.mdmcode = mdmcode;
	}
	public String getPre_value() {
		return pre_value;
	}
	public void setPre_value(String pre_value) {
		this.pre_value = pre_value;
	}
	public String getCurr_value() {
		return curr_value;
	}
	public void setCurr_value(String curr_value) {
		this.curr_value = curr_value;
	}
	public String getFeildname() {
		return feildname;
	}
	public void setFeildname(String feildname) {
		this.feildname = feildname;
	}
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Object getDate() {
		return date;
	}
	public void setDate(Object date) {
		this.date = date;
	}
	public Material() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Material(String sapcode, Integer mdmcode, String pre_value, String curr_value, String feildname,
			Integer version, String userid, Object date,String plant,String storageloc) {
		super();
		this.sapcode = sapcode;
		this.mdmcode = mdmcode;
		this.pre_value = pre_value;
		this.curr_value = curr_value;
		this.feildname = feildname;
		this.version = version;
		this.userid = userid;
		this.date = date;
		this.plant=plant;
		this.storageloc=storageloc;
	}
	
	
	
}
