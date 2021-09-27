<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   
            <%@ page import="java.util.*" %>
                <%@ page isELIgnored="false" %>
 
             <%@ page import="com.tvs.subscr.Level2DAO" %>
                <%@ page import="com.tvs.subscr.Level2" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(request.getParameter("materialtype")!=null) 
{
    String idmg=request.getParameter("materialtype"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
Level2DAO ld =new Level2DAO();
    

    try
    {
    	List<Level2> l2 = ld.subgrouplist1(idmg);
    	request.setAttribute("listsubgroup1",l2);
    	
    	


    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
        <c:forEach items="${listsubgroup1}" var="gpl1">  
            <option value=" ${gpl1.description}" data-id="${gpl1.subgroup1}" ></option>
        </c:forEach>
    
</body>
</html>