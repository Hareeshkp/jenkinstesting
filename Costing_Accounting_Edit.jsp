<%@page import="com.tvs.costing.PlantCode"%>
<%@page import="com.tvs.costing.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@page import="com.tvs.costing.CostingDAO"%>
<%@page import="com.tvs.costing.Costing"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.costing.Overheadgroup"%>
<%@page import="com.tvs.costing.OverheadgroupDAO"%>
<%@page import="com.tvs.costing.Variancekey"%>
<%@page import="com.tvs.costing.VariancekeyDAO"%>
<%@page import="com.tvs.costing.Origingroupmaster"%>
<%@page import="com.tvs.costing.OrigingroupmasterDAO"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.costing.SpecialProcurementDAO" %>
<%@page import="com.tvs.costing.SpecialProcurement"%>
<%@page import="com.tvs.costing.Valuationcatlist" %>
<%@page import="com.tvs.costing.Plantlocationcode" %>
<%@page import="com.tvs.costing.SelectedPlantLocationcode" %>
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
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
 

<script type="text/javascript">
$(document).ready(function() {	
	
	document.getElementById('matcode').style.pointerEvents = 'none';
	document.getElementById('mattype').style.pointerEvents = 'none';
	document.getElementById('MDesc').style.pointerEvents = 'none';
	document.getElementById('plantdesc').style.pointerEvents = 'none';
	
});
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
		
		
function checkform()
{
	$("#Origingroup").prop("required",false);
	$("#ValuationClass").prop("required",false);
}
function checkforms()
{
	var materialtype = $("#mattype").val();
	if(materialtype!=null)
	{
		materialtype =  materialtype.split("-")[0]
		if(materialtype == 'ZROH')
		{
			$("#Origingroup").prop("required",true);
		}
		if( ss =="ZPRT"||ss =="ZRTP" ||ss =="ZCAP" || ss=="ZNBW")
		{
			$("#ValuationClass").prop("required",false);
		}
	}
}
function datalistValidatormdm(modelname) {
	var obj = $("#MdmCodeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
function mdmcode(){
	
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

function datalistValidatorplant(modelname) {
	var obj = $("#PlantList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
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

function datalistValidatORGP(modelname) {
	var obj = $("#OverheadGroupList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function overheadgroupmt(){
	var mt = $("#OverheadGroup").val();
	if(mt!='')
		{
		
		
	var existingmt = $('h2').text();
	if (datalistValidatORGP(mt)==false) {
		
		alert(mt + " is not a valid Overhead Group");
		$("#OverheadGroup").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}


function datalistValidatorvkey(modelname) {
	var obj = $("#VarianceKeyList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function VarianceKeys(){
	var mt = $("#VarianceKey").val();
	if(mt!='')
		{
	var existingmt = $('h2').text();
	if (datalistValidatorvkey(mt)==false) {
		
		alert(mt + " is not a valid  Variance Key");
		$("#VarianceKey").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}

function datalistValidatorogroup(modelname) {
	var obj = $("#OrigingroupList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function origingroup(){
	var mt = $("#Origingroup").val();
	if(mt!='')
		{
		
		
	var existingmt = $('h2').text();
	if (datalistValidatorogroup(mt)===false) {
		
		alert(mt + " is not a valid Origin Group");
		$("#Origingroup").val(existingmt).focus();
			return false;
	}		
	else{
		return true;
	}
		}
}
//new fields from form 2
function Validationclass(){
	var mt = $("#ValuationClass").val();
	
	if(mt!='')
		{
		
		
	var existingmt = $('h2').text();
	if (datalistValidatorvclass(mt)==false) {
		
		alert(mt + " is not a valid Validation  Class");
		$("#ValuationClass").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}
function ValclsFun() {
	  var selected =  $("#ValuationClassList option[value='" + $('#ValuationClass').val() + "']").attr('data-id');	  
	 	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ValuationClassid').value="";

		}
	 else
		 {
		 document.getElementById('ValuationClassid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	
	  
}
function get_HSNCode()
{
	
	var Mcode = $("#MDMCode").val();
		
	    $.ajax({
			type: "POST",
			url: "Accounting_Data/HSNCode.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
	            $("#HSNw").html(response);
				$("#HSNw1").hide();
	        }
	    });
}
function get_ValuationClass()
{
	
	var Mcode = $("#MDMCode").val();
	    $.ajax({
			type: "POST",
			url: "Accounting_Data/ValuationClass.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
				
	            $("#ValuationClassList").html(response);	            
	        }
	    });	   
}


//new fields from form 2



function get_materialcode()
{
	var Mcode = $("#MDMCode").val();
	console.log(Mcode);
		
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
	console.log(Plant);
	    $.ajax({
			type: "POST",
			url: "PlantMapping_Data/plantdescription.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {				
	            $("#plantdesc").html(response);
	        }
	    });
}
    
function get_Origingroup()
{
	console.log("true");
	var Mcode = $("#MDMCode").val();
		
	    $.ajax({
			type: "POST",
			url: "orgingroup.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
				console.log(response);
	           // $("#OrigingroupList").html(response);	
				$("#Origingroup").html(response);
	        }
	    });
}
    
function OverFun() {
	  var selected =  $("#OverheadGroupList option[value='" + $('#OverheadGroup').val() + "']").attr('data-id');
	  

	  
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('OverheadGroupid').value="";

		}
	 else
		 {
		 document.getElementById('OverheadGroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function varkeyFun() {
	  var selected =  $("#VarianceKeyList option[value='" + $('#VarianceKey').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('VarianceKeyid').value="";

		}
	 else
		 {
		 document.getElementById('VarianceKeyid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
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
	            var str = response;
	            var res = str.split("-");	
		        //var ss=res[1];
		        var ss=res[2];
		        var spl=ss.split(">");
		        firstChar=spl[0].replace('"','');
		        //firstChar=spl[0].slice(0,-1);
		        if( firstChar =="ZROH" ){
		    		
		    		$("#Origingroup").prop("required",true);
		    		$("#org").addClass("required");
		    		//$("#org").removeClass("mandatory");
		    	}
		    	else{
		    		console.log("Org");
		    		$("#Origingroup").prop("required",false);
		    		$("#org").removeClass("required");
		    		//$("#org").addClass("mandatory");
		    	}
		        var mtcode = firstChar;
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
function OrgFun() {
	  var selected =  $("#OrigingroupList option[value='" + $('#Origingroup').val() + "']").attr('data-id');	  
	
	 
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Origingroupid').value="";

		}
	 else
		 {
		 document.getElementById('Origingroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function  SearchbyMDM()

{
 var mmcode=document.getElementById("mcode").value; 

 $.ajax({
		type: "POST",
		url: "Costing_Accounting_Modal_View2.jsp",    
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
			url: "Costing_Accounting_Modal_View.jsp",    
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

function validation(){
	console.log($("#mattype").val());
	
}
function get_Pricedetermation(){
	
	
	var Mcode = $("#MDMCode").val();	
	var Plant = $("#plant").val();
	var firstChar;
	$.ajax({
		type: "POST",
		url: "Accounting_Data/PriceControl.jsp",
		 data : {
	            "materialtype":Mcode,
	            "plant":Plant
	        },
		cache: false,
		success: function(response)
        {			
			console.log(response);	
	        var str = response;
	        var res = str.split("-");
	        console.log(res[1]);
	        var strfst=res[1];
	        firstChar=strfst.charAt(0);
	        console.log(firstChar);
            $("#PriceControl").html(response);
            $.ajax({
    			type: "POST",
    			url: "Accounting_Data/Pricedetermination.jsp",
    			data: "materialtype="+firstChar,		
    			cache: false,
    			success: function(response)
    	        {	
    				console.log(response);
    	            $("#Pricedetermination").html(response);
    	        }
    	    });
        }

    });
}

</script>


</head>
<body onload="get_materialcode();vclassvalidate();get_description();get_PlantDesc();get_materialType();get_Origingroup();OverFun();varkeyFun();OrgFun();validation();get_Pricedetermation();get_HSNCode();get_ValuationClass();">
<div style="overflow: scroll; height : 90%; max-height:600px">
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
     access=rr.getCostingAccounting();
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
OverheadgroupDAO  ovrDAO=new OverheadgroupDAO();
VariancekeyDAO vkyDAO= new VariancekeyDAO();
OrigingroupmasterDAO ormDAO=new OrigingroupmasterDAO();
PlantCodeDAO pcd=new PlantCodeDAO();
//MaterialtypeDAO m =new MaterialtypeDAO();
Material_Material_Type_DAO m =new Material_Material_Type_DAO();
SpecialProcurementDAO spldao = new SpecialProcurementDAO();



try
{
	//List<Materialtype> listm = m.materiallist(rolename);
	List<Material_Material_Type> listm = m.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	
	//List<PlantCode> listpc=pcd.plantcodelist(mattype);
	List<PlantCode> listpc=pcd.plantcodelist1();

	request.setAttribute("listpc",listpc);
	Set<Talendcodes> listtd =td.costlist();
	request.setAttribute("listtd",listtd);
	/* if(mattype.equals("None"))
	{
		Set<Talendcodes> listtd =td.costlist();
		request.setAttribute("listtd",listtd);
	}

	else
	{
		Set<Talendcodes> listtd=td.costlist(mattype);
		request.setAttribute("listtd",listtd);
	} */
List<Overheadgroup> listover =ovrDAO.getoverheadgroup();
request.setAttribute("listover",listover);
List<Variancekey> listvky =vkyDAO.getvariancekey();
request.setAttribute("listvky",listvky);
List<Origingroupmaster> listorm =ormDAO.getOrigingroupmaster();
request.setAttribute("listorm",listorm);
//new fields from form 2
List<SpecialProcurement> listsp = spldao.getSpecialProcure();
request.setAttribute("specialprocurementlist", listsp);
//
}
catch(Exception e)
{
	
}
Integer sid=Integer.parseInt(request.getParameter("id"));  
String plant=request.getParameter("plant");




Costing cobj=CostingDAO.getCostingByTalendcode(sid, plant);
Integer mdmcode=cobj.getMdmcode();
String plantcode=cobj.getPlantcode();
String overheadgroup=cobj.getOverheaddesc();
String costinglotsize=cobj.getCostlotsize();
Boolean matiscosted=cobj.getMateriaCosted();
Boolean matrelated=cobj.getMaterelated();
String variancekey=cobj.getVariancepdesc();
String origingroup=cobj.getOrigingroupdesc();
String reasonforedit=cobj.getReasonforedit();

Integer valcatcode=cobj.getvaluationclasscode();

String matcode=cobj.getMaterialtypecode();


String status=cobj.getStatus();
String appstus=cobj.getApprovalprocess();
// new fields from form 2
Integer valuationclasscode = cobj.getvaluationclasscode();
String valuationclassdesc = cobj.getvaluationclassdesc();
String valuationcatcode = cobj.getvaluationcatcode();
String valuationcatdesc = cobj.getvaluationcatdesc();
String pricecontrolcode = cobj.getpricecontrolcode();
String pricecontroldesc = cobj.getpricecontroldesc();
String pricedeterminationcode = cobj.getpricedetermination();
String hsncode = cobj.gethsnw();
String valuationcategoryvalues = cobj.getmultiselectvalc();
Boolean donotcost = cobj.getdonotcost();
String specialprocurementcostcode = cobj.getspecialprocurementcostcode();
String specialprocurementcostdesc = cobj.getspecialprocurementcostdesc();


Valuationcatlist obj = new Valuationcatlist();
List<Plantlocationcode> plantlocationlist = obj.getvaluationcatplantcodes(valuationcatdesc);
List<SelectedPlantLocationcode> selectedplantlocationlist = obj.getvaluationcatplantcodesoncategory(mdmcode,plantcode);


pageContext.setAttribute("mdmcode",mdmcode);
pageContext.setAttribute("plantcode",plantcode);
pageContext.setAttribute("overheadgroup",overheadgroup);

pageContext.setAttribute("costinglotsize",costinglotsize);
pageContext.setAttribute("matiscosted",matiscosted);
pageContext.setAttribute("matrelated",matrelated);


pageContext.setAttribute("variancekey",variancekey);
pageContext.setAttribute("origingroup",origingroup);
pageContext.setAttribute("reasonforedit",reasonforedit);

pageContext.setAttribute("status",status);
pageContext.setAttribute("appstus", appstus);

pageContext.setAttribute("donotcost",donotcost);
pageContext.setAttribute("specialprocurementcost", specialprocurementcostdesc);
pageContext.setAttribute("specialprocurementcostid",specialprocurementcostcode);

pageContext.setAttribute("valuationclasscode",valuationclasscode);
pageContext.setAttribute("valuationclassdesc",valuationclassdesc);

pageContext.setAttribute("valuationcatcode",valuationcatcode);
pageContext.setAttribute("valuationcatdesc",valuationcatdesc);

pageContext.setAttribute("Pricedetermination", pricedeterminationcode);

pageContext.setAttribute("plantlocationlist", plantlocationlist);
pageContext.setAttribute("selectedplantlocationlist", selectedplantlocationlist);




%>

<script type="text/javascript">
function vclassvalidate()
{
var ss="<%=matcode%>";
	console.log("yyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
	console.log(ss)
	 if( ss =="ZPRT"||ss =="ZRTP" || ss =="ZCAP" || ss=="ZNBW"){
     	$("#ValuationClass").prop("required",false);
 		//$("#valcls").addClass("mandatory");
 		$("#valcls").removeClass("required");


 		
 	}
 	else{
 		$("#ValuationClass").prop("required",true);
 		//$("#valcls").removeClass("mandatory");
 		$("#valcls").addClass("required");


 	}
	 
	 var dd="<%=valcatcode%>";
	 if(dd = "null")
 	{
		 //$("#valcat").addClass("mandatory");
		 	$("#valcat").removeClass("required");


 	}

 else
 	{
	 	//$("#valcat").removeClass("mandatory");
	 	$("#valcat").addClass("required"); 	
 	}
	
	}

 function abc()
 {
	 
 var clr="<%=status%>";
 console.log(clr);
 var appstus="<%=appstus%>";
 console.log(appstus);
 if(clr=='Draft')
	 {
	 console.log("asdf");
	 draftClr();
	 }
 else
	 {
	
	 //activclr();
	 }
 if(appstus=='Rejected'){
	 draftClr();
 }
 }
 
 function draftClr()
 {	
	 
	// $("#PurchasingGroup").val('');
	
	 $("#OverheadGroup").val('');
	// $("#MateriaCostedlid ").val(''); //checkbox
	 $('#MateriaCostedlid').prop('checked', false);
	 $("#VarianceKey").val('');

	 $("#costlotsize").val('');
	 //$("#MaterialRelatedOriginid").val('');
	 $('#MaterialRelatedOriginid').prop('checked', false);
	 $("#Origingroup").val('');
 }
 
 
 	
	 
	
 
 </script>
 	<form action="Costingupdate" method="post">
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		<div class = "panel-heading">
      		<h3 class = "panel-title">Costing & Accounting View</h3>
  		</div>     
   		<div class = "panel-body">
	    <fieldset class="scheduler-border">
		<legend class="scheduler-border">Costing View</legend> 
   		<div class="col-md-6">
   		
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="MdmCodeList" tabindex = "-1" readonly value="${mdmcode}" onchange="return mdmcode();" class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off" onfocusout="get_Origingroup();get_description();get_materialcode();get_Plant();get_materialType();">
			      <datalist id="MdmCodeList">
			      <c:forEach items="${listtd}" var="pg">
			      	<option value="${pg.talendcode}">${pg.talendcode}</option>  
	        	  </c:forEach>
			      </datalist>	
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id ="mtcode" for="name">Material Code</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex = "-1" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList" tabindex = "-1" readonly  value="${plantcode }" onchange="return plants" class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Overhead Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="OverheadGroupList" tabindex = "1" value="${overheadgroup }" onchange="return overheadgroupmt();" autocomplete="off"  class="form-control input-sm input_text" name="OverheadGroup"  id="OverheadGroup"   placeholder="Overhead Group" onfocusout="OverFun();" 
		      <c:if test="${status eq 'Active' }"> readonly </c:if>
		      >
			   <datalist id="OverheadGroupList">
			   <c:forEach items="${listover}" var="pg">
			      	<option value="${pg.description}" data-id="${pg.overheadgroup}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="OverheadGroupid" id="OverheadGroupid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-6">Material Is Costed with Qty Str.</label>
		      <div class="col-sm-6 input-group">
		      		   <input tabindex = "3" type="checkbox" 
		      		   
		      		       <c:if test="${matiscosted == 'true'}">checked="checked"</c:if>
		      		   <c:if test="${status eq 'Active' }"> disabled="disabled" </c:if>	
		      		   	      		   
		      		   name="MateriaCostedlid" id="MateriaCostedlid" >	
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Variance Key</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex = "5" list="VarianceKeyList"  value="${variancekey }"class="form-control input-sm input_text" onchange="return  VarianceKeys(); " name="VarianceKey"  id="VarianceKey" autocomplete="off"  autocomplete="off"  placeholder="Variance Key" onfocusout="varkeyFun();"
		      <c:if test="${status eq 'Active' }"> readonly </c:if>
		      >
			   <datalist id="VarianceKeyList">
			   <c:forEach items="${listvky}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="VarianceKeyid" id="VarianceKeyid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-6">Do Not Cost</label>
		      <div class="col-sm-6 input-group">
		      		   <input tabindex = "7" type="checkbox" 
		      		   
		      		       <c:if test="${donotcost == 'true'}">checked="checked"</c:if>
		      		   <c:if test="${status eq 'Active' }"> disabled="disabled" </c:if>	
		      		   	      		   
		      		   name="donotcost" id="donotcost" >	
		      </div>
		    </div>
		     	
		     
		     	
		     		    
	    </div>    
   		
   		<div class="col-md-6">
   			<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex = "-1" id="mattype" name="mattype" readonly></select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select id="MDesc" tabindex = "-1" class="form-control input-sm" name="MDesc" readonly>					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select class="form-control input-sm" tabindex = "-1" id="plantdesc" name="plantdesc" readonly></select>		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Costing Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" tabindex = "2"  value="${costinglotsize}" name="costlotsize"  id="costlotsize" 
		      <c:if test="${status eq 'Active' }"> readonly </c:if>>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-6">Material Related Origin</label>
		      <div class="col-sm-6 input-group">
		      		   <input tabindex = "4" type="checkbox" readonly 
		      		   
		      		       <c:if test="${matrelated == 'true'}">checked="checked"</c:if>
		      		   <c:if test="${status eq 'Active' }"> disabled="disabled" </c:if>	
		      		   	      		   
		      		   name="MaterialRelatedOriginid" id="MaterialRelatedOriginid" >	
		      </div>
		    </div>
		    <!-- <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory">Material Related Origin</label>
		      <div class="col-sm-8 input-group">
			      <input type="checkbox" tabindex = "4" readonly name="MaterialRelatedOriginid" 
			      <c:if test="${matrelated == 'true'}">checked="checked" </c:if>
			      <c:if test="${status eq 'Active' }"> disabled="disabled" </c:if>
			      id="MaterialRelatedOriginid" >			   
		      </div>
		    </div> -->
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name" id="org">Origin group</label>
		      <div class="col-sm-8 input-group">   
			    <input type="text" list="OrigingroupList" tabindex = "6" autocomplete="off"   class="form-control input-sm input_text" value="${origingroup}" name="Origingroup" onchange="return origingroup();"  id="Origingroup" onfocusout="OrgFun()"  placeholder="Origin group"
			    <c:if test="${status eq 'Active' }"> readonly </c:if>>
			   <datalist id="OrigingroupList">
				   <c:forEach items="${listorm}" var="pg">
				      	<option value="${pg.origindesc}" data-id="${pg.origin}"></option>  
		           </c:forEach>
			   </datalist>		
			    <span class="glyphicon glyphicon-search form-control-feedback"></span>        
			           
		        <input type="hidden" name="Origingroupid" id="Origingroupid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name" id="org">Special Procurement Cost</label>
		      <div class="col-sm-8 input-group">
	   
			    <input type="text" tabindex = "8" list=SpecialProcuremetCostList autocomplete="off" class="form-control input-sm input_text" value="${specialprocurementcost}" name=specialprocurementcost id="specialprocurementcost" placeholder="SpecialProcurement Cost"
			    <c:if test="${status eq 'Active' }"> readonly </c:if>
			    >
			   <datalist id="SpecialProcuremetCostList">
			   <c:forEach items="${specialprocurementlist}" var="spc">
			      	<option value="${spc.spdescription}" data-id="${spc.spcode}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
			           
		        <input type="hidden" name="specialprocurementcostid" id="specialprocurementcostid" value="${specialprocurementcostid}" >
		        		   
		      </div>
		    </div>
	   	</div>	
	   	</fieldset>
	    <fieldset class="scheduler-border">
		<legend class="scheduler-border">Accounting View</legend> 
  		 <div class="col-md-6">
  		 <div class="form-group ">
		      <label class="control-label col-sm-4" id="valcls" for="name">Valuation Class</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex = "9" list="ValuationClassList"   value="${valuationclassdesc}" onchange="return Validationclass();" class="form-control input-sm " name="ValuationClass"  id="ValuationClass"  autocomplete="off" onfocusout="ValclsFun()" 
		      <c:if test="${status eq 'Active' }"> readonly </c:if>>
		      <datalist id="ValuationClassList">		      
		      </datalist>	
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>
		      <input type="hidden" name="ValuationClassid" readonly id="ValuationClassid" value="${valuationclasscode}" >		   
		      </div>
		   </div>
		   <div class="form-group ">
		      <label class="required control-label col-sm-4">Price Control</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex = "-1" readonly id="PriceControl" name="PriceControl" onfocusout="get_materialPriceCat()">
		      </select>			   
		      </div>
		   </div>
		   <div class="form-group">
		      <label class="control-label col-sm-4" for="name">Valuation Cat.</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex = "-1" list="ValuationCatlist" readonly  value="${valuationcatdesc}"  class="form-control input-sm " name="ValuationCat"  id="ValuationCat" autocomplete="off"  
		      <c:if test="${status eq 'Active' }"> readonly </c:if>
		      >
		      <datalist id="ValuationCatlist">
		      
		      </datalist>	
		      <input type="hidden" name="ValuationCatid"  id="ValuationCatid" value="${valuationcatcode}" >		   
		      </div>
		   </div>
		   <div class="form-group">
		     <label class="control-label col-sm-4" id="multiselectval"></label>
		     <div class="col-sm-8 input-group">
		     	<select class="form-control input-sm " tabindex = "10"  multiple="multiple" name="multiselectvalc" id="multiselectvalc" >
		     	<c:forEach items="${plantlocationlist}" var="m">  		            
		     	<option value="${m.plantlocation}"
		     	<c:forEach items="${selectedplantlocationlist}" var="mt">  	
		     	<c:if test="${m.plantlocation eq mt.selectedplantlocation}">selected</c:if>
		        </c:forEach>		            
		           > ${m.plantlocation} </option>		             
		        </c:forEach>		             
		     			
   				</select>
		      </div>
		    </div>	
		   
		   	    
  		 </div>	
  		 <div class="col-md-6">
  		 	<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">HSN Code</label>
		      <div class="col-sm-8 input-group">
		      <div id="HSNw"></div>
		      <input type="text" tabindex = "-1" name="HSNw1" id="HSNw1" readonly  class="form-control input-sm " >
		      <!-- <span id="hsn">
		       </span>-->
		      <!-- <select class="form-control" id="HSNCode" name="HSNCode">
		      <option value="-1">Select</option>
		      	</select> -->		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Price determination</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex = "-1" name="Pricedetermination" id="Pricedetermination" readonly  value="${Pricedetermination}" class="form-control input-sm ">
		      </div>
		    </div>		    
  		 </div> 
  		 </fieldset>
  		 	<!-- Role Based changed the button showing -->
   		<%
   	 if(rolename!=null && role !=null && access!=null)
	   {
		   if(rolename.equals(role)  && access.equals("Read"))
		    {
		   %>
		    <div class="col-md-1 col-md-offset-8"><input type="submit"  class="btn btn-primary form-control disabled"name="Save"  value="Save" onclick="SaveFunc()"/></div>
		    <div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
		    
		    <div class="col-md-1"><a href="Costing_Accounting_View.jsp" class="btn btn-primary form-control disabled ">Clear</a></div>
		    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   
		   <%
		    }
		   
		   else
		   {
		   %>
		    <div class="col-md-1 col-md-offset-8"><input type="submit" class="btn btn-primary form-control<c:if test="${status eq 'Active' }"> disabled </c:if>"  name="Save" value="Save" onclick="checkform()"/></div>
			<div class="col-md-1 "><button type="submit" onclick="return (checkforms())" class="btn btn-primary" name="Submit"  value="Submit">Submit</button></div>
			<div class="col-md-1"><input type="button"  class="btn btn-primary form-control <c:if test="${status eq 'Active' }"> disabled </c:if>" name="Clear" value="Clear" onclick="abc()"/></div>
			<div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   <%}}%>		     		     
   		</div>
   		
   		</div>
   		</div>
   	</div>
   		
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
        <button type="button" onclick="javascript:window.location='Costing_Accounting_View.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
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
$(".modal").on("hidden.bs.modal", function () {
	  window.location = "Costing_Accounting_View.jsp";
	});
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
</script>

</form>
</div>
</body>
</html>
