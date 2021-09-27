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
   <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
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
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
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
			url: "MRP_Data/Plant.jsp",
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
	            
	            var str = response;
	            var res = str.split("-");
	            var ss=res[2];
	            //var ss=res[1];
	            var spl=ss.split(">");
	            firstChar = spl[0].replace('"','')	           
	            //firstChar=spl[0].slice(0,-1);

	            if(firstChar=="ZSFG"|| firstChar=="ZROH"|| firstChar=="ZSPR"|| firstChar=="ZFG"|| firstChar=="ZPRT"|| firstChar=="ZFUE"){
	    	    	$("#Mrpgroup").prop("required",true);
	    	    	$("#MrpType").prop("required",true);
	    	    	
	    	    	//$("#mgrp").removeClass("mandatory");
	    	    	//$("#mtyp").removeClass("mandatory");
	    	    	$("#mgrp").addClass("required");
	    	    	$("#mtyp").addClass("required");
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
}

function MRPGroupFun() { 
	  var selected =  $("#MrpgroupList option[value='" + $('#Mrpgroup').val() + "']").attr('data-id');
	
	  var ss=$("#Mrpgroupid").val(selected);	
	 
}
function AbcindicatorFun() { 
	  var selected =  $("#ABCIndicatorList option[value='" + $('#ABCIndicator').val() + "']").attr('data-id');
	
	  var ss=$("#ABCIndicatorid").val(selected);	
	 
}
function MRPtypeFun() { 
	  var selected =  $("#MrpTypeList option[value='" + $('#MrpType').val() + "']").attr('data-id');
	
	  var ss=$("#MrpTypeid").val(selected);	
	 
}

function MRPcontrollerFun() { 
	  var selected =  $("#MrpControllerList option[value='" + $('#MrpController').val() + "']").attr('data-id');
	
	  var ss=$("#MrpControllerid").val(selected);	
	 
}

function LotsizingprocedureFun() { 
	  var selected =  $("#LotSizingProcedureList option[value='" + $('#LotSizingProcedure').val() + "']").attr('data-id');
	
	  var ss=$("#LotSizingProcedureid").val(selected);	
	 
}

function MRPGroupFun() { 
	  var selected =  $("#MrpgroupList option[value='" + $('#Mrpgroup').val() + "']").attr('data-id');
	
	  var ss=$("#Mrpgroupid").val(selected);	
	 
}

function ProcurementtypeFun() { 
	  var selected =  $("#ProcurementTypeList option[value='" + $('#ProcurementType').val() + "']").attr('data-id');
	
	  var ss=$("#ProcurementTypeid").val(selected);	
	 
}

function SpecialprocurementFun() { 
	  var selected =  $("#SpecialProcurementKeyList option[value='" + $('#SpecialProcurementKey').val() + "']").attr('data-id');
	
	  var ss=$("#SpecialProcurementKeyid").val(selected);	
	 
} 

function ProductionstorageFun() { 
	  var selected =  $("#ProductionStorageLocList option[value='" + $('#ProductionStorageLoc').val() + "']").attr('data-id');
	
	  var ss=$("#ProductionStorageLocid").val(selected);	
	 
}

function BackflushFun() { 
	  var selected =  $("#BackFlushList option[value='" + $('#BackFlush').val() + "']").attr('data-id');
	
	  var ss=$("#BackFlushid").val(selected);	
	 
}

function StrategyGroupFun() { 
	  var selected =  $("#StrategyGroupList option[value='" + $('#StrategyGroup').val() + "']").attr('data-id');
	
	  var ss=$("#StrategyGroupid").val(selected);	
	 
}
function ConsumptionmodeFun() { 
	  var selected =  $("#ConsumptionModeList option[value='" + $('#ConsumptionMode').val() + "']").attr('data-id');
	
	  var ss=$("#ConsumptionModeid").val(selected);	
	 
}





function MixedMrpFun() { 
	  var selected =  $("#MixedMRPList option[value='" + $('#MixedMRP').val() + "']").attr('data-id');
	
	  var ss=$("#MixedMRPid").val(selected);	
	 
}

function AvailabilityFun() { 
	  var selected =  $("#AvailabilityCheckList option[value='" + $('#AvailabilityCheck').val() + "']").attr('data-id');
	
	  var ss=$("#AvailabilityCheckid").val(selected);	
	 
}

function IndividuallcollFun() { 
	  var selected =  $("#IndividuallcollList option[value='" + $('#Individuallcoll').val() + "']").attr('data-id');
	
	  var ss=$("#Individuallcollid").val(selected);	
	 
}

function RemprofileFun() { 
	  var selected =  $("#REMProfileList option[value='" + $('#REMProfile').val() + "']").attr('data-id');
	
	  var ss=$("#REMProfileid").val(selected);	
	 
}


</script>


</head>
<body onload="get_materialcode();get_description();get_PlantDesc();get_materialType();MRPGroupFun();AbcindicatorFun();MRPtypeFun();MRPcontrollerFun();LotsizingprocedureFun();ProcurementtypeFun();SpecialprocurementFun();ProductionstorageFun();BackflushFun();StrategyGroupFun();ConsumptionmodeFun();MixedMrpFun();AvailabilityFun();IndividuallcollFun();RemprofileFun();


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
     access=rr.getMrp();
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
try
{
	
	
	

	Set<Talendcodes> listtd =td.mrplist();
	request.setAttribute("listtd",listtd);





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
String mrpgroup=m.getMrpgroupcodedesc();
String abcindicator=m.getAbcindicatorcodedesc();
String mrptype=m.getMrptypedesc();
Integer recordpoint=m.getReorderpoint();
String mrpcontroller=m.getMrpcontrollercodedesc();
String lotsizing=m.getLotsizingdesc();
String minlotsize=m.getMinlotsize();
String maxstocklevel=m.getMaximamstocklevel();
Integer assemblyscrap=m.getAssemblyscrap();
String procurementtype=m.getProcurementtypecodedesc();
String specialproc=m.getSpecialprocurementcodedesc();

String prodstorageloc=m.getProductionstoragelocationdesc();
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


Integer version=m.getVersion();


pageContext.setAttribute("version",version);


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
pageContext.setAttribute("reasonforedit",reasonforedit);

%>
<form action="MrpCheckerUpdate" method="post">
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
		      <input type="text" list="MdmCodeList" readonly value="${mdmcode}"  class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="MDM Material Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_materialType()">
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
		      <select class="form-control" id="matcode" name="matcode" readonly></select>	   
		      </div>
		    </div>		    
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Plant</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="PlantList" readonly value="${plantcode}" class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc()" >
		      <datalist id="PlantList">
		      
		      </datalist>			   
		      </div>
		    </div>
		    		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="mgrp" for="name">MRP Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" tabindex="1" list="MrpgroupList" readonly autocomplete="off" value="${mrpgroup}" onchange="return mrpgroup();" class="Materialtypes form-control input-sm input_text" name="Mrpgroup"  id="Mrpgroup" onfocusout="MRPGroupFun()"  placeholder="MRP Group" >
			   <datalist id="MrpgroupList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="Mrpgroupid" id="Mrpgroupid" value="${mrpgroupcode}" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" id="mtyp">MRP Type</label>
		      <div class="col-sm-8 input-group">
		       <input type="text" tabindex="3" list="MrpTypeList" value="${mrptype}" readonly autocomplete="off" onchange="return mrptype();"   class="form-control input-sm input_text" name="MrpType"  id="MrpType" onfocusout="MRPtypeFun()" placeholder="MRP Type">
			   <datalist id="MrpTypeList">
			   <c:forEach items="${listmt}" var="pg">
			      	<option value="${pg.mrpdesc}" data-id="${pg.mrptype}"></option>  
	        	  </c:forEach>
			   </datalist>	
<span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="MrpTypeid" id="MrpTypeid" >
		      </div>
		    </div>
		    <!-- <div class="form-group ">
		      <label class="required control-label col-sm-4" id="mgrp" for="name">MRP Group</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="MrpgroupList" value="${mrpgroup}" readonly class="Materialtypes form-control input-sm input_text" name="Mrpgroup"  id="Mrpgroup" onfocusout="MRPGroupFun()"  placeholder="MRP Group" >
			   <datalist id="MrpgroupList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="Mrpgroupid" id="Mrpgroupid" >
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" id="mtyp" >MRP Type</label>
		      <div class="col-sm-8 input-group">
		       <input type="text" list="MrpTypeList" value="${mrptype}" readonly class="form-control input-sm input_text" name="MrpType"  id="MrpType" onfocusout="MRPtypeFun()" placeholder="MRP Type">
			   <datalist id="MrpTypeList">
			   <c:forEach items="${listmt}" var="pg">
			      	<option value="${pg.mrpdesc}" data-id="${pg.mrptype}"></option>  
	        	  </c:forEach>
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="MrpTypeid" id="MrpTypeid" >
		      </div>
		    </div>  -->
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">MRP Controller</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="MrpControllerList" value="${mrpcontroller}" readonly class="form-control input-sm input_text" name="MrpController"  id="MrpController" onfocusout="MRPcontrollerFun()"    placeholder="MRP Controller">
			   <datalist id="MrpControllerList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="MrpControllerid" id="MrpControllerid" >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Lot Size</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm " placeholder="Min. Lot Size" maxlength="13" readonly value="${minlotsize}" name="minlotsize"  id="minlotsize"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Assembly Scrap(%)</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm " placeholder="Assembly Scrap(%)" maxlength="6" readonly onkeypress="return isNumber(event)"  
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
				<input type="text" list="SpecialProcurementKeyList" value="${specialproc}" class="form-control input-sm input_text" readonly name="SpecialProcurementKey" onfocusout="SpecialprocurementFun()"  id="SpecialProcurementKey" placeholder="Special Procurement Key">
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
		          <input type="text" list="BackFlushList" value="${backflush}" readonly class="form-control input-sm input_text" name="BackFlush" onfocusout="BackflushFun() " id="BackFlush" placeholder="Back Flush">
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
		      	  <input type="checkbox"   name="CoProduct" disabled
		      	  
		      	  		      		       <c:if test="${coproduct == 'true'}">checked="checked"</c:if>
		      	  
		      	    id="CoProduct" > 
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">SchedMarginKey</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" list="SchedMarginKeyList" readonly value="${schedmkey}"class="form-control input-sm input_text" name="SchedMarginKey"  id="SchedMarginKey" onfocusout="SchedmarginFun()" placeholder="SchedMarginKey">
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
		      <input type="text"  class="form-control input-sm " readonly placeholder="Min. Safety Stock" maxlength="17"onkeypress="return isNumber(event)" value="${minsaftystock}" name="minsafetystock"  id="plant"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Bwd Consumption per</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm " readonly placeholder="Bwd Consumption per" maxlength="3" onkeypress="return isNumber(event)"
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
			     <input type="text" list="MixedMRPList" value="${mixedmrp}" readonly class="form-control input-sm input_text" name="MixedMRP"  onfocusout="MixedMrpFun()" id="MixedMRP" placeholder="Mixed MRP">
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
		      <input type="text"  class="form-control input-sm " readonly placeholder="Tot.repl.lead time"  maxlength="3"onkeypress="return isNumber(event)"  
		    	  <c:choose>
		        <c:when test="${totleadtime==null || totleadtime==''}">
		          value=""
		        </c:when>
		        <c:otherwise>
		      value="${totleadtime}"
		        </c:otherwise> 
		    </c:choose>
		      
		      name="Totreplleadtime"  id="plant"  >		   
		      </div>
		    </div>
		     <div class="form-group ">
		      <label class="control-label col-sm-4">Individuallcoll</label>
		      <div class="col-sm-8 input-group">
			      <input type="text" list="IndividuallcollList" readonly value="${indivuallcoll}" class="form-control input-sm input_text" name="Individuallcoll"  id="Individuallcoll" onfocusout="IndividuallcollFun()" placeholder="Individuall coll">
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
				<input type="text" list="REMProfileList" readonly value="${remprofile}" class="form-control input-sm input_text" name="REMProfile" onfocusout="RemprofileFun()" id="REMProfile" placeholder="REM Profile">
			   <datalist id="REMProfileList">
			   <c:forEach items="${listrem}" var="pg">
			      	<option value="${pg.remprofiledesc}" data-id="${pg.remprofile}"></option>  
	        	  </c:forEach>
			   </datalist>		
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			           
		        <input type="hidden" name="REMProfileid" id="REMProfileid" >			   
		      </div>
		    </div>
		    
		    
		  		     <div class="form-group " <c:if test="${version < 1 }" > style='display:none;' </c:if> <c:if test="${status eq 'Draft' }"> style='display:none;'  </c:if>>

	      <label class="control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" class="form-control input-sm" id="reasonforedit" value="${reasonforedit}" disabled  placeholder="Reason for edit" name="reasonforedit" autocomplete="off">        
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
		      		<select id="MDesc" name="MDesc" class="form-control" readonly>					
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
		      <label class="control-label col-sm-4">ABC Indicator</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="ABCIndicatorList"  readonly value="${abcindicator}" class="form-control input-sm input_text" name="ABCIndicator" onfocusout="AbcindicatorFun()"  id="ABCIndicator" placeholder="ABC Indicator">
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
		      <input type="text"  class="form-control input-sm input_text" readonly placeholder="Record Point" maxlength="17" 
		      
		       <c:choose>
        <c:when test="${recordpoint==null || recordpoint==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${recordpoint}"
        </c:otherwise> 
    </c:choose>
		      
		       onkeypress="return isNumber(event)" name="recordpoint"  id="ptime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Lot Sizing Procedure</label>
		      <div class="col-sm-8 input-group">
			     <input type="text" list="LotSizingProcedureList" value="${lotsizing}" readonly class="form-control input-sm input_text" name="LotSizingProcedure" onfocusout="LotsizingprocedureFun()" id="LotSizingProcedure" placeholder="Lot Sizing Procedure">
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
		      <input type="text"  class="form-control input-sm input_text" readonly maxlength="13" placeholder="Maximum Stock Level" value="${maxstocklevel}"name="maxstocklevel"  id="maxstocklevel" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4">Procurement Type</label>
		      <div class="col-sm-8 input-group">
				  <input type="text" list="ProcurementTypeList" readonly value="${procurementtype}" class="form-control input-sm input_text" name="ProcurementType" onfocusout="ProcurementtypeFun()" id="ProcurementType" placeholder="Procurement Type">
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
		      	<input type="text" list="ProductionStorageLocList" readonly value="${prodstorageloc}" class="form-control input-sm input_text" name="ProductionStorageLoc" onfocusout="ProductionstorageFun()"  id="ProductionStorageLoc" placeholder="Production Storage Location">
			   <datalist id="ProductionStorageLocList">
			  
			   </datalist>	
			   			      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
			   	        
		        <input type="hidden" name="ProductionStorageLocid" id="ProductionStorageLocid" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">In-House Production</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" readonly value="${houseproduction}" placeholder="In-House Production" maxlength="3" onkeypress="return isNumber(event)" name="inhouseproduction"  id="inhouseproduction" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">PlannedDeliv.Time</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" readonly
		      
		      <c:choose>
        <c:when test="${plandelvtime==null || plandelvtime==''}">
          value=""
        </c:when>
        <c:otherwise>
        value="${plandelvtime}"
        </c:otherwise> 
    </c:choose>
		      
		        maxlength="3" placeholder="PlannedDeliv.Time" onkeypress="return isNumber(event)" name="planneddelivtime"  id="planneddelivtime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Safety Stock</label>
		      <div class="col-sm-8 input-group">
		      <input type="text"  class="form-control input-sm input_text" readonly value="${saftystock}" placeholder="Safety Stock" maxlength="13" onkeypress="return isNumber(event)"name="safetystock"  id="safetystock" >			   
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Strategy Group</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" list="StrategyGroupList" value="${strategygrp}" readonly class="form-control input-sm input_text" name="StrategyGroup"  onfocusout="StrategyGroupFun()" id="StrategyGroup" placeholder="Strategy Group">
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
		      		<input type="text" list="ConsumptionModeList" value="${consumptionmode}" readonly class="form-control input-sm input_text" name="ConsumptionMode" onfocusout="ConsumptionmodeFun()"  id="ConsumptionMode" placeholder="Consumption Mode">
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
		      <input type="text"  class="form-control input-sm input_text" readonly placeholder="Fwd Consumption per" onkeypress="return isNumber(event)" maxlength="3" 
		      
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
		      <label class="required control-label col-sm-4 " for="name">Availability Check	</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="AvailabilityCheckList" required value="${availibilitycheck}" readonly class="form-control input-sm input_text" name="AvailabilityCheck" onfocusout=" AvailabilityFun()"  id="AvailabilityCheck" placeholder="Availability Check">
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
		      <input type="text"  class="form-control input-sm input_text" readonly maxlength="6" placeholder="Component Scrap(%)" 
		      
		      
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
		      		<input type="checkbox"   name="Repetativemfg"  disabled
		      				      		       <c:if test="${repetativemfg == 'true'}">checked="checked"</c:if>
		      		
		      		
		      		  id="Repetativemfg" >                 	   
		      </div>
		    </div>
		    	    
	    </div>
   		
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
   		<br>
   		</div>
   	</div>
   		
<br><br>
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
