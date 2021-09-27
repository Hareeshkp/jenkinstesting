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
<link rel="shortcut icon" type="image/png" href="images/LOGO.PNG"/>
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
 /* function hide() {
	  document.getElementById('hide').style.display = 'none';
	}
	function show()
	{
		  document.getElementById('hide').style.display = 'block';
	} */
	
	
	
</script>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>MDM TVSEurogrip</title>
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





$(document).keydown(function (e) 
		{
	
		    var keycode1 = (e.keyCode ? e.keyCode : e.which);
		    if (keycode1 == 0 || keycode1 == 9) {
		        e.preventDefault();
		        e.stopPropagation();
		    }
		}); 
		
		
</script>




</head>

<body  oncontextmenu="return false;" style="font-family: 'Open Sans', sans-serif; font-size:13px;overflow-y:auto;">
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
String scrplantstoragepurchase = r.getPlantStoragePurchase();
//String plantmapping=r.getPlantmapping();
//String purchasing=r.getPurchasing();
//String plantstorage=r.getPlantstorage();
String sales=r.getSales();
String mrp=r.getMrp();
String costingaccounting = r.getCostingAccounting();
//String costing =r.getCosting();
//String accounting=r.getAccounting();
String customer=r.getCustomer();


String vendor=r.getVendor();

pageContext.setAttribute("username",username,PageContext.SESSION_SCOPE);
response.setContentType("text/html");  


if(session.getAttribute("username")==null)
{
	     out.println("<script type=\"text/javascript\">");
		   out.println("alert('Session timeout!');");
		   response.sendRedirect("Login");
		   out.println("</script>");
		   }
		 
	

%>
    <div class="wrapper"  >
	<!-- header  -->
	
	
        <!-- Sidebar  -->
        <nav id="sidebar">                     
<a class="navbar-brand"  href="#" style="padding-top:0px; padding-left:0px;"><img src="images/LOGO.PNG" style="width:179px;"/></a>
            <ul id="myDIV" class="list-unstyled components" style="padding-top: 90px;">
            
              <% 
                  Boolean mdmadmin=r.getMdmadmin();
                   Boolean bool1=true;
                   if(rolename!=null && rolename.equals(role)  && mdmadmin==bool1)
                   {
                	  %>
                	    
                	 <li class=" rajan dropdown btnMenu"><i class="fa fa-group form-controls" ></i>&emsp;<label>Admin</label>
                
<div  class="dropdown-content form-controls">	
 <a class="abc" style="font-weight: bold;" href="RoleCreation.jsp" onclick="myFunction();"  target="iframe_a">Role Creation</a>
 <a class="abc"  style=" font-weight: bold;" href="Usercreation.jsp" onclick="myFunction();" target="iframe_a">User Creation </a>		
 </div>
  </li>
                	  
           
                   
                   <%
                   }
                   
                   %>
            

  
  
            
            <li class=" rajan  dropdown btnMenu"><i class="fa fa-user" ></i>&emsp;<label>Vendor</label>
            	<div class="dropdown-content form-controls">	
          
            <%
			if(rolename!=null && role !=null)
		 	{
		 		
		 	
				 if(rolename.equals(role)  && vendor.equals("Read") || vendor.equals("Creator"))
			 	   {
			 		%>			 		  
						 		  <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Vendor.jsp"  target="iframe_a">Vendor</a>	
			 		<%  
			 		
			 	   }
			 	if(vendor.equals("Reviewer")){
			 		%>
			 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Vendor_Reviewerview.jsp" target="iframe_a">Vendor</a>
			 		<%			 		
			 		}
			 	
				if(vendor.equals("Approval")){
			 		%>
			 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Vendor_Checkerview.jsp" target="iframe_a">Vendor</a>
			 		<%			 		
			 		}
			 	
		 	}%>
            
            </div>
            </li>
                  
			<li class=" rajan dropdown btnMenu"><i class="fa fa-user-circle"></i>&emsp;<label >Customer</label>
			
						    <div class="dropdown-content form-controls">				 	
			
			<%
			if(rolename!=null && role !=null)
		 	{
		 		
				 if(rolename.equals(role)  && customer.equals("Read") || customer.equals("Creator"))
			 	   {
			 		%>			 		  
						 		  <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Customer.jsp"  target="iframe_a">Customer</a>	
			 		<%  
			 		
			 	   }
			 	if(customer.equals("Reviewer")){
			 		%>
			 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Customer_Reviewerview.jsp" target="iframe_a">Customer</a>
			 		<%			 		
			 		}
			 	
				if(customer.equals("Approval")){
			 		%>
			 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Customer_Checkerview.jsp" target="iframe_a">Customer</a>
			 		<%			 		
			 		}
		 	   
		 	}%>
			 		  
						 		  						 		  			 		  
			</div>    
			
			</li>
			 <li class="rajan dropdown btnMenu"><i class="fa fa-tag"></i> &emsp;<label>Material</label>
			 	
			 	<div  class="dropdown-content form-controls">				 	
			 	<%	
			 	if(rolename == "dummy" && role == "dummy")
			 	{
			 		
					 if(rolename.equals(role)  && scrbasic.equals("Read") || scrbasic.equals("Creator"))
				 	   {
				 		%>			 		  
							 		  <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Basic_Plant_Mapping_View.jsp"  target="iframe_a">Basic & Plant Mapping</a>	
				 		<%  
				 		
				 	   }
					 if(scrbasic.equals("Approval")){
				 		%>
				 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Basic_Plant_Mapping_Checker_View.jsp" target="iframe_a">Basic & Plant Mapping</a>
				 		<%			 		
				 		}
					 if(rolename.equals(role)  && scrplantstoragepurchase.equals("Read") || scrplantstoragepurchase.equals("Creator"))
				 	   {
				 		%>			 		  
							 		  <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Purchasing_Plant_Storage_View.jsp"  target="iframe_a">Purchasing & Plant Storage</a>	
				 		<%  
				 		
				 	   }
					 if(scrplantstoragepurchase.equals("Approval")){
				 		%>
				 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Purchasing_Plant_Storage_Checker_View.jsp" target="iframe_a">Purchasing & Plant Storage</a>
				 		<%			 		
				 		}
					 if(rolename.equals(role)  && sales.equals("Read") || mrp.equals("Creator"))
				 	   {
				 		%>			 		  
							 		  <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="MRP.jsp"  target="iframe_a">MRP</a>	
				 		<%  
				 		
				 	   }
					 if(mrp.equals("Approval")){
				 		%>
				 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="MRPCheckerView.jsp" target="iframe_a">MRP</a>
				 		<%			 		
				 		}
					 if(rolename.equals(role)  && sales.equals("Read") || sales.equals("Creator"))
				 	   {
				 		%>			 		  
							 <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Sales.jsp"  target="iframe_a">Sales</a>	
				 		<%  
				 		
				 	   }
					 if(sales.equals("Approval")){
				 		%>
				 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="SalesCheckerView.jsp" target="iframe_a">Sales</a>
				 		<%			 		
				 		}
					 if(rolename.equals(role)  && sales.equals("Read") || sales.equals("Creator"))
				 	   {
				 		%>			 		  
							 <a class="abc" style=" font-weight: bold;"onclick="myFunction();" href="Costing_Accounting_View.jsp"  target="iframe_a">Costing & Accounting</a>	
				 		<%  
				 		
				 	   }
					 if(sales.equals("Approval")){
				 		%>
				 		<a class="abc" style=" font-weight: bold;" onclick="myFunction();"href="Costing_Accounting_Checker_View.jsp" target="iframe_a">Costing & Accounting</a>
				 		<%			 		
				 		}
			 	   
			 	}
			 	%>	 	
				 </div>
			 </li>
			 <li class=" rajan dropdown btnMenu"><i class="fa fa-briefcase	
			  form-controls" ></i>&emsp;<label>Version</label>
				<div class="dropdown-content form-controls">	
			    <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="Vendor_Log.jsp" target="iframe_a">Vendor</a>
			    <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="Customer_Log.jsp"  target="iframe_a">Customer</a>
			    
			     <!--<a class="abc"   style=" font-weight: bold;" onclick="myFunction();"href="Material_Log.jsp" target="iframe_a">Material</a>-->
			  </div>
			  
			  
			  </li>
			  
			  <li class=" rajan dropdown btnMenu"><i class="fa fa-book	
			  	
			  form-controls" ></i>&emsp;<label>Report</label>
				<div class="dropdown-content form-controls">	
			    			      <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="VendorReport.jsp"  target="iframe_a">Vendor</a> 
			    			      <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="CustomerReport.jsp"  target="iframe_a">Customer</a> 
			    			      <!-- <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="MaterialReport.jsp"  target="iframe_a">Material</a>  --> 
			    			      
			    			      <a class="abc"  style=" font-weight: bold;" onclick="myFunction();"  href="tracebility.jsp"  target="iframe_a">Traceability</a>  
			    
			  </div>
			  </li>
			  		  
			   <script>
// Add active class to the current button (highlight it)
var header = document.getElementById("myDIV");
var btns = header.getElementsByClassName("rajan");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function() {
  var current = document.getElementsByClassName("active");
  if (current.length > 0) { 
    current[0].className = current[0].className.replace(" active", "");
  }
  this.className += " active";
  });
}
</script>
            </ul>
            
            <%

           
            	 Timestamp t= LastLoginDAO.getlastloginbyuserid(userid);

            if(t!=null)
            {
            	Date d= new  Date(t.getTime());
                
                
                SimpleDateFormat    formatter = new SimpleDateFormat("dd-M-yyyy hh:mm a");  
            String    strDate = formatter.format(d);  
            	
            	%>
            	
            	 <div  style="margin-top: 200%";>
                 
                             <h6>Last login: <%=strDate %></h6>
                 </div>
            	
            	
            	
          <%} %>  
                 
          
        </nav>

        <!-- Page Content  -->
        
        <div id="content" style="padding:0px;padding-left:0px;">
        
        <nav class="navbar navbar-expand-lg navbar-light  headerBg"  style="background-color: #DCDCDC; padding:0px !important; margin-bottom:0px;" >
                <!--<div class="container-fluid headerBg"  style="background-color: #DCDCDC;"> <a href="Welcome.jsp"  class="btn btn-primary form-control">Back</a>-->
				 
                   <li style="width:20px;float:left; margin-top:5px;padding-left:10px;list-style-type:none;"><a href="ui"><i class="glyphicon glyphicon-home" style="color:white;font-size: larger;"></i></a></li>
                   <!-- <a href="Welcome.jsp" style="color:#DCDCDC;padding-left:10px;">Admin</a> -->
            
                 
                   
                	  
                    <!--<div class="collapse navbar-collapse headerBg" id="navbarSupportedContent" >-->
                        <ul class="nav navbar-nav ml-auto navbar-right" style="padding-right: 25px;">
                        
                         <li class="nav-item active pull-right">
                                
                            </li>
                            <li class="nav-item active" > 
                            
                               
                                 <li class=" dropdown" style="margin-top: -10px;"> 
<a href="#" class="form-controls" style="color:white; margin-top:10px;margin-left:35px;"><i class="fa fa-user-circle" style="padding-right: 5px;"></i>${username}&nbsp;<i class="fa fa-sort-desc"></i></a>
<div class="dropdown-contentAdimn form-controls">
	
		<a onclick="myFunction();" href="ChangePassword.jsp" target="iframe_a">Change Password</a>		
		<a href="logout" >Logout</a>			    
			    
</div>
</li>
                           
                        </ul>
                        
                    <!-- </div> -->
                <!-- </div> -->
            </nav>
           
            
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
    
      <div class="col-sm-4">
        <a onclick="myFunction();" href="Vendor_Checkerview.jsp" target="iframe_a" class="tile white">
      <p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
          <h3 class="title" align="center">Vendor</h3>
         <p align="center" >Click here to launch Vendor Approval</p>
        </a>
    </div>
    
    
    
    <% 
    }
    
    
    
    
    
    if(vendor.equals("Reviewer")){
 		%>

<div class="col-sm-4">
<a onclick="myFunction();" href="Vendor_Reviewerview.jsp" target="iframe_a" class="tile white">
<p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
<h3 class="title" align="center">Vendor</h3>
<p align="center" >Click here to launch Vendor Reviewer</p>
</a>
</div>



<% 
}
    
    
    
    
    
    
    
    
    
    
     		 if(rolename.equals(role)  && customer.equals("Read") || customer.equals("Creator"))
	 	   {
	 		%>	
 <div class="col-sm-4">
<a onclick="myFunction();" href="Customer.jsp" target="iframe_a" class="tile white">
<p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
<h3 class="title" align="center">Customer</h3>
<p align="center" >Click here to launch Customer</p>
</a>
</div> 

<%} 
    
    
    
    
     		  
     		    if(customer.equals("Approval")){
     					 		%>
     		    
     		       <div class="col-sm-4">
     		        <a onclick="myFunction();" href="Customer_Checkerview.jsp" target="iframe_a" class="tile white">
     		      <p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
     		          <h3 class="title" align="center">Customer</h3>
     		         <p align="center" >Click here to launch Customer Approval</p>
     		        </a>
     		    </div> 
     		    
     		    
     		    
     		    <% 
     		    }
     		    
     		    
     		    
     		    
     		    
     		    if(customer.equals("Reviewer")){
     		 		%>

     		 <div class="col-sm-4">
     		<a onclick="myFunction();" href="Customer_Reviewerview.jsp" target="iframe_a" class="tile white">
     		<p align="center"><i  style="font-size: 40px;"class="fa fa-user" ></i> </p>    
     		<h3 class="title" align="center">Customer</h3>
     		<p align="center" >Click here to launch Customer Reviewer</p>
     		</a>
     		</div> 



     		<% 
     		}
     		    
    
    
    
    
     %>
    
    <% 
	
	
      if(rolename.equals(role)  && scrbasic.equals("Read") || scrbasic.equals("Write"))
			 	   {
			 		%>	
    
    <!-- <div class="col-sm-4">
        <a onclick="myFunction();"href="SCR_Basic.jsp" target="iframe_a" class="tile white">
        <p align="center"><i  style="font-size: 40px;"class="fa fa-tag" ></i> </p> 
          <h3 class="title" align="center">Material</h3>
          <p align="center">Click here to launch Material Basic Data</p>
        </a>
    </div> -->
    
    <%} %>
    <% 
    if(scrbasic.equals("Grant")){
			 		%>
    
     <!--  <div  class="col-sm-4">
        <a onclick="myFunction();"href="CheckerView.jsp" target="iframe_a" class="tile white">
        <p align="center"><i  style="font-size: 40px;"class="fa fa-tag" ></i> </p> 
          <h3 class="title" align="center">Material</h3>
          <p align="left">Click here to launch Material Basic Checker</p>
        </a>
    </div> -->

    <%}} %>
  </div>
 
</div>
            
            
             <iframe name="iframe_a"  scrolling="yes"  frameBorder="0"   width="100%" height="100%" style="padding-right:5px;">
             
	
	 </iframe>  
           
          
          




   
    </div>
    </div>
     
</body>

</html>
