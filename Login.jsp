<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>MDM TVSEurogrip</title>

  <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"> -->

<link rel="shortcut icon" type="image/png" href="images/LOGO.PNG"/>
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<script src="./bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

<style type="text/css">
.login-bg{
	 background:#fff;
     border-top:1px solid #fff;
	box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.14);
	padding:10px;
}
.bg-img{
background-image: url('images/loginbgimg.jpg');
background-size:cover;
}
.submit{
color: #fdfdfd !important;
    background-color: #2F3C90;}
</style>
</head>
<body class="bg-img">

<%




%>
<div class="col-md-3"></div>
	<div class="col-md-4 well" style="background-color: #ffffff; margin-top:15%; margin-left: 35px; padding: 0px 15px 0px 0px;border-radius: 26px;border-left-width: 0px; border-top-width: 0px;border-bottom-width: 0px;">  
  <form class="form-horizontal" action="Login" method="post">
  <div class="col-md-3" style="padding: 0px;height: 261px; background-color: #2F3C90;border-radius: 26px;border-top-right-radius: 0px!important;border-bottom-right-radius: 0px;">
  	<div class="panel-body"></div>
  </div>
    <div class="col-md-9" style="margin-top:5px;">
    <div class="col-md-offset-2">
    <img src="images/LOGO.PNG" class="loginLogo" style="width: 180px; padding: 10px;margin-left: 30px;margin-bottom: 15px;">
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email" style="text-align:left;">UserID</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control" id="email" placeholder="UserID" name="username" autocomplete="off">
        <!-- <span class="input-group-addon"><i class="fa fa-envelope"></i><span> -->
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-4" for="pwd" style="text-align:left;">Password</label>
      <div class="col-sm-8 input-group" >          
        <input type="password" class="form-control" id="pwd" placeholder="Password" name="password" autocomplete="off">
        <!-- <span class="input-group-addon"><i class="fa fa-lock"></i><span> -->
      </div>
    </div>   
      <%	String msssg = (String)session.getAttribute("result");
if (msssg != null) {
    %><p style="color:red"><%= msssg %></p>
    <%
    session.removeAttribute("result"); 
}

%> 
    <div class="form-group">        
      <div class="col-sm-offset-5 col-sm-2" style="margin-left: 29%;">
        <button type="submit" class="btn submit" value="Login">Login</button>
      </div>
    </div>
    </div>
  </form>
</div>	
	<div class="col-md-2"></div>
</body>
</html>