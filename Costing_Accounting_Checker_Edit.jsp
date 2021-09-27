<%@page import="com.tvs.costing.CostingDAO"%>
<%@page import="com.tvs.costing.Costing"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.costing.Overheadgroup"%>
<%@page import="com.tvs.costing.OverheadgroupDAO"%>
<%@page import="com.tvs.costing.Variancekey"%>
<%@page import="com.tvs.costing.VariancekeyDAO"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.costing.Origingroupmaster"%>
<%@page import="com.tvs.costing.OrigingroupmasterDAO"%>
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
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
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
			url: "PlantMapping_Data/Plant.jsp",
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
	  
	 var ss= document.getElementById('OverheadGroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function varkeyFun() {
	  var selected =  $("#VarianceKeyList option[value='" + $('#VarianceKey').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('VarianceKeyid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
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
function OrgFun() {
	  var selected =  $("#OrigingroupList option[value='" + $('#Origingroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Origingroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function ShowEditPopup()
{	
	 
	 
	    $.ajax({
			type: "POST",
			url: "Costingview.jsp",    			
			cache: false,
			success: function(response)
	        {
				console.log(response);
	            $("#tableView").html(response);
	        }
	    });
}
function ValclsFun() {
	  var selected =  $("#ValuationClassList option[value='" + $('#ValuationClass').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('ValuationClassid').value =selected;//$('#materialgroupid').val("ssss");
	
	  
}
function get_materialPrice()
{	
	var Mcode = $("#MDMCode").val();	
	var Plant = $("#plant").val();
	
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
            $("#PriceControl").html(response);
        }
    });
	   
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
function get_HSNcode()
{
	
	var Mcode = $("#MDMCode").val();
		
	    $.ajax({
			type: "POST",
			url: "Accounting_Data/HSNCode.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
				console.log("llllllllllllllllllllll");
				console.log(response);
				$("#HSNw").html(response);
				$("#HSNw1").hide();            
	        }
	    });
}


</script>

<style type="text/css">
    a[disabled="disabled"] {
        pointer-events: none;
        text-decoration:none !important;
    }
</style>
</head>
<body onload="get_materialcode();get_description();get_PlantDesc();get_materialType();get_Origingroup();OverFun();varkeyFun();OrgFun();get_materialPrice();get_Pricedetermation();get_HSNcode();">

<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<% 

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
     access=rr.getCosting();
      mattype=rr.getMaterialtypecode();
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
OverheadgroupDAO  ovrDAO=new OverheadgroupDAO();
VariancekeyDAO vkyDAO= new VariancekeyDAO();
OrigingroupmasterDAO ormDAO=new OrigingroupmasterDAO();
SpecialProcurementDAO spldao = new SpecialProcurementDAO();


try
{
	Set<Talendcodes> listtd =td.costlist();
request.setAttribute("listtd",listtd);
List<Overheadgroup> listover =ovrDAO.getoverheadgroup();
request.setAttribute("listover",listover);
List<Variancekey> listvky =vkyDAO.getvariancekey();
request.setAttribute("listvky",listvky);
List<Origingroupmaster> listorm =ormDAO.getOrigingroupmaster();
request.setAttribute("listorm",listorm);

//new fields from form 2
List<SpecialProcurement> listsp = spldao.getSpecialProcure();
request.setAttribute("specialprocurementlist", listsp);
Valuationcatlist obj = new Valuationcatlist();

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
String status=cobj.getStatus();
String appstus=cobj.getApprovalprocess();

//new fields from form 2
Boolean donotcost = cobj.getdonotcost();
String specialprocurementcostcode = cobj.getspecialprocurementcostcode();
String specialprocurementcostdesc = cobj.getspecialprocurementcostdesc();
Integer valuationclasscode = cobj.getvaluationclasscode();
String valuationclassdesc = cobj.getvaluationclassdesc();
String valuationcatcode = cobj.getvaluationcatcode();
String valuationcatdesc = cobj.getvaluationcatdesc();
Valuationcatlist obj = new Valuationcatlist();
List<Plantlocationcode> plantlocationlist = obj.getvaluationcatplantcodes(valuationcatdesc);
List<SelectedPlantLocationcode> selectedplantlocationlist = obj.getvaluationcatplantcodesoncategory(mdmcode,plant);
String pricedeterminationcode = cobj.getpricedetermination();
String hsncode = cobj.gethsnw();


//

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
//new fields from form 2
pageContext.setAttribute("donotcost", donotcost);
pageContext.setAttribute("specialprocurementcost", specialprocurementcostdesc);
pageContext.setAttribute("specialprocurementcostid",specialprocurementcostcode);

pageContext.setAttribute("valuationclasscode",valuationclasscode);
pageContext.setAttribute("valuationclassdesc",valuationclassdesc);

pageContext.setAttribute("valuationcatcode",valuationcatcode);
pageContext.setAttribute("valuationcatdesc",valuationcatdesc);

pageContext.setAttribute("Pricedetermination", pricedeterminationcode);
pageContext.setAttribute("plantlocationlist", plantlocationlist);
pageContext.setAttribute("selectedplantlocationlist", selectedplantlocationlist);

//


%>

<form action="CostingCheckerUpdate" method="post">
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		<div class="col-md-12">
			 <fieldset>
			 <legend class="w-auto">Costing & Accounting View</legend> 
			 </fieldset> 
  		</div> 
   		<div class = "panel-body">
	    <fieldset class="scheduler-border">
		<legend class="scheduler-border">Costing View</legend>  
   		<div class="col-md-6">
   		
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Material Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="MdmCodeList" readonly value="${mdmcode}" class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off" onfocusout="get_Origingroup();get_description();get_materialcode();get_Plant();get_materialType();">
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
		      <select class="form-control input-sm" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList" readonly  value="${plantcode }" class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Overhead Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="OverheadGroupList" readonly value="${overheadgroup }" class="form-control input-sm input_text" name="OverheadGroup"  id="OverheadGroup"   placeholder="Overhead Group" onfocusout="OverFun();" >
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
		      		   <input type="checkbox" 
		      		   
		      		       <c:if test="${matiscosted == 'true'}">checked="checked"</c:if>
		      		   <c:if test="${status eq 'Inactive' }"> disabled="disabled" </c:if>
		      		   
		      		   name="MateriaCostedlid" id="MateriaCostedlid" >	
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Variance Key</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="VarianceKeyList" readonly value="${variancekey }"class="form-control input-sm input_text" name="VarianceKey"  id="VarianceKey"   placeholder="Variance Key" onfocusout="varkeyFun();">
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
		      		   <input type="checkbox" 
		      		   
		      		       <c:if test="${donotcost == 'true'}">checked="checked"</c:if>
		      		   <c:if test="${status eq 'Inactive' }"> disabled="disabled" </c:if>
		      		   
		      		   name="donotcost" id="donotcost" >	
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
		      		<select id="MDesc" class="form-control input-sm" name="MDesc" readonly>					
					</select>                     	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">		      	
		      <select class="form-control input-sm" id="plantdesc" name="plantdesc" readonly></select>		   
		      </div>
		    </div>
		      <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Costing Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" readonly value="${costinglotsize}" name="costlotsize"  id="costlotsize" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-6">Material Related Origin</label>
		      <div class="col-sm-6 input-group">
		      <input type="checkbox" readonly name="MaterialRelatedOriginid"
		      
		      <c:if test="${matrelated == 'true'}">checked="checked"</c:if>
		      <c:if test="${status eq 'Inactive' }"> disabled="disabled" </c:if>
		      
		       id="MaterialRelatedOriginid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Origin group</label>
		      <div class="col-sm-8 input-group">
<!-- 		      <select class="form-control input-sm" id="Origingroup" name="Origingroup"></select>
 -->		   
 
    <input type="text" list="OrigingroupList" readonly class="form-control input-sm input_text" value="${origingroup}" name="Origingroup"  id="Origingroup" onfocusout="OrgFun()"  placeholder="Origin group">
			   <datalist id="OrigingroupList">
			   <c:forEach items="${listorm}" var="pg">
			      	<option value="${pg.origindesc}" data-id="${pg.origin}"></option>  
	        	  </c:forEach>
			   </datalist>		        
		        <input type="hidden" name="Origingroupid" id="Origingroupid" >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Special Procurement Cost</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="SpecialProcuremetCostList" readonly class="form-control input-sm input_text" value="${specialprocurementcost}" name="specialprocurementcost"  id="specialprocurementcost" placeholder="Special Procurement Cost">
			   <datalist id="SpecialProcuremetCostList">
			   <c:forEach items="${specialprocurementlist}" var="spc">
			      	<option value="${spc.spdescription}" data-id="${spc.spcode}"></option>  
	           </c:forEach>
			   </datalist>		        
		        <input type="hidden" name="specialprocurementcostid" id="specialprocurementcostid" value="${specialprocurementcostid}">		   
		      </div>
		    </div>
		     		    
	    </div>
	    </fieldset>
	    <fieldset class="scheduler-border">
		<legend class="scheduler-border">Accounting View</legend> 
  		<div class="col-md-6">
  		<div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Valuation Class</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="ValuationClassList" readonly  value="${valuationclassdesc}" class="form-control input-sm " name="ValuationClass"  id="ValuationClass" required autocomplete="off" onfocusout="ValclsFun()" >
		      <datalist id="ValuationClassList">
		      
		      </datalist>	
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>
		      <input type="hidden" name="ValuationClassid" readonly id="ValuationClassid"  value="${valuationclasscode}" >		   
		      </div>
		 </div>
		 <div class="form-group ">
		      <label class="required control-label col-sm-4">Price Control</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" readonly id="PriceControl" name="PriceControl" onfocusout="get_materialPriceCat()">
		      
		      </select>			   
		      </div>
		 </div>
		 <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Valuation Cat.</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="ValuationCatlist" readonly  value="${valuationcatdesc}"  class="form-control input-sm " name="ValuationCat"  id="ValuationCat" autocomplete="off"  
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
		     	<select class="form-control input-sm"  multiple="multiple" name="multiselectvalc" id="multiselectvalc">
		     	<c:forEach items="${plantlocationlist}" var="m">  		            
		     	<option disabled value="${m.plantlocation}"
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
		      <input type="text" name="HSNw1" id="HSNw1" readonly class="form-control input-sm " >	   
		      </div>
		 </div>
		 <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Price determination</label>
		      <div class="col-sm-8 input-group">
		      		      <input type="text" name="HSw" id="HNw" readonly value="${Pricedetermination}" class="form-control input-sm " >
		      
		      </div>
		    </div>
  		</div>
  		</fieldset>
	    
   		
   		<div class="col-md-2 col-md-offset-8"><input type="submit"  class="btn btn-primary form-control"  name="Approval" value="Approve"/></div>  
	 
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
