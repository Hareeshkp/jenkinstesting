
<%@page import="com.tvstyres.vendor.model.Bankkey"%>
<%@page import="com.tvstyres.vendor.dao.BankkeyDAO"%>
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
if(request.getParameter("countrycode")!=null && request.getParameter("countrycode")!="") 
{
    String id=request.getParameter("countrycode"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
   
    BankkeyDAO bkd =new BankkeyDAO();
    
    
    
    try
    {
    	List<Bankkey> banklist = bkd.getBanklist(id);
    	request.setAttribute("banklist",banklist);
    	
    	


    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    
  


   
    
        <c:forEach items="${banklist}" var="gp">
        
        
            <option value="${gp.bankkey}"  data-id="${gp.bankname }" >${gp.bankkey}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>