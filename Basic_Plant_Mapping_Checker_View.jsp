<%@page import="com.tvs.Purchase.Purchase"%>
<%@page import="com.tvs.Purchase.PurchaseDAO"%>
<%@page import="com.tvs.scrbasic.SCRBasic"%>
<%@page import="com.tvs.scrbasic.SRCBasicDAO"%>
   <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
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
<body oncontextmenu="return false;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<%
String userid =(String) request.getAttribute("myTest");
if(session==null || userid==null)
{
	%>
	<script type="text/javascript">
	alert('Session timeout!');
window.parent.location.href= "Login.jsp";
</script>
	<% 
	}

User uu =UserDAO.getUsernameRoleByUserId(userid);
String role= uu.getRolename();//rolename in user table

Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
String rolename=rr.getRole();

String mattype=rr.getMaterialtypecode();

SRCBasicDAO sd=new SRCBasicDAO();
try
{	
List<SCRBasic> listal=sd.alllist(mattype);
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
<div class = "panel panel-primary">
	   <div class = "panel-heading">
	      <h3 class = "panel-title">Basic & Plant Mapping View</h3>
	   </div>   
	   <div class = "panel-body">
	<table id="myTable" class="display table table-responsive"  >
	<thead>
	      <tr>
	       <th>MDM Material Code</th>
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
	    	<td><a  href='Basic_Plant_Mapping_Checker_Edit.jsp?id=${abcd.talendcode}'style="text-decoration:underline;"
	    	<c:if test="${abcd.approvalstatus == 'Approved' || abcd.approvalstatus == 'Rejected'  }">disabled="disabled"</c:if>
	    	>${abcd.talendcode}</a></td>
	    	<td>${abcd.materialcode}</td>   
	    	<td>${abcd.description}</td> 
	    	<td>${abcd.materialtypedesc}</td> 	    
	    	<td>${abcd.basicuom}</td>
	    	<td>${abcd.version}</td>  
	    	<td>${abcd.status}</td> 
	    	<td>${abcd.approvalstatus}</td>
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







