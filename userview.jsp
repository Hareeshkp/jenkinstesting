<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.UserDAO"%>

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

UserDAO ud =new UserDAO();




try
{
List<User> listal = ud.userdetails();
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
	        		
	                
	              <th>UserId</th>
	               <th>Email</th>
	                <th>Role</th>
  <th>Status</th>
 
   
	           </tr>
	    </thead>
	    
	   <tbody>
		  
		 	    	<c:forEach items="${listall}" var="abcd">
		 
	    <tr>
	      <td><a  id="edt" href='Useredit.jsp?id=${abcd.userid}'>${abcd.userid}</a>	</td>
       <td>${abcd.email}	</td>
         <td>${abcd.rolename}	</td>
       <td>${abcd.status}</td>
          
                       
            
            
	    
	    
	    
	        
	  	</tr>
	 	</c:forEach>
	 
	</tbody>
	</table>
</div>
</div>

</body>
</html>







