<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.tvstyres.customer.dao.CheckMDMCodeDAO" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<%
if(request.getParameter("firstname")!=null && request.getParameter("street")!=null && request.getParameter("pincode")!=null && request.getParameter("city")!=null && request.getParameter("mdmcode")!=null)
{
String name = request.getParameter("firstname");
String address = request.getParameter("street");
String pincode = request.getParameter("pincode");
String city = request.getParameter("city");
String code=request.getParameter("mdmcode");
Integer mdmcode=Integer.parseInt(code);
JSONObject json = new JSONObject();
if(CheckMDMCodeDAO.check(name, address, pincode, city,mdmcode)==true)
{
json.put("isDuplicate","yes");
}
else
{
json.put("isDuplicate","no");
}
out.print(json.toString());
out.flush();
}

%>