<%@page import="com.tvs.mrp.Mrpgroup"%>
<%@page import="com.tvs.mrp.MrpgroupDAO"%>
<%@page import="com.tvs.mrp.Mrpcontroller"%>
<%@page import="com.tvs.mrp.MrpcontrollerDAO"%>
<%@page import="com.tvstyres.customer.model.State"%>
<%@page import="com.tvstyres.customer.dao.StateDAO"%>
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
if(request.getParameter("Plant")!=null && request.getParameter("Plant")!="") 
{
    String id=request.getParameter("Plant"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
   
    MrpgroupDAO mg=new MrpgroupDAO();
    
    
    try
    {
    	
    	
    	
    	
    	List<Mrpgroup> listmg =mg.getMrpgroup(id);
    	request.setAttribute("listmg", listmg);


    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    
  


   
    
        <c:forEach items="${listmg}" var="gp">
        
        
            <option value="${gp.name}"  data-id="${gp.group }" >${gp.name}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>