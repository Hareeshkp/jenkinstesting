<%@page import="com.tvs.scrbasic.SCRBasic"%>
<%@page import="com.tvs.scrbasic.SRCBasicDAO"%>
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
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],

        "order": [[ 0, "desc" ]]   
    } );
    
});
</script>
</head>


<body>


<%

String id=null;
String s=request.getParameter("val");  


if(s==null || s.length()<7 || s.trim().equals("")){  
out.print("Please select all above details");  
}


else{  
 id=s; 
}
SRCBasicDAO ad =new SRCBasicDAO();

try
{


List<SCRBasic> listall=ad.desclist(id);
request.setAttribute("listall",listall);


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
	        		
	                
	               <th>Material Code</th>
	               	               <th>Description</th>
	               
 
        
    
	                
	                
	                
	           </tr>
	    </thead>
	    
	   <tbody>
		  
		 	    	<c:forEach items="${listall}" var="abcd">
		 
	    <tr>
      
               <td>${abcd.materialcode}</td>
        
        
       <td>${abcd.description}</td>
            
                        
	    
	    
	    
	    
	        
	  	</tr>
	 	</c:forEach>
	 
	</tbody>
	</table>
</div>
</div>

</body>
</html>







