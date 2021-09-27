<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListVendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListMaterialDAO"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroup"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroupDAO"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<% 
if(request.getParameter("vendorgroupid")!=null)
{
	List<String> listven = new ArrayList<>();
	VendorDAO vd=new VendorDAO();
	String vendorgroupid = request.getParameter("vendorgroupid");
	
	listven=vd.getReviewerUsername1(vendorgroupid);
	JSONObject json = new JSONObject();
	 JSONArray array = new JSONArray();
	 for (int i = 0; i < listven.size(); i++) {
		 array.put( listven.get(i));
     }
	 json.put("reviewerNameList",array);
	 out.print(json.toString());
	 out.flush();
	
}
%>

