<%@page import="com.tvs.Purchase.PlantCode"%>
<%@page import="com.tvs.Purchase.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>

<%@page import="com.tvs.Purchase.Model"%>
<%@page import="com.tvs.Purchase.ModelDAO"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.plantandstorage.Serialnoprofile"%>
<%@page import="com.tvs.plantandstorage.SerialnoprofileDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tvs.Purchase.Orderunit"%>
<%@page import="com.tvs.Purchase.OrderunitDAO"%>
<%@page import="com.tvs.Purchase.Purchasingvaluekey"%>
<%@page import="com.tvs.Purchase.PurchasingvaluekeyDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tvs.Purchase.Purchasinggroup" %>
<%@ page import="com.tvs.Purchase.PurchasinggroupDAO" %>
<%@page import="com.tvs.plantandstorage.Unitofissue"%>
<%@page import="com.tvs.plantandstorage.UnitofissueDAO"%>

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
<script>
function onlyAlpha(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) || (charCode >47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function datalistValidatormdm(modelname) {
	var obj = $("#MdmCodeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
function datalistValidatorplant(modelname) {
	var obj = $("#PlantList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function datalistValidatorpgroup(modelname) {
	var obj = $("#PurchasingGroupList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function datalistValidatorpvkey(modelname) {
	var obj = $("#PurchaseKeyValList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function datalistValidatororderunit(modelname) {
	var obj = $("#OrderUnitList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function MdmCode(){
	
	var mg = $("#MDMCode").val();
	var existingmg = $('h2').text();
	if (datalistValidatormdm(mg)===false) {
		
		alert(mg + " is not a valid MDM Code");
		$("#MDMCode").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}
function plants(){
	var mt = $("#plant").val();
	var existingmt = $('h2').text();
	if (datalistValidatorplant(mt)===false) {
		
		alert(mt + " is not a valid Plant Code");
		$("#plant").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
}

function pgroup(){
	var mg = $("#PurchasingGroup").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorpgroup(mg)===false) {

		alert(mg + " is not a valid Purchasing Group");
		$("#PurchasingGroup").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}

function pkeyval(){
	var mg = $("#PurchaseKeyVal").val();
	
	if(mg!='')
		{
	var existingmg = $('h2').text();
	if (datalistValidatorpvkey(mg)===false) {
		
		alert(mg + " is not a valid Purchase Key Value");
		$("#PurchaseKeyVal").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}}
}

function orderunit(){
	var mg = $("#OrderUnit").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatororderunit(mg)===false) {
		
		alert(mg + " is not a valid Order Unit");
		$("#OrderUnit").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}



function datalistValidatormodel(modelname) {
	var obj = $("#ModelList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}


function model(){
	var mg = $("#Model").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatormodel(mg)===false) {
		
		alert(mg + " is not a valid Model");
		$("#Model").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}
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
			url: "Plantmapping_Data/plantdescription.jsp",
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
	        }
	    });
}

function funcLoad(){
	$("#MDMCode").focus();	
	
}

function  SearchbyMDM()

{
 var mmcode=document.getElementById("mcode").value; 
 $.ajax({
		type: "POST",
		url: "Purchasingview2.jsp",    
		data : {
            "zzz":mmcode
        },
	
		cache: false,
		success: function(response)
        {
            $("#tableView").html(response);
        }
    });
	
}
function ShowEditPopup()
{	
	 // var sam=set.value;
	 var plantc=document.getElementById("pt").value; 
	  var mattype=document.getElementById("mt").value; 
	  var stat=document.getElementById("status").value; 
	  var apvstat=document.getElementById("approvalstatus").value; 
	  var ver=document.getElementById("version").value; 
	  
	    $.ajax({
			type: "POST",
			url: "Purchasingview.jsp",    
			data : {
	            "materialtype":mattype,
	            "plantv":plantc,
	            "status":stat,
	            "approvalstatus":apvstat,
	            "version":ver
	        },
		
			cache: false,
			success: function(response)
	        {
	            $("#tableView").html(response);
	        }
	    });
	   
}

function ShowChecker(){
	$.ajax({
		type: "POST",
		url: "PurchaseCheckerView.jsp",    			
		cache: false,
		success: function(response)
        {
			console.log(response);
            $("#tableView").html(response);
        }
    });
}

</script>

<script type="text/javascript">
 	$(document).ready(function() {	
 		
 		document.getElementById('matcode').style.pointerEvents = 'none';
		document.getElementById('mattype').style.pointerEvents = 'none';
		document.getElementById('MDesc').style.pointerEvents = 'none';
		document.getElementById('plantdesc').style.pointerEvents = 'none';
 		$("input[name=MDMCode]").on('change',function(){  
 		$("#plant").val('');
 		$('#plantdesc').val('');
 		var Mcode = $("#MDMCode").val();
 		
 		
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/materialtype.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
	            $("#mattype").html(response);
	        }
	    });
	    //plant 
	    $.ajax({
			type: "POST",
			url: "Purchase_Data/Plant.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {		
				console.log(response);
	            $("#PlantList").html(response);
	        }
	    });
	    //matcode
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
	    //
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/description.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {				
	            $("#MDesc").html(response);
	        }
	    });
	    //new validation
	    $.ajax({
			type: "POST",
			url: "Scr_Basic_Data/materialtype.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
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
				//$("#mattype").html(response);
	        }
	    });
	    
	    
 	});
 		
 		$("input[name=plant]").on('change',function(){ 			
 			var vals=$(this).val();
 		    //console.log(vals);
 		    
 		    //plant desc
 		    var Plant = $("#plant").val();	
 		    $.ajax({
 				type: "POST",
 				url: "PlantandStore_Data/plantdescription.jsp",
 				data: "Plant="+Plant,
 				cache: false,
 				success: function(response)
 		        {
 					
 		            $("#plantdesc").html(response);
 		        }
 		    });
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
 		    
 		});
 		//Purcharching group
 		$("input[name=PurchasingGroup]").on('change',function(){
 		var selected =  $("#PurchasingGroupList option[value='" + $('#PurchasingGroup').val() + "']").attr('data-id');	  
 		  var ss= document.getElementById('PurchasingGroupid').value =selected;
 		  
 		});
 		//
 		$("input[name=PurchaseKeyVal]").on('change',function(){
 			var selected = $('#PurchaseKeyVal').val();// $("#PurchaseKeyValList option[value='" + $('#PurchaseKeyVal').val() + "']").attr('data-id');	 
 			  var ss= document.getElementById('PurchaseKeyValid').value =selected;
 			 
 		});
 		//
 		$("input[name=OrderUnit]").on('change',function(){
 			var selected =  $("#OrderUnitList option[value='" + $('#OrderUnit').val() + "']").attr('data-id');	  
 			  var ss= document.getElementById('OrderUnitid').value =selected;
 			
 		});
 		
 		
 		$("input[name=Model]").on('change',function(){
 			var selected =  $("#ModelList option[value='" + $('#Model').val() + "']").attr('data-id');	  
 			  var ss= document.getElementById('Modelid').value =selected;
 			
 		});
 		//from form 2
 		$("input[name=minshelf]").on('change',function(){
 			console.log($('#Profitd').val());
 			var selected =  $("#ProfitList option[value='" + $('#Profitd').val() + "']").attr('data-id');
 			
 			
 		});
 		//
 		$("input[name=UnitDesc]").on('change',function(){
 		var selected =  $("#UnitList option[value='" + $('#UnitDesc').val() + "']").attr('data-id');	
 		     
 		  var ss= document.getElementById('UintID').value =selected;
 		 
 		 
 		});
 		//
 		$("input[name=SerialNo]").on('change',function(){
 		 var selected =  $("#SerialNoList option[value='" + $('#SerialNo').val() + "']").attr('data-id');
 		  var ss= document.getElementById('SerialNoid').value =selected; 
 		 console.log(selected);
 		});

 		//
 	})
 	
 	
 	function checkform()
   {
	$("#PurchasingGroup").prop("required",false);   
   }
 	function checkforms()
 	{
 		$("#PurchasingGroup").prop("required",true);   
	}
 	
 	function PurchasingGroupFun() { 
 		  var selected =  $("#PurchasingGroupList option[value='" + $('#PurchasingGroup').val() + "']").attr('data-id');	  
 		  
 		  if (typeof(selected) == 'undefined') {
 				 document.getElementById('PurchasingGroupid').value="";
 				 

 				}
 			 else
 				 {
 				 document.getElementById('PurchasingGroupid').value =selected;//$('#materialgroupid').val("ssss");

 				 }
 	}
 	function PurchaseKeyValFun() { 
 		  var selected =  $("#PurchaseKeyValList option[value='" + $('#PurchaseKeyVal').val() + "']").attr('data-id');	 
 		  var ss= document.getElementById('PurchaseKeyValid').value =selected;
 		  
 	}
 	function OrderUnitFunc() { 
 		  var selected =  $("#OrderUnitList option[value='" + $('#OrderUnit').val() + "']").attr('data-id');	  
 		  if (typeof(selected) == 'undefined') {
 				 document.getElementById('OrderUnitid').value="";
 				 

 				}
 			 else
 				 {
 				 document.getElementById('OrderUnitid').value =selected;//$('#materialgroupid').val("ssss");

 				 }
 	}
 	
 	
 	
 	function ModelFunc() { 
		  var selected =  $("#ModelList option[value='" + $('#Model').val() + "']").attr('data-id');	  
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('OrderUnitid').value="";
				 

				}
			 else
				 {
				 document.getElementById('Modelid').value =selected;//$('#materialgroupid').val("ssss");

				 }
	}
 	//from form 2
 	function datalistValidatorsrnolist(modelname) {
	var obj = $("#SerialNoList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

 	function datalistValidatorunit(modelname) {
	var obj = $("#UnitList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
 	function unitofissue(){
 		console.log("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
 		var mg = $("#UnitDesc").val();
 		if(mg!='')
 			{
 			
 			
 		var existingmg = $('h2').text();
 		if (datalistValidatorunit(mg)===false) {
 			
 			alert(mg + " is not a valid Unit of Issue");
 			$("#UnitDesc").val(existingmg).focus();

 				return false;
 		}		
 		else{
 			return true;
 		}
 			}
 	}
	function get_UnitIssue() { 
		  var selected =  $("#UnitList option[value='" + $('#UnitDesc').val() + "']").attr('data-id');	
		   
		  
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('UintID').value="";

				}
			 else
				 {
				 document.getElementById('UintID').value =selected;//$('#materialgroupid').val("ssss");

				 }
		  
	}
	function get_Serial() { 
		  var selected =  $("#SerialNoList option[value='" + $('#SerialNo').val() + "']").attr('data-id');	
		 
		  
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('SerialNoid').value="";

				}
			 else
				 {
				 document.getElementById('SerialNoid').value =selected;//$('#materialgroupid').val("ssss");

				 }
	}
	function serialnolist(){
		var mg = $("#SerialNo").val();
		if(mg!='')
			{
			
			
		var existingmg = $('h2').text();
		if (datalistValidatorsrnolist(mg)===false) {
			
			alert(mg + " is not a valid Serial Number Profile");
			$("#SerialNo").val(existingmg).focus();

				return false;
		}		
		else{
			return true;
		}
			}
	}
 		
</script>
</head>
<body >
<!--  <div style="overflow: scroll; height : 1000%; max-height:500px"> -->
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>

<% 

//role code 
String userid =(String) request.getAttribute("myTest");

String role=null;
String username=null;
String rolename=null;
String access=null;
//String mattype=null;
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
	pageContext.setAttribute("access", access);


TalendcodesDAO td =new TalendcodesDAO();
PurchasingvaluekeyDAO pdk=new PurchasingvaluekeyDAO();
OrderunitDAO ou=new OrderunitDAO();
PurchasinggroupDAO pda =new PurchasinggroupDAO();
ModelDAO mdo =new ModelDAO();
PlantCodeDAO pcd=new PlantCodeDAO();
//MaterialtypeDAO m =new MaterialtypeDAO();
Material_Material_Type_DAO m =new Material_Material_Type_DAO();
try
{
	
	//List<Materialtype> listm = m.materiallist(rolename);
	//request.setAttribute("listmaterial",listm);	
	
	List<Material_Material_Type> listm = m.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	
	List<PlantCode> listpc=pcd.plantcodelist();
	request.setAttribute("listpc",listpc);
	
	List<Purchasinggroup> listg = pda.pgrouplist();
	request.setAttribute("listpgroup",listg);	
	
	List<Purchasingvaluekey> listk = pdk.pkeylist();
	request.setAttribute("listpkey",listk);
	
	List<Orderunit> listou = ou.unitlist();
	request.setAttribute("listounit",listou);
	
	UnitofissueDAO ui=new UnitofissueDAO();
	List<Unitofissue> listui = ui.unitlist();
	request.setAttribute("listui",listui);
	
	List<Model> listmodel =mdo.modellist();
	request.setAttribute("listmodel",listmodel);
	//from from plant and storage
	SerialnoprofileDAO sno=new SerialnoprofileDAO();
	List<Serialnoprofile> listno = sno.seriallist();
	request.setAttribute("listno",listno);
	
	Set<Talendcodes> listtd =td.purchaseandplantstoragelist();
	request.setAttribute("listtd",listtd);

	/* if(mattype.equals("None"))
	{
		Set<Talendcodes> listtd =td.purchaseandplantstoragelist();
		request.setAttribute("listtd",listtd);
	}
	
	else
	{
		Set<Talendcodes> listtd=td.purchaseandplantstoragelist(mattype);
		request.setAttribute("listtd",listtd);
	} */
	}
	catch(Exception e)
	{
		
		
	}
%>
<script type="text/javascript">

var abc="<%=access%>";


if(abc=='Read')
{

$('html').bind('keypress', function(e)
			{
			   if(e.keyCode == 13)
			   {
			      return false;
			   }
			});


}


</script>
<form action="Purchasesave" method="post">
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
		      	<input type="text" required tabindex="1" list="MdmCodeList" maxlength="8" maxlength="30"  onkeypress="return isNumber(event)"  class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="Talend Code" onchange="return MdmCode();" autocomplete="off" >
			      <datalist id="MdmCodeList">
			      <c:forEach items="${listtd}" var="pg">
			      	<option value="${pg.talendcode}">${pg.talendcode}</option>  
	        	  </c:forEach>
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>		   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="mtcode"  for="name">Material Code</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex="-1" id="matcode" maxlength="40"  name="matcode" readonly></select>			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" required list="PlantList" tabindex="2" maxlength="4" onkeypress="return isNumber(event)" class="form-control input-sm " name="plant" placeholder="Plant" id="plant" onchange="return plants();" required autocomplete="off"  >
		      <datalist id="PlantList">
		      
		      </datalist>
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Purchasing Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" required tabindex="3" list="PurchasingGroupList" maxlength="40"  required class="form-control input-sm " onchange="return pgroup();" name="PurchasingGroup"  id="PurchasingGroup" onfocusout="PurchasingGroupFun()"  placeholder="Purchasing Group"   autocomplete="off">
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
		      <label class="control-label col-sm-4">Purchasing Value Key</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="5" list="PurchaseKeyValList" maxlength="5"class="form-control input-sm " onchange="return pkeyval();" name="PurchaseKeyVal"  id="PurchaseKeyVal"  placeholder="Purchasing Value Key"   autocomplete="off">
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
		      <label class="control-label col-sm-4" for="name">PO Text</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="7" class="form-control input-sm "maxlength="132"placeholder="PO Text" name="potext"  id="potext" onkeypress="return onlyAlpha(event,this);" autocomplete="off"  >			   
		      </div>
		    </div>
	    </div>    
   		
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class=" required control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex = "-1" readonly id="mattype" name="mattype" ></select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select id="MDesc" tabindex = "-1" name="MDesc" readonly class="form-control input-sm" >					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select class="form-control input-sm" tabindex = "-1" readonly id="plantdesc" name="plantdesc" ></select>		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">GR. Processing Time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="4" class="form-control input-sm input_text"  autocomplete="off" placeholder="GR. Processing Time" maxlength="3" onkeypress="return isNumber(event)" name="ptime"  id="ptime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Order Unit</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="6" list="OrderUnitList" maxlength="40" class="form-control input-sm " name="OrderUnit"  id="OrderUnit"  placeholder="Order Unit"  onchange="return orderunit();" onfocusout="OrderUnitFunc()" autocomplete="off" >
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
		      		 <input type="text" tabindex="8" list="ModelList" maxlength="40" class="form-control input-sm " name="Model"  id="Model"  placeholder="Model" onfocusout="ModelFunc()" onchange="return model();"  autocomplete="off" >
			      <datalist id="ModelList">
			      <c:forEach items="${listmodel}" var="pg">
			      	<option value="${pg.description}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
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
               <input type="text" tabindex = "9" class="form-control input-sm " placeholder="Min. Rem. Shelf Life" maxlength="5" onkeypress="return isNumber(event)"name="minshelf"  id="minshelf"  autocomplete="off" >		   
               </div>
           	</div>
            <div class="form-group ">
              <label class="required control-label col-sm-4">Profit Centre</label>
              <div class="col-sm-8 input-group">
              <select class="form-control" tabindex = "-1" readonly id="ProfitCenteid" name="ProfitCenteid" required> 
              </select>	
              <select class="form-control input-sm"  id="ProfitCentedec"  name="ProfitCentedec" style="display:none;">  
              </select>
              </div>
            </div>
           <div class="form-group ">
             <label class="control-label col-sm-4" for="name">Unit of Issue</label>
             <div class="col-sm-8 input-group">
             <input type="text" tabindex = "12" list="UnitList" class="form-control input-sm " maxlength="40" name="UnitDesc"  id="UnitDesc"  onchange="return unitofissue();" placeholder="Unit of Issue"  autocomplete="off" onfocusout="get_UnitIssue();">
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
         <div class = "col-md-6">
         	<div class="form-group ">
                <label class="control-label col-sm-4" for="name">Total Shelf Life</label>
                <div class="col-sm-8 input-group">
                	<input type="text" tabindex = "10" class="form-control input-sm input_text" maxlength="5" placeholder="Total Shelf Life" onkeypress="return isNumber(event)" name="totalshelf"  id="totalshelf" autocomplete="off">			   
                </div>
           </div>
           <div class="form-group ">
                <label class="control-label col-sm-4" for="name">Storage Bin</label>
                <div class="col-sm-8 input-group">
                <input type="text" tabindex = "11" onkeypress="return onlyAlpha(event,this);"  class="form-control input-sm input_text" placeholder="Storage Bin"  maxlength="10" name="storagebin"  id="storagebin" autocomplete="off">			   
                </div>
           </div>
	    	<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Serial Number Profile</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" tabindex = "13" list="SerialNoList" class="form-control input-sm " maxlength="30" name="SerialNo"  id="SerialNo" onchange="return serialnolist();" placeholder="Serial Number Profile" onfocusout="get_Serial()"  autocomplete="off" >
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
               <%
   		if(rolename!=null && role !=null && access!=null)
    	   {
		   if(rolename.equals(role)  && access.equals("Read"))
		    {
		   %>
		    <div class="col-md-1 col-md-offset-8"><input type="submit"  class="btn btn-primary form-control disabled"name="Save"  value="Save" onclick="SaveFunc()"/></div>
		    <div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
		    
		    <div class="col-md-1"><a href="Purchase_Plant_Storage_View.jsp"  class="btn btn-primary form-control disabled">Clear</a></div>
		    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   
		   <%
		    }
		  
		   
		   else
		   {
		   %>
		     <div class="col-md-1 col-md-offset-8"><input type="submit" name="Save" class="btn btn-primary form-control"  value="Save" onclick="checkform()"/></div>
			 <div class="col-md-1"><button type="submit" onclick="return (checkforms())" class="btn btn-primary" name="Submit" id="submit" value="Submit">Submit </button> </div>
			<!-- <div class="col-md-1"><button type="submit" class="btn btn-primary  btn-md" name="Submit"  value="Submit">Submit</button></div> -->
		     <div class="col-md-1"><a href="Purchase_Plant_Storage_View.jsp"  class="btn btn-primary form-control">Clear</a></div>
		     <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   
		   <%}}%>

            </div>
	    
   		
   		<!-- Role Based changed the button showing -->
   		</div>
   		</div>
        </div>
        </div>
        </form>
   		

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 80%;">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="container-fluid" id="data">
 
  
  <div class="row" style="margin-top: 15px;  ">
    <div class="col-sm-12"  align="right">
     <div style="border: 1px solid #DCDCDC;">
<label >Material Type</label>
      <select id="mt" >
  
  
  <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.materialtypecode}" > ${c.materialtypedesc} </option>		             
		        </c:forEach>   
 
</select>
<label >Plant</label>
 <select id="pt">
     
          <c:forEach items="${listpc}" var="pg">
			      	<option value="${pg.plant}">${pg.plant}</option>  
	        	  </c:forEach>
     </select>
 <label style="font-weight:normal;">Status</label>
  <select id="status">
  <option value="Select"  selected >Select</option>
   <option value="Draft"  >Draft</option>
    <option value="Inactive"  >Inactive</option>
     <option value="Active" >Active</option>
 </select>
 <label style="font-weight:normal;">Approval Status</label>
  <select  id="approvalstatus">
  <option value="Select"  selected >Select</option>
   <option value="Pending"  >Pending</option>
    <option value="Rejected"  >Rejected</option>
     <option value="Approved" >Approved</option>
 </select>
    
    
    <label style="font-weight:normal;">Version</label>
        <input type="text" onkeypress="return isNumber(event)"  name="version" id="version"  maxlength="5" size="5"> 
    
     <button style="margin-top: 5px;margin-bottom: 5px;margin-right: 5px"  type="button" onclick="ShowEditPopup();hide();" class="btn btn-primary">Search</button><br>
     
     </div>
     <div style="border: 1px solid #DCDCDC; margin-top: 20px;margin-bottom: 5px">
       <label >MDMCode</label>
    <input type="text" autocomplete="off" onkeypress="return isNumber(event)"  name="MD" id="mcode"  maxlength="10" size="8"> 
    <button style="margin-top: 5px;margin-bottom: 5px;margin-right: 5px"  type="button" onclick="emptycheck();" class="btn btn-primary">Search</button>
     </div>
    </div>
  </div>
</div>
      <div class="modal-body">
        <span id="tableView">
        </span>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="javascript:window.location='Purchasing_Plant_Storage_View.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
function emptycheck()
{
	var mmcode=document.getElementById("mcode").value;
	if(mmcode=="")
		{
		alert("please enter the MDMCode")
		return false;
		}
	hide();
	SearchbyMDM();
	return true;
}
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
$(".modal").on("hidden.bs.modal", function () {
	  window.location = "Purchasing_Plant_Storage_View.jsp";
	});
</script>
</body>
</html>
