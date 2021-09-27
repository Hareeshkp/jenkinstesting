
<%@page import="com.tvstyres.vendor.model.State"%>
<%@page import="com.tvstyres.vendor.dao.StateDAO"%>
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
if(request.getParameter("countryidd")!=null && request.getParameter("countryidd")!="") 
{
    String id=request.getParameter("countryidd"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
    
   
    StateDAO sd =new StateDAO();
    
    try
    {
    	List<State> statelist = sd.getStatelist(id);
    	request.setAttribute("statelist",statelist);

    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    
  


   
    
        <c:forEach items="${statelist}" var="gp">
        
        
            <option value="${gp.description}"  data-id="${gp.statecode }" >${gp.description}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>