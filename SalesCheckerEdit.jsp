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
<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
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
 
    
function get_AccsitCode()
{
	console.log("true");
	var Mcode = $("#MDMCode").val();
		
	    $.ajax({
			type: "POST",
			url: "Sales/Acctassignmentgrp.jsp",
			data: "materialtype="+Mcode,
			cache: false,
			success: function(response)
	        {	
				console.log(response);
	            $("#AcctassignmentgrpList").html(response);	            
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
	 var ss= document.getElementById('SalesOraganizationid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function MatlgrpFun() {
	  var selected =  $("#MatlstatisticsgroupList option[value='" + $('#Matlstatisticsgroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Matlstatisticsgroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function AcctFun() {
	  var selected =  $("#AcctassignmentgrpList option[value='" + $('#Acctassignmentgrp').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Acctassignmentgrpid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}  
function ItemFun() {
	  var selected =  $("#ItemcategorygroupList option[value='" + $('#Itemcategorygroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Itemcategorygroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function LoadFun() {
	  var selected =  $("#LoadingGroupList option[value='" + $('#LoadingGroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('LoadingGroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function DistFun() {
	  var selected =  $("#DistchannelList option[value='" + $('#Distchannel').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Distchannelid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function MpriceFun() {
	  var selected =  $("#MaterialpricegroupList option[value='" + $('#Materialpricegroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Materialpricegroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function gengrpFun() {
	  var selected =  $("#GenitemcatgroupList option[value='" + $('#Genitemcatgroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Genitemcatgroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function TransFun() {
	  var selected =  $("#TransportationgroupList option[value='" + $('#Transportationgroup').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Transportationgroupid').value =selected;//$('#materialgroupid').val("ssss");
	 console.log(ss);
	  
}
function DelFun() {
	  var selected =  $("#DeliveringplantList option[value='" + $('#Deliveringplant').val() + "']").attr('data-id');	  
	 var ss= document.getElementById('Deliveringplantid').value =selected;//$('#materialgroupid').val("ssss");
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


</head>
<body onload="get_materialcode();get_description();get_PlantDesc();get_materialType();SalesFun();DistFun();MatlgrpFun();MpriceFun();AcctFun();gengrpFun();ItemFun();TransFun();LoadFun(); DelFun();
">
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
     access=rr.getSales();
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
SalesOrganizationDAO sloDAO =new SalesOrganizationDAO();
MatlstatisticsgrpDAO mtlDAO=new MatlstatisticsgrpDAO();
ItemcategorygroupDAO itcDAO=new ItemcategorygroupDAO();
LoadingGroupDAO loDAO=new LoadingGroupDAO();
MaterialPriceGrpDAO mprgDAO=new MaterialPriceGrpDAO();
GenitemcatgrpDAO gmDAO=new GenitemcatgrpDAO();
TransportationGroupDAO tgpDAO=new TransportationGroupDAO();
DistChannelDAO dcDAO=new DistChannelDAO();
DeliveringPlantDAO depDAO=new DeliveringPlantDAO();

try
{

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
String gencat=s.getGencatgrpdesc();
String itemcat=s.getItmcatgrpdesc();
String transgrp=s.getTrngrpdesc();
String lodgrp=s.getLodgrpdesc();
String delplant=s.getDelplantdesc();
String reasonforedit=s.getReasonforedit();
Integer version=s.getVersion();
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


pageContext.setAttribute("version",version);

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
//new fields
pageContext.setAttribute("segmentvalue",segmentvalue1);
pageContext.setAttribute("applicationvalue",applicationvalue1);
pageContext.setAttribute("ccvalue",ccvalue1);
pageContext.setAttribute("polymervalue",polymervalue1);
pageContext.setAttribute("aspectratiovalue",aspectratiovalue1);
//new fields

%>

<form action="SalesCheckerUpdate" method="post">
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Sales View</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-6">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">MDM Code</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="MdmCodeList"  value="${mdmcode }" readonly class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="Talend Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_AccsitCode();get_materialType();">
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
		      <select class="form-control" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList" readonly value="${plant }" class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>	
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Sales Oraganization</label>
		      <div class="col-sm-8 input-group">
				 <input type="text" list="SalesOraganizationList" readonly value="${salesorg}" class="form-control input-sm input_text" name="SalesOraganization"  id="SalesOraganization"   placeholder="Sales Oraganization" onfocusout="SalesFun();" >
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
				<input type="text" list="MatlstatisticsgroupList" readonly value="${mstatgrp}"class="form-control input-sm input_text" name="Matlstatisticsgroup"  id="Matlstatisticsgroup"   placeholder="Matl statistics group" onfocusout="MatlgrpFun();">
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
				     <input type="text" list="AcctassignmentgrpList" readonly value="${accassign}"class="form-control input-sm input_text" name="Acctassignmentgrp"  id="Acctassignmentgrp"   placeholder="Acct assignment grp List" onfocusout="AcctFun();" >
			   <datalist id="AcctassignmentgrpList">
			   <c:forEach items="${listmtl}" var="pg">
			      	<option value="${pg.desc}" data-id="${pg.code}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>	        
		        <input type="hidden" name="Acctassignmentgrpid" id="Acctassignmentgrpid" >	   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4">Item category group</label>
		      <div class="col-sm-8 input-group">
		      	 <input type="text" list="ItemcategorygroupList" readonly value="${itemcat}" class="form-control input-sm input_text" name="Itemcategorygroup"  id="Itemcategorygroup"   placeholder="Item category group" onfocusout="ItemFun();">
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
		      <label class="required control-label col-sm-4 " for="name">Loading Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="LoadingGroupList" value="${lodgrp}" readonly class="form-control input-sm input_text" name="LoadingGroup"  id="LoadingGroup"   placeholder="Loading GroupList" onfocusout="LoadFun();">
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
		      <label class="control-label col-sm-4 " for="name">Segment</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="SegmentList" value="${segmentvalue}" readonly class="form-control input-sm input_text" name="segment"  id="segment"   placeholder="Segment" onfocusout="LoadSegment();">
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
		      <label class="control-label col-sm-4 " for="name">Application</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="ApplicationList" value="${applicationvalue}" readonly class="form-control input-sm input_text" name="application"  id="application"   placeholder="Application" onfocusout="LoadApplication();">
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
		      <label class="control-label col-sm-4 " for="name">CC</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="CCList" value="${ccvalue}" readonly class="form-control input-sm input_text" name="cc"  id="cc"   placeholder="CC" onfocusout="LoadCC();">
			   <datalist id="CCList">
			   <c:forEach items="${cclistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="LoadingGroupid" id="LoadingGroupid" >
		      </div>
		    </div>
		     		  		     <div class="form-group " <c:if test="${version < 1 }" > style='display:none;' </c:if> <c:if test="${status eq 'Draft' }"> style='display:none;'  </c:if>>

	      <label class="control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" disabled  class="form-control input-sm" id="reasonforedit"  value="${reasonforedit}"  placeholder="Reason for edit" name="reasonforedit" autocomplete="off">        
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
		      		<select id="MDesc" class="form-control" name="MDesc" readonly>					
					</select>                   	   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Description</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control" id="plantdesc" name="plantdesc" readonly></select>			   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Dist. channel</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="DistchannelList" value="${distchnl}" readonly class="form-control input-sm input_text" name="Distchannel"  id="Distchannel"   placeholder="Dist channel" onfocusout="DistFun();">
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
		      	<input type="text" list="MaterialpricegroupList" readonly value="${mtpricegrp}" class="form-control input-sm input_text" name="Materialpricegroup"  id="Materialpricegroup"   placeholder="Material price group" onfocusout="MpriceFun();" >
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
		      	<input type="text" list="GenitemcatgroupList" readonly value="${gencat}" class="form-control input-sm input_text" name="Genitemcatgroup"  id="Genitemcatgroup"   placeholder="Gen item cat group " onfocusout="gengrpFun();" >
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
		        <input type="text" list="TransportationgroupList" value="${transgrp}"  readonly class="form-control input-sm input_text" name="Transportationgroup"  id="Transportationgroup"   placeholder="Transportation group" onfocusout="TransFun();" >
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
		      <input type="text" list="DeliveringplantList" value="${delplant}" readonly class="form-control input-sm input_text" name="Deliveringplant"  id="Deliveringplant"   placeholder="Delivering plant" onfocusout="DelFun();">
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
		      	<input type="text" list="AspectRatioList" value="${aspectratiovalue}" readonly class="form-control input-sm input_text" name="aspectratio"  id="aspectratio"   placeholder="Aspect Ratio" onfocusout="LoadAspectRatio();">
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
		      <label class="control-label col-sm-4 " for="name">Polymer</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="PolymerList" value="${polymervalue}" readonly class="form-control input-sm input_text" name="polymer"  id="polymer"   placeholder="Polymer" onfocusout="LoadPolymer();">
			   <datalist id="PolymerList">
			   <c:forEach items="${polymerlistvalue}" var="slv">
			      	<option value="${slv.desc}" data-id="${slv.code}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="polymerid" id="polymerid" >
		      </div>
		    </div>	    
	    	<div class="col-md-3 col-md-offset-4"><input type="submit"  class="btn btn-primary form-control"  name="Approval" value="Approve"/></div>  
	 
   	<div class="col-md-3"> <button type="button" class="btn btn-primary form-control" id="btnreject">Reject</button></div>
   	
  	<br><br>
  	<div id="rject" style="display:none;" class="col-md-offset-3">
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
