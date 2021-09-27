
<%@page import="com.tvstyres.vendor.model.Paymentmethods"%>
<%@page import="com.tvstyres.vendor.dao.PaymentmethodsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
   
            <%@ page import="java.util.*" %>
                <%@ page isELIgnored="false" %>
                <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
            
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
    
   PaymentmethodsDAO pd =new PaymentmethodsDAO();
	//String us= (String) pageContext.getAttribute("paymentmethods", PageContext.SESSION_SCOPE);

    
    try
    {
    	List<Paymentmethods> paylist = pd.getpaymentmethods(id);
    	request.setAttribute("paylist",paylist);
    }
    catch(Exception e)
    {
    	
    }
        }       
    
    
    %>
    
  


   
    
        <c:forEach items="${paylist}" var="gp">
        
        
            <option value="${gp.paymentmethods}"
            <c:if test = "${fn:contains(paymentmethods,gp.paymentmethods)}">
        selected="selected"
      </c:if>
            
            
            
            
            
              >${gp.paymentmethods}</option>
            
            
            
        </c:forEach>
    
            

</body>
</html>