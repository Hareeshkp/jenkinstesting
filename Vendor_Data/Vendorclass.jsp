
<%@page import="com.tvstyres.vendor.model.Vendorclass"%>
<%@page import="com.tvstyres.vendor.dao.VendorclassDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   
            <%@ page import="java.util.*" %>
                <%@ page isELIgnored="false" %>
            
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(request.getParameter("vendortype")!=null && request.getParameter("vendortype")!="") 
{
    String id=request.getParameter("vendortype"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    VendorclassDAO vd =new VendorclassDAO();
    try
    {
    	List<Vendorclass> vlist = vd.getVenclasslist(id);
    	request.setAttribute("vlist",vlist);
    }
    catch(Exception e)
    {
    	
    }
        }       
    
    %>
    
        <c:forEach items="${vlist}" var="gp">
        
        
            <option value="${gp.description}" data-id="${gp.vendorclass }" >${gp.description}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>