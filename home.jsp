<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.tvs.login.LastLoginDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page isELIgnored="false" %>
     <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@page import="com.tvs.userconsole.UserDAO"%>
	 <%@page import="com.tvs.userconsole.User"%>
     <%@page import="com.tvs.userconsole.RoleDAO"%>
     <%@page import="com.tvs.userconsole.Role"%>     
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="css/style.css">
<link rel="shortcut icon" type="image/png" href="images/icon-tvs.jpg"/>
<script type="text/javascript">

$(document).keydown(function (event) {
    if (event.keyCode == 123) { // Prevent F12
        return false;
    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        return false;
    }
});


</script>
<script type="text/javascript">
 function hide() {
	  document.getElementById('hide').style.display = 'none';
	}
	function show()
	{
		  document.getElementById('hide').style.display = 'block';
	}
	
	
	
</script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>MDM-TVSTyres</title>
<link rel="stylesheet" href="css/welcome.css">
    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
   
    <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
<script src="./bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<!-- <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js" integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ" crossorigin="anonymous"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js" integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY" crossorigin="anonymous"></script> -->
    

    <style type="text/css">
/* Style the buttons */
.rajan{
  
  padding: 10px 16px;
  background-color: WHITE; 
  cursor: pointer;
 
}
/* Style the active class, and buttons on mouse-over */
.active, .rajan:hover{
  background-color:#00bfff;
   color:white ! important;
}

    .test {
    border: 1px solid black;
    margin-left:10px;
        margin-right:10px;
        padding:5px;
    
}
    .nav>li>a:hover {
    background-color: transparent;
}
    .dropbtn {
  background-color: #F1F1F1;
  color: black;
  padding: 6px;
  font-size: 16px;
  border: none;
  
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
  padding-top: 1px;
  padding-bottom: 1px;
  

}



/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	
  display: none;
  position: absolute;
  background-color: #F1F1F1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
  margin-left: 115px;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}
.nav-item, .nav-link{
color:#DCDCDC !important;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #00bfff;
color:black;

}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {display: block; cursor: pointer;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: white; cursor: pointer;}
.dropdown:hover .dropdown-content {background-color: white;
}

.abc:hover{

color:white!important;
}

.sideIcon{
padding-left:20px;
}

.dropdown-contentAdimn {
    display: none;
    
    position: absolute;
    background-color: #fff;
    min-width: 145px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    
}
.dropdown-contentAdimn a {

  padding: 12px 16px;
  text-decoration: none;
  display: block;
  cursor: pointer;
}
.nav-item, .nav-link{
color:#DCDCDC !important;
}

/* Change color of dropdown links on hover */
.dropdown-contentAdimn a:hover {background-color: #fff;}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-contentAdimn {display: block; cursor: pointer;}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {background-color: white;color:black ! important; cursor: pointer;}


label {
  height: 30px;
font-size: 15px;
position: relative;
  display: inline-block;
  padding-top: 3px;
  padding-bottom: 3px;
 pointer-events: none;
cursor: default;
   font-style: normal;
 
  
}
    </style>
   
<script type="text/javascript">
function myFunction() {
	  var x = document.getElementById("quicklink");
	    x.style.display = "none";
	}

</script>




</head>

<body onload="hide()" oncontextmenu="return false;" style="font-family: 'Open Sans', sans-serif; font-size:13px;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.addHeader("Cache-Control", "post-check=0, pre-check=0");
response.setHeader("Pragma","no-cache"); 
response.setDateHeader ("Expires", 0);
String userid =(String) request.getAttribute("myTest");
User uu =UserDAO.getUsernameRoleByUserId(userid);
String username=uu.getUsername();
String role= uu.getRolename();//rolename in user table
Role r=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
String rolename=r.getRole();
String scrbasic=r.getBasic();
String plantmapping=r.getPlantmapping();
String purchasing=r.getPurchasing();
String plantstorage=r.getPlantstorage();
String sales=r.getSales();
String mrp=r.getMrp();
String costing =r.getCosting();
String accounting=r.getAccounting();

String customer=r.getCustomer();


String vendor=r.getVendor();










pageContext.setAttribute("username",username,PageContext.SESSION_SCOPE);
response.setContentType("text/html");  


if(session.getAttribute("username")==null)
{
	     out.println("<script type=\"text/javascript\">");
		   out.println("alert('Session timeout!');");
		   response.sendRedirect("Login");
		   }
		   out.println("</script>");
	

%>
    <div class="wrapper" >
	<!-- header  -->
        <!-- Page Content  -->
        
        <div id="content" style="padding:0px;padding-left:0px;">
        
          <div id="quicklink" style=" margin-top:25px;margin-left:0px;" class="container-fluid">
  <div class="row">
  
  <%			
			 	if(rolename!=null && role !=null)
			 	{
			 		 if(rolename.equals(role)  && vendor.equals("Read") || vendor.equals("Creator"))
				 	   {
				 		%>	
    <div class="col-sm-4">
        <a onclick="myFunction();" href="Vendor.jsp" target="iframe_a" class="tile white">
      <p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
          <h3 class="title" align="center">Vendor</h3>
         <p align="center" >Click here to launch Vendor</p>
        </a>
    </div>
    
    <%} %>
    <% 
    if(vendor.equals("Approval")){
			 		%>
    
    <!--   <div class="col-sm-4">
        <a onclick="myFunction();" href="#" target="iframe_a" class="tile white">
      <p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
          <h3 class="title" align="center">Vendor</h3>
         <p align="center" >Click here to launch Vendor Basic Checker</p>
        </a>
    </div> -->
    
    
    
    <% 
    }
     if(rolename.equals(role)  && customer.equals("Read") || customer.equals("Creator"))
			 	   {
			 		%>
      <div class="col-sm-4">
        <a onclick="myFunction();"href="Customer.jsp" target="iframe_a" class="tile white">
          <p align="center"><i  style="font-size: 40px;"class="fa fa-user-circle" ></i> </p> 
          <h3 class="title" align="center">Customer</h3>
          <p align="center">Click here to launch Customer</p>
        </a>
    </div>  
    
    <%} %>
    
    <% 
	if(customer.equals("Grant")){
 		%>
     <!-- <div class="col-sm-4">
        <a onclick="myFunction();"href="CustomerBasicData_CheckerView.jsp" target="iframe_a" class="tile white">
          <p align="center"><i  style="font-size: 40px;"class="fa fa-user-circle" ></i> </p> 
          <h3 class="title" align="center">Customer</h3>
          <p align="center">Click here to launch Customer Basic Checker</p>
        </a>
    </div>
 -->    <% 
	}
      if(rolename.equals(role)  && scrbasic.equals("Read") || scrbasic.equals("Write"))
			 	   {
			 		%>	
    
    <div class="col-sm-4">
        <a onclick="myFunction();"href="SCR_Basic.jsp" target="iframe_a" class="tile white">
        <p align="center"><i  style="font-size: 40px;"class="fa fa-tag" ></i> </p> 
          <h3 class="title" align="center">Material</h3>
          <p align="center">Click here to launch Material Basic Data</p>
        </a>
    </div>
    
    <%} %>
    <% 
    if(scrbasic.equals("Approval")){
			 		%>
    
      <div  class="col-sm-4">
        <a onclick="myFunction();"href="CheckerView.jsp" target="iframe_a" class="tile white">
        <p align="center"><i  style="font-size: 40px;"class="fa fa-tag" ></i> </p> 
          <h3 class="title" align="center">Material</h3>
          <p align="left">Click here to launch Material Basic Checker</p>
        </a>
    </div>

    <%}} %>
  </div>
 
</div>
            
            
             
          
          




   
    </div>
    </div>
     
</body>

</html>
