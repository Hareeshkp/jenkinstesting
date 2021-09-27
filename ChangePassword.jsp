
<%@page import="com.tvs.userconsole.Status"%>
<%@page import="com.tvs.userconsole.Statuslist"%>
<%@page import="com.tvs.userconsole.RoleLists"%>
<%@page import="com.tvs.userconsole.Role"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
  <link rel="stylesheet" href="css/form.css">
   <link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">
<style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
</style>
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">


function Reset()
{
	 document.getElementById("password").value = "";
     document.getElementById("confirm_password").value = "";
     form.password.focus();
     return false;
	}

	
function checkForm(form)
{
if(form.password.value !== form.confirm_password.value) {
      alert("Error: Password must Match!");
      document.getElementById("password").value = "";
      document.getElementById("confirm_password").value = "";
      form.password.focus();
      return false;

    }
    
    

}
</script>
</head>
<body >
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

<%} %>

<form  name="form" action="Password" method="post"  onsubmit="return checkForm(this);" >
	<div id="user" class="row" style="margin-top:2%;">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title"><i class="fa fa-user" style="padding-right:5px;"></i>ChangePassword</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Password</label>
		      <div class="col-sm-8 input-group">
		      		     <span id="message"></span>
		      
		      <input type="password" list="PlantList"      pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$"  title="a combination of alpha, numeric and special character between 8 to 12"  maxlength="12"   autocomplete="off" class="form-control input-sm " name="password"  id="password" placeholder="Password"required autocomplete="off"  >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">ConfirmPassword</label>
		      <div class="col-sm-8 input-group">
		     		      <input type="password" list="PlantList"  class="form-control input-sm " name="plant" placeholder="ConfirmPassword" id="confirm_password" required autocomplete="off"    >
		      </div>
		    </div>
		   
		   <div class="col-md-3 "><input type="submit"  class="btn btn-primary form-control"  value="Change" ></div>
		   <div class="col-md-3 "><input type="button"  class="btn btn-primary form-control"  value="Reset" onclick="Reset()"></div>
		    
	    </div>   
   		</div>
   		</div>
   		</div>
   	</div>
   		
</form>


</body>
</html>
