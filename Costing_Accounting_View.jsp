<%@page import="com.tvs.costing.PlantCode"%>
<%@page import="com.tvs.costing.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
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
 <style id="compiled-css" type="text/css">
      .multiselect-container>li>a>label {
  padding: 4px 20px 3px 20px;
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

<script type="text/javascript">
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

 	$(document).ready(function() {	
 		
 		document.getElementById('matcode').style.pointerEvents = 'none';
 		document.getElementById('mattype').style.pointerEvents = 'none';
 		document.getElementById('MDesc').style.pointerEvents = 'none';
 		document.getElementById('plantdesc').style.pointerEvents = 'none';
 		
 		$("input[name=MDMCode]").on('change',function(){  
 			$("#plant").val('');
 			$('#plantdesc').val('');
 		var Mcode = $("#MDMCode").val(); 	
 		var mattype = "";
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
		        ss = ss.split(">");
	        	ss = ss[0];
		        ss = ss.replace('"','');	
		        mattype = ss;
		        //firstChar = ss;
		        //var spl=ss.split(">");
		       
		        //firstChar=spl[0].slice(0,-1);
		        //mattype = firstChar
		        if( mattype =="ZROH" ){		    		
		    		$("#Origingroup").prop("required",true);
		    		//$("#org").removeClass("mandatory");
		    		$("#org").addClass("required");

		    	}
		    	else{
		    		$("#Origingroup").prop("required",false);
		    		//$("#org").removeClass("mandatory");
		    		//$("#org").addClass("mandatory");
		    		$("#org").removeClass("required")
		    	}
		      //plant 
			    $.ajax({	    	
			    	type: "POST",
					url: "Accounting_Data/Plant.jsp",
					data : {
			            "materialtype":Mcode,
			            "mtype":mattype
			        },
					cache: false,
					success: function(response)
			        {
			            $("#PlantList").html(response);
			        }
			    });
		      	var mtcode = mattype;
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
	    //
	    $.ajax({
			type: "POST",
			url: "orgingroup.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
			
	           // $("#OrigingroupList").html(response);	
				$("#Origingroup").html(response);
	        }
	    });
	  //HSN Codee
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
	    
	    //ValuationClassList
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
 	});
 		
 		$("input[name=plant]").on('change',function(){
 			var vals=$(this).val();
 		    
 		    //plant desc
 		    var Plant = $("#plant").val();	
 		    $.ajax({
 				type: "POST",
 				url: "Accounting_Data/plantdescription.jsp",
 				data: "Plant="+Plant,
 				cache: false,
 				success: function(response)
 		        {
 					
 		            $("#plantdesc").html(response);
 		        }
 		    });
 		   var mattyp = $("#mattype").val();	
 			
 			 var str = mattyp;
 	         var res = str.split("-");		        
 		     //var ss=res[1];
 		     var ss=res[0];
 		     if( ss =="ZPRT"||ss =="ZRTP" ||ss =="ZCAP" || ss=="ZNBW"){
 		    	$("#ValuationClass").prop("required",false);
 		    	//$("#valcls").addClass("mandatory");	
 		    	$("#valcls").removeClass("required");
 		    }
 		     else if(typeof(ss) == 'undefined')
 		     {
 		    	$("#ValuationClass").prop("required",false);
 		    	//$("#valcls").addClass("mandatory");
 		    	$("#valcls").removeClass("required");
 		    }
 		    else
 		    {
 		    	$("#ValuationClass").prop("required",true);
 		    	//$("#valcls").removeClass("mandatory");
 		    	$("#valcls").addClass("required");
 		    }
 		    $.ajax({
 				type: "POST",
 				url: "Accounting_Data/ValuationCat.jsp", 			
 				//alert(Plant);
 				//data: "materialtype="+vals,
 				 data : {
 			            "materialtype":ss,
 			            "plant":Plant
 			        },
 				
 				cache: false,
 				success: function(response)
 		        {	
 					$("#ValuationCat").html(response);	
 					var mattyp = response;	
 					var str = mattyp;
 			        var res = str.split("@");		        
 				    var ss=res[1]; 	
 				    var split1;
	 				var spplit2;
 				    if(typeof(ss) == 'undefined')
 				    {
 				    	//$("#valcat").addClass("mandatory");
 				    	split1 = ""
 				    	split2 = ""
 				    	$("#valcat").removeClass("required"); 	
 				    }
 				    else
		        	{		        	
		        		//$("#valcat").removeClass("mandatory");
		        		split1 = ss.split('<')[0];
 				    	split2 = split1.split('>')[1];
 				    	$("#valcat").addClass("required"); 				    	
		        	}
 				    if(split2!="")
 				    {
 	 				    $.ajax({
 	 				    	type:"POST",
 	 				    	url:"Accounting_Data/ValuationCatPlant.jsp",
 	 				    	data:"valcat="+split2,
 	 				    	cache:false,
 	 				    	success:function(response)
 	 				    	{
 	 				    		$("#multiselectvalc").html(response)
 	 				    	}
 	 				    })
 				    }
 				    else
 				    {

 				    	$('#multiselectvalc').find('option').remove()
 				    	//$('#multiselectvalc > option').each(function() {
 				    		
 				    		//$("#multiselectvalc option[value='option1']").remove();

 				    	    //alert($(this).text() + ' ' + $(this).val());
 				    	//});
 				    }
 		        }
 		    });
 			//PriceControl
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
 			        var strfst=res[1];
 			        console.log(strfst)
 			        firstChar=strfst.charAt(0); 			        
 		            $("#PriceControl").html(response);
 		            $.ajax({
 		    			type: "POST",
 		    			url: "Accounting_Data/Pricedetermination.jsp",
 		    			data: "materialtype="+firstChar,		
 		    			cache: false,
 		    			success: function(response)
 		    	        {	
 		    	            $("#Pricedetermination").html(response);
 		    	        }
 		    	    });
 		        }
 		    });
 		});
 		//
 		$("input[name=OverheadGroup]").on('change',function(){
 		 var selected =  $("#OverheadGroupList option[value='" + $('#OverheadGroup').val() + "']").attr('data-id');
 		  
 		 var ss= document.getElementById('OverheadGroupid').value =selected;//$('#materialgroupid').val("ssss");
 		 console.log(ss);
 		});
 		$("input[name=VarianceKey]").on('change',function(){
 		 var selected =  $("#VarianceKeyList option[value='" + $('#VarianceKey').val() + "']").attr('data-id');	  
 		 var ss= document.getElementById('VarianceKeyid').value =selected;//$('#materialgroupid').val("ssss");
 		 console.log(ss);
 		});
 		//
 		$("input[name=Origingroup]").on('change',function(){
 		var selected =  $("#OrigingroupList option[value='" + $('#Origingroup').val() + "']").attr('data-id');	  
 		 var ss= document.getElementById('Origingroupid').value =selected;//$('#materialgroupid').val("ssss");
 		 console.log(ss);
 		});
 		$("input[name=specialprocurementcost]").on('change',function(){
 	 		var selected =  $("#SpecialProcuremetCostList option[value='" + $('#specialprocurementcost').val() + "']").attr('data-id');	  
 	 		 var ss= document.getElementById('specialprocurementcostid').value =selected;//$('#materialgroupid').val("ssss");
 	 		 console.log(ss);
 	 		});
 		$("input[name=ValuationClass]").on('change',function(){	
 			console.log('***************************8');
 			var vals=$(this).val();
 		    var id = $('#ValuationClassList [value="' + vals + '"]').data('id');
 			console.log('***************************');
 		    console.log(id);
 		    document.getElementById('ValuationClassid').value =id;
 		});

 		
 	})
</script>

<script type="text/javascript">
//Valuation Class textchanged
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
function datalistValidatorvclass(modelname) {
	var obj = $("#ValuationClassList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
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
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
</script>


</head>
<body >
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
	List<PlantCode> listpc=pcd.plantcodelist1();
	//List<PlantCode> listpc=pcd.plantcodelist(mattype);
	request.setAttribute("listpc",listpc);
	//these comes under same validattion
	Set<Talendcodes> listtd =new HashSet(); 
	Set<Talendcodes> lista=td.costlist("ZFG");
	Set<Talendcodes> listb=td.costlist("ZROH");
	Set<Talendcodes> listc=td.costlist("ZSFG");
	
	Set<Talendcodes> listg=td.mrplist2("ZPRT");//prod resource tool
	Set<Talendcodes> listi=td.mrplist2("ZHAW");//trading material
	//these comes under same validattion

	

	
	//Set<Talendcodes> lista=td.accountlist("ZFG");
	//Set<Talendcodes> listb=td.accountlist("ZROH");
	//Set<Talendcodes> listc=td.accountlist("ZSFG");
	
	Set<Talendcodes> listd=td.mrplist2("ZCP1");
	Set<Talendcodes> liste=td.mrplist2("ZCAP");
	Set<Talendcodes> listf=td.mrplist2("ZIMT");
	Set<Talendcodes> listh=td.mrplist2("ZSCR");
	
	Set<Talendcodes> listj=td.mrplist("ZCON");
	Set<Talendcodes> listk=td.mrplist("ZFUE");
	Set<Talendcodes> listl=td.mrplist("ZPAC");
	Set<Talendcodes> listm1=td.mrplist("ZPOW");
	Set<Talendcodes> listn=td.mrplist("ZNBW");
	Set<Talendcodes> listo=td.mrplist("ZRTP");
	Set<Talendcodes> listp=td.mrplist("ZSTA");
	Set<Talendcodes> listq=td.mrplist("ZWEL");
	Set<Talendcodes> listr=td.saleslist("ZSPR");
	
	listtd.addAll(lista);
	listtd.addAll(listb);
	listtd.addAll(listc);
	
	listtd.addAll(listd);
	listtd.addAll(liste);
	listtd.addAll(listf);
	listtd.addAll(listg);
	listtd.addAll(listh);
	listtd.addAll(listi);
	
	listtd.addAll(listj);
	listtd.addAll(listk);
	listtd.addAll(listl);
	listtd.addAll(listm1);
	listtd.addAll(listn);
	listtd.addAll(listo);
	listtd.addAll(listp);
	listtd.addAll(listq);
	listtd.addAll(listr);

	request.setAttribute("listtd",listtd);
	/*Set<Talendcodes> lista=td.costlist("ZFG");
	Set<Talendcodes> listb=td.costlist("ZROH");
	Set<Talendcodes> listc=td.costlist("ZSFG");
	listtd.addAll(lista);
	listtd.addAll(listb);
	listtd.addAll(listc);
	request.setAttribute("listtd",listtd);*/

List<Overheadgroup> listover =ovrDAO.getoverheadgroup();
request.setAttribute("listover",listover);
List<Variancekey> listvky =vkyDAO.getvariancekey();
request.setAttribute("listvky",listvky);
List<Origingroupmaster> listorm =ormDAO.getOrigingroupmaster();
request.setAttribute("listorm",listorm);
//new fields
List<SpecialProcurement> listsp = spldao.getSpecialProcure();
request.setAttribute("specialprocurementlist", listsp);

//new fields

}
catch(Exception e)
{
	
}

%>

<form action="CostingSave" method="post">
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
		      <input type="text" tabindex = "1" list="MdmCodeList" maxlength="8" onkeypress="return isNumber(event)" onchange="return mdmcode();" class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off" onfocusout="get_Origingroup();get_description();get_materialcode();get_materialType();">
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
		      <select class="form-control input-sm" tabindex = "-1" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList" tabindex = "2" maxlength="4"  onchange=" return plants();"  class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" required >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Overhead Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="OverheadGroupList" tabindex = "3" class="form-control input-sm input_text" autocomplete="off"  name="OverheadGroup"  id="OverheadGroup"  onfocusout="OverFun()"  placeholder="Overhead Group" onchange="return overheadgroupmt();"  >
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
		      		   <input type="checkbox" tabindex = "5" name="MateriaCostedlid" id="MateriaCostedlid" >	
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Variance Key</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="VarianceKeyList" tabindex = "7" class="form-control input-sm input_text" name="VarianceKey" onchange="return VarianceKeys();" autocomplete="off"  id="VarianceKey"  onfocusout="varkeyFun()"  placeholder="Variance Key" >
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
		      		   <input type="checkbox" tabindex = "9" name="donotcost" id="donotcost" >	
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
		      		<select id="MDesc" tabindex = "-1" class="form-control input-sm" name="MDesc" readonly >					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select class="form-control input-sm" tabindex = "-1" id="plantdesc" name="plantdesc" readonly required></select>		   
		      </div>
		    </div>
		      <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Costing Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" tabindex = "4"  maxlength="13" name="costlotsize"  id="costlotsize" autocomplete="off" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-6">Material Related Origin</label>
		      <div class="col-sm-6 input-group">
		      <input type="checkbox" name="MaterialRelatedOriginid" tabindex = "6" id="MaterialRelatedOriginid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="org" for="name">Origin group</label>
		      <div class="col-sm-8 input-group">
<!-- 		      <select class="form-control input-sm" id="Origingroup" name="Origingroup"></select>
 -->		   
 
    <input type="text" list="OrigingroupList" tabindex = "8" class="form-control input-sm input_text" autocomplete="off"  name="Origingroup" onchange="return origingroup();"  id="Origingroup" onfocusout="OrgFun()"  placeholder="Origin group">
			   <datalist id="OrigingroupList">
			   <c:forEach items="${listorm}" var="pg">
			      	<option value="${pg.origindesc}" data-id="${pg.origin}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
			   	        
		        <input type="hidden" name="Origingroupid" id="Origingroupid" >		   
		      </div>
		    </div>
		    <div class="form-group">
		    <label class="control-label col-sm-4">Special Procurement Cost</label>
		    <div class="col-sm-8 input-group">
		    <input type="text" list="SpecialProcuremetCostList" tabindex = "10" class="form-control input-sm input_text" autocomplete="off" name="specialprocurementcost" onchange=""  id="specialprocurementcost" onfocusout=""  placeholder="Special Procurement Cost">
		    <datalist id="SpecialProcuremetCostList">
		    <c:forEach items="${specialprocurementlist}" var="sp">
		    	<option value="${sp.spdescription}" data-id="${sp.spcode}"></option>
		    </c:forEach>
   		    </datalist>
		    <span class="glyphicon glyphicon-search form-control-feedback"></span>
		    <input type="hidden" name="specialprocurementcostid" id="specialprocurementcostid">
		    </div>
		    </div>
		     		    
	    </div>
	    </fieldset>
		<fieldset class="scheduler-border">
		<legend class="scheduler-border">Accounting View</legend> 
  		<div class="col-md-6">
  			<div class="form-group ">
		      <label class="control-label col-sm-4" for="name" id="valcls">Valuation Class</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex = "11" list="ValuationClassList"  class="form-control input-sm " onchange="return  Validationclass();" name="ValuationClass" onfocusout="ValclsFun()"  id="ValuationClass" autocomplete="off"  >
		      <datalist id="ValuationClassList">		      
		      </datalist>	
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>
		      <input type="hidden" name="ValuationClassid" id="ValuationClassid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4">Price Control</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" tabindex = "-1" readonly  id="PriceControl" name="PriceControl"  required>		      
		      </select>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="valcat">Valuation Cat.</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" readonly tabindex = "-1" id="ValuationCat" name="ValuationCat">
		      </select>			   
		      </div>
		    </div> 
		    <div class="form-group">
		     <label class="control-label col-sm-4" id="multiselectval"></label>
		     <div class="col-sm-8 input-group">
		     	<select class="form-control input-sm " tabindex = "13" multiple="multiple" name="multiselectvalc" id="multiselectvalc" >		
   				</select>
		      </div>
		    </div>	
		    	
  		</div>
  		<div class="col-md-6">
  			<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">HSN Code</label>
		      <div class="col-sm-8 input-group">
		      <div id="HSNw"></div>
		      <input type="text" name="HSNw1" tabindex = "-1" id="HSNw1" readonly  class="form-control input-sm " >
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
		      <select class="form-control input-sm" tabindex = "-1" readonly  id="Pricedetermination" name="Pricedetermination" required>			      
		      </select>		   
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
		     <div class="col-md-1 col-md-offset-8"><input type="submit" name="Save" class="btn btn-primary form-control"  onclick="checkform()" value="Save"/></div>
			 <div class="col-md-1"><button type="submit"  onclick="return (checkforms())" class="btn btn-primary" name="Submit"  value="Submit">Submit</button></div>
		     <div class="col-md-1"><a href="Costing_Accounting_View.jsp"  class="btn btn-primary form-control">Clear</a></div>
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
