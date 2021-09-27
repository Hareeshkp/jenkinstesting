<%@page import="com.tvs.mrp.PlantCode"%>
<%@page import="com.tvs.mrp.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">

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
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
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
	//var mattype = document.getElementById('mattype');
	var mattype = $("#mattype").val();	
	if(mattype!='ZHAW-Trading Material-ZHAW')
	{
		$("#Mrpgroup").prop("required",true);
		$("#MrpType").prop("required",true);
	}
	$("#AvailabilityCheck").prop("required",true);	
}

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
	            
	            var str = response;
	            var res = str.split("-");	

	            //var ss=res[1];
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
	    	    	$("#mgrp").removeClass("required");
	    	    	$("#mtyp").removeClass("required");
	    	    	//$("#mgrp").addClass("mandatory");
	    	    	//$("#mtyp").addClass("mandatory");
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
	   
	    
	    
	    //plant 
	    $.ajax({
			type: "POST",
			url: "MRP_Data/Plant.jsp",
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
	    
 	});
 		
 		$("input[name=plant]").on('change',function(){
 			var vals=$(this).val();
 		    //console.log(vals);
 		    
 		    //plant desc
 		    var Plant = $("#plant").val();	
 		    
 		   $("#MrpController").val('');	
 		   $("#Mrpgroup").val('');	
 		  $("#ProductionStorageLoc").val('');	
 		 $("#MrpControllerid").val('');	
		   $("#Mrpgroupid").val('');	
		  $("#ProductionStorageLocid").val('');	
 		  
		 
 		    $.ajax({
 				type: "POST",
 				url: "MRP_Data/plantdescription.jsp",
 				data: "Plant="+Plant,
 				cache: false,
 				success: function(response)
 		        {
 					
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
 		    
 		});
 		//MRP  Mrpgroup
 		$("input[name=Mrpgroup]").on('change',function(){
 		 var selected =  $("#MrpgroupList option[value='" + $('#Mrpgroup').val() + "']").attr('data-id');	
 		  var ss=$("#Mrpgroupid").val(selected);
 		});
 		//
 		$("input[name=MrpType]").on('change',function(){
 		var selected =  $("#MrpTypeList option[value='" + $('#MrpType').val() + "']").attr('data-id');
 		var ss= document.getElementById('MrpTypeid').value =selected; 		
 		  console.log(ss);
 		});
 		//
 		$("input[name=MrpController]").on('change',function(){
 		var selected =  $("#MrpControllerList option[value='" + $('#MrpController').val() + "']").attr('data-id');
 		
 		  var ss=$("#MrpControllerid").val(selected);
 		});
 		//
 		$("input[name=SpecialProcurementKey]").on('change',function(){
 		var selected =  $("#SpecialProcurementKeyList option[value='" + $('#SpecialProcurementKey').val() + "']").attr('data-id');
 		
 		  var ss=$("#SpecialProcurementKeyid").val(selected);	
 		});
 		// SchedMarginKey
 		$("input[name=BackFlush]").on('change',function(){
 		var selected =  $("#BackFlushList option[value='" + $('#BackFlush').val() + "']").attr('data-id'); 		
 		  var ss=$("#BackFlushid").val(selected);
 		});
 		
 		//$("input[name=SchedMarginKey]").on('change',function(){
 	 	//	var selected =  $("#SchedMarginKeyList option[value='" + $('#SchedMarginKey').val() + "']").attr('data-id'); 		
 	 	//	  var ss=$("#BackFlushid").val(selected);
 	 	//	});
 		$("input[name=MixedMRP]").on('change',function(){
 		var selected =  $("#MixedMRPList option[value='" + $('#MixedMRP').val() + "']").attr('data-id');
 		
 		  var ss=$("#MixedMRPid").val(selected);
 		});
 		//
 		$("input[name=Individuallcoll]").on('change',function(){
 		var selected =  $("#IndividuallcollList option[value='" + $('#Individuallcoll').val() + "']").attr('data-id');
 		
 		  var ss=$("#Individuallcollid").val(selected);
 		});
 		//
 		$("input[name=REMProfile]").on('change',function(){
 		var selected =  $("#REMProfileList option[value='" + $('#REMProfile').val() + "']").attr('data-id');
 		
 		  var ss=$("#REMProfileid").val(selected);
 		});
 		//
 		$("input[name=ABCIndicator]").on('change',function(){
 		var selected =  $("#ABCIndicatorList option[value='" + $('#ABCIndicator').val() + "']").attr('data-id');
 		
 		  var ss=$("#ABCIndicatorid").val(selected);	
 		});
 		//
 		$("input[name=LotSizingProcedure]").on('change',function(){
 		var selected =  $("#LotSizingProcedureList option[value='" + $('#LotSizingProcedure').val() + "']").attr('data-id');
 		
 		  var ss=$("#LotSizingProcedureid").val(selected);
 		});
 		//
 		$("input[name=ProcurementType]").on('change',function(){
 		var selected =  $("#ProcurementTypeList option[value='" + $('#ProcurementType').val() + "']").attr('data-id');
 		
 		  var ss=$("#ProcurementTypeid").val(selected);	
 		});
 		//
 		$("input[name=ProductionStorageLoc]").on('change',function(){
 		var selected =  $("#ProductionStorageLocList option[value='" + $('#ProductionStorageLoc').val() + "']").attr('data-id');
 		
 		  var ss=$("#ProductionStorageLocid").val(selected);
 		});
 		//
 		$("input[name=StrategyGroup]").on('change',function(){
 		var selected =  $("#StrategyGroupList option[value='" + $('#StrategyGroup').val() + "']").attr('data-id');
 		
 		  var ss=$("#StrategyGroupid").val(selected);
 		});
 		//
 		$("input[name=ConsumptionMode]").on('change',function(){
 		var selected =  $("#ConsumptionModeList option[value='" + $('#ConsumptionMode').val() + "']").attr('data-id');
 		
 		  var ss=$("#ConsumptionModeid").val(selected);	
 		});
 		//
 		$("input[name=AvailabilityCheck]").on('change',function(){
 		var selected =  $("#AvailabilityCheckList option[value='" + $('#AvailabilityCheck').val() + "']").attr('data-id');
 		
 		  var ss=$("#AvailabilityCheckid").val(selected);	
 		});
 	})
 	
 	
 	
 	
 	
 	function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
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
 	function ShowChecker(){
 		$.ajax({
 			type: "POST",
 			url: "MRPCheckerView.jsp",    			
 			cache: false,
 			success: function(response)
 	        {
 				console.log(response);
 	            $("#tableView").html(response);
 	        }
 	    });
 	}
 	
 	
</script>



</head>
<body >
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
//MaterialtypeDAO m =new MaterialtypeDAO();
Material_Material_Type_DAO m =new Material_Material_Type_DAO();

try
{
	List<Material_Material_Type> listm = m.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	/* List<Materialtype> listm = m.materiallist(rolename);
	request.setAttribute("listmaterial",listm); */
	List<PlantCode> listpc=pcd.plantcodelist1();
	request.setAttribute("listpc",listpc);
	
	Set<Talendcodes> listtd =new HashSet(); 
	Set<Talendcodes> lista=td.mrplist("ZFG");
	Set<Talendcodes> listb=td.mrplist("ZPRT");
	Set<Talendcodes> listc=td.mrplist("ZROH");
	Set<Talendcodes> listd=td.mrplist("ZSFG");
	Set<Talendcodes> liste=td.mrplist("ZSPR");
	Set<Talendcodes> listf=td.mrplist("ZHAW");
	
	listtd.addAll(lista);
	listtd.addAll(listb);
	listtd.addAll(listc);
	listtd.addAll(listd);
	listtd.addAll(liste);
	listtd.addAll(listf);
	request.setAttribute("listtd",listtd);
	
	/* if(mattype.equals("None"))
	{
		Set<Talendcodes> listtd =new HashSet(); 
		Set<Talendcodes> lista=td.mrplist("ZFG");
		Set<Talendcodes> listb=td.mrplist("ZPRT");
		Set<Talendcodes> listc=td.mrplist("ZROH");
		Set<Talendcodes> listd=td.mrplist("ZSFG");
		Set<Talendcodes> liste=td.mrplist("ZSPR");
		Set<Talendcodes> listf=td.mrplist("ZHAW");
		
		listtd.addAll(lista);
		listtd.addAll(listb);
		listtd.addAll(listc);
		listtd.addAll(listd);
		listtd.addAll(liste);
		listtd.addAll(listf);
		request.setAttribute("listtd",listtd);
	}

	else
	{
			if(mattype.equals("ZFG")||mattype.equals("ZPRT")|| mattype.equals("ZROH")|| mattype.equals("ZSFG")||mattype.equals("ZSPR")|| mattype.equals("ZHAW"))
			{
				Set<Talendcodes> listtd=td.mrplist(mattype);
				request.setAttribute("listtd",listtd);
			}
		
	}

 */


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

%>
<form action="MrpSave" method="post" >
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px; overflow:scroll;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">MRP View</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class=" required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="1" list="MdmCodeList" class="form-control input-sm " name="MDMCode" onchange="return mdmcode();" onkeypress="return isNumber(event)"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off"  >
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
		      <select tabindex="-1" class="form-control" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="2" list="PlantList" onkeypress="return isNumber(event)"  onchange="return plants();" class="form-control input-sm " placeholder="Plant" name="plant"  id="plant" required autocomplete="off"  >
		      <datalist id="PlantList">
		      
		      </datalist>	
		      			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		      		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4 " for="name" id="mgrp">MRP Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="3" list="MrpgroupList"   class="Materialtypes form-control input-sm input_text"  onchange="return mrpgroup();"    name="Mrpgroup"  id="Mrpgroup" autocomplete="off" required  onfocus="MRPGroupFun()" placeholder="MRP Group" >
			   <datalist id="MrpgroupList">
			   
			   </datalist>		        
		        <input type="hidden" name="Mrpgroupid" id="Mrpgroupid" >
		        			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		        
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4 " id="mtyp">MRP Type</label>
		      <div class="col-sm-8 input-group">
		       <input type="text" tabindex="5" list="MrpTypeList"   class="form-control input-sm input_text" name="MrpType"  id="MrpType" onchange="return mrptype();" autocomplete="off" onfocusout="MRPtypeFun()" required placeholder="MRP Type">
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
		      	<input type="text" tabindex="7" list="MrpControllerList" class="form-control input-sm input_text" onchange="return  mrpcontroller();" name="MrpController"  id="MrpController" autocomplete="off"  onfocusout="MRPcontrollerFun()"   placeholder="MRP Controller">
			   <datalist id="MrpControllerList">
			   
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="MrpControllerid" id="MrpControllerid" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="9" class="form-control input-sm " maxlength="13" name="minlotsize" onkeypress="return isNumber(event)" placeholder="Min. Lot Size" autocomplete="off" id="minlotsize"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Assembly Scrap(%)</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="11" class="form-control input-sm "  placeholder="Assembly Scrap(%)" autocomplete="off" maxlength="6"onkeypress="return isNumber(event)" name="assemblyscrap"  id="assemblyscrap"  >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Special Procurement Key</label>
		      <div class="col-sm-8 input-group">
				<input type="text" tabindex="13" list="SpecialProcurementKeyList" onchange="return specialproctype();" class="form-control input-sm input_text" name="SpecialProcurementKey" autocomplete="off" onfocusout="SpecialprocurementFun()"  id="SpecialProcurementKey" placeholder="Special Procurement Key">
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
		          <input type="text" tabindex="15" list="BackFlushList" class="form-control input-sm input_text" onchange="return backflush();" name="BackFlush" autocomplete="off" onfocusout="BackflushFun()" id="BackFlush" placeholder="Back Flush">
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
		      	  <input type="checkbox" tabindex="17" autocomplete="off"  placeholder="Co-Product" name="CoProduct"  id="CoProduct" > 
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">SchedMarginKey</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" tabindex="19" list="SchedMarginKeyList" class="form-control input-sm input_text" onchange="return smkey();" name="SchedMarginKey"  id="SchedMarginKey" autocomplete="off"  placeholder="SchedMarginKey">
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
		      <input type="text" tabindex="21" class="form-control input-sm "  placeholder="Min. Safety Stock" autocomplete="off" maxlength="17"onkeypress="return isNumber(event)"name="minsafetystock"  id="plant"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Bwd Consumption per</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="23" class="form-control input-sm " maxlength="3"  placeholder="Bwd Consumption per" autocomplete="off" onkeypress="return isNumber(event)" name="bwdconsumptionper"  id="bwdconsumptionper"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Mixed MRP</label>
		      <div class="col-sm-8 input-group">
			     <input type="text" tabindex="25" list="MixedMRPList" class="form-control input-sm input_text" name="MixedMRP"  onchange="return mixedmrp();" onfocusout="MixedMrpFun()"  id="MixedMRP" autocomplete="off" placeholder="Mixed MRP">
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
		      <input type="text" tabindex="27" class="form-control input-sm " autocomplete="off"  placeholder="Tot.repl.lead time" maxlength="3"onkeypress="return isNumber(event)" name="Totreplleadtime"  id="plant"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4">Individuallcoll</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" tabindex="29" list="IndividuallcollList" class="form-control input-sm input_text" onchange="return Individuallcall();" onfocusout="IndividuallcollFun()" name="Individuallcoll"  id="Individuallcoll" autocomplete="off" placeholder="Individuall coll">
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
				<input type="text" tabindex="31" list="REMProfileList" class="form-control input-sm input_text" name="REMProfile" onchange="return remprofile();"  id="REMProfile" onfocusout="RemprofileFun()" autocomplete="off" placeholder="REM Profile">
			   <datalist id="REMProfileList">
			   <c:forEach items="${listrem}" var="pg">
			      	<option value="${pg.remprofiledesc}" data-id="${pg.remprofile}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="REMProfileid" id="REMProfileid" >			   
		      </div>
		    </div>
		    
	    </div>    
   		
   		<div class="col-md-6">
   		
   		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		      <select tabindex="-1" class="form-control input-sm" id="mattype" name="mattype" readonly></select>			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      		<select tabindex="-1" id="MDesc" name="MDesc" class="form-control" readonly>					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select tabindex="-1" class="form-control" id="plantdesc" name="plantdesc" readonly></select>		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">ABC Indicator</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="4" list="ABCIndicatorList" class="form-control input-sm input_text" name="ABCIndicator"  onchange="return abcindicator();"  id="ABCIndicator" autocomplete="off" onfocusout="AbcindicatorFun()" placeholder="ABC Indicator">
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
		      <input type="text" tabindex="6" class="form-control input-sm input_text" placeholder="Record Point" maxlength="17" onkeypress="return isNumber(event)" name="recordpoint" autocomplete="off"  id="recordpoint" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Lot Sizing Procedure</label>
		      <div class="col-sm-8 input-group">
			     <input type="text" tabindex="8" list="LotSizingProcedureList" class="form-control input-sm input_text"  onchange="return lotsizing(); "    name="LotSizingProcedure"  id="LotSizingProcedure" autocomplete="off" onfocusout="LotsizingprocedureFun()" placeholder="Lot Sizing Procedure">
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
		      <input type="text" tabindex="10" class="form-control input-sm input_text" maxlength="13" onkeypress="return isNumber(event)"  name="maxstocklevel" autocomplete="off" placeholder="Maximum Stock Level"  id="maxstocklevel" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Procurement Type</label>
		      <div class="col-sm-8 input-group">
				  <input type="text" tabindex="12" list="ProcurementTypeList" class="form-control input-sm input_text" autocomplete="off" name="ProcurementType" onchange="return proctype();"  id="ProcurementType" onfocusout="ProcurementtypeFun()" placeholder="Procurement Type">
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
		      	<input type="text" tabindex="14" list="ProductionStorageLocList" class="form-control input-sm input_text" autocomplete="off" onchange="return productionstorageloc();" name="ProductionStorageLoc"   id="ProductionStorageLoc" onfocusout="ProductionstorageFun()" placeholder="Production Storage Location">
			   <datalist id="ProductionStorageLocList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ProductionStorageLocid" id="ProductionStorageLocid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">In-House Production</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="16" class="form-control input-sm input_text"  autocomplete="off" placeholder="In-House Production" onkeypress="return isNumber(event)" maxlength="3" name="inhouseproduction"  id="inhouseproduction" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">PlannedDeliv.Time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="18" class="form-control input-sm input_text" autocomplete="off"  placeholder="PlannedDeliv.Time" maxlength="3" onkeypress="return isNumber(event)" name="planneddelivtime"  id="planneddelivtime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Safety Stock</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="20" class="form-control input-sm input_text" autocomplete="off"  placeholder="Safety Stock" maxlength="13" name="safetystock" onkeypress="return isNumber(event)" id="safetystock" >			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Strategy Group</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" tabindex="22" list="StrategyGroupList" class="form-control input-sm input_text" name="StrategyGroup" onchange="return sgroup();" onfocusout="StrategyGroupFun()" autocomplete="off"   id="StrategyGroup" placeholder="Strategy Group">
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
		      		<input type="text" tabindex="24" list="ConsumptionModeList" class="form-control input-sm input_text" name="ConsumptionMode" autocomplete="off"  onchange="return cmode();"  onfocusout="ConsumptionmodeFun()" id="ConsumptionMode" placeholder="Consumption Mode">
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
		      <input type="text" tabindex="26" placeholder="Fwd Consumption per" autocomplete="off" class="form-control input-sm input_text" maxlength="3" onkeypress="return isNumber(event)" name="fwdconsumptionper"  id="fwdconsumptionper" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Availability Check	</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="28" list="AvailabilityCheckList" required class="form-control input-sm input_text" onchange="return acheck();" autocomplete="off" name="AvailabilityCheck"   id="AvailabilityCheck" onfocusout="AvailabilityFun()" placeholder="Availability Check">
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
		      <input type="text" tabindex="30" class="form-control input-sm input_text" placeholder="Component Scrap(%)"  autocomplete="off"  maxlength ="6"onkeypress="return isNumber(event)" name="componentscrap"  id="componentscrap" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Repetative mfg</label>
		      <div class="col-sm-8 input-group">
		      		<input type="checkbox" tabindex="32" name="Repetativemfg"  id="Repetativemfg" >                 	   
		      </div>
		    </div>
		    	    
	    </div>
   		
   		<!-- Button -->
   		   <!-- <div class="col-md-1 col-md-offset-8"><input type="submit" class="btn btn-primary form-control"  value="Save" onclick="SaveFunc()"></div>
		   <div class="col-md-1"><input type="button" class="btn btn-primary form-control"  value="Clear"></div>
   <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" onclick="ShowEditPopup()">Edit</button></div>
		   <div class="col-md-1" style="display:none;"><a href="#"  class="btn btn-primary form-control">Exit</a></div> -->  
   		
   		<!-- Role Based changed the button showing -->
   		<%
   		if(rolename!=null && role !=null && access!=null)
    	   {
		   if(rolename.equals(role)  && access.equals("Read"))
		    {
		   %>
		    <div class="col-md-1 col-md-offset-8"><input type="submit" class="btn btn-primary form-control disabled"name="Save"  value="Save" onclick="SaveFunc()"/></div>
		    <div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
		    
		    <div class="col-md-1"><a href="MRP.jsp" class="btn btn-primary form-control disabled">Clear</a></div>
		    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control "  data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   
		   <%
		    }
		  
		   else
		   {
		   %>
		     <div class="col-md-1 col-md-offset-8"><input type="submit" name="Save" class="btn btn-primary form-control" onclick="checkform();"  value="Save"/></div>
		     <div class="col-md-1"><button type="submit" onclick="return (checkforms())" class="btn btn-primary" name="Submit" id="submit" value="Submit">Submit </button> </div>
			 <!--<div class="col-md-1"><button type="submit" class="btn btn-primary  btn-md" name="Submit"  value="Submit">Submit</button></div>-->
		     <div class="col-md-1"><a href="MRP.jsp"  class="btn btn-primary form-control">Clear</a></div>
		     <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
		   
		   <%}}%>
   		
   		</div>
   		</div>
   		<br>
   		</div>
   	</div>
   		
<br><br>
   <!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 82%;">

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
