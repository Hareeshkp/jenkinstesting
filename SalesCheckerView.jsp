<%@page import="com.tvs.Sales.Sales"%>
<%@page import="com.tvs.Sales.SalesDAO"%>
<%@page import="com.tvs.plantandstorage.PlantandStorageDAO"%>
<%@page import="com.tvs.plantandstorage.PlantandStorage"%>
 <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.scrbasic.SCRBasic"%>
<%@page import="com.tvs.scrbasic.SRCBasicDAO"%>

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
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],
        "order": [[ 0, "desc" ]] 
    } );
    
});
</script>
<style type="text/css">
    a[disabled="disabled"] {
        pointer-events: none;
        text-decoration:none !important;
    }
</style>
</head>


<body>

<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>

<%

String userid =(String) request.getAttribute("myTest");

String role=null;
String username=null;
String rolename=null;
String access=null;
//String mattype=null;
if(userid!=null)
{
	User uu =UserDAO.getUsernameRoleByUserId(userid);
	 username=uu.getUsername();
	 role= uu.getRolename();//rolename in user table
	Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
	 rolename=rr.getRole();
     access=rr.getSales();
      //mattype=rr.getMaterialtypecode();
}
else
{
		%>
		<script type="text/javascript">
		alert('Session timeout!');
	window.parent.location.href= "Login.jsp";
	</script>
		<% 
}



SalesDAO sd =new SalesDAO();
try
{
	
	
List<Sales> listal=sd.alllist1();
request.setAttribute("listall",listal);

}
catch(Exception e)
{
	
}



%>


<div class="col-md-1">
<br>
</div>
<div class="col-md-12">
<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Sales View</h3>
		   </div>   
   		<div class = "panel-body">
<div class="table-responsive"><br>

	<table id="myTable" class="display table table-responsive"  >
	<thead>
	      <tr>
	      		<th>MDM Material Code</th>
	             <th>Plant Code</th>
	             	             <th>Dist. Channel</th>
	             
	             <th>Material Code</th>
	             <th>Material Description</th>
	             <th>Material Type</th>
	             <th>UOM</th>
	             <th>Version</th>
	             <th>Status</th>	              
	             <th>Approval Status</th>
	           </tr>
	    </thead>	    
	   <tbody>
		  <c:forEach items="${listall}" var="abcd">		  
	    <tr>
	    	<td><a  href='SalesCheckerEdit.jsp?id=${abcd.mdmcode}&amp;plant=${abcd.plantcode}&amp;dcode=${abcd.dtchcode}' style="text-decoration:underline;"
	    	<c:if test="${abcd.approvalprocess == 'Approved' || abcd.approvalprocess == 'Rejected'  }">disabled="disabled"</c:if>
	    	>${abcd.mdmcode}</a></td>
	 	    <td>${abcd.plantcode}</td>   
	 	     <td>${abcd.dtchdesc}</td>  	 	    
	    	<td>${abcd.materialcode}</td>   
	    	<td>${abcd.description}</td> 
	    	<td>${abcd.materialtypedesc}</td>	    
	    	<td>${abcd.uom}</td>
	    	<td>${abcd.version}</td>
	    	<td>${abcd.status}</td>
	    	<td>${abcd.approvalprocess}</td>
	  	</tr>
	 	</c:forEach>	 
	</tbody>
	</table>
</div>
</div>
</div>
</div>
</body>
</html>







