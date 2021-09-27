
<%@page import="com.tvstyres.customer.model.CustomerGroup"%>
<%@page import="com.tvstyres.customer.model.CustomerGroup2"%>
<%@page import="com.tvstyres.customer.dao.CustomerGroupDAO"%>
<%@page import="com.tvstyres.vendor.model.VendorGroup"%>
<%@page import="com.tvstyres.vendor.dao.VendorGroupDAO"%>
<%@page import="com.tvs.scrbasic.MaterialDAO"%>
<%@page import="com.tvs.scrbasic.Material"%>
<%@page import="com.tvs.userconsole.Access"%>
<%@page import="com.tvs.userconsole.AccessDAO"%>
<%@page import="com.tvs.userconsole.MaterialAcess" %>
<%@page import="com.tvs.userconsole.RoleDAO"%>

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

     <script type="text/javascript" src="http://davidstutz.de/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
      <link rel="stylesheet" type="text/css" href="http://davidstutz.de/bootstrap-multiselect/dist/css/bootstrap-multiselect.css">
      <link rel="stylesheet" type="text/css" href="http://davidstutz.de/bootstrap-multiselect/docs/css/bootstrap-3.3.2.min.css">
<style>
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
.form-group.required .control-label:after { 
   content:"*";
   color:red;
}

th, td ,tr{ padding: 5px;

border:1px solid black; }

/* cellspacing */
table { border:1px solid black; border-spacing: 5px; } /* cellspacing="5" */


</style>
<style>
  .required:after {
    content:"*";
    color: red;
  }
</style>
<style>
.dropdown-menu {
height: 200px;
overflow: auto;
position: absolute;
top: 100%;
left: 0;
z-index: 1000;
display: none;
float: left;
min-width: 160px;
padding: 5px 0;
margin: 2px 0 0;
font-size: 14px;
text-align: left;
list-style: none;
background-color: #fff;
-webkit-background-clip: padding-box;
background-clip: padding-box;
border: 1px solid #ccc;
border: 1px solid rgba(0,0,0,.15);
border-radius: 4px;
-webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

</style>
 <style id="compiled-css" type="text/css">
      .multiselect-container>li>a>label {
  padding: 4px 20px 3px 20px;
}
  </style>
  
  <script type="text/javascript">//<![CDATA[

$(function() {

$('.chkveg').multiselect({

includeSelectAllOption: true

});

});
  //]]></script>
<script>
function onlyAlphanumeric(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) || (charCode > 47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function datalistmtype(modelname) {
	var obj = $("#materiallist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function mtype(){
	var mt = $("#material").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistmtype(mt)===false) {
		
		alert(mt + " is not a valid Materialtype ");
		$("#material").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}
function clearform()
{
	
	  $("#role").val("");
	  $('#mdmadmin').prop('checked', false); // Unchecks it
	 	        var $select = $('.combo');
	        $select.val($select.data('default'));
	        
	        $("#my").multiselect("clearSelection");

	       
	        
	        $("#myy").multiselect("clearSelection");
	        $("#myyy").multiselect("clearSelection");
}
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
			url: "roleview.jsp",    			
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#tableView").html(response);
	        }
	    });
}

$(document).ready(function() {	
	

$("input[name=material]").on('change',function(){ 
	
	var selected =  $("#materiallist  option[value='" + $('#material').val() + "']").attr('data-id');	
	var abb=document.getElementById('materialid').value =selected;
	
});



});
</script>
</head>
<body oncontextmenu="return false;">
<%
	if(session==null || session.getAttribute("username")==null)
{
%>
	
	<script type="text/javascript">
	alert('Session timeout!');

window.parent.location.href= "Login.jsp";
</script>
	<%
		}
	%>
        <%
        	AccessDAO ad =new AccessDAO();
            	MaterialDAO m = new MaterialDAO();

                try
            {
                	List<Material> listm = m.materiallist();
            		request.setAttribute("listmaterial",listm);
        List<Access> accesslist =ad.accesslist();
        request.setAttribute("accesslist",accesslist);
        
        List<MaterialAcess> materialacesslist = ad.materialaccesslist();
        request.setAttribute("materialacesslist", materialacesslist);
        
        VendorGroupDAO vgd =new VendorGroupDAO();
        List<VendorGroup> listvg =vgd.getVendorgroup();
        request.setAttribute("listvg", listvg);

        CustomerGroupDAO cgd=new CustomerGroupDAO();
        List<CustomerGroup> cglist=cgd.getCustomergroup();
        request.setAttribute("cglist",cglist);

        }
        catch(Exception e)
        {
        	
        }
        %>                                                                                                                                                                                                                                                                                                                      
<form action="RoleSave" method="post">
	<div class="row" style="margin-top:2%;">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">RoleCreation</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
		    
		    <div class="form-group ">
		      <label class=" required control-label col-sm-4">Role</label>
		      <div class="col-sm-8 input-group">
		           <input type="text" maxlength="20" onkeypress="return onlyAlphanumeric(event,this);"  class="form-control input-sm " name="role" placeholder="Role" id="role" required autocomplete="off"  >
		         		   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 ">isMDMAdmin</label>
		      <div class="col-sm-6 input-group">
		          <input type="checkbox"   name="mdmadmin"  id="mdmadmin"  autocomplete="off"  >
		         		   
		      </div>
		    </div>
		     
  <div class="col-md-12">
 <div class="col-md-4">
  <button type="button" disabled id="materiaid" class="btn btn-primary btn-md form-control" data-toggle="collapse" data-target="#demos">Material <span class="glyphicon glyphicon-plus"></span></button> <br>
  
  
  </div>
  
  </div><BR>
  
  <div id="demos" class="collapse" style="margin-top: 5%;">
  <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
<select name="multiselectmaterial" id="multiselectmaterial"  class='chkveg' multiple>
<c:forEach items="${listmaterial}" var="c">  	

		            <option value="${c.description}"  
		             data-id="${c.materialtype}"> ${c.description} </option>		             
       	            
		        </c:forEach>  	
</select>

 	       
		      </div>
		      <!-- <div class="col-sm-8 input-group">
 <input  list="materiallist"  class=" form-control input-sm input_text" name="material"  id="material" maxlength="40"    placeholder="Material Type"  value="None" onchange="return mtype();"   autocomplete="off"  >
		   <datalist id="materiallist">
		     <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.description}" data-id="${c.materialtype}"> ${c.description} </option>		             
		        </c:forEach>  
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		           	           <input type="hidden" value="None"  name="materialid" id="materialid" > 		       
		      </div> -->
		      
		    </div>
   <table class="" >
   
   
   <tr>
   <td>Forms</td>
      <td>Access</td>
  
   </tr>
   
   <tr>   <td>
        <input type="hidden" name="SCR_Basic&Plant_Mapping" value="scrbasic&plantmapping">
   
     Basic & Plant Mapping View</td>
   
   <td>   <select class="combo" name="basic&plantmappingrole" data-default="-1" style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		      <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      
		      		     
		      
		      </select>		</td>
   
   </tr>
   <!-- <tr>   <td> 
           <input type="hidden" name="SCR_Plantmapping" value="scrplantmapping">
   
    Plant Mapping</td>
   
   <td>   <select class="combo" name="plantmappingrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr> -->
   <tr>   <td>
   
              <input type="hidden" name="SCR_Purchase&Plant_Storage" value="scrpurchase&plantstorage">
   
     Purchasing & Plant Storage view</td>
   
   <td>   <select  class="combo" name="purchase&plantstoragerole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   <tr>   <td> 
   
                 <input type="hidden" name="SCR_MRP" value="scrmrp">
   
    MRP</td>
   
   <td>   <select  class="combo" name="mrprole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		      <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   <!-- <tr>   <td> 
                    <input type="hidden" name="SCR_PlantStorage" value="scrplantstorage">
   
   
    Plant & Storage</td>
   
   <td>   <select  class="combo" name="plantstoragerole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr> -->
   <tr>   <td> 
   <input type="hidden" name="SCR_Sales" value="scrsales">
   Sales</td>
   
   <td>   <select  class="combo" name="salesrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   <tr>   <td> 
   <input type="hidden" name="SCR_Costing&Accounting" value="scrcosting&accounting">
   Costing & Accounting</td>
   <td>   <select  class="combo" name="costing&accountingrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   
   <!-- <tr>   <td>  
   
        <input type="hidden" name="SCR_Accounting" value="scraccounting">
   
   Accounting</td>
   
   <td>   <select class="combo" name="accountingrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>-->
   
   
   
   
   
   </table>
   
   
  </div>
  <div class="col-md-12">
  <div class="col-md-4">
  <button type="button" id="Customer" style="margin-top:10px;" class="btn btn-primary btn-md  form-control " data-toggle="collapse" data-target="#demo">Customer <span class="glyphicon glyphicon-plus"></span></button><br>
  </div>
  </div>
  <div id="demo" class="collapse" style="margin-top: 14%;">   
   <br>
  
   <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Customer Group</label>
		      <div class="col-sm-8 input-group">
<select name="customergroup" id="my"  class='chkveg' multiple>
<c:forEach items="${cglist}" var="c">  		            
		            <option value="${c.description}" > ${c.description} </option>		             
		        </c:forEach>		             

</select>

 	       
		      </div>
		    </div>
   <table class="" >
   <tr>
   <td>Forms</td>
      <td>Access</td>
  
   </tr>
   
   <tr>   <td>  Customer </td>
   
   <td>   <select  class="combo" name="custrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		      <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      		     
		      
		      </select>		</td>
   
   </tr>
   
   
   </table>
   
  </div>
  <div class="col-md-12">
  <div class="col-md-4">
   <button type="button" id="Vendor" style="margin-top:10px;" class="btn btn-primary form-control" data-toggle="collapse" data-target="#dem">Vendor <span class="glyphicon glyphicon-plus"></span></button>
   </div>
   </div>
  <div id="dem" class="collapse" style="margin-top: 16%;">
  
   <br>
   <br>
   <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
<select name="multi" id="myy"  class='chkveg' multiple>
<c:forEach items="${listmaterial}" var="c">  	

		            <option value="${c.description}"  
		             data-id="${c.materialtype}"> ${c.description} </option>		             
       	            
		        </c:forEach>  	
</select>

 	       
		      </div>
		    </div>
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Vendor Group</label>
		      <div class="col-sm-8 input-group">
<select name="multivendor" id="myyy"  class='chkveg' multiple>
<c:forEach items="${listvg}" var="c">  		            
		            <option value="${c.description}" data-id="${c.vendorcode}" data-type="${c.vendortype }"> ${c.description} </option>		             
		        </c:forEach> 	
</select>

 	       
		      </div>
		    </div>
   <table  >
   <tr>
   <td>Forms</td>
      <td>Access</td>
  
   </tr>
   
   <tr>   <td>  Vendor</td>
   
   <td>   <select class="combo" name="vendorrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}">${pg.access}</option>  
	        	  </c:forEach>
		      
		      		     
		      
		      </select>		</td>
   
   </tr>
  
   
   </table>
   
   
  </div>
  
  <div class="col-md-12" style="margin-bottom: 10px;" >
  <br>
  <div class="col-md-3"><input type="submit" class="btn btn-primary form-control"  value="Create"></div>
  <div class="col-md-3"><input type="button" onclick="clearform()" id="dd" class="btn btn-primary form-control"  value="Clear"></div>
   <div class="col-md-3"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" onclick="ShowEditPopup()">Edit</button></div>
  </div>
  
</div>
	    </div>    
  
   		</div>
   		</div>
   		<br>
   		</div>

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
        <button type="button" onclick="javascript:window.location='RoleCreation.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>	

</form>

<br>
<br>
<br>
<br>
</body>
<script type="text/javascript">
$(".modal").on("hidden.bs.modal", function () {
	  window.location = "RoleCreation.jsp";
	});
jQuery(function($) {
	  $('#materiaid').on('click', function() {
	    var $el = $(this),
	      textNode = this.lastChild;
	    console.log($el);
	    console.log(textNode);
	    $el.find('span').toggleClass('glyphicon-minus');
	    textNode.nodeValue = ' Gimme ' + ($el.hasClass('showFire') ? 'Fire' : 'Water')
	    $el.toggleClass('showFire');
	  });
	});

jQuery(function($) {
	  $('#Customer').on('click', function() {
	    var $el = $(this),
	      textNode = this.lastChild;
	    console.log($el);
	    console.log(textNode);
	    $el.find('span').toggleClass('glyphicon-minus');
	    textNode.nodeValue = ' Gimme ' + ($el.hasClass('showFire') ? 'Fire' : 'Water')
	    $el.toggleClass('showFire');
	  });
	});
jQuery(function($) {
	  $('#Vendor').on('click', function() {
	    var $el = $(this),
	      textNode = this.lastChild;
	    console.log($el);
	    console.log(textNode);
	    $el.find('span').toggleClass('glyphicon-minus');
	    textNode.nodeValue = ' Gimme ' + ($el.hasClass('showFire') ? 'Fire' : 'Water')
	    $el.toggleClass('showFire');
	  });
	});

</script>


</html>
