
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
 <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvstyres.vendor.dao.ListVendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListMaterialDAO"%>
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
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
</style>
<style type="text/css">
    a[disabled="disabled"] {
        pointer-events: none;
        text-decoration:none !important;
    }
</style>
</head>


<body oncontextmenu="return false;" >
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
	<%
		String Userid =(String) request.getAttribute("myTest");
	String username=null;
	String role=null;
	String rolename=null;
	
	String listmaterial=null;
    String materialcode=null;
	String listvendor=null;
	String vengrpdesc=null;

	if(Userid!=null)
	{
	
		 User uu =UserDAO.getUsernameRoleByUserId(Userid);    //username
		 	username=uu.getUsername();//createdby
		 	 role= uu.getRolename();//rolename in user table
			 Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
			 rolename=rr.getRole();
			  listmaterial=ListMaterialDAO.getmatlist(rolename);
			     materialcode=listmaterial.substring(0,listmaterial.length()-2);

				 listvendor=ListVendorGroupDAO.getvengrouplist(rolename);
				 vengrpdesc=listvendor.substring(0,listvendor.length()-2);

			 
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
	
		VendorDAO vdo =new VendorDAO();
 	try
		{
		List<Vendor> listal = vdo.alllist(materialcode,vengrpdesc);
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
	      <h3 class = "panel-title">Vendor Approval</h3>
	   </div>   
	   <div class = "panel-body">
	<table id="myTable" class="display table table-responsive"  >
	<thead>
	         <tr>
	            <th>MDM Vendor Code</th>
	             <th>SAP Vendor Code</th>
	            <th>Vendor Name</th>
	            <th>Vendor Group</th>
	            <th>Status</th>
	            <th>Approval Status</th>
	            <th>Version</th>
	            	 
	            
	         </tr>
	    </thead>
	 
	   <tbody>
		 <c:forEach items="${listall}" var="abcd">
		  <tr>
		    <td><a  href='VendorCheckerEdit.jsp?id=${abcd.mdm_vendor_code}' style="text-decoration:underline;"
		    <c:if test="${abcd.approval_status == 'Approved' || abcd.approval_status == 'Rejected'  }">disabled="disabled"</c:if>
		    >${abcd.mdm_vendor_code}</a></td>
		  		    		    		    	   <td>${abcd.sap_vendor_code}</td>
		  		    		    		    	   <td>${abcd.firstname}</td>
		  		    		    		    
		  		  		    		   <td>${abcd.vendor_group_desc}</td>
		  		  		    		    		    	  
		  
		    <td>${abcd.status}</td> 
		    <td>${abcd.approval_status}</td>
		    		    <td>${abcd.version}</td>
		    		    
		    
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







