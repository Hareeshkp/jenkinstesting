package com.tvs.userconsole;

public class Vendor_Material_Type {

private String rolename;
private String mattypecode;
private String mattypedesc;
public String getRolename() {
return rolename;
}
public void setRolename(String rolename) {
this.rolename = rolename;
}
public String getMattypecode() {
return mattypecode;
}
public void setMattypecode(String mattypecode) {
this.mattypecode = mattypecode;
}
public String getMattypedesc() {
return mattypedesc;
}
public void setMattypedesc(String mattypedesc) {
this.mattypedesc = mattypedesc;
}
public Vendor_Material_Type(String rolename, String mattypecode, String mattypedesc) {
super();
this.rolename = rolename;
this.mattypecode = mattypecode;
this.mattypedesc = mattypedesc;
}
public Vendor_Material_Type() {
super();
// TODO Auto-generated constructor stub
}



public Vendor_Material_Type(String mattypecode, String mattypedesc) {
	super();
	this.mattypecode = mattypecode;
	this.mattypedesc = mattypedesc;
}
@Override
public String toString() {
	return "Vendor_Material_Type [rolename=" + rolename + ", mattypecode=" + mattypecode + ", mattypedesc="
			+ mattypedesc + "]";
}


}