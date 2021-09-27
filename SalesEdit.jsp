<%@page import="com.tvs.Sales.PlantCode"%>
<%@page import="com.tvs.Sales.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@page import="com.tvs.Sales.SalesDAO"%>
<%@page import="com.tvs.Sales.Sales"%>

<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.Sales.SalesOrganization"%>
<%@page import="com.tvs.Sales.SalesOrganizationDAO"%>

<%@page import="com.tvs.Sales.Matlstatisticsgrp"%>
<%@page import="com.tvs.Sales.MatlstatisticsgrpDAO"%>
<%@page import="com.tvs.Sales.Itemcategorygroup"%>
<%@page import="com.tvs.Sales.ItemcategorygroupDAO"%>
<%@page import="com.tvs.Sales.LoadingGroup"%>
<%@page import="com.tvs.Sales.LoadingGroupDAO"%>
<%@page import="com.tvs.Sales.MaterialPriceGrp"%>
<%@page import="com.tvs.Sales.MaterialPriceGrpDAO"%>
<%@page import="com.tvs.Sales.Genitemcatgrp"%>
<%@page import="com.tvs.Sales.GenitemcatgrpDAO"%>

<%@page import="com.tvs.Sales.TransportationGroup"%>
<%@page import="com.tvs.Sales.TransportationGroupDAO"%>
<%@page import="com.tvs.Sales.DistChannel"%>
<%@page import="com.tvs.Sales.DistChannelDAO"%>
<%@page import="com.tvs.Sales.DeliveringPlant"%>
<%@page import="com.tvs.Sales.DeliveringPlantDAO"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.Sales.segment"%>
<%@page import="com.tvs.Sales.segmentDAO"%>
<%@page import="com.tvs.Sales.Polymer"%>
<%@page import="com.tvs.Sales.PolymerDAO"%>
<%@page import="com.tvs.Sales.CC"%>
<%@page import="com.tvs.Sales.CCDAO"%>
<%@page import="com.tvs.Sales.AspectRatio"%>
<%@page import="com.tvs.Sales.AspectRatioDAO"%>
<%@page import="com.tvs.Sales.Application"%>
<%@page import="com.tvs.Sales.ApplicationDAO"%>
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
</style>
<style>
  .required:after {
    content:"*";
    color: red;
  }
</style>
<script type="text/javascript">

$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
		
$(document).ready(function() {	
	
	document.getElementById('matcode').style.pointerEvents = 'none';
	document.getElementById('mattype').style.pointerEvents = 'none';
	document.getElementById('MDesc').style.pointerEvents = 'none';
	document.getElementById('plantdesc').style.pointerEvents = 'none';
	$("input[name=Acctassignmentgrp]").on('change',function(){
		 var selected =  $("#AcctassignmentgrpList option[value='" + $('#Acctassignmentgrp').val() + "']").attr('data-id');	  
		 var ss= document.getElementById('Acctassignmentgrpid').value =selected;//$('#materialgroupid').val("ssss");
	
		});
	var Mcode = $("#MDMCode").val();
	
    $.ajax({
		type: "POST",
		url: "Sales/Acctassignmentgrp.jsp",
		data: "materialtype="+Mcode,
		cache: false,
		success: function(response)
        {	
			
            $("#AcctassignmentgrpList").html(response);	            
        }
    });
	
});
function checkform()
{
	$("#SalesOraganization").prop("required",false);
 $("#Acctassignmentgrp").prop("required",false);	  

 
 $("#Genitemcatgroup").prop("required",false);
 $("#Itemcategorygroup").prop("required",false);
 $("#Transportationgroup").prop("required",false);	   	
 $("#LoadingGroup").prop("required",false);	   	


}
function checkforms()
{
	  	$("#SalesOraganization").prop("required",true);
	    $("#Acctassignmentgrp").prop("required",true);	  	    
	    $("#Genitemcatgroup").prop("required",true);
	    $("#Itemcategorygroup").prop("required",true);
	    $("#Transportationgroup").prop("required",true);	   	
	    $("#LoadingGroup").prop("required",true);	
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



function datalistValidatorsalesorg(modelname) {
		var obj = $("#SalesOraganizationList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function salesorg(){
		var mt = $("#SalesOraganization").val();
		var existingmt = $('h2').text();
		if (datalistValidatorsalesorg(mt)===false) {
			
			alert(mt + " is not a valid Sales Organization");
			$("#SalesOraganization").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}



	function datalistValidatordchnl(modelname) {
		var obj = $("#DistchannelList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function distchannel(){
		var mt = $("#Distchannel").val();
		var existingmt = $('h2').text();
		if (datalistValidatordchnl(mt)===false) {
			
			alert(mt + " is not a valid Dist Channel");
			$("#Distchannel").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}
	
	
	

	function datalistValidatormsgroup(modelname) {
		var obj = $("#MatlstatisticsgroupList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function Matgroup(){
		var mt = $("#Matlstatisticsgroup").val();
		var existingmt = $('h2').text();
		if (datalistValidatormsgroup(mt)===false) {
			
			alert(mt + " is not a valid Matl statistics Group");
			$("#Matlstatisticsgroup").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}




	function datalistValidatormpgroup(modelname) {
		var obj = $("#MaterialpricegroupList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function Matpricegroup(){
		var mt = $("#Materialpricegroup").val();
		var existingmt = $('h2').text();
		if (datalistValidatormpgroup(mt)===false) {
			
			alert(mt + " is not a valid Material Price Group");
			$("#Materialpricegroup").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}

	
	function datalistValidatoraccgroup(modelname) {
		var obj = $("#AcctassignmentgrpList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function acctassigngroup(){
		var mt = $("#Acctassignmentgrp").val();
		var existingmt = $('h2').text();
		if (datalistValidatoraccgroup(mt)===false) {
			
			alert(mt + " is not a valid Acct assignment grp");
			$("#Acctassignmentgrp").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}



	function datalistValidatorgenitem(modelname) {
		var obj = $("#GenitemcatgroupList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function genitemcat(){
		var mt = $("#Genitemcatgroup").val();
		var existingmt = $('h2').text();
		if (datalistValidatorgenitem(mt)===false) {
			
			alert(mt + " is not a valid Gen. item Category Group");
			$("#Genitemcatgroup").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}



	function datalistValidatoritemcat(modelname) {
		var obj = $("#ItemcategorygroupList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function itemcat(){
		var mt = $("#Itemcategorygroup").val();
		var existingmt = $('h2').text();
		if (datalistValidatoritemcat(mt)===false) {
			
			alert(mt + " is not a valid  item Category Group");
			$("#Itemcategorygroup").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}



	function datalistValidatortransgroup(modelname) {
		var obj = $("#TransportationgroupList").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function transgroup(){
		var mt = $("#Transportationgroup").val();
		var existingmt = $('h2').text();
		if (datalistValidatortransgroup(mt)===false) {
			
			alert(mt + " is not a valid  Transpotation Group");
			$("#Transportationgroup").val(existingmt).focus();

				return false;
		}		
		else{
			return true;
		}
	}
	
	
	
	
	function datalistValidatorlgroup(modelname) {
		
		var obj = $("#LoadingGroupList").find("option[value='" + modelname + "']");		
		if (obj != null && obj.length > 0) {				
				return true
		}		
		return false;
	}
	function loadinggroupMt(){		
		var mt = $("#LoadingGroup").val();
		var existingmt = $('h2').text();
		
		if(datalistValidatorlgroup(mt)==false){
			alert(mt + " is not a valid  Loading Group");
			$("#LoadingGroup").val(existingmt).focus();
				return false;
		}
		else{
			return true;
		}
			
	}


function datalistValidatorlDeliver(modelname) {
		
		var obj = $("#DeliveringplantList").find("option[value='" + modelname + "']");		
		if (obj != null && obj.length > 0) {				
				return true
		}		
		return false;
	}
	function DeliveringplantMP(){		
		var mt = $("#Deliveringplant").val();
		var existingmt = $('h2').text();
		
		if(datalistValidatorlDeliver(mt)==false){
			alert(mt + " is not a valid  Delivering Plant");
			$("#Deliveringplant").val(existingmt).focus();
				return false;
		}
		else{
			return true;
		}
			
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
			url: "Sales/plantdescription.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				
	            $("#plantdesc").html(response);
	        }
	    });
}
    


function materialFun() {
	  var selected =  $("#mg option[value='" + $('#materialgroup1').val() + "']").attr('data-id');
	  
	 var ss= document.getElementById('materialgroup1id').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function SalesFun() {
	  var selected =  $("#SalesOraganizationList option[value='" + $('#SalesOraganization').val() + "']").attr('data-id');	  
	 
	 
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('SalesOraganizationid').value="";

		}
	 else
		 {
		 document.getElementById('SalesOraganizationid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function MatlgrpFun() {
	  var selected =  $("#MatlstatisticsgroupList option[value='" + $('#Matlstatisticsgroup').val() + "']").attr('data-id');	  
	 
	 
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Matlstatisticsgroupid').value="";

		}
	 else
		 {
		 document.getElementById('Matlstatisticsgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
  
function ItemFun() {
	  var selected =  $("#ItemcategorygroupList option[value='" + $('#Itemcategorygroup').val() + "']").attr('data-id');	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Itemcategorygroupid').value="";

		}
	 else
		 {
		 document.getElementById('Itemcategorygroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function LoadFun() {
	  var selected =  $("#LoadingGroupList option[value='" + $('#LoadingGroup').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('LoadingGroupid').value="";

		}
	 else
		 {
		 document.getElementById('LoadingGroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function DistFun() {
	  var selected =  $("#DistchannelList option[value='" + $('#Distchannel').val() + "']").attr('data-id');	  
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Distchannelid').value="";

		}
	 else
		 {
		 document.getElementById('Distchannelid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function MpriceFun() {
	  var selected =  $("#MaterialpricegroupList option[value='" + $('#Materialpricegroup').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Materialpricegroupid').value="";

		}
	 else
		 {
		 document.getElementById('Materialpricegroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function gengrpFun() {
	  var selected =  $("#GenitemcatgroupList option[value='" + $('#Genitemcatgroup').val() + "']").attr('data-id');	
	  

	 
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Genitemcatgroupid').value="";

		}
	 else
		 {
		 document.getElementById('Genitemcatgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function TransFun() {
	  var selected =  $("#TransportationgroupList option[value='" + $('#Transportationgroup').val() + "']").attr('data-id');	  
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Transportationgroupid').value="";

		}
	 else
		 {
		 document.getElementById('Transportationgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	  
}
function DelFun() {
	  var selected =  $("#DeliveringplantList option[value='" + $('#Deliveringplant').val() + "']").attr('data-id');	  
	  
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Deliveringplantid').value="";

		}
	 else
		 {
		 document.getElementById('Deliveringplantid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function funcLoad(){
	$("#MDMCode").focus();	
	
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


function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123) || (charCode==32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function  SearchbyMDM()

{
 var mmcode=document.getElementById("mcode").value; 

 $.ajax({
		type: "POST",
		url: "Salesview2.jsp",    
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
	  var distc=document.getElementById("distc").value;
	 var plantc=document.getElementById("pt").value; 
	  var mattype=document.getElementById("mt").value; 
	  var stat=document.getElementById("status").value; 
	  var apvstat=document.getElementById("approvalstatus").value; 
	  var ver=document.getElementById("version").value; 
	    $.ajax({
			type: "POST",
			url: "Salesview.jsp",    
			data : {
	            "materialtype":mattype,
	            "plantv":plantc,
	            "distc":distc,
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
//functions for new fields
function LoadSegment() {
	  var selected =  $("#SegmentList option[value='" + $('#segment').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('segmentid').value="";

		}
	 else
		 {
		 document.getElementById('segmentid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function LoadApplication() {
	  var selected =  $("#ApplicationList option[value='" + $('#application').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('applicationid').value="";

		}
	 else
		 {
		 document.getElementById('applicationid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function LoadCC() {
	  var selected =  $("#CCList option[value='" + $('#cc').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ccid').value="";

		}
	 else
		 {
		 document.getElementById('ccid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function LoadPolymer() {
	  var selected =  $("#PolymerList option[value='" + $('#polymer').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('polymerid').value="";

		}
	 else
		 {
		 document.getElementById('polymerid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function LoadAspectRatio() {
	  var selected =  $("#AspectRatioList option[value='" + $('#aspectratio').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('aspectratioid').value="";

		}
	 else
		 {
		 document.getElementById('aspectratioid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
//
</script>
<script>
//new fields
//segment
function segmentfunction() { 
	var selected =  $("#SegmentList option[value='" + $('#segment').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('segmentid').value="";
		}
	 else
		 {
		 document.getElementById('segmentid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatorsegment(segmentname) {
	var obj = $("#SegmentList").find("option[value='" + segmentname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function segmentvalue(){
	var mg = $("#segment").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorsegment(mg)===false) {
		
		alert(mg + " is not a valid segment");
		$("#segment").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}
//aspect ratio
function aspectratiofunction() { 
	var selected =  $("#AspectRatioList option[value='" + $('#aspectratio').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('aspectratioid').value="";
		}
	 else
		 {
		 document.getElementById('aspectratioid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatoraspectratio(aspectrationame) {
	var obj = $("#AspectRatioList").find("option[value='" + aspectrationame + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function aspectratiovalue(){
	var mg = $("#aspectratio").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatoraspectratio(mg)===false) {
		
		alert(mg + " is not a valid aspect ratio");
		$("#aspectratio").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}
//application
function applicationfunction() { 
	var selected =  $("#ApplicationList option[value='" + $('#application').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('applicationid').value="";
		}
	 else
		 {
		 document.getElementById('applicationid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatorapplication(applicationname) {
	var obj = $("#ApplicationList").find("option[value='" + applicationname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function applicationvalue(){
	var mg = $("#application").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorapplication(mg)===false) {
		
		alert(mg + " is not a valid application");
		$("#application").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}

//polymer
function polymerfunction() { 
	var selected =  $("#PolymerList option[value='" + $('#polymer').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('polymerid').value="";
		}
	 else
		 {
		 document.getElementById('polymerid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatorpolymer(polymername) {
	var obj = $("#PolymerList").find("option[value='" + polymername + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function polymervalue(){
	var mg = $("#polymer").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorpolymer(mg)===false) {
		
		alert(mg + " is not a valid polymer");
		$("#polymer").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}

//cc
function ccfunction() { 
	var selected =  $("#CCList option[value='" + $('#cc').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('ccid').value="";
		}
	 else
		 {
		 document.getElementById('ccid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatorcc(ccname) {
	var obj = $("#CCList").find("option[value='" + ccname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function ccvalue(){
	var mg = $("#cc").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorcc(mg)===false) {
		
		alert(mg + " is not a valid cc");
		$("#cc").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}


</script>



</head>
<body onload="get_materialcode();get_description();get_PlantDesc();get_materialType();SalesFun();DistFun();MatlgrpFun();MpriceFun();gengrpFun();ItemFun();TransFun();LoadFun(); DelFun();
">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<% 
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
     access=rr.getSales();
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

TalendcodesDAO td =new TalendcodesDAO();
SalesOrganizationDAO sloDAO =new SalesOrganizationDAO();
MatlstatisticsgrpDAO mtlDAO=new MatlstatisticsgrpDAO();
ItemcategorygroupDAO itcDAO=new ItemcategorygroupDAO();
LoadingGroupDAO loDAO=new LoadingGroupDAO();
MaterialPriceGrpDAO mprgDAO=new MaterialPriceGrpDAO();
GenitemcatgrpDAO gmDAO=new GenitemcatgrpDAO();
TransportationGroupDAO tgpDAO=new TransportationGroupDAO();
DistChannelDAO dcDAO=new DistChannelDAO();
DeliveringPlantDAO depDAO=new DeliveringPlantDAO();
PlantCodeDAO pcd=new PlantCodeDAO();
segmentDAO segDAO = new segmentDAO();
ApplicationDAO appDAO = new ApplicationDAO();
CCDAO ccDAO = new CCDAO();
AspectRatioDAO aspDAO = new AspectRatioDAO();
PolymerDAO polymerDAO = new PolymerDAO();
//MaterialtypeDAO m =new MaterialtypeDAO();
Material_Material_Type_DAO m =new Material_Material_Type_DAO();
//MaterialtypeDAO m =new MaterialtypeDAO();

try
{
	//List<Materialtype> listm = m.materiallist(rolename);
	List<Material_Material_Type> listm = m.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	List<PlantCode> listpc=pcd.plantcodelist1();
	//List<PlantCode> listpc=pcd.plantcodelist(mattype);
	request.setAttribute("listpc",listpc);
	
	Set<Talendcodes> listtd =td.saleslist();
request.setAttribute("listtd",listtd);

List<SalesOrganization> listsls =sloDAO.getSalesOrganization();
request.setAttribute("listsls",listsls);

List<Matlstatisticsgrp> listmtl =mtlDAO.getMatlstatisticsgrp();
request.setAttribute("listmtl",listmtl);
List<Itemcategorygroup> listitgp =itcDAO.getItemcategorygroup();
request.setAttribute("listitgp",listitgp);

List<LoadingGroup> listlodg =loDAO.getLoadingGroup();
request.setAttribute("listlodg",listlodg);

List<MaterialPriceGrp> listmprg =mprgDAO.getMaterialPriceGrp();
request.setAttribute("listmprg",listmprg);
List<Genitemcatgrp> listgic =gmDAO.getGenitemcatgrp();
request.setAttribute("listgic",listgic);
List<TransportationGroup> listtgp =tgpDAO.getTransportationGroup();
request.setAttribute("listtgp",listtgp);


List<DistChannel> listtdc =dcDAO.getDistChannel();
request.setAttribute("listtdc",listtdc); 
List<DeliveringPlant> listtdep =depDAO.getDeliveringPlant();
request.setAttribute("listtdep",listtdep);

//newly added fields
List<segment> segmentlistvalue = segDAO.getSegment();
request.setAttribute("segmentlistvalue", segmentlistvalue);

List<Application> applicationlistvalue = appDAO.getApplication();
request.setAttribute("applicationlistvalue", applicationlistvalue);

List<Polymer> polymerlistvalue =polymerDAO.getpolymer();
request.setAttribute("polymerlistvalue", polymerlistvalue);

List<AspectRatio> aspectratiolistvalue = aspDAO.getAspectRatio();
request.setAttribute("aspectratiolistvalue", aspectratiolistvalue);

List<CC> cclistvalue = ccDAO.getcc();
request.setAttribute("cclistvalue", cclistvalue); 
//
}
catch(Exception e)
{
	
}



//talendcode
Integer sid=Integer.parseInt(request.getParameter("id"));  
String plantt=request.getParameter("plant");
String dcode=request.getParameter("dcode");


Sales s=SalesDAO.getSalesByTalendcode(sid,plantt,dcode);

Integer mdmcode=s.getMdmcode();

String plant=s.getPlantcode();

String salesorg=s.getSlorgdesc();
String distchnl=s.getDtchdesc();
String mstatgrp=s.getMtlstatisticsgrpdesc();
String mtpricegrp=s.getMtlpricegrpdesc();
String accassign=s.getAcassignmentgrpdesc();
String acccode=s.getAcassignmentgrpcode();
String gencat=s.getGencatgrpdesc();
String itemcat=s.getItmcatgrpdesc();
String transgrp=s.getTrngrpdesc();
String lodgrp=s.getLodgrpdesc();
String delplant=s.getDelplantdesc();
String reasonforedit=s.getReasonforedit();
String status=s.getStatus();
String appstus=s.getApprovalprocess();
//new fields values
String segmentcode1 = s.getsegmentcode();
String segmentvalue1 = s.getsegmentdescription();

String applicationcode1 = s.getapplicationcode();
String applicationvalue1 = s.getapplicationdescription();

String cccode1 = s.getcccode();
String ccvalue1 = s.getccdescription();

String polymercode1 = s.getpolymercode();
String polymervalue1 = s.getpolymerdescription();

String aspectratiocode1 = s.getaspectratiocode();
String aspectratiovalue1 = s.getaspectratiodescription();
//new fields values
pageContext.setAttribute("acccode",acccode);
pageContext.setAttribute("mdmcode",mdmcode);
pageContext.setAttribute("plant",plant);

pageContext.setAttribute("salesorg",salesorg);
pageContext.setAttribute("distchnl",distchnl);
pageContext.setAttribute("mstatgrp",mstatgrp);
pageContext.setAttribute("mtpricegrp",mtpricegrp);
pageContext.setAttribute("accassign",accassign);

pageContext.setAttribute("gencat",gencat);
pageContext.setAttribute("itemcat",itemcat);
pageContext.setAttribute("transgrp",transgrp);

pageContext.setAttribute("lodgrp",lodgrp);

pageContext.setAttribute("delplant",delplant);
pageContext.setAttribute("reasonforedit",reasonforedit);
pageContext.setAttribute("status",status);
pageContext.setAttribute("appstus", appstus);
pageContext.setAttribute("access",access);
//new fields
pageContext.setAttribute("segmentvalue",segmentvalue1);
pageContext.setAttribute("applicationvalue",applicationvalue1);
pageContext.setAttribute("ccvalue",ccvalue1);
pageContext.setAttribute("polymervalue",polymervalue1);
pageContext.setAttribute("aspectratiovalue",aspectratiovalue1);
//new fields
%>

<form action="Salesupdate" method="post">
<script type="text/javascript">
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
	
	 activclr();
	 }
 if(appstus=='Rejected'){
	 draftClr();
 }
 }
 
 function draftClr()
 {	
	 
	// $("#PurchasingGroup").val('');
	
	 $("#SalesOraganization").val('');
	 $("#Matlstatisticsgroup").val('');
	 $("#Acctassignmentgrp").val('');
	 $("#Itemcategorygroup").val('');
	 $("#LoadingGroup").val('');

	 $("#Materialpricegroup").val('');
	 $("#Genitemcatgroup").val('');
	 $("#Transportationgroup").val('');
	 $("#Deliveringplant").val('');
	 //new fields
	 $("#segment").val('');
	 $("#aspectratio").val('');
	 $("#application").val();
	 $("#polymer").val('')
	 $("#cc").val('')
	 //
 }
 
 function activclr()
 {
	 
	 $("#Matlstatisticsgroup").val('');	
	 $("#LoadingGroup").val('');	 
	 $("#Materialpricegroup").val('');	
	 $("#Transportationgroup").val('');
	 $("#Deliveringplant").val('');
	 $("#reasonforedit").val('');
	//new fields
	 $("#segment").val('');
	 $("#aspectratio").val('');
	 $("#application").val();
	 $("#polymer").val('')
	 $("#cc").val('')
	//

	 
 }
 	
	 
	
 
 </script>

	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Sales View</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="-1" list="MdmCodeList" <c:if test="${access eq 'Read'}" > disabled </c:if>  value="${mdmcode }" readonly class="form-control input-sm " onchange="return mdmcode();" name="MDMCode"  id="MDMCode"  placeholder="Talend Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_AccsitCode();get_materialType();">
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
		      <select class="form-control" tabindex="-1" id="matcode" <c:if test="${access eq 'Read'}" > disabled </c:if> name="matcode" readonly></select>	   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="-1" list="PlantList" <c:if test="${access eq 'Read'}" > disabled </c:if> readonly value="${plant}" class="form-control input-sm " name="plant" onchange="return plants();"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>	
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Sales Oraganization</label>
		      <div class="col-sm-8 input-group">
				 <input type="text" tabindex="1" list="SalesOraganizationList" <c:if test="${access eq 'Read'}" > disabled </c:if> required  value="${salesorg}" class="form-control input-sm input_text" onchange="return salesorg();" name="SalesOraganization"  id="SalesOraganization"  autocomplete="off"  placeholder="Sales Oraganization" onfocusout="SalesFun();"
				 <c:if test="${status eq 'Active' }"> readonly </c:if>
				 >
			   <datalist id="SalesOraganizationList">
			   <c:forEach items="${listsls}" var="pg">
			      	<option value="${pg.name}" data-id="${pg.salesorganization}"></option>  
	        	  </c:forEach>
			   </datalist>		        
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		        <input type="hidden" name="SalesOraganizationid" id="SalesOraganizationid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Matl statistics group</label>
		      <div class="col-sm-8 input-group">
				<input type="text" tabindex="2" list="MatlstatisticsgroupList" <c:if test="${access eq 'Read'}" > disabled </c:if>  value="${mstatgrp}"class="form-control input-sm input_text" name="Matlstatisticsgroup" onchange="return Matgroup();"  id="Matlstatisticsgroup"  autocomplete="off"   placeholder="Matl statistics group" onfocusout="MatlgrpFun();"
				>
			   <datalist id="MatlstatisticsgroupList">
			   <c:forEach items="${listmtl}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Matlstatisticsgroupid" id="Matlstatisticsgroupid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Acct. assignment grp</label>
		      <div class="col-sm-8 input-group">
				     <input type="text" tabindex="4" list="AcctassignmentgrpList" <c:if test="${access eq 'Read'}" > disabled </c:if>  required value="${accassign}"class="form-control input-sm input_text" onchange="return acctassigngroup();" name="Acctassignmentgrp"  id="Acctassignmentgrp" autocomplete="off"   placeholder="Acct assignment grp List" onfocusout="AcctFun();" 
				     <c:if test="${status eq 'Active' }"> readonly </c:if>
				     >
			   <datalist id="AcctassignmentgrpList">
			   
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Acctassignmentgrpid" id="Acctassignmentgrpid" value="${acccode}" >	   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4">Item category group</label>
		      <div class="col-sm-8 input-group">
		      	 <input type="text" tabindex="6" list="ItemcategorygroupList"  value="${itemcat}" <c:if test="${access eq 'Read'}" > disabled </c:if> required  onchange="return itemcat();"  class="form-control input-sm input_text" name="Itemcategorygroup"  id="Itemcategorygroup" autocomplete="off"    placeholder="Item category group" onfocusout="ItemFun();"
		      	 <c:if test="${status eq 'Active' }"> readonly </c:if>
		      	 >
			   <datalist id="ItemcategorygroupList">
			   <c:forEach items="${listitgp}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="Itemcategorygroupid" id="Itemcategorygroupid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Loading Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="8" list="LoadingGroupList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${lodgrp}" required  onchange="return loadinggroupMt();" class="form-control input-sm input_text" name="LoadingGroup"  id="LoadingGroup" autocomplete="off"   placeholder="Loading GroupList" onfocusout="LoadFun();"
		      	>
			   <datalist id="LoadingGroupList">
			   <c:forEach items="${listlodg}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="LoadingGroupid" id="LoadingGroupid" >
		      </div>
		    </div>
		    <div class="form-group " style="display:none;" >
		      <label class="control-label col-sm-4" for="name">Reason</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" name="Reason" id="Reason" >                   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Segment</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="10" list ="SegmentList" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control input-sm input_text" value="${segmentvalue}" id="segment" name="segment" onfocusout="segmentfunction()" onchange="return segmentvalue();" placeholder="segment" autocomplete="off">
		      <!-- <input type="text" tabindex="10" list="SegmentList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${segmentvalue}" onchange="" class="form-control input-sm input_text" name="segment"  id="segment" autocomplete="off"   placeholder="Segment" onfocusout="LoadSegment();">  -->
			   <datalist id="SegmentList">
			   <c:forEach items="${segmentlistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="segmentid" id="segmentid" >
		      </div>
		</div>
		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Application</label>
		      <div class="col-sm-8 input-group">
		        <input type="text" tabindex="12" list ="ApplicationList" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control input-sm input_text" value="${applicationvalue}" id="application" name="application" onfocusout="applicationfunction()" onchange="return applicationvalue();" placeholder="Application" autocomplete="off">
		        <!-- <input type="text" tabindex="12" list="ApplicationList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${applicationvalue}" onchange="" class="form-control input-sm input_text" name="application"  id="application" autocomplete="off"   placeholder="Application" onfocusout="LoadApplication();">  -->
			   <datalist id="ApplicationList">
			   <c:forEach items="${applicationlistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="applicationid" id="applicationid" >
		      </div>
		</div>
		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">CC</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="14" list ="CCList" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control input-sm input_text" value="${ccvalue}" id="cc" name="cc" onfocusout="ccfunction()" onchange="return ccvalue();" placeholder="CC" autocomplete="off">
		      <!-- <input type="text" tabindex="14" list="CCList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${ccvalue}" onchange="" class="form-control input-sm input_text" name="cc"  id="cc" autocomplete="off"   placeholder="CC" onfocusout="LoadCC();">  -->
			   <datalist id="CCList">
			   <c:forEach items="${cclistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="ccid" id="ccid" >
		      </div>
		</div> 
		     <div class="form-group "<c:if test="${status eq 'Active' }"> style='display:block;' </c:if>  style='display:none;'>
	      <label class="required control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="16" class="form-control input-sm" id="reasonforedit" <c:if test="${access eq 'Read'}" > disabled </c:if> <c:if test="${status eq 'Active' }"> required </c:if>     placeholder="Reason for edit" name="reasonforedit" autocomplete="off">        
	      </div>
	    </div>
	    </div>    
   		
   		<div class="col-md-6">
   			<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex="-1" id="mattype" <c:if test="${access eq 'Read'}" > disabled </c:if> name="mattype" readonly></select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select id="MDesc" tabindex="-1" class="form-control" <c:if test="${access eq 'Read'}" > disabled </c:if> name="MDesc" readonly>					
					</select>                   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control" tabindex="-1" id="plantdesc" <c:if test="${access eq 'Read'}" > disabled </c:if> name="plantdesc" readonly></select>			   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Dist. channel</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="-1" list="DistchannelList" value="${distchnl}"  <c:if test="${access eq 'Read'}" > disabled </c:if> required onchange="return distchannel();" readonly class="form-control input-sm input_text" name="Distchannel"  id="Distchannel"  autocomplete="off"   placeholder="Dist channel" onfocusout="DistFun();"
		      <c:if test="${status eq 'Active'}"> readonly </c:if>
		      >
			   <datalist id="DistchannelList">
			   <c:forEach items="${listtdc}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Distchannelid" id="Distchannelid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Material price group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="3" list="MaterialpricegroupList" <c:if test="${access eq 'Read'}" > disabled </c:if>  value="${mtpricegrp}" onchange="return Matpricegroup();" class="form-control input-sm input_text" name="Materialpricegroup"  id="Materialpricegroup"  autocomplete="off"   placeholder="Material price group" onfocusout="MpriceFun();" 
		      	>
			   <datalist id="MaterialpricegroupList">
			   <c:forEach items="${listmprg}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="Materialpricegroupid" id="Materialpricegroupid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Gen. item cat. group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="5" list="GenitemcatgroupList" <c:if test="${access eq 'Read'}" > disabled </c:if>  value="${gencat}" required  onchange="return genitemcat();" class="form-control input-sm input_text" name="Genitemcatgroup"  id="Genitemcatgroup" autocomplete="off"    placeholder="Gen item cat group " onfocusout="gengrpFun();" 
		      	<c:if test="${status eq 'Active' }"> readonly </c:if>
		      	>
			   <datalist id="GenitemcatgroupList">
			   <c:forEach items="${listgic}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Genitemcatgroupid" id="Genitemcatgroupid" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4">Transportation group</label>
		      <div class="col-sm-8 input-group">
		        <input type="text" tabindex="7" list="TransportationgroupList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${transgrp}" required  onchange="return transgroup();" class="form-control input-sm input_text" name="Transportationgroup"  id="Transportationgroup" autocomplete="off"    placeholder="Transportation group" onfocusout="TransFun();" 
		        >
			   <datalist id="TransportationgroupList">
			   <c:forEach items="${listtgp}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Transportationgroupid" id="Transportationgroupid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Delivering plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="9" list="DeliveringplantList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${delplant}" onchange="return DeliveringplantMP();" class="form-control input-sm input_text" name="Deliveringplant" autocomplete="off"   id="Deliveringplant"   placeholder="Delivering plant" onfocusout="DelFun();"
		      >
			   <datalist id="DeliveringplantList">
			   <c:forEach items="${listtdep}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="Deliveringplantid" id="Deliveringplantid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Aspect Ratio</label>
		      <div class="col-sm-8 input-group">
		        <input type="text" tabindex="11" list ="AspectRatioList" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control input-sm input_text" value="${aspectratiovalue}" id="aspectratio" name="aspectratio" onfocusout="aspectratiofunction()" onchange="return aspectratiovalue();" placeholder="Aspect ratio" autocomplete="off">
		      	<!-- <input type="text" tabindex="11" list="AspectRatioList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${aspectratiovalue}" onchange="" class="form-control input-sm input_text" name="aspectratio"  id="aspectratio" autocomplete="off"   placeholder="Aspect Ratio" onfocusout="LoadAspectRatio();">  -->
			   <datalist id="AspectRatioList">
			   <c:forEach items="${aspectratiolistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="aspectratioid" id="aspectratioid" >
		      </div>
		</div> 
		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Polymer</label>
		      <div class="col-sm-8 input-group">
		        <input type="text" tabindex="13" list ="PolymerList" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control input-sm input_text" value="${polymervalue}" id="polymer" name="polymer" onfocusout="polymerfunction()" onchange="return polymervalue();" placeholder="Polymer" autocomplete="off">
		        <!-- <input type="text" tabindex="13" list="PolymerList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${polymervalue}" onchange="" class="form-control input-sm input_text" name="polymer"  id="polymer" autocomplete="off"   placeholder="Polymer" onfocusout="LoadPOlymer();">  -->
			   <datalist id="PolymerList">
			   <c:forEach items="${polymerlistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="polymerid" id="polymerid" >
		      </div>
		</div> 		    
	    	
	    	<div class="form-group ">
	   		 	<%
	   		 if(rolename!=null && role !=null && access!=null)
	    	   {
	  			 if(rolename.equals(role)  && access.equals("Read"))
	    			{
	  			 %>
	           <div class="col-md-2 col-md-offset-4"><input type="submit"  class="btn btn-primary form-control disabled"  value="Save" onclick="SaveFunc()"/></div>
<div class="col-md-2"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
	   		   <div class="col-md-2"><input type="button"  class="btn btn-primary form-control disabled" name="Clear" value="Clear" onclick="abc()"/></div>
	   		   <div class="col-md-2"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
	   		  <%
			    }
			   else
			   {	   
			  %> 
			    <div class="col-md-2 col-md-offset-4"><input type="submit" class="btn btn-primary form-control<c:if test="${status eq 'Active' }"> disabled </c:if>"  name="Save" value="Save" onclick="checkform()"/></div>
				<div class="col-md-2"><button type="submit" onclick="return (checkforms())" class="btn btn-primary" name="Submit"  value="Submit">Submit</button></div>
			    <div class="col-md-2"><input type="button"  class="btn btn-primary form-control" name="Clear" value="Clear" onclick="abc()"/></div>
			    <div class="col-md-2"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
			   <%
		  	  }}
			   %>
	   </div>
	    
	    </div>
   		
   		</div>
   		</div>
   		</div>
   	</div>
   		

 <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 85%;">

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
<label >Dist. Channel</label>
 <select id="distc">
          <c:forEach items="${listtdc}" var="pg">
			      	<option value="${pg.code}" >${pg.desc}</option>  
	        	  </c:forEach>
     </select>
 <label style="font-weight:normal;">Status</label>
  <select id="status">
  <option value="Select"  selected >Select</option>
   <option value="Draft"  >Draft</option>
    <option value="Inactive"  >Inactive</option>
     <option value="Active" >Active</option>
 </select>
 <label style="font-weight:normal;display:none">Approval Status</label>
  <select  id="approvalstatus" style="display:none">
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
        <button type="button" onclick="javascript:window.location='Sales.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
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
	  window.location = "Sales.jsp";
	});
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
</script>

</form>

</body>
</html>
