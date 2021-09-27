package com.tvs.userconsole;

public class Role {

	String role;
	//material
	String basic;
	String plantmapping;
	String purchasing;
	String mrp;
	String plantstorage;
	String sales;
	String costing;
	String accounting;
	//customer
	String customer;
	//vendor
	String vendor;
	String createdby;
	Object createddate;
	String modifiedby;
	String modifieddate;
	Boolean mdmadmin;
	//new fields
	String plantstoragepurchase;
	String costingaccounting ;

	String materialtypecode;
	String materialtypedesc;
	
	// new fields
	
	
	
		
	public String getMaterialtypedesc() {
		return materialtypedesc;
	}
	public void setMaterialtypedesc(String materialtypedesc) {
		this.materialtypedesc = materialtypedesc;
	}
	public String getMaterialtypecode() {
		return materialtypecode;
	}
	public void setMaterialtypecode(String materialtypecode) {
		this.materialtypecode = materialtypecode;
	}
	
	
	

//	public Role(String role, String basic, String plantmapping, String purchasing, String mrp, String plantstorage,
//			String sales, String costing, String accounting, String customer, String vendor, String createdby,
//			Object createddate, String modifiedby, String modifieddate, Boolean mdmadmin) {
//		super();
//		this.role = role;
//		this.basic = basic;
//		this.plantmapping = plantmapping;
//		this.purchasing = purchasing;
//		this.mrp = mrp;
//		this.plantstorage = plantstorage;
//		this.sales = sales;
//		this.costing = costing;
//		this.accounting = accounting;
//		this.customer = customer;
//		this.vendor = vendor;
//		this.createdby = createdby;
//		this.createddate = createddate;
//		this.modifiedby = modifiedby;
//		this.modifieddate = modifieddate;
//		this.mdmadmin = mdmadmin;
//		
//	}
	public Role(String role, String basic,String purchasing, String mrp,
			String sales, String costing, String customer, String vendor, String createdby,
			Object createddate, String modifiedby, String modifieddate, Boolean mdmadmin) {
		super();
		this.role = role;
		this.basic = basic;
//		this.plantmapping = plantmapping;
		this.plantstoragepurchase = purchasing;
		this.mrp = mrp;
//		this.plantstorage = plantstorage;
		this.sales = sales;
		this.costingaccounting = costing;
//		this.accounting = accounting;
		this.customer = customer;
		this.vendor = vendor;
		this.createdby = createdby;
		this.createddate = createddate;
		this.modifiedby = modifiedby;
		this.modifieddate = modifieddate;
		this.mdmadmin = mdmadmin;
		
	}

	public String getRole() {
		return role;
	}




	public void setRole(String role) {
		this.role = role;
	}




	public String getBasic() {
		return basic;
	}




	public void setBasic(String basic) {
		this.basic = basic;
	}




	public String getPlantmapping() {
		return plantmapping;
	}




	public void setPlantmapping(String plantmapping) {
		this.plantmapping = plantmapping;
	}




	public String getPurchasing() {
		return purchasing;
	}




	public void setPurchasing(String purchasing) {
		this.purchasing = purchasing;
	}




	public String getMrp() {
		return mrp;
	}




	public void setMrp(String mrp) {
		this.mrp = mrp;
	}




	public String getPlantstorage() {
		return plantstorage;
	}




	public void setPlantstorage(String plantstorage) {
		this.plantstorage = plantstorage;
	}




	public String getSales() {
		return sales;
	}




	public void setSales(String sales) {
		this.sales = sales;
	}




	public String getCosting() {
		return costing;
	}




	public void setCosting(String costing) {
		this.costing = costing;
	}

	public String getAccounting() {
		return accounting;
	}
	//new structure
	public String getPlantStoragePurchase()
	{
		return this.plantstoragepurchase;
	}
	public void setPlantStoragePurchase(String plantstoragepurfchase)
	{
		this.plantstoragepurchase = plantstoragepurfchase;
	}
	
	public String getCostingAccounting()
	{
		return this.costingaccounting;
	}
	public void setCostingAccounting(String costingaccounting)
	{
		this.costingaccounting = costingaccounting;
	}
	//new structure

	public void setAccounting(String accounting) {
		this.accounting = accounting;
	}




	public String getCustomer() {
		return customer;
	}




	public void setCustomer(String customer) {
		this.customer = customer;
	}




	public String getVendor() {
		return vendor;
	}




	public void setVendor(String vendor) {
		this.vendor = vendor;
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




	public String getModifieddate() {
		return modifieddate;
	}




	public void setModifieddate(String modifieddate) {
		this.modifieddate = modifieddate;
	}




	public Boolean getMdmadmin() {
		return mdmadmin;
	}




	public void setMdmadmin(Boolean mdmadmin) {
		this.mdmadmin = mdmadmin;
	}




	

	public Role(String role) {
		super();
		this.role = role;
	}




	public Role() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
