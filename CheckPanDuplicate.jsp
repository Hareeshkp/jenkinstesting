<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.tvstyres.vendor.dao.CheckMDMVendorCodeDAO" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<%
if(request.getParameter("panno")!=null && request.getParameter("mdmvendorcode")!=null )
{
String panno = request.getParameter("panno");
String mcode = request.getParameter("mdmvendorcode");



Integer mdmcode =Integer.parseInt(mcode);



JSONObject json = new JSONObject();
if(CheckMDMVendorCodeDAO.checkForDuplicatePan(panno,"0",mdmcode)==true)
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