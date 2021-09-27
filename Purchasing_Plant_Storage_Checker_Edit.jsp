<%@page import="com.tvs.Purchase.PurchaseDAO"%>
<%@page import="com.tvs.Purchase.Purchase"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tvs.Purchase.Orderunit"%>
<%@page import="com.tvs.Purchase.OrderunitDAO"%>
<%@page import="com.tvs.Purchase.Purchasingvaluekey"%>
<%@page import="com.tvs.Purchase.PurchasingvaluekeyDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tvs.Purchase.Purchasinggroup" %>
<%@ page import="com.tvs.Purchase.PurchasinggroupDAO" %>
<%@page import="com.tvs.plantandstorage.PlantandStorageDAO"%>
<%@page import="com.tvs.plantandstorage.PlantandStorage"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
  <link rel="stylesheet" href="css/form.css">
  
   <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script> 
  <style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
.scrollable{
  width: 100%;
  height: 600px;
  overflow: scroll;
  border: 1px solid #ccc;
}
</style>
<style>
  .required:after {
    content:"*";
    color: red;
  }
</style>
<style>
        fieldset.scheduler-border {
    border: 1px groove #ddd !important;
    padding: 0 1.4em 1.4em 1.4em !important;
    margin: 0 0 1.5em 0 !important;
    -webkit-box-shadow:  0px 0px 0px 0px #000;
            box-shadow:  0px 0px 0px 0px #000;
}

    legend.scheduler-border {
        font-size: 1.2em !important;
        font-weight: bold !important;
        text-align: left !important;
        width:auto;
        padding:0 10px;
        border-bottom:none;
    }

</style>
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function get_materialcode()
{	
	var Mcode = $("#MDMCode").val();		
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/materialcode.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {				
	            $("#matcode").html(response);
	        }
	    });
}
function get_description()
{	
	 var country = $("#MDMCode").val();		
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/description.jsp",
			data: "materialtype="+country,
			cache: false,
			success: function(response)
	        {				
	            $("#MDesc").html(response);
	        }
	    });
}
function get_Plant()
{	
	 var country = $("#MDMCode").val();		
	    $.ajax({
			type: "POST",
			url: "Plantmapping_Data/Plant.jsp",
			data: "materialtype="+country,
			cache: false,
			success: function(response)
	        {				
	            $("#PlantList").html(response);
	        }
	    });
}
function get_PlantDesc()
{		 
	 var Plant = $("#plant").val();	
	    $.ajax({
			type: "POST",
			url: "PlantMapping_Data/plantdescription.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#plantdesc").html(response);
	        }
	    });
}
function get_materialType()
{
	var Mcode = $("#MDMCode").val();		
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/materialtype.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {				
	            $("#mattype").html(response);
	            var mtcode = response.split(">")[0];
	            mtcode = mtcode.split("=")[1];
	            mtcode = mtcode.split("-")[0];
	            mtcode = mtcode.replace('"','');
			    if(mtcode =="ZFG" || mtcode =="ZPRT" || mtcode =="ZROH" || mtcode=="ZSFG" || mtcode=="ZCP1" ||mtcode=="ZSCR")
			    {
			    	$("#mtcode").addClass("required");		    	
			    }
			    else
			    {
			    	$("#mtcode").removeClass("required");		    	
			    }
	        }
	    });
}
function PurchasingGroupFun() { 
	  var selected =  $("#PurchasingGroupList option[value='" + $('#PurchasingGroup').val() + "']").attr('data-id');	  
	  var ss= document.getElementById('PurchasingGroupid').value =selected;
	  
}
function PurchaseKeyValFun() { 
	  var selected =  $("#PurchaseKeyValList option[value='" + $('#PurchaseKeyVal').val() + "']").attr('data-id');	 
	  var ss= document.getElementById('PurchaseKeyValid').value =selected;
	  
}
function OrderUnitFunc() { 
	  var selected =  $("#OrderUnitList option[value='" + $('#OrderUnit').val() + "']").attr('data-id');	  
	  var ss= document.getElementById('OrderUnitid').value =selected;
	  
}
function funcLoad(){
	$("#MDMCode").focus();	
	
}
function ProfitCenterFunc()
{
	
	var Mcode = $("#plant").val();
		
	    $.ajax({
			type: "POST",
			url: "ProfitCenter.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {			
				console.log(response);
	            $("#ProfitCenteid").html(response);
	            $("#ProfitList").html(response);
	            //ProfitDesc();
	        }
	    });
	    $.ajax({
			type: "POST",
			url: "EditProfit.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {			
				console.log(response);
	            
	            $("#ProfitCentedec").html(response);
	            //ProfitDesc();
	        }
	    });
}




</script>
<script type="text/javascript">
$(document).ready(function() {	
	
	$("input[name=OrderUnit]").on('change',function(){
			var selected =  $("#OrderUnitList option[value='" + $('#OrderUnit').val() + "']").attr('data-id');	  
			  var ss= document.getElementById('OrderUnitid').value =selected;
			console.log(ss);
		});
})
</script>

</head>
<body onload="ProfitCenterFunc();get_materialType();get_PlantDesc();get_materialcode();get_description();PurchasingGroupFun();OrderUnitFunc();">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>

<% 
//role code 
String userid =(String) request.getAttribute("myTest");

String role=null;
String username=null;
String rolename=null;
String access=null;
String mattype=null;
if(userid!=null)
{
	User uu =UserDAO.getUsernameRoleByUserId(userid);
	 username=uu.getUsername();
	 role= uu.getRolename();//rolename in user table
	Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
	 rolename=rr.getRole();
     access=rr.getPlantStoragePurchase();
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





//role code end 


TalendcodesDAO td =new TalendcodesDAO();
PurchasingvaluekeyDAO pdk=new PurchasingvaluekeyDAO();
OrderunitDAO ou=new OrderunitDAO();
PurchasinggroupDAO pda =new PurchasinggroupDAO();

try
{
List<Purchasinggroup> listg = pda.pgrouplist();
request.setAttribute("listpgroup",listg);

List<Purchasingvaluekey> listk = pdk.pkeylist();
request.setAttribute("listpkey",listk);

List<Orderunit> listou = ou.unitlist();
request.setAttribute("listounit",listou);

Set<Talendcodes> listtd =td.purchaseandplantstoragelist();
request.setAttribute("listtd",listtd);

/* if(mattype.equals("None"))
{
	Set<Talendcodes> listtd =td.purchaselist();
	request.setAttribute("listtd",listtd);
}

else
{
	Set<Talendcodes> listtd=td.purchaselist(mattype);
	request.setAttribute("listtd",listtd);
}
 */

}
catch(Exception e)
{
	
}
//talendcode
Integer sid=Integer.parseInt(request.getParameter("id"));  
String plantt=request.getParameter("plant");

Purchase pobj =PurchaseDAO.getPurchaseByTalendcode(sid,plantt);

Integer mdmcode=pobj.getMdmcode();
String materialtypecode=pobj.getMaterialtypecode();
String materialtypedesc=pobj.getMaterialtypedesc();
String modeldesc=pobj.getModeldesc();
String materialcode=pobj.getMaterialcode();
String mdesc=pobj.getMaterialcodedesc();
String plant=pobj.getPlantcode();
String plantdesc=pobj.getPlantcodecodedesc();
String purchasinggroup=pobj.getPurchasegroupdesc();
String purchasingcode=pobj.getPurchasegroup();
Integer grprocessing =pobj.getGrprocessingtime();
String purchasingvaluekey=pobj.getPurchasekeyvalue();
String orderunit=pobj.getOrderunitdesc();
String potext=pobj.getPotext();
Integer version=pobj.getVersion();
//String reasonforedit=pobj.getReasonforedit();
String reasonforedit=pobj.getReasonforedit();
// new fields from form 2
//PlantandStorage p=PlantandStorageDAO.getPlantstorageByTalendcode(sid,plantt);
Integer minshelf=pobj.getminshelf();
Integer totalshelf=pobj.gettotalshelf();
String profitcentercode=pobj.getprofitcentercode();
String profitcenterdesc=pobj.getprofitcenterdesc();
String storagebin=pobj.getstoragebin();
String unitofissuecode=pobj.getunitofissue();
String unitofissuedesc=pobj.getsunitofissuedesc();
String serialno=pobj.getserialnoprofile();
String serialnodesc=pobj.getserialnoprofiledesc();
// new fields from form 2


pageContext.setAttribute("reasonforedit",reasonforedit);

pageContext.setAttribute("version",version);
pageContext.setAttribute("modeldesc",modeldesc);

pageContext.setAttribute("mdmcode",mdmcode);
pageContext.setAttribute("plant",plant);
pageContext.setAttribute("purchasingcode",purchasingcode);

pageContext.setAttribute("purchasinggroup",purchasinggroup);
pageContext.setAttribute("grprocessing",grprocessing);
pageContext.setAttribute("purchasingvaluekey",purchasingvaluekey);


pageContext.setAttribute("orderunit",orderunit);
pageContext.setAttribute("potext",potext);
//pageContext.setAttribute("reasonforedit",reasonforedit);
//new fields from form 2
pageContext.setAttribute("minshelf",minshelf);
pageContext.setAttribute("totalshelf",totalshelf);
pageContext.setAttribute("profitcentercode",profitcentercode);
pageContext.setAttribute("profitcenterdesc",profitcentercode);
pageContext.setAttribute("storagebin",storagebin);
pageContext.setAttribute("unitofissuecode",unitofissuecode);
pageContext.setAttribute("unitofissuedesc",unitofissuedesc);
pageContext.setAttribute("serialno",serialno);
pageContext.setAttribute("serialnodesc",serialnodesc);
//new fields from form 2

%>

<form action="PurchaseCheckerUpdate" method="post">
	<div class="scrollable">
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Purchasing & Plant Storage View</h3>
		   </div>   
   		<div class = "panel-body">
		<fieldset class="scheduler-border">
		<legend class="scheduler-border">Purchasing View</legend> 
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" required list="MdmCodeList" value="${mdmcode }" maxlength="8" onkeypress="return isNumber(event)"  readonly class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="Talend Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_materialType();">
			      <datalist id="MdmCodeList">
			      <c:forEach items="${listtd}" var="pg">
			      	<option value="${pg.talendcode}">${pg.talendcode}</option>  
	        	  </c:forEach>
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>		   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id = "mtcode" for="name">Material Code</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" id="matcode" name="matcode" readonly ></select>			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" required list="PlantList" value="${plant}" onkeypress="return isNumber(event)" maxlength="4" readonly class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Purchasing Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" required list="PurchasingGroupList" maxlength="40" value="${purchasinggroup }" readonly class="form-control input-sm " name="PurchasingGroup"  id="PurchasingGroup"  placeholder="Purchasing Group" onfocusout="PurchasingGroupFun()"  required autocomplete="off">
			      <datalist id="PurchasingGroupList">
			      <c:forEach items="${listpgroup}" var="pg">
			      	<option value=" ${pg.desc}" data-id="${pg.group}"></option>  
	        	  </c:forEach>
			      </datalist>
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>
				<input type="hidden" name="PurchasingGroupid" id="PurchasingGroupid" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" >Purchasing Value Key</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PurchaseKeyValList" maxlength="5" value="${purchasingvaluekey }" readonly class="form-control input-sm " name="PurchaseKeyVal"  id="PurchaseKeyVal"  placeholder="Purchasing Value Key"  onfocusout="PurchaseKeyValFun()"  required autocomplete="off">
			      <datalist id="PurchaseKeyValList">
			      <c:forEach items="${listpkey}" var="pg">
			      	<option value="${pg.purchasingkey}"></option>  
	        	  </c:forEach>
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>	
			      <input type="hidden" name="PurchaseKeyValid" id="PurchaseKeyValid" >	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name" >PO Text</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  value="${potext }" maxlength="132" placeholder="PO Text"  readonly class="form-control input-sm " name="potext"  id="potext" required autocomplete="off"  >			   
		      </div>
		    </div>
		    
		 <div class="form-group " <c:if test="${version < 1 }" > style='display:none;' </c:if>  >
	      <label class="control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" value="${reasonforedit}" disabled class="form-control input-sm" <c:if test="${access eq 'Read' }"> disabled </c:if>  id="reasonforedit" <c:if test="${status eq 'Active' }"> required </c:if> placeholder="Reason for Edi" name="reasonforedit" autocomplete="off">        
	      </div>
	    </div>
	    
	 
	    </div>    
   		
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" id="mattype" name="mattype" readonly></select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select id="MDesc" name="MDesc"  class="form-control input-sm" readonly>					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select class="form-control input-sm"   id="plantdesc" name="plantdesc" readonly></select>		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">GR. Processing Time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"
		       <c:choose>
        <c:when test="${grprocessing==null || grprocessing==''}">
          value=""
        </c:when>
        <c:otherwise>
       value="${grprocessing}"
        </c:otherwise> 
    </c:choose>
		      
		       maxlength="3" readonly placeholder="GR. Processing Time"onkeypress="return isNumber(event)" class="form-control input-sm input_text" name="ptime" autocomplete="off" id="ptime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Order Unit</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="OrderUnitList"maxlength="40" value="${orderunit }" readonly class="form-control input-sm " name="OrderUnit"  id="OrderUnit"  placeholder="Order Unit" onfocusout="OrderUnitFunc()" required autocomplete="off" >
			      <datalist id="OrderUnitList">
			      <c:forEach items="${listounit}" var="pg">
			      	<option value="${pg.text}" data-id="${pg.measureunit}"></option>  
	        	  </c:forEach>
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>
			      <input type="hidden" name="OrderUnitid" id="OrderUnitid" >
			      </div>
		    </div>
		   <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Model</label>
		      <div class="col-sm-8 input-group">
		      		 <input type="text" list="ModelList" maxlength="40" class="form-control input-sm " name="Model" readonly  id="Model" value="${modeldesc}"  placeholder="Model"  autocomplete="off" >
			      <datalist id="ModelList">
			      
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>
			      <input type="hidden" name="Modelid" id="Modelid" >                    	   
		      </div>
		    </div>
	    </div>
	    </fieldset>
	<fieldset class="scheduler-border">
		<legend class="scheduler-border">Plant Storage View</legend> 
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Rem. Shelf Life</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm " readonly placeholder="Min. Rem. Shelf Life"  onkeypress="return isNumber(event)" maxlength="5"
		       <c:choose> <c:when test="${minshelf==null || minshelf==''}"> value="" </c:when> <c:otherwise> value="${minshelf}" </c:otherwise>  </c:choose>
		       name="minshelf"  id="minshelf"  onfocusout="ProfitDesc();"  >		   
		      </div>
		</div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4">Profit Centre</label>
	      <div class="col-sm-8 input-group">
	      <select class="form-control" id="ProfitCenteid" name="ProfitCenteid" readonly>	        
	      </select>	
	      <select class="form-control input-sm" id="ProfitCentedec" readonly name="ProfitCentedec" style="display:none;">
	      </select>
	      </div>
	    </div>
        <div class="form-group ">
	      <label class="control-label col-sm-4" for="name">Unit of Issue</label>
	      <div class="col-sm-8 input-group">
	      <input type="text" list="UnitList" readonly value="${unitofissuedesc}" class="form-control input-sm " name="UnitDesc"  id="UnitDesc"  placeholder="Unit of Issue" required autocomplete="off" onfocusout="get_UnitIssue();">
		      <datalist id="UnitList">
		      <c:forEach items="${listui}" var="pg">
		      	<option value="${pg.text}" data-id="${pg.measureunit}"></option>  
        	  </c:forEach>
		      </datalist>
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>	
		      <input type="hidden" name="UintID" id="UintID" >	   
	      </div>
	    </div>
   		</div>
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Total Shelf Life</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" 
		      
		       <c:choose>
        <c:when test="${totalshelf==null || totalshelf==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${totalshelf}"
        </c:otherwise> 
    </c:choose>
		      
		       placeholder="Total Shelf Life" readonly onkeypress="return isNumber(event)" maxlength="5" class="form-control input-sm input_text" name="totalshelf"  id="totalshelf" >			   
		      </div>
		    </div>
		    		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Storage Bin</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  value="${storagebin}" placeholder="Storage Bin" readonly maxlength="10" class="form-control input-sm input_text" name="storagebin"  id="storagebin" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Serial Number Profile</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" list="SerialNoList" readonly value="${serialnodesc}" class="form-control input-sm " name="SerialNo"  id="SerialNo"  placeholder="Serial Number Profile" required autocomplete="off" onfocusout="get_Serial()">
			      <datalist id="SerialNoList">
			      <c:forEach items="${listno}" var="pg">
			      	<option value="${pg.des}" data-id="${pg.serialno}"></option>   
	        	  </c:forEach>
			      </datalist>   
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>
			      <input type="hidden" name="SerialNoid" id="SerialNoid" >         	   
		      </div>
		    </div>	
		    
   		</div>
   		</fieldset>
   
    <div class="col-md-2 col-md-offset-8">
    
    <input type="submit"  class="btn btn-primary form-control"  name="Approval" value="Approve"/></div> 

   	<div class="col-md-2"> <button type="button" class="btn btn-primary form-control" id="btnreject">Reject</button></div>
   	
  	<br><br>
  	<div id="rject" style="display:none;" class="col-md-offset-6">
  	<br>
  		<div class="form-group col-md-12 " style="margin-top:8px;">
	      <label class="control-label col-sm-4  " for="email">Reason for reject</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" class="form-control input-sm" id="rjcomments" name="rjcomments"  autocomplete="off" >        
	      </div>
	    </div>
	    <div class="col-md-3 col-md-offset-4"><input type="submit"  class="btn btn-success form-control" name="rejectyes" value="Yes"/></div>  
   		<div class="col-md-3"> <button type="button" class="btn btn-danger form-control" id="btnrejectno" >No</button></div>
	    
  	</div>
   		</div>
   		</div>
   		</div>
   	</div>
   	</div>
   	
  
</form>

<script type="text/javascript">
$(document).ready(function() {	
	
$("#btnreject").click(function(){
			$("#rject").css({ display: "block" });
	});
$("#btnrejectno").click(function(){
	$("#rject").css({display:"none"});
})
});
</script>
</body>
</html>
