<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.tvs.scrbasic.CheckDescriptionDuplicateDAO" %>
<%@ page import = "com.tvs.scrbasic.CheckMatCodeDAO"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.Arrays"%>
<%@ page import ="org.json.JSONArray" %>
<%@ page import ="org.json.JSONException" %>
<%@ page import ="org.json.JSONObject" %>
<%@ page import ="org.json.JSONString" %>
<%@ page import="com.tvs.userconsole.Reviewername" %>
<%@ page import ="java.util.List"%>


<%
if(request.getParameter("materialcode")!=null)
{
String materialcode = request.getParameter("materialcode");


JSONObject json = new JSONObject();
if(CheckMatCodeDAO.checkmatcode(materialcode))
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