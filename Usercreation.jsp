
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

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<style type="text/css">

btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}

</style>
<style>
  .required:after {
    content:"*";
    color: red;
  }
</style>
<script type="text/javascript">

$(document).ready(function(){
	   // $('#myTable').dataTable();
	    $('#myTable').DataTable( {
	        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
	    } );
	    
	});
function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function ShowEditPopup()
{	
	 
	 
	    $.ajax({
			type: "POST",
			url: "userview.jsp",    			
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#tableView").html(response);
	        }
	    });
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
    
    
if(form.role.value == -1) {
    alert(" Please Select the role!");
    form.role.focus();
    return false;

  }


if(form.status.value == -1) {
    alert(" Please Select the Status!");
    form.status.focus();
    return false;

  }
}




$(document).ready(function() {	
	
	

	
	$('#plant').keyup(function(){
	    this.value = this.value.toUpperCase();
	});
	
});
</script>
</head>
<body onload="onload()" oncontextmenu="return false;">
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
	<% 
	
	
	
	
}

RoleLists rl=new RoleLists();
Statuslist sl =new Statuslist();
try
{
List<Role> listtd =rl.rolelist();
request.setAttribute("rolelist",listtd);

List<Status> listst =sl.statuslist();
request.setAttribute("statuslist",listst);

}
catch(Exception e)
{
	
}

%>
<form  name="form" action="UserServlet" method="post"  onsubmit="return checkForm(this);" >
	<div id="user" class="row" style="margin-top:2%;">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">UserCreation</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
		    <div class="form-group ">
		      <label class=" required control-label col-sm-4" for="name">UserId</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList"     
		      
		       title="UserId must contains  number, Capital letter  and between 4 to 8 Characters only" maxlength="8" pattern="^(?=.*[A-Z])(?=.*\d)[A-Z\d]{4,8}$" class="form-control input-sm " name="userid"  id="plant" required autocomplete="off" placeholder="UserId" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class=" required control-label col-sm-4" for="name">Username</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="MdmCodeList" onkeypress="return onlyAlphabets(event,this);" class="form-control input-sm " name="username"  id="MDMCode"  maxlength="20" placeholder="Username" required autocomplete="off" >
			     		   
		      </div>
		    </div>
		    
		     <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Email Id</label>
		      <div class="col-sm-8 input-group">
		      <input type="email" list="MdmCodeList" title="please enter a valid emailid" class="form-control input-sm " name="email"  id="email" pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}" maxlength="50"  placeholder="Email" required autocomplete="off" >
		      </div>
		    </div>
		    
		     
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Password</label>
		      <div class="col-sm-8 input-group">
		      		     <span id="message"></span>
		      
		      <input type="password" list="PlantList"   pattern="^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,12}$"  title="a combination of alpha, numeric and special character between 8 to 12" class="form-control input-sm " required  name="password"  id="password" maxlength="12" placeholder="Password"  autocomplete="off"  >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class=" required control-label col-sm-4" for="name">ConfirmPassword</label>
		      <div class="col-sm-8 input-group">
		     		      <input type="password" list="PlantList"  maxlength="12" class="form-control input-sm " name="plant" placeholder="ConfirmPassword" id="confirm_password" required   autocomplete="off"  onclick="checks()"  >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class=" required control-label col-sm-4">Role</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control" id="combo" name="role">
		      <option value="-1">Select</option>
		      		      <c:forEach items="${rolelist}" var="pg">
			      	<option value="${pg.role}">${pg.role}</option>  
	        	  </c:forEach>
		      
		      </select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Status</label>
		      <div class="col-sm-8 input-group">
<select class="form-control" id="combo" name="status">
		      <option value="-1">Select</option>
		      		     
		      <c:forEach items="${statuslist}" var="pg">
			      	<option value="${pg.status}">${pg.status}</option>  
	        	  </c:forEach>
		      		     
		      
		      </select>			   
		      </div>
		    </div>
		    
		   <div class="col-md-3 "><input type="submit"  class="btn btn-primary form-control"  value="Create" onclick="SaveFunc()"></div>
		    <div class="col-md-3 "><input type="reset"  class="btn btn-primary form-control" value="Clear"></div>
   <div class="col-md-3"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" onclick="ShowEditPopup()">Edit</button></div>
		    
	    </div>   
   		</div>
   		</div>
   		</div>
   	</div>
   		
   	<!--  -->
   	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 64%;">

    <!-- Modal content-->
    <div class="modal-content">
     
      <div class="modal-body">
        <span id="tableView">
        </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>	
   		

</form>


</body>
</html>
