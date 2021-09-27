
<%@page import="com.tvstyres.customer.model.Customer"%>
<%@page import="com.tvstyres.customer.dao.CustomerDAO"%>

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
	String cgroup=request.getParameter("cgroup");
	String status=request.getParameter("status");
	String apvstatus=request.getParameter("approvalstatus");
	String v=request.getParameter("version");
	String custname=request.getParameter("custname");
	
	
   String customername=null;
	
	if(custname.isEmpty())
	{
		customername="Select";
	}
	if(!custname.isEmpty())
	{
		customername=custname;
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
     CustomerDAO cbd =new CustomerDAO();
 	try
		{
		List<Customer> listal = cbd.UserList(username,cgroup,status,apvstatus,version,customername);
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
	            <th>MDM Customer Code</th>
	             <th>SAP Customer Code</th>
	             <th>Customer Name</th>
	            <th>CustomerGroup</th>	                
	            <th>Status</th>
	            <th>Approval Status</th>
	            <th>Version</th>
	          
	            	 
	            
	         </tr>
	    </thead>
	 
	   <tbody>
		 <c:forEach items="${listall}" var="abcd">
		  <tr>
		    <td><a  href='CustomerEdit.jsp?id=${abcd.mdm_customer_code}'	style="text-decoration:underline;"
		    <c:if test="${abcd.status == 'Inactive' && (abcd.approval_status == 'Approved' || abcd.approval_status == 'Pending' || abcd.approval_status == 'Reviewed') }">disabled="disabled"</c:if>
		    >${abcd.mdm_customer_code}</a></td>
		      <td>${abcd.sap_customer_code}</td>
		       <td>${abcd.name}</td>
		    <td>${abcd.customer_group_desc}</td> 
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
