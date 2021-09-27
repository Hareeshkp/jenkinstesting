<%@page import="com.tvs.mrp.PlantCode"%>
<%@page import="com.tvs.mrp.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@page import="com.tvs.mrp.MrpDAO"%>
<%@page import="com.tvs.mrp.Mrp"%>
<%@page import="com.tvs.mrp.BackflushDAO"%>
<%@page import="com.tvs.mrp.Specialprocurement"%>
<%@page import="com.tvs.mrp.SpecialprocurementDAO"%>
<%@page import="com.tvs.mrp.Procurementtype"%>
<%@page import="com.tvs.mrp.ProcurementtypeDAO"%>
<%@page import="com.tvs.mrp.Lotsize"%>
<%@page import="com.tvs.mrp.LotsizeDAO"%>
<%@page import="com.tvs.mrp.MrpcontrollerDAO"%>
<%@page import="com.tvs.mrp.Mrpcontroller"%>
<%@page import="com.tvs.mrp.Mrptype"%>
<%@page import="com.tvs.mrp.MrptypeDAO"%>
<%@page import="com.tvs.mrp.Abcindicator"%>
<%@page import="com.tvs.mrp.AbcindicatorDAO"%>
<%@page import="java.security.spec.MGF1ParameterSpec"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.mrp.Backflush"%>
<%@page import="com.tvs.mrp.Backflush"%>
<%@page import="com.tvs.mrp.Remprofile"%>
<%@page import="com.tvs.mrp.RemprofileDAO"%>
<%@page import="com.tvs.mrp.Strategygroup"%>
<%@page import="com.tvs.mrp.StrategygroupDAO"%>
<%@page import="com.tvs.mrp.Availabilitycheck"%>
<%@page import="com.tvs.mrp.AvailabilitycheckDAO"%>
<%@page import="com.tvs.mrp.SchedMarginkey"%>
<%@page import="com.tvs.mrp.SchedMarginkeyDAO"%>
<%@page import="com.tvs.mrp.MixedMRP"%>
<%@page import="com.tvs.mrp.MixedMRPDAO"%>
<%@page import="com.tvs.mrp.Individualcoll"%>
<%@page import="com.tvs.mrp.IndividualcollDAO"%>
<%@page import="com.tvs.mrp.ProductionStorageLocation"%>
<%@page import="com.tvs.mrp.ProductionStorageLocationDAO"%>

<%@page import="com.tvs.mrp.Consumptionmode"%>
<%@page import="com.tvs.mrp.ConsumptionmodeDAO"%>
        <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
        
    <%@ page import="com.tvs.mrp.Mrpgroup" %>
       <%@ page import="com.tvs.mrp.MrpgroupDAO" %>
                
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
  .required:after{
  content:"*";
  color:red
  }
</style>
<script type="text/javascript">


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


function datalistValidatormrpgroup(modelname) {
	var obj = $("#MrpgroupList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function mrpgroup(){
	var mt = $("#Mrpgroup").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatormrpgroup(mt)===false) {
		
		alert(mt + " is not a valid MRP Group");
		$("#Mrpgroup").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}





function datalistValidatorabc(modelname) {
	var obj = $("#ABCIndicatorList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function abcindicator(){
	var mt = $("#ABCIndicator").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorabc(mt)===false) {
		
		alert(mt + " is not a valid ABC Indicator");
		$("#ABCIndicator").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}
function datalistValidatormrptype(modelname) {
	var obj = $("#MrpTypeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}


function mrptype(){
	var mt = $("#MrpType").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatormrptype(mt)===false) {
		
		alert(mt + " is not a valid Mrp Type");
		$("#MrpType").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}

function datalistValidatormrpcontroller(modelname) {
	var obj = $("#MrpControllerList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function mrpcontroller(){
	var mt = $("#MrpController").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if ( datalistValidatormrpcontroller(mt)===false) {
		
		alert(mt + " is not a valid Mrp  Controller");
		$("#MrpController").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatorlotsizing(modelname) {
	var obj = $("#LotSizingProcedureList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function lotsizing(){
	var mt = $("#LotSizingProcedure").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorlotsizing(mt)===false) {
		
		alert(mt + " is not a valid Lot Sizing Procedure");
		$("#LotSizingProcedure").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}


function datalistValidatorproc(modelname) {
	var obj = $("#ProcurementTypeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function proctype(){
	var mt = $("#ProcurementType").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorproc(mt)===false) {
		
		alert(mt + " is not a valid ProcurementType");
		$("#ProcurementType").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatorsproc(modelname) {
	var obj = $("#SpecialProcurementKeyList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function specialproctype(){
	var mt = $("#SpecialProcurementKey").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorsproc(mt)===false) {
		
		alert(mt + " is not a valid Special Procurement Key");
		$("#SpecialProcurementKey").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}


function datalistValidatorprod(modelname) {
	var obj = $("#ProductionStorageLocList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function productionstorageloc(){
	var mt = $("#ProductionStorageLoc").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorprod(mt)===false) {
		
		alert(mt + " is not a valid Production Storage Location");
		$("#ProductionStorageLoc").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}


function datalistValidatorbackflush(modelname) {
	var obj = $("#BackFlushList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function backflush(){
	var mt = $("#BackFlush").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if ( datalistValidatorbackflush(mt)===false) {
		
		alert(mt + " is not a valid Back Flush");
		$("#BackFlush").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatorsmkey(modelname) {
	var obj = $("#SchedMarginKeyList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function smkey(){
	var mt = $("#SchedMarginKey").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if ( datalistValidatorsmkey(mt)===false) {
		
		alert(mt + " is not a valid Sched Margin Key ");
		$("#SchedMarginKey").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}


function datalistValidatorsgroup(modelname) {
	var obj = $("#StrategyGroupList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function sgroup(){
	var mt = $("#StrategyGroup").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if ( datalistValidatorsgroup(mt)===false) {
		
		alert(mt + " is not a valid Strategy Group ");
		$("#StrategyGroup").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}




function datalistValidatorcmode(modelname) {
	var obj = $("#ConsumptionModeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function cmode(){
	var mt = $("#ConsumptionMode").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatorcmode(mt)===false) {
		
		alert(mt + " is not a valid Consumption Mode ");
		$("#ConsumptionMode").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatormixedmrp(modelname) {
	var obj = $("#MixedMRPList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function mixedmrp(){
	var mt = $("#MixedMRP").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatormixedmrp(mt)===false) {
		
		alert(mt + " is not a valid Mixed MRP ");
		$("#MixedMRP").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}


function datalistValidatoracheck(modelname) {
	var obj = $("#AvailabilityCheckList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function acheck(){
	var mt = $("#AvailabilityCheck").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatoracheck(mt)===false) {
		
		alert(mt + " is not a valid AvailabilityCheck ");
		$("#AvailabilityCheck").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatoricall(modelname) {
	var obj = $("#IndividuallcollList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function Individuallcall(){
	var mt = $("#Individuallcoll").val();
	if(mt!='')
	{
	var existingmt = $('h2').text();
	if (datalistValidatoricall(mt)===false) {
		
		alert(mt + " is not a valid Individuallcoll ");
		$("#Individuallcoll").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
	}
}



function datalistValidatorremprofile(modelname) {
	var obj = $("#REMProfileList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function remprofile(){
	var mt = $("#REMProfile").val();
	if(mt!='')
		{
		
		
	var existingmt = $('h2').text();
	if (datalistValidatorremprofile(mt)===false) {
		
		alert(mt + " is not a valid Rem Profile ");
		$("#REMProfile").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}

function checkform()
{
	$("#Mrpgroup").prop("required",false);
 $("#MrpType").prop("required",false);
 $("#AvailabilityCheck").prop("required",false);	   	


}
function checkforms()
{
	var mattype = $("#mattype").val();	
	if(mattype!='ZHAW-Trading Material-ZHAW')
	{
		$("#Mrpgroup").prop("required",true);
		$("#MrpType").prop("required",true);
	}
	$("#AvailabilityCheck").prop("required",true);

}

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
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
function get_materialcode()
{
	console.log("true");
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
			url: "MRP/Plant.jsp",
			data: "materialtype="+country,
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#PlantList").html(response);
	        }
	    });
}
function get_PlantDesc()
{	
	 
	 var Plant = $("#plant").val();	
	    $.ajax({
			type: "POST",
			url: "MRP_Data/plantdescription.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#plantdesc").html(response);
	        }
	    });
	    
	    
	    $.ajax({
			type: "POST",
			url: "MRP_Data/Prodstorageloc.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				
	            $("#ProductionStorageLocList").html(response);
	        }
	    });
	    
	    $.ajax({
			type: "POST",
			url: "MRP_Data/MRPController.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				
	            $("#MrpControllerList").html(response);
	        }
	    });
	    
	    $.ajax({
			type: "POST",
			url: "MRP_Data/MRPGroup.jsp",
			data: "Plant="+Plant,
			cache: false,
			success: function(response)
	        {
				
	            $("#MrpgroupList").html(response);
	        }
	    });
	    
}
function funcLoad(){
	
	
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
	           // var ss=res[1];
	            var ss=res[2];
	            var spl=ss.split(">");
	           
	            //firstChar=spl[0].slice(0,-1);
	            firstChar = spl[0].replace('"','')
	            if(firstChar=="ZSFG"|| firstChar=="ZROH"|| firstChar=="ZSPR"|| firstChar=="ZFG"|| firstChar=="ZPRT"|| firstChar=="ZFUE"){
	    	    	$("#Mrpgroup").prop("required",true);
	    	    	$("#MrpType").prop("required",true);
	    	    	$("#mgrp").addClass("required");
	    	    	$("#mtyp").addClass("required");
	    	    	//$("#mgrp").removeClass("mandatory");
	    	    	//$("#mtyp").removeClass("mandatory");
	    	    }
	    	    else{
	    	    	$("#Mrpgroup").prop("required",false);
	    	    	$("#MrpType").prop("required",false);
	    	    	//$("#mgrp").addClass("mandatory");
	    	    	//$("#mtyp").addClass("mandatory");
	    	    	$("#mgrp").removeClass("required");
	    	    	$("#mtyp").removeClass("required");
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

function MRPGroupFun() { 
	  var selected =  $("#MrpgroupList option[value='" + $('#Mrpgroup').val() + "']").attr('data-id');
	
	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Mrpgroupid').value="";

		}
	 else
		 {
		 document.getElementById('Mrpgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}
function AbcindicatorFun() { 
	  var selected =  $("#ABCIndicatorList option[value='" + $('#ABCIndicator').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ABCIndicatorid').value="";

		}
	 else
		 {
		 document.getElementById('ABCIndicatorid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}
function MRPtypeFun() { 
	  var selected =  $("#MrpTypeList option[value='" + $('#MrpType').val() + "']").attr('data-id');
	
	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('MrpTypeid').value="";

		}
	 else
		 {
		 document.getElementById('MrpTypeid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function MRPcontrollerFun() { 
	  var selected =  $("#MrpControllerList option[value='" + $('#MrpController').val() + "']").attr('data-id');
	
	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('MrpControllerid').value="";

		}
	 else
		 {
		 document.getElementById('MrpControllerid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function LotsizingprocedureFun() { 
	  var selected =  $("#LotSizingProcedureList option[value='" + $('#LotSizingProcedure').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('LotSizingProcedureid').value="";

		}
	 else
		 {
		 document.getElementById('LotSizingProcedureid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}



function ProcurementtypeFun() { 
	  var selected =  $("#ProcurementTypeList option[value='" + $('#ProcurementType').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ProcurementTypeid').value="";

		}
	 else
		 {
		 document.getElementById('ProcurementTypeid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
	 
}

function SpecialprocurementFun() { 
	  var selected =  $("#SpecialProcurementKeyList option[value='" + $('#SpecialProcurementKey').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('SpecialProcurementKeyid').value="";

		}
	 else
		 {
		 document.getElementById('SpecialProcurementKeyid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
} 

function ProductionstorageFun() { 
	  var selected =  $("#ProductionStorageLocList option[value='" + $('#ProductionStorageLoc').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ProductionStorageLocid').value="";
		}
	 else
		 {
		 document.getElementById('ProductionStorageLocid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function BackflushFun() { 
	  var selected =  $("#BackFlushList option[value='" + $('#BackFlush').val() + "']").attr('data-id');
	
	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('BackFlushid').value="";

		}
	 else
		 {
		 document.getElementById('BackFlushid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function StrategyGroupFun() { 
	  var selected =  $("#StrategyGroupList option[value='" + $('#StrategyGroup').val() + "']").attr('data-id');
	
	  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('StrategyGroupid').value="";

		}
	 else
		 {
		 document.getElementById('StrategyGroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}
function ConsumptionmodeFun() { 
	  var selected =  $("#ConsumptionModeList option[value='" + $('#ConsumptionMode').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('ConsumptionModeid').value="";

		}
	 else
		 {
		 document.getElementById('ConsumptionModeid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}





function MixedMrpFun() { 
	  var selected =  $("#MixedMRPList option[value='" + $('#MixedMRP').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('MixedMRPid').value="";

		}
	 else
		 {
		 document.getElementById('MixedMRPid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
	 
}

function AvailabilityFun() { 
	  var selected =  $("#AvailabilityCheckList option[value='" + $('#AvailabilityCheck').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('AvailabilityCheckid').value="";

		}
	 else
		 {
		 document.getElementById('AvailabilityCheckid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function IndividuallcollFun() { 
	  var selected =  $("#IndividuallcollList option[value='" + $('#Individuallcoll').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('Individuallcollid').value="";

		}
	 else
		 {
		 document.getElementById('Individuallcollid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

function RemprofileFun() { 
	  var selected =  $("#REMProfileList option[value='" + $('#REMProfile').val() + "']").attr('data-id');
	
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('REMProfileid').value="";

		}
	 else
		 {
		 document.getElementById('REMProfileid').value =selected;//$('#materialgroupid').val("ssss");

		 }
	 
}

$(document).ready(function() {	
		
		document.getElementById('matcode').style.pointerEvents = 'none';
		document.getElementById('mattype').style.pointerEvents = 'none';
		document.getElementById('MDesc').style.pointerEvents = 'none';
		document.getElementById('plantdesc').style.pointerEvents = 'none';
		
});

function  SearchbyMDM()

	{
	 var mmcode=document.getElementById("mcode").value; 

	 $.ajax({
			type: "POST",
			url: "MRPView2.jsp",    
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
				url: "MRPView.jsp",    
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
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
</script>


</head>
<body onload="funcLoad();get_materialcode();get_description();get_PlantDesc();get_materialType();AbcindicatorFun();MRPtypeFun();LotsizingprocedureFun();ProcurementtypeFun();SpecialprocurementFun();BackflushFun();StrategyGroupFun();ConsumptionmodeFun();MixedMrpFun();AvailabilityFun();IndividuallcollFun();RemprofileFun();

	<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
">

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
     access=rr.getMrp();
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

MrpgroupDAO mg=new MrpgroupDAO();
AbcindicatorDAO ab=new AbcindicatorDAO();
MrptypeDAO mt=new MrptypeDAO();
MrpcontrollerDAO mc =new MrpcontrollerDAO();
LotsizeDAO ls =new LotsizeDAO();
ProcurementtypeDAO pt =new ProcurementtypeDAO();
SpecialprocurementDAO spt=new SpecialprocurementDAO();
TalendcodesDAO td =new TalendcodesDAO();
BackflushDAO bfDAO=new BackflushDAO();
RemprofileDAO RemDAO=new RemprofileDAO();
StrategygroupDAO StrGrpDAO=new StrategygroupDAO();
AvailabilitycheckDAO AvchkDAO= new AvailabilitycheckDAO();
SchedMarginkeyDAO SchDAO=new SchedMarginkeyDAO();
MixedMRPDAO MmrpPDAO =new MixedMRPDAO();
IndividualcollDAO InvDAO=new IndividualcollDAO();
ConsumptionmodeDAO ConsmDAO=new ConsumptionmodeDAO();
PlantCodeDAO pcd=new PlantCodeDAO();
//MaterialtypeDAO mtd =new MaterialtypeDAO();
Material_Material_Type_DAO mtd =new Material_Material_Type_DAO();

try
{
	//List<Materialtype> listm = mtd.materiallist(rolename);
    List<Material_Material_Type> listm = mtd.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	//List<PlantCode> listpc=pcd.plantcodelist(mattype);
	List<PlantCode> listpc=pcd.plantcodelist1();
	request.setAttribute("listpc",listpc);
	
	/*if(mattype.equals("None"))
	{
		Set<Talendcodes> listtd =td.mrplist();
		request.setAttribute("listtd",listtd);
	}

	else
	{
		Set<Talendcodes> listtd=td.mrplist(mattype);
		request.setAttribute("listtd",listtd);
	}*/


	


	List<Abcindicator> listab = ab.getAbcindicator();
	request.setAttribute("listab",listab);
	
	List<Mrptype> listmt = mt.getMrptype();
	request.setAttribute("listmt",listmt);



	

	List<Lotsize> listls = ls.getLotsize();
	request.setAttribute("listls",listls);

	

	List<Procurementtype> listpt = pt.getProcurementtype();
	request.setAttribute("listpt",listpt);
	
	List<Specialprocurement> listspt = spt.getSpecialprocurement();
	request.setAttribute("listspt",listspt);
	

	List<Backflush> listbckflsh = bfDAO.getBackflush();
	request.setAttribute("listbckflsh",listbckflsh);
	List<Remprofile> listrem = RemDAO.getRemprofile();
	request.setAttribute("listrem",listrem);

	List<Strategygroup> liststrgrp = StrGrpDAO.getstratgygroup();
	request.setAttribute("liststrgrp",liststrgrp);
	
	List<Availabilitycheck> listavchk = AvchkDAO.getAvailability();
	request.setAttribute("listavchk",listavchk);
	
	List<SchedMarginkey> listschkey = SchDAO.getSchedMarginkey();
	request.setAttribute("listschkey",listschkey);
	
	
	List<MixedMRP> listMrp = MmrpPDAO.getMixedMRP();
	request.setAttribute("listMrp",listMrp);
	
	List<Individualcoll> listInv = InvDAO.getIndividualcoll();
	request.setAttribute("listInv",listInv);
	
	

	List<Consumptionmode> listconsm = ConsmDAO.getConsumptionmode();
	request.setAttribute("listconsm",listconsm);
	
}
catch(Exception e)
{
	
}
Integer sid=Integer.parseInt(request.getParameter("id"));  
String plantt=request.getParameter("plant");

Mrp m =MrpDAO.getMRPByTalendcode(sid,plantt);

Integer mdmcode=m.getMdmcode();
String plantcode=m.getPlantcode();
String mrpgroupcode=m.getMrpgroupcode();

String mrpgroup=m.getMrpgroupcodedesc();
String abcindicator=m.getAbcindicatorcodedesc();
String mrptype=m.getMrptypedesc();
Integer recordpoint=m.getReorderpoint();
String mrpcontrollercode=m.getMrpcontrollercode();
String mrpcontroller=m.getMrpcontrollercodedesc();
String lotsizing=m.getLotsizingdesc();
String minlotsize=m.getMinlotsize();
String maxstocklevel=m.getMaximamstocklevel();
Integer assemblyscrap=m.getAssemblyscrap();
String procurementtype=m.getProcurementtypecodedesc();
String specialproc=m.getSpecialprocurementcodedesc();

String prodstorageloc=m.getProductionstoragelocationdesc();
String prodstorageloccode=m.getProductionstoragelocationcode();
String backflush=m.getBackflushdesc();
String houseproduction=m.getInhouseproduction();
Boolean coproduct=m.getCoproduct();
Integer plandelvtime=m.getPlanneddeliverytime();
String schedmkey=m.getSchedmarginkey();
String saftystock=m.getSaftystock();
String minsaftystock=m.getMinsaftystock();
String strategygrp=m.getStrategygroupdesc(); 
Integer bwdconsption=m.getBwdconsumptionper();
String consumptionmode=m.getConsumptionmodedesc();


String mixedmrp=m.getMixedmrpdesc();
Integer fwdconsumption=m.getForwardconsumptionper();
Integer totleadtime=m.getTotalrepleadtime();
String availibilitycheck=m.getAvailabilitycheckdesc();
String indivuallcoll=m.getIndividualcalldesc();
Integer componentscrap=m.getComponenetscrap();
String remprofile=m.getRemprofiledesc();
Boolean repetativemfg=m.getRepetativemfg();

String reasonforedit =m.getReasonforedit();

String status=m.getStatus();
String appstus=m.getApprovalprocess();


pageContext.setAttribute("mrpgroupcode",mrpgroupcode);


pageContext.setAttribute("prodstorageloccode",prodstorageloccode);
pageContext.setAttribute("mrpcontrollercode",mrpcontrollercode);

pageContext.setAttribute("mdmcode",mdmcode);
pageContext.setAttribute("plantcode",plantcode);
pageContext.setAttribute("mrpgroup",mrpgroup);
pageContext.setAttribute("abcindicator",abcindicator);
pageContext.setAttribute("mrptype",mrptype);
pageContext.setAttribute("recordpoint",recordpoint);
pageContext.setAttribute("mrpcontroller",mrpcontroller);
pageContext.setAttribute("lotsizing",lotsizing);
pageContext.setAttribute("minlotsize",minlotsize);
pageContext.setAttribute("maxstocklevel",maxstocklevel);
pageContext.setAttribute("assemblyscrap",assemblyscrap);
pageContext.setAttribute("procurementtype",procurementtype);
pageContext.setAttribute("specialproc",specialproc);
pageContext.setAttribute("prodstorageloc",prodstorageloc);
pageContext.setAttribute("backflush",backflush);
pageContext.setAttribute("houseproduction",houseproduction);
pageContext.setAttribute("coproduct",coproduct);
pageContext.setAttribute("plandelvtime",plandelvtime);
pageContext.setAttribute("schedmkey",schedmkey);
pageContext.setAttribute("saftystock",saftystock);
pageContext.setAttribute("minsaftystock",minsaftystock);
pageContext.setAttribute("strategygrp",strategygrp);
pageContext.setAttribute("bwdconsption",bwdconsption);
pageContext.setAttribute("consumptionmode",consumptionmode);


pageContext.setAttribute("mixedmrp",mixedmrp);
pageContext.setAttribute("fwdconsumption",fwdconsumption);
pageContext.setAttribute("totleadtime",totleadtime);
pageContext.setAttribute("availibilitycheck",availibilitycheck);
pageContext.setAttribute("indivuallcoll",indivuallcoll);
pageContext.setAttribute("componentscrap",componentscrap);
pageContext.setAttribute("remprofile",remprofile);
pageContext.setAttribute("repetativemfg",repetativemfg);

pageContext.setAttribute("Reason_For_Edit",reasonforedit);


pageContext.setAttribute("status",status);
pageContext.setAttribute("appstus", appstus);
pageContext.setAttribute("access",access);


%>
<form action="MrpUpdate" method="post">

<script type="text/javascript">

var abc="<%=status%>";


if(abc=='Active')
{

$('html').bind('keypress', function(e)
			{
			   if(e.keyCode == 13)
			   {
			      return false;
			   }
			});


}


 function abbc()
 {
	 $("#Mrpgroup").val('');
	 $("#reasonforedit").val('');
	 $("#MrpType").val('');
	 $("#MrpController").val('');
	 $("#minlotsize").val('');
	 $("#assemblyscrap").val('');
	 $("#SpecialProcurementKey").val('');
	 $("#BackFlush").val('');
	 $('#CoProduct').prop('checked', false);
	 $("#SchedMarginKey").val('');
	 $("#minsafetystock").val('');
	 $("#bwdconsumptionper").val('');
	 $("#MixedMRP").val('');
	 $("#Totreplleadtime").val('');
	 $("#Individuallcoll").val('');
	 $("#REMProfile").val(''); 
	 $("#ABCIndicator").val('');
	 $("#recordpoint").val('');
	 $("#LotSizingProcedure").val('');
	 $("#maxstocklevel").val('');
	 $("#ProcurementType").val('');
	 $("#ProductionStorageLoc").val('');
	 $("#inhouseproduction").val('');
	 $("#planneddelivtime").val('');
	 $("#safetystock").val('');
	 $("#StrategyGroup").val('');
	 $("#ConsumptionMode").val('');
	 $("#fwdconsumptionper").val('');
	 $("#AvailabilityCheck").val('');
	 $("#componentscrap").val('');
	 $('#Repetativemfg').prop('checked', false);
 }
 

 </script>

	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;overflow:scroll;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">MRP View</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="-1" list="MdmCodeList" readonly <c:if test="${access eq 'Read'}" > disabled </c:if> value="${mdmcode}"  class="form-control input-sm "  onchange="return mdmcode();"   name="MDMCode"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_materialType()">
			      <datalist id="MdmCodeList">
			      <c:forEach items="${listtd}" var="pg">
			      	<option value="${pg.talendcode}">${pg.talendcode}</option>  
	        	  </c:forEach>
			      </datalist>		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id = "mtcode" for="name">Material Code</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control" tabindex="-1" id="matcode" <c:if test="${access eq 'Read'}" > disabled </c:if> name="matcode" readonly></select>	   
		      </div>
		    </div>		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="-1" list="PlantList" readonly value="${plantcode}" <c:if test="${access eq 'Read'}" > disabled </c:if>  onchange="return plants();" class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="mgrp" for="name">MRP Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="1" list="MrpgroupList" <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" value="${mrpgroup}" onchange="return mrpgroup();" class="Materialtypes form-control input-sm input_text" name="Mrpgroup"  id="Mrpgroup" onfocusout="MRPGroupFun()"  placeholder="MRP Group" >
			   <datalist id="MrpgroupList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="Mrpgroupid" id="Mrpgroupid" value="${mrpgroupcode}" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="mtyp">MRP Type</label>
		      <div class="col-sm-8 input-group">
		       <input type="text" tabindex="3" list="MrpTypeList" value="${mrptype}" <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" onchange="return mrptype();"   class="form-control input-sm input_text" name="MrpType"  id="MrpType" onfocusout="MRPtypeFun()" placeholder="MRP Type">
			   <datalist id="MrpTypeList">
			   <c:forEach items="${listmt}" var="pg">
			      	<option value="${pg.mrpdesc}" data-id="${pg.mrptype}"></option>  
	        	  </c:forEach>
			   </datalist>	
<span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="MrpTypeid" id="MrpTypeid" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">MRP Controller</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="5" list="MrpControllerList" <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" value="${mrpcontroller}" onchange="return mrpcontroller();" class="form-control input-sm input_text" name="MrpController"  id="MrpController" onfocusout="MRPcontrollerFun()"    placeholder="MRP Controller">
			   <datalist id="MrpControllerList">
			  </datalist>	
			     <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		        <input type="hidden" name="MrpControllerid" id="MrpControllerid" value="${mrpcontrollercode}" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="7" class="form-control input-sm " onkeypress="return isNumber(event)" <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" placeholder="Min. Lot Size" maxlength="13" value="${minlotsize}" name="minlotsize"  id="minlotsize"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Assembly Scrap(%)</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="9" class="form-control input-sm " <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" placeholder="Assembly Scrap(%)" maxlength="6" onkeypress="return isNumber(event)" 
		      
		    	  <c:choose>
		        <c:when test="${assemblyscrap==null || assemblyscrap==''}">
		          value=""
		        </c:when>
		        <c:otherwise>
		       value="${assemblyscrap}"
		        </c:otherwise> 
		    </c:choose>
		      
		      name="assemblyscrap"  id="assemblyscrap"  >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Special Procurement Key</label>
		      <div class="col-sm-8 input-group">
				<input type="text" tabindex="11" list="SpecialProcurementKeyList" <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" value="${specialproc}" onchange="return specialproctype();" class="form-control input-sm input_text" name="SpecialProcurementKey" onfocusout="SpecialprocurementFun()"  id="SpecialProcurementKey" placeholder="Special Procurement Key">
			   <datalist id="SpecialProcurementKeyList">
			   <c:forEach items="${listspt}" var="pg">
			      	<option value="${pg.spdesc}" data-id="${pg.procurement}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="SpecialProcurementKeyid" id="SpecialProcurementKeyid" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Back Flush</label>
		      <div class="col-sm-8 input-group">
		          <input type="text" tabindex="13" list="BackFlushList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${backflush}" onchange="return backflush();" autocomplete="off" class="form-control input-sm input_text" name="BackFlush" onfocusout="BackflushFun() " id="BackFlush" placeholder="Back Flush">
			   <datalist id="BackFlushList">
			   <c:forEach items="${listbckflsh}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.backflush}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="BackFlushid" id="BackFlushid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Co-Product</label>
		      <div class="col-sm-8 input-group">
		      	  <input type="checkbox" tabindex="15" name="CoProduct" <c:if test="${access eq 'Read'}" > disabled </c:if>
		      	  
		      	  		      		       <c:if test="${coproduct == 'true'}">checked="checked"</c:if>
		      	  
		      	    id="CoProduct" > 
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">SchedMarginKey</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" tabindex="17" list="SchedMarginKeyList" <c:if test="${access eq 'Read'}" > disabled </c:if> onchange="return smkey();" value="${schedmkey}"class="form-control input-sm input_text" autocomplete="off" name="SchedMarginKey"  id="SchedMarginKey" onfocusout="SchedmarginFun()" placeholder="SchedMarginKey">
			   <datalist id="SchedMarginKeyList">
			   <c:forEach items="${listschkey}" var="pg">
			      	<option value="${pg.smkeyId}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Safety Stock </label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="19" class="form-control input-sm " <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off" placeholder="Min. Safety Stock" maxlength="17"onkeypress="return isNumber(event)" value="${minsaftystock}" name="minsafetystock"  id="minsafetystock"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Bwd Consumption per</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="21" class="form-control input-sm " <c:if test="${access eq 'Read'}" > disabled </c:if> autocomplete="off"  placeholder="Bwd Consumption per" maxlength="3" onkeypress="return isNumber(event)"
		      
		      
		          <c:choose>
		        <c:when test="${bwdconsption==null || bwdconsption==''}">
		          value=""
		        </c:when>
		        <c:otherwise>
		       value="${bwdconsption}"
		        </c:otherwise> 
		    </c:choose>
		      
		      name="bwdconsumptionper"  id="bwdconsumptionper"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Mixed MRP</label>
		      <div class="col-sm-8 input-group">
			     <input type="text" tabindex="23" list="MixedMRPList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${mixedmrp}"class="form-control input-sm input_text" autocomplete="off" onchange="return mixedmrp();" name="MixedMRP"  onfocusout="MixedMrpFun()" id="MixedMRP" placeholder="Mixed MRP">
			   <datalist id="MixedMRPList">
			   <c:forEach items="${listMrp}" var="pg">
			      	<option value="${pg.mrpdesc}" data-id="${pg.mrpcode}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="MixedMRPid" id="MixedMRPid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Tot.repl.lead time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="25" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm " autocomplete="off"  placeholder="Tot.repl.lead time"  maxlength="3"onkeypress="return isNumber(event)" 
		      
		    	  <c:choose>
		        <c:when test="${totleadtime==null || totleadtime==''}">
		          value=""
		        </c:when>
		        <c:otherwise>
		      value="${totleadtime}"
		        </c:otherwise> 
		    </c:choose>
		      
		       name="Totreplleadtime"  id="Totreplleadtime"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4">Individuallcoll</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" tabindex="27" list="IndividuallcollList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${indivuallcoll}" autocomplete="off" class="form-control input-sm input_text" onchange="return Individuallcall();" name="Individuallcoll"  id="Individuallcoll" onfocusout="IndividuallcollFun()" placeholder="Individuall coll">
			   <datalist id="IndividuallcollList">
			   <c:forEach items="${listInv}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.individualcode}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="Individuallcollid" id="Individuallcollid" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4">REM Profile</label>
		      <div class="col-sm-8 input-group">
				<input type="text" tabindex="29" list="REMProfileList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${remprofile}" autocomplete="off"  onchange="return remprofile();"   class="form-control input-sm input_text" name="REMProfile" onfocusout="RemprofileFun()" id="REMProfile" placeholder="REM Profile">
			   <datalist id="REMProfileList">
			   <c:forEach items="${listrem}" var="pg">
			      	<option value="${pg.remprofiledesc}" data-id="${pg.remprofile}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="REMProfileid" id="REMProfileid" >			   
		      </div>
		    </div>
		    
		    
		     <div class="form-group "<c:if test="${status eq 'Active' }"> style='display:block;' </c:if>  style='display:none;'>
	      <label class="required control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="31" class="form-control input-sm" <c:if test="${access eq 'Read'}" > disabled </c:if> id="reasonforedit"  <c:if test="${status eq 'Active' }"> required </c:if>  placeholder="Reason for edit" name="reasonforedit" autocomplete="off">        
	      </div>
	    </div>
		    
	    </div>    
   		
   		<div class="col-md-6">
   		
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex="-1" <c:if test="${access eq 'Read'}" > disabled </c:if> id="mattype" name="mattype" readonly></select>			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select id="MDesc" tabindex="-1" name="MDesc" <c:if test="${access eq 'Read'}" > disabled </c:if> class="form-control" readonly>					
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
		      <label class="control-label col-sm-4">ABC Indicator</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="2" list="ABCIndicatorList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${abcindicator}" autocomplete="off"   onchange="return abcindicator();"  class="form-control input-sm input_text" name="ABCIndicator" onfocusout="AbcindicatorFun()"  id="ABCIndicator" placeholder="ABC Indicator">
			   <datalist id="ABCIndicatorList">
			   <c:forEach items="${listab}" var="pg">
			      	<option value="${pg.abcdesc}" data-id="${pg.abcindicator}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ABCIndicatorid" id="ABCIndicatorid" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Record Point</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="4" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" autocomplete="off" placeholder="Record Point" maxlength="17" 
		      
		      
		        <c:choose>
        <c:when test="${recordpoint==null || recordpoint==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${recordpoint}"
        </c:otherwise> 
    </c:choose>
		      
		      onkeypress="return isNumber(event)" name="recordpoint"  id="recordpoint" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Lot Sizing Procedure</label>
		      <div class="col-sm-8 input-group">
			     <input type="text" tabindex="6" list="LotSizingProcedureList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${lotsizing}" autocomplete="off" onchange="return lotsizing();" class="form-control input-sm input_text" name="LotSizingProcedure" onfocusout="LotsizingprocedureFun()" id="LotSizingProcedure" placeholder="Lot Sizing Procedure">
			   <datalist id="LotSizingProcedureList">
			   <c:forEach items="${listls}" var="pg">
			      	<option value="${pg.lotdesc}" data-id="${pg.lotsizing}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="LotSizingProcedureid" id="LotSizingProcedureid" >	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Maximum Stock Level</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="8" onkeypress="return isNumber(event)" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" maxlength="13" placeholder="Maximum Stock Level" value="${maxstocklevel}" autocomplete="off"name="maxstocklevel"  id="maxstocklevel" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Procurement Type</label>
		      <div class="col-sm-8 input-group">
				  <input type="text" tabindex="10" <c:if test="${access eq 'Read'}" > disabled </c:if> list="ProcurementTypeList" value="${procurementtype}" autocomplete="off" onchange="return  proctype();"  class="form-control input-sm input_text" name="ProcurementType" onfocusout="ProcurementtypeFun()" id="ProcurementType" placeholder="Procurement Type">
			   <datalist id="ProcurementTypeList">
			   <c:forEach items="${listpt}" var="pg">
			      	<option value="${pg.pdesc}" data-id="${pg.procurementtype}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ProcurementTypeid" id="ProcurementTypeid" >    	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Production Storage Location</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="12" <c:if test="${access eq 'Read'}" > disabled </c:if> list="ProductionStorageLocList" onchange="return  productionstorageloc();" value="${prodstorageloc}" class="form-control input-sm input_text" name="ProductionStorageLoc" onfocusout="ProductionstorageFun()"  id="ProductionStorageLoc" autocomplete="off" placeholder="Production Storage Location">
			   <datalist id="ProductionStorageLocList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ProductionStorageLocid" id="ProductionStorageLocid" value="${prodstorageloccode}" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">In-House Production</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="14" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" autocomplete="off" value="${houseproduction}" placeholder="In-House Production" maxlength="3" onkeypress="return isNumber(event)" name="inhouseproduction"  id="inhouseproduction" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">PlannedDeliv.Time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="16" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text"
		      
		        <c:choose>
        <c:when test="${plandelvtime==null || plandelvtime==''}">
          value=""
        </c:when>
        <c:otherwise>
        value="${plandelvtime}"
        </c:otherwise> 
    </c:choose>
		      
		      
		       maxlength="3" placeholder="PlannedDeliv.Time" onkeypress="return isNumber(event)" autocomplete="off" name="planneddelivtime"  id="planneddelivtime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Safety Stock</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="18" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" autocomplete="off" value="${saftystock}" placeholder="Safety Stock" maxlength="13" onkeypress="return isNumber(event)"name="safetystock"  id="safetystock" >			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Strategy Group</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" tabindex="20" <c:if test="${access eq 'Read'}" > disabled </c:if>list="StrategyGroupList"  onchange="return sgroup();"  value="${strategygrp}"class="form-control input-sm input_text" autocomplete="off" name="StrategyGroup"  onfocusout="StrategyGroupFun()" id="StrategyGroup" placeholder="Strategy Group">
			   <datalist id="StrategyGroupList">
			   <c:forEach items="${liststrgrp}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.strategygroup}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="StrategyGroupid" id="StrategyGroupid" >                      	   
		      </div>
		    </div>	
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Consumption Mode</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" tabindex="22" list="ConsumptionModeList" <c:if test="${access eq 'Read'}" > disabled </c:if> value="${consumptionmode}" autocomplete="off" onchange="return cmode();" class="form-control input-sm input_text" name="ConsumptionMode" onfocusout="ConsumptionmodeFun()"  id="ConsumptionMode" placeholder="Consumption Mode">
			   <datalist id="ConsumptionModeList">
			   <c:forEach items="${listconsm}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.concode}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ConsumptionModeid" id="ConsumptionModeid" >                   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Fwd Consumption per</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="24" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" autocomplete="off" placeholder="Fwd Consumption per" onkeypress="return isNumber(event)" maxlength="3" 
		      
		        <c:choose>
        <c:when test="${fwdconsumption==null || fwdconsumption==''}">
          value=""
        </c:when>
        <c:otherwise>
       value="${fwdconsumption}"
        </c:otherwise> 
    </c:choose>
		      
		      
		     name="fwdconsumptionper"  id="fwdconsumptionper" >			   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Availability Check	</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="26" <c:if test="${access eq 'Read'}" > disabled </c:if> list="AvailabilityCheckList" onchange="return acheck();" required value="${availibilitycheck}"class="form-control input-sm input_text" autocomplete="off" name="AvailabilityCheck" onfocusout=" AvailabilityFun()"  id="AvailabilityCheck" placeholder="Availability Check">
			   <datalist id="AvailabilityCheckList">
			   <c:forEach items="${listavchk}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.checkcode}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="AvailabilityCheckid" id="AvailabilityCheckid" >                    	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Component Scrap(%)</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="28" <c:if test="${access eq 'Read'}" > disabled </c:if>  class="form-control input-sm input_text" autocomplete="off" maxlength="6" placeholder="Component Scrap(%)"
		      
		      
		         <c:choose>
        <c:when test="${componentscrap==null || componentscrap==''}">
          value=""
        </c:when>
        <c:otherwise>
        value="${componentscrap}"
        </c:otherwise> 
    </c:choose>
		      
		       onkeypress="return isNumber(event)" name="componentscrap"  id="componentscrap" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Repetative mfg</label>
		      <div class="col-sm-8 input-group">
		      		<input type="checkbox" tabindex="30" <c:if test="${access eq 'Read'}" > disabled </c:if>   name="Repetativemfg" 
		      		<c:if test="${repetativemfg == 'true'}">checked="checked"</c:if>
		      		id="Repetativemfg" >                 	   
		      </div>
		    </div>
		    	    
	    </div>
   		
   		<div class="form-group ">	    
	     <%
	     if(rolename!=null && role !=null && access!=null)
	   	   {
  	 if(rolename.equals(role)  && access.equals("Read"))
	    {  
	   %>
   
          <div  class="col-md-1 col-md-offset-8" ><input type="submit" class="btn btn-primary form-control disabled"  name="Save" value="Save" onclick="checkform()"/></div>
<div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
	    <div class="col-md-1"><input type="button"  class="btn btn-primary form-control disabled" name="Clear" value="Clear" onclick="abbc()"/></div>
	    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
	     <%  
	    }
	   else
	   {     
	  %> 
	    <div  class="col-md-1 col-md-offset-8" ><input type="submit" class="btn btn-primary form-control<c:if test="${status eq 'Active' }"> disabled  </c:if>"  name="Save" value="Save" onclick="checkform()"/></div>
		<div class="col-md-1"><button type="submit" onclick="return (checkforms())" class="btn btn-primary" name="Submit" id="submit" value="Submit">Submit </button> </div>
		<!-- <div class="col-md-1"><button type="submit" class="btn btn-primary  btn-md" name="Submit"  value="Submit">Submit</button></div> -->
	    <div class="col-md-1"><input type="button"  class="btn btn-primary form-control" name="Clear" value="Clear" onclick="abbc()"/></div>
	    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
		<%
	    }}
		%>
	     </div> 
   		
   		</div>
   		</div>
   		<br>
   		
   		</div>
   	</div>
   		<br><br>

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
        <button type="button" onclick="javascript:window.location='MRP.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
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
	  window.location = "MRP.jsp";
	});
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
</script>
</form>

</body>
</html>
