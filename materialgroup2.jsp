<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
    <%@ page import="com.tvs.scrbasic.Material" %>
    <%@ page import="com.tvs.scrbasic.MaterialDAO" %>
    <%@ page import="java.util.*" %>
    <%@ page isELIgnored="false" %>
    <%@page import="com.tvs.scrbasic.SRCBasicDAO"%>
    <%@page import="com.tvs.scrbasic.SCRBasic"%>
    <%@ page import="com.tvs.scrbasic.MaterialGroup" %>
    <%@ page import="com.tvs.scrbasic.MaterialGroupDAO" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%
	if(request.getParameter("materialtype")!=null) 
	{
	    String id=request.getParameter("materialtype"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
	
	   
	    MaterialGroupDAO mg = new MaterialGroupDAO();
	    
		    try
		    {
		    	List<MaterialGroup> listgp = mg.materialgrouplist(id);
		    	request.setAttribute("listgroup",listgp);    	
		    	
		    	String us= (String) pageContext.getAttribute("mg", PageContext.SESSION_SCOPE);
		    }
		    catch(Exception e)
		    {
		    	
		    }
	 }  
    %>
    
    <option value='Select'>Select</option>
 	<c:forEach items="${listgroup}" var="gp"> 
		<option value="${gp.mgdescription}" >${gp.mgdescription}</option> 
        </c:forEach> 
    
