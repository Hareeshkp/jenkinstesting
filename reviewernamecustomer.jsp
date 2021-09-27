<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListVendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListMaterialDAO"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroup"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroupDAO"%>
<%@page import="com.tvstyres.customer.model.Customer"%>
<%@page import="com.tvstyres.customer.dao.CustomerDAO"%>
<%@page import="com.tvstyres.customer.dao.ListCustomerGroupDAO"%>
<%@page import="com.tvstyres.customer.dao.CustomerGroupDAO2"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<% 
if(request.getParameter("customergroupid")!=null)
{
	List<String> listven = new ArrayList<>();
	CustomerDAO vd=new CustomerDAO();
	String customergroupid = request.getParameter("customergroupid");
	
	listven=vd.getReviewerUsernameCustomer(customergroupid);
	JSONObject json = new JSONObject();
	 JSONArray array = new JSONArray();
	 for (int i = 0; i < listven.size(); i++) {
		 array.put( listven.get(i));
     }
	 json.put("reviewerNameList",array);
	 System.out.println(json.toString());
	 out.print(json.toString());
	 out.flush();
		 //response.getWriter().write(array.toString()); 
	 //response.getWriter().flush(); 
	 //response.getWriter().close();	 
	//request.setAttribute("listgroup",listven);   
	//String us= (String) pageContext.getAttribute("mg", PageContext.SESSION_SCOPE);
}
%>

