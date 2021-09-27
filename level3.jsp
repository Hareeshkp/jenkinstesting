<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   
            <%@ page import="java.util.*" %>
                <%@ page isELIgnored="false" %>
        
             <%@ page import="com.tvs.subscr.Level3DAO" %>
                <%@ page import="com.tvs.subscr.Level3" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(request.getParameter("state_id")!=null) 
{
    String idg=request.getParameter("state_id"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
Level3DAO ld3 =new Level3DAO();
    

    try
    {
    	List<Level3> ll2 = ld3.subgrouplist2(idg);
    	request.setAttribute("listsubgroup2",ll2);
    	

    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    <c:forEach items="${listsubgroup2}" var="gpl1">
    <option value="${gpl1.description}" data-id="${gpl1.subgroup2}" ></option>
    </c:forEach>
    
</body>
</html>