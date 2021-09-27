package com.tvs.userconsole;

public class Material_Material_Type {

private String rolename;
private String materialtypecode;
private String materialtypedesc;
public String getRolename() {
return rolename;
}
public void setRolename(String rolename) {
this.rolename = rolename;
}
public String getmaterialtypecode() {
return materialtypecode;
}
public void setmaterialtypecode(String materialtypecode) {
this.materialtypecode = materialtypecode;
}
public String getmaterialtypedesc() {
return materialtypedesc;
}
public void setmaterialtypedesc(String materialtypedesc) {
this.materialtypedesc = materialtypedesc;
}
public Material_Material_Type(String rolename, String materialtypecode, String materialtypedesc) {
super();
this.rolename = rolename;
this.materialtypecode = materialtypecode;
this.materialtypedesc = materialtypedesc;
}
public Material_Material_Type() {
super();
// TODO Auto-generated constructor stub
}



public Material_Material_Type(String materialtypecode, String materialtypedesc) {
	super();
	this.materialtypecode = materialtypecode;
	this.materialtypedesc = materialtypedesc;
}
@Override
public String toString() {
	return "Vendor_Material_Type [rolename=" + rolename + ", materialtypecode=" + materialtypecode + ", materialtypedesc="
			+ materialtypedesc + "]";
}


}