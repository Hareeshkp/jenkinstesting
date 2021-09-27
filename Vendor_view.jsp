
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>

<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>

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
  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>

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


<body oncontextmenu="return false;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
	<%
	String Userid =(String) request.getAttribute("myTest");
	String vgroup=request.getParameter("vgroup");
	
	String status=request.getParameter("status");
	String fname=request.getParameter("fname");
	String apvstatus=request.getParameter("approvalstatus");
	String v=request.getParameter("version");
	String blobk=request.getParameter("block");
	Boolean blk=Boolean.parseBoolean(blobk);
	
	String firstname=null;
	
	if(fname.isEmpty())
	{
		firstname="Select";
	}
	if(!fname.isEmpty())
	{
		firstname=fname;
	}
	
	
	if(v.isEmpty())
	{
		v="-1";
	}
	
	Integer version=null;
	if(v!=null && v!="")
	{
	 version=Integer.parseInt(v);
	}
	
	String username=null;
	if(Userid!=null)
	{
	 User uu =UserDAO.getUsernameRoleByUserId(Userid);    //username
 	 username=uu.getUsername();//createdby
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
		List<Vendor> listal = vdo.UserList(username,vgroup,status,apvstatus,version,firstname);
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
	            <th>MDM Code</th>
	             <th>Vendor Code</th>
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
		    <td><a  href='VendorEdit.jsp?id=${abcd.mdm_vendor_code}'	style="text-decoration:underline;"
		    <c:if test="${abcd.status == 'Inactive' && (abcd.approval_status == 'Approved' || abcd.approval_status == 'Pending' || abcd.approval_status == 'Reviewed') }">disabled="disabled"</c:if>
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

</body>
</html>







