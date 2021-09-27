<%@page import="com.tvs.userconsole.Role"%>

<%@page import="com.tvs.userconsole.RoleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*" %>
              <%@ page import="java.sql.*"%>
      
                <%@ page isELIgnored="false" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
<head>
 <title>Table</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

   <script>
$(document).ready(function(){
   // $('#myTable').dataTable();
    $('#myTable').DataTable( {
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
    } );
    
});
</script>
</head>


<body oncontextmenu="return false;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<%
String Userid =(String) request.getAttribute("myTest");
if(Userid==null)
{
%>
	
	<script type="text/javascript">
	alert('Session timeout!');
window.parent.location.href= "Login.jsp";
</script>
	
<% 

}
RoleDAO rd =new RoleDAO();

try
{
List<Role> listal = rd.roledetails();
request.setAttribute("listall",listal);




}
catch(Exception e)
{
	
}




%>


<div class="col-md-1">
</div>
<div class="col-md-12">
<div class="table-responsive"><br>

	<table id="myTable" class="display table table-responsive"  >
	<thead>
	      <tr>
	        		
	                
	               <th>Role</th>
	               	               <th>isMDMAdmin</th>
	               	               
	               
  <th>Basic View</th>
  <th>Plant Mapping</th>
    <th>Purchasing</th>
        <th>Plant & Storage</th>
    
        <th>MRP</th>
                <th>Sales</th>
        
                <th>Costing</th>
        
                <th>Accounting</th>
        
      <th>Customer</th>
      
	                
	                
	      <th>Vendor</th>
       
	                
	                
	           </tr>
	    </thead>
	    
	   <tbody>
		  
		 	    	<c:forEach items="${listall}" var="abcd">
		 
	    <tr>
	    <td><a  id="edt" href='Roleedit.jsp?id=${abcd.role}'>${abcd.role}</a>	</td>
      
               <td>${abcd.mdmadmin}</td>
               
        
        
       <td>${abcd.basic}</td>
            <td>${abcd.plantmapping}	</td>
                        <td>${abcd.purchasing}	</td>
                                                <td>${abcd.plantstorage}	</td>
                        
                                                <td>${abcd.mrp}	</td>
                        
                                                <td>${abcd.sales}	</td>
                        
                                                <td>${abcd.costing}	</td>
                                                  <td>${abcd.accounting}	</td>
                                                
                        
	                                          <td>${abcd.customer}	</td>
                                              
                                                  
                                                  
                                                   <td>${abcd.vendor}	</td>
                                               
	    
	    
	    
	        
	  	</tr>
	 	</c:forEach>
	 
	</tbody>
	</table>
</div>
</div>

</body>
</html>







