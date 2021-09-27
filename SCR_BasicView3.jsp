
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
        "order": [[ 0, "desc" ]] ,
    } );
    
});

function Showviewcurrentcode()
{	
	 var v=$("#mdm").val();//document.getElementById("mcc1").value; 
	
	    $.ajax({
			type: "POST",
			url: "viewcurrentcode2.jsp?val="+v,    			
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#tableView").html(response);
	        }
	    });
}

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
	
	//String mdmCode=request.getParameter("zzz");
	
	//Integer mcode=Integer.parseInt(mdmCode);
	String blobk=request.getParameter("block");
	Boolean blk=Boolean.parseBoolean(blobk);
	String mattyp=request.getParameter("mattyp");

	String role=null;
	String username=null;
	 String mattype=null;
	String rolename=null;
	if(userid!=null)
	{
		User uu =UserDAO.getUsernameRoleByUserId(userid);
		 role= uu.getRolename();//rolename in user table
	    username=uu.getUsername();
		//Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
		//rolename=rr.getRole();
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
		SRCBasicDAO sd=new SRCBasicDAO();
		try
		{
			
		List<SCRBasic> listal = sd.UserList3(username,blk,mattyp);
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
		  	<c:if test="${abcd.status!='Active'}">
		  	<td><a  href='Basic_Plant_Mapping_View_Draft.jsp?id=${abcd.talendcode}' style="text-decoration:underline;"
		    <c:if test="${abcd.status == 'Inactive' && (abcd.approvalstatus == 'Approved' || abcd.approvalstatus == 'Pending') }">disabled="disabled"</c:if>
		    >${abcd.talendcode}</a></td>		
		    <td>${abcd.materialcode}</td>   
		    <td>${abcd.description}</td> 
		    <td>${abcd.materialtypedesc}</td> 		    
		    <td>${abcd.basicuom}</td>
		    <td>${abcd.version}</td>	
		    <td>${abcd.status}</td>	    
		    <td>${abcd.approvalstatus}</td>
		  	</c:if>
		  	<c:if test="${abcd.status eq 'Active'}">
		  	<td><a  href='Basic_Plant_Mapping_View_Edit.jsp?id=${abcd.talendcode}'	style="text-decoration:underline;"
		    <c:if test="${abcd.status == 'Inactive' && (abcd.approvalstatus == 'Approved' || abcd.approvalstatus == 'Pending') }">disabled="disabled"</c:if>
		    >${abcd.talendcode}</a></td>		
		    <td>${abcd.materialcode}</td>   
		    <td>${abcd.description}</td> 
		    <td>${abcd.materialtypedesc}</td> 		    
		    <td>${abcd.basicuom}</td>
		    <td>${abcd.version}</td>	
		    <td>${abcd.status}</td>	    
		    <td>${abcd.approvalstatus}</td>
		  	</c:if>
	  	 </tr>
	 	</c:forEach>	 
	 	
	 	
	</tbody>
	
	</table>
	
	
	
</div>
</div>


</body>
</html>







