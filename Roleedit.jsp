
<%@page import="com.tvstyres.customer.model.CustomerGroup"%>
<%@page import="com.tvs.userconsole.Customer_CustomerGroupDAO"%>
<%@page import="com.tvs.userconsole.Customer_CustomerGroup"%>
<%@page import="com.tvstyres.customer.model.CustomerGroup2"%>
<%@page import="com.tvstyres.customer.dao.CustomerGroupDAO"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroup"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroupDAO"%>
<%@page import="com.tvs.userconsole.Vendor_Material_Type"%>
<%@page import="com.tvs.userconsole.Vendor_Material_Type_DAO"%>
<%@page import="com.tvs.userconsole.Access"%>
<%@page import="com.tvs.userconsole.AccessDAO"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvstyres.vendor.model.VendorGroup"%>
<%@page import="com.tvstyres.vendor.dao.VendorGroupDAO"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.scrbasic.MaterialDAO"%>
<%@page import="com.tvs.scrbasic.Material"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO" %>
<%@page import="com.tvs.userconsole.MaterialAcess" %>

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
<script type="text/javascript">

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
	 
	  $('#mdmadmin').prop('checked', false); // Unchecks it
	 
	        var $select = $('.combo');
	        $select.val($select.data('default'));
	        $("#my").multiselect("clearSelection");

	        $("#my").multiselect( 'refresh' );

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
        	String role=request.getParameter("id");
                
               
                Role r= RoleDAO.getRoleByRoleName(role);
                
                String basicrole=r.getBasic();
                //String plantmappingrole=r.getPlantmapping();
                String purchasingrole=r.getPlantStoragePurchase();
                String mrprole=r.getMrp();
                //String plantstoragerole=r.getPlantstorage();
                String salesrole=r.getSales();
                String costingaccounting = r.getCostingAccounting();
                //String costingrole=r.getCosting();
                //String accountrole=r.getAccounting();
                
                String customerrole=r.getCustomer();
                String vendorrole=r.getVendor();
                
                
               
              
                Boolean mdmadmin=r.getMdmadmin();
                
                
                
                pageContext.setAttribute("Role",role);
               


                pageContext.setAttribute("basicrole",basicrole);
                //pageContext.setAttribute("plantmappingrole",plantmappingrole);
                pageContext.setAttribute("purchasingrole",purchasingrole);
                pageContext.setAttribute("mrprole",mrprole);
                //pageContext.setAttribute("plantstoragerole",plantstoragerole);
                pageContext.setAttribute("salesrole",salesrole);
                pageContext.setAttribute("costingaccounting",costingaccounting);
                //pageContext.setAttribute("costingrole",costingrole);
                
                
                
                pageContext.setAttribute("customerrole",customerrole);
                pageContext.setAttribute("vendorrole",vendorrole);

              

                pageContext.setAttribute("mdmadmin",mdmadmin);

                
                
                

        AccessDAO ad =new AccessDAO();
        MaterialDAO m = new MaterialDAO();
        Material_Material_Type_DAO mm = new Material_Material_Type_DAO();
        try
        {
        	List<Material> listm = m.materiallist();
            request.setAttribute("listmaterial",listm);
            
            List<Material_Material_Type> selectedlistmaterial = mm.matertialtypelist(role);
            request.setAttribute("selectedlistmaterial",selectedlistmaterial);
            		
            		
	        List<Access> accesslist =ad.accesslist();
	        request.setAttribute("accesslist",accesslist);
	        
	        List<MaterialAcess> materialacesslist = ad.materialaccesslist();
	        request.setAttribute("materialacesslist", materialacesslist);
	        
	        VendorGroupDAO vgd =new VendorGroupDAO();
	        List<VendorGroup> listvg =vgd.getVendorgroup();
	        request.setAttribute("listvg", listvg);
	
	
	        Vendor_Material_Type_DAO vmtd=new Vendor_Material_Type_DAO();
	        List<Vendor_Material_Type> vmtype =vmtd.mattypeforvendor(role);
	        request.setAttribute("vmtype", vmtype);
	
	
	        Vendor_VendorGroupDAO vvgd=new Vendor_VendorGroupDAO();
	        List<Vendor_VendorGroup> vvg=vvgd.ventypeforvendor(role);
	        request.setAttribute("vvg", vvg);
	
	        CustomerGroupDAO cgd=new CustomerGroupDAO();
	        List<CustomerGroup> cglist=cgd.getCustomergroup();
	        request.setAttribute("cglist",cglist);
	
	        Customer_CustomerGroupDAO ccgd=new Customer_CustomerGroupDAO();
	        List<Customer_CustomerGroup> listccg=ccgd.custcustomergrouplist(role);
	        request.setAttribute("listccg", listccg);
        }
        catch(Exception e)
        {
        	
        }
        %>  
          
          
                                                                                                                                                                                                                                                                                                                                            
<form action="RoleUpdate" method="post">

<c:set var="role" scope="session" value="${Role}"/>  
<c:set var="basicrole" scope="session" value="${basicrole}"/>  
<c:set var="plantmappingrole" scope="session" value="${plantmappingrole}"/>  
<c:set var="purchasingrole" scope="session" value="${purchasingrole}"/>
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
		          <input type="text" maxlength="20"  readonly value="${Role}" class="form-control input-sm " name="role" placeholder="Role" id="role" required autocomplete="off"  >
		         		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory">isMDMAdmin</label>
		      <div class="col-sm-6 input-group">
		          <input type="checkbox"   
		          
		          		      		       <c:if test="${mdmadmin == 'true'}">checked="checked"</c:if>
		          
		          
		          name="mdmadmin"  id="mdmadmin" autocomplete="off"  >
		         		   
		      </div>
		    </div>
		   
  <div class="col-md-12">
 <div class="col-md-4">
  <button type="button" disabled class="btn btn-primary btn-md form-control" data-toggle="collapse" data-target="#demos">Material</button> <br>
  </div>
  </div><BR>
  <div id="demos" class="collapse" style="margin-top: 5%;">
  <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
<select name="materialtype" id="mtype"  class='chkveg' multiple>
<c:forEach items="${listmaterial}" var="m">  		            
		            <option value="${m.description}"
		            
		             <c:forEach items="${selectedlistmaterial}" var="mt">  	

		<c:if test="${m.materialtype eq mt.materialtypecode}">
		            selected
		             </c:if>
		        </c:forEach>		            
		           > ${m.description} </option>		             
		        </c:forEach>		             
       	            
		   
</select>

 	       
		      </div>
		    </div>
  
 <!--  <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
 <input  list="materiallist"  class=" form-control input-sm input_text" name="material"  id="material" maxlength="40"    placeholder="Material Type"  value="${materialtypedesc}"  onchange="return mtype()"  autocomplete="off"  >
		   <datalist id="materiallist">
		     <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.description}" data-id="${c.materialtype}"> ${c.description} </option>		             
		        </c:forEach>  
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		           	           <input type="hidden" name="materialid" id="materialid" value="${materialtypecode}" > 		       
		      </div>
		    </div> -->
   <table class="" >
   <tr>
   <td>Forms</td>
      <td>Access</td>
  
   </tr>
   
   <tr>   <td>
        <input type="hidden" name="SCR_Basic" value="scrbasic">
   
     Basic & Plant Mapping</td>
   
   <td>   <select class="combo" name="basicrole" data-default="-1"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		      <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
    <c:if test="${pg.access eq  basicrole}"> selected="selected"</c:if>
			      	
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      
		      		     
		      
		      </select>		</td>
   
   </tr>
   <tr>   <td>
   
              <input type="hidden" name="SCR_Purchase" value="scrpurchase">
   
     Purchase and Plant Storage</td>
   
   <td>   <select  class="combo" data-default="-1" name="purchasingrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
			      	
			      				      	    <c:if test="${pg.access eq  purchasingrole}"> selected="selected"</c:if>
			      	
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   <tr>   <td> 
   
                 <input type="hidden" name="SCR_MRP" value="scrmrp">
   
    MRP</td>
   
   <td>   <select  class="combo" data-default="-1" name="mrprole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		      <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
			      	    <c:if test="${pg.access eq  mrprole}"> selected="selected"</c:if>
			      	
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
  
   <tr>   <td> 
                       <input type="hidden" name="SCR_Sales" value="scrsales">
   
    Sales</td>
   
   <td>   <select  class="combo" data-default="-1" name="salesrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
			      	    <c:if test="${pg.access eq  salesrole}"> selected="selected"</c:if>
			      	
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   <tr>   <td> 
   
   
                          <input type="hidden" name="SCR_Costing" value="scrcosting">
   
    Costing & Accounting</td>
   
   <td>   <select  class="combo" data-default="-1" name="costingaccounting"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     
		       <c:forEach items="${materialacesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
			      	    <c:if test="${pg.access eq  costingaccounting}"> selected="selected"</c:if>
			      	
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      </select>		</td>
   
   </tr>
   </table>
   
   
  </div>
  <div class="col-md-12">
  <div class="col-md-4">
  <button type="button" style="margin-top:10px;" class="btn btn-primary btn-md form-control   " data-toggle="collapse" data-target="#demo">Customer +</button><br>
  </div>
  </div>
  <div id="demo" class="collapse" style="margin-top: 14%;">
   <br>
  
   <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Customer Group</label>
		      <div class="col-sm-8 input-group">
<select name="customergroup" id="my"  class='chkveg' multiple>
<c:forEach items="${cglist}" var="c">  		            
		            <option value="${c.description}"
		            
		             <c:forEach items="${listccg}" var="d">  	

		<c:if test="${c.customercode eq d.customergroupcode}">
		            selected
		             </c:if>
		        </c:forEach>
		            
		             > ${c.description} </option>		             
		        </c:forEach>		             
       	            
		   
</select>

 	       
		      </div>
		    </div>
   <table class="" >
   <tr>
   <td>Forms</td>
      <td>Access</td>
  
   </tr>
   
   <tr>   <td>  Customer</td>
   
   <td>   <select  class="combo" data-default="-1" name="custrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		      <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}"
			      	    <c:if test="${pg.access eq  customerrole}"> selected="selected"</c:if>
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      		     
		      
		      </select>		</td>
   
  
   
   </table>
   
   
  </div>
  <div class="col-md-12">
  <div class="col-md-4">
   <button type="button" style="margin-top:10px;" class="btn btn-primary form-control" data-toggle="collapse" data-target="#dem">Vendor +</button>
   </div>
   </div>
  <div id="dem" class="collapse" style="margin-top: 16%;">
   <br>
   <br>
   <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
<select name="multi"   class='chkveg' multiple>
<c:forEach items="${listmaterial}" var="c">  	

		            <option value="${c.description}"  
		            <c:forEach items="${vmtype}" var="d">  	

		<c:if test="${c.materialtype eq d.mattypecode}">
		            selected
		             </c:if>
		        </c:forEach> 
		             data-id="${c.materialtype}"> ${c.description} </option>		             
		        </c:forEach>  	
</select>

		      </div>
		    </div>
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name">Vendor Group</label>
		      <div class="col-sm-8 input-group">
<select name="multivendor"   class='chkveg' multiple>
<c:forEach items="${listvg}" var="c">  		            
		            <option value="${c.description}"
		             <c:forEach items="${vvg}" var="d">  	
		<c:if test="${c.vendorcode eq d.vendorgroupcode}">
		            selected
		             </c:if>
		        </c:forEach> 
		             data-id="${c.vendorcode}" data-type="${c.vendortype }"> ${c.description} </option>		             
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
   
   <td>   <select class="combo" data-default="-1" name="vendorrole"  style="width:100px;height:20px;">
		      <option value="-1">Select</option>
		      		     <c:forEach items="${accesslist}" var="pg">
			      	<option value="${pg.access}"
			      	
			      	    <c:if test="${pg.access eq  vendorrole}"> selected="selected"</c:if>
			      	
			      	>${pg.access}</option>  
	        	  </c:forEach>
		      

		      </select>		</td>
   
   </tr>
   
   
   </table>
   
   
  </div>
  
  
  <div class="col-md-12"><br>
  <div class="col-md-3 "><input type="submit" class="btn btn-primary form-control"  value="Update"></div>
		   <div class="col-md-3"><input type="button" id="dd" class="btn btn-primary form-control" onclick="clearform()"  value="Clear"></div>
  </div>
  
</div>
 		   
		    <!-- Button -->
   		   		    
	    </div>    

   		</div>
   		</div>
   		<br>
   		</div>

   		

</form>

<br>
<br>
<br>
<br>
</body>
</html>
