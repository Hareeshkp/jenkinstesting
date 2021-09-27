<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.tvs.scrbasic.CheckDescriptionDuplicateDAO" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<%
if(request.getParameter("materialcodedesc")!=null && request.getParameter("materialtyecode")!=null )
{
String materialtype = request.getParameter("materialtyecode");
String description = request.getParameter("materialcodedesc");



JSONObject json = new JSONObject();
if(CheckDescriptionDuplicateDAO.checkdesc(materialtype,description))
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