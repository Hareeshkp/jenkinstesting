

<%@page import="com.tvs.mrp.ProductionStorageLocation"%>
<%@page import="com.tvs.mrp.ProductionStorageLocationDAO"%>
<%@page import="com.tvstyres.customer.model.Division"%>
<%@page import="com.tvstyres.customer.dao.DivisionDAO"%>
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
if(request.getParameter("Plant")!=null  && request.getParameter("Plant")!="") 
{
    String id=request.getParameter("Plant"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
   

    
    ProductionStorageLocationDAO dd =new ProductionStorageLocationDAO();
    
   // DivisionDAO dd =new DivisionDAO();
    
    try
    {
    	
    	
    	List<ProductionStorageLocation> listsg=dd.getProductionStorageLocation(id);
    	request.setAttribute("listsg",listsg);


    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    
  


   
    
        <c:forEach items="${listsg}" var="gp">
        
        
            <option value="${gp.desc}"  data-id="${gp.storeCode }" >${gp.desc}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>