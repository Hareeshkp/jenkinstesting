
<%@page import="com.tvs.Purchase.PlantCode"%>
<%@page import="com.tvs.Purchase.PlantCodeDAO"%>
<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@page import="com.tvs.Purchase.PurchaseDAO"%>
<%@page import="com.tvs.Purchase.Purchase"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvs.Purchase.Model"%>
<%@page import="com.tvs.Purchase.ModelDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.tvs.Purchase.Orderunit"%>
<%@page import="com.tvs.Purchase.OrderunitDAO"%>
<%@page import="com.tvs.Purchase.Purchasingvaluekey"%>
<%@page import="com.tvs.Purchase.PurchasingvaluekeyDAO"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.tvs.Purchase.Purchasinggroup" %>
<%@ page import="com.tvs.Purchase.PurchasinggroupDAO" %>
<%@page import="com.tvs.plantandstorage.Serialnoprofile"%>
<%@page import="com.tvs.plantandstorage.SerialnoprofileDAO"%>
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

function checkform()
{
	$("#PurchasingGroup").prop("required",false);


}
function checkforms()
	{
		$("#PurchasingGroup").prop("required",true);   
}
	
// new fields from form 2
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
</script>
<script type="text/javascript">
$(document).ready(function() {	
	document.getElementById('matcode').style.pointerEvents = 'none';
	document.getElementById('mattype').style.pointerEvents = 'none';
	document.getElementById('MDesc').style.pointerEvents = 'none';
	document.getElementById('plantdesc').style.pointerEvents = 'none';

 		
 		$("input[name=MDMCode]").on('change',function(){  
 			
 		
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
			url: "Plantmapping_Data/Plant.jsp",
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
 		    $.ajax({
 				type: "POST",
 				url: "Plantmapping_Data/plantdescription.jsp",
 				data: "Plant="+Plant,
 				cache: false,
 				success: function(response)
 		        {
 					
 		            $("#plantdesc").html(response);
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
 	
})
</script>

</head>
<body onload="ProfitCenterFunc();get_materialType();get_PlantDesc();get_materialcode();get_description();PurchasingGroupFun();OrderUnitFunc();ModelFunc();">
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
ModelDAO mdo =new ModelDAO();
PlantCodeDAO pcd=new PlantCodeDAO();
//MaterialtypeDAO m =new MaterialtypeDAO();
Material_Material_Type_DAO m =new Material_Material_Type_DAO();

try
{
	//List<Materialtype> listm = m.materiallist(rolename);
	//request.setAttribute("listmaterial",listm);	
	
	List<PlantCode> listpc=pcd.plantcodelist();
	request.setAttribute("listpc",listpc);
	
	List<Material_Material_Type> listm = m.matertialtypelist(rolename);
	request.setAttribute("listmaterial",listm);	
	
	List<Purchasinggroup> listg = pda.pgrouplist();
	request.setAttribute("listpgroup",listg);
	List<Model> listmodel =mdo.modellist();
	request.setAttribute("listmodel",listmodel);
	List<Purchasingvaluekey> listk = pdk.pkeylist();
	request.setAttribute("listpkey",listk);
	
	List<Orderunit> listou = ou.unitlist();
	request.setAttribute("listounit",listou);
	//new fields from form 2
	SerialnoprofileDAO sno=new SerialnoprofileDAO();
	List<Serialnoprofile> listno = sno.seriallist();
	request.setAttribute("listno",listno);
	UnitofissueDAO ui=new UnitofissueDAO();
	List<Unitofissue> listui = ui.unitlist();
	request.setAttribute("listui",listui);
	//
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
	}
	 */

}
catch(Exception e)
{
	
}
//talendcode
Integer sid=Integer.parseInt(request.getParameter("id"));  
String plantt=request.getParameter("plant");

System.out.println("cccccccccccccccccccccc"+sid+plantt);
Purchase pobj =PurchaseDAO.getPurchaseByTalendcode(sid,plantt);

Integer mdmcode=pobj.getMdmcode();
String materialtypecode=pobj.getMaterialtypecode();
String materialtypedesc=pobj.getMaterialtypedesc();

String materialcode=pobj.getMaterialcode();
String mdesc=pobj.getMaterialcodedesc();
String plant=pobj.getPlantcode();
String plantdesc=pobj.getPlantcodecodedesc();
String purchasinggroup=pobj.getPurchasegroupdesc();
String purchasingcode=pobj.getPurchasegroup();
Integer grprocessing =pobj.getGrprocessingtime();
String purchasingvaluekey=pobj.getPurchasekeyvalue();
String orderunit=pobj.getOrderunitdesc();
String modeldesc=pobj.getModeldesc();
String potext=pobj.getPotext();
String reasonforedit=pobj.getReasonforedit();
String status=pobj.getStatus();
String appstus=pobj.getApprovalprocess();
Integer version=pobj.getVersion();
//new fields from form 2
Integer minremshelflife = pobj.getminshelf();
Integer totalshelflife = pobj.gettotalshelf();
String profitcentrecode = pobj.getprofitcentercode();
String profitcentredesc = pobj.getprofitcenterdesc();
String storagebin = pobj.getstoragebin();
String unitofissuecode = pobj.getunitofissue();
String unitofissuedesc = pobj.getsunitofissuedesc();
String serialnumberprofiledesc = pobj.getserialnoprofiledesc();
String serialnumberprofilecode = pobj.getserialnoprofile();

//



pageContext.setAttribute("modeldesc",modeldesc);
pageContext.setAttribute("version",version);


pageContext.setAttribute("mdmcode",mdmcode);
pageContext.setAttribute("plant",plant);
pageContext.setAttribute("purchasingcode",purchasingcode);

pageContext.setAttribute("purchasinggroup",purchasinggroup);
pageContext.setAttribute("grprocessing",grprocessing);
pageContext.setAttribute("purchasingvaluekey",purchasingvaluekey);


pageContext.setAttribute("orderunit",orderunit);
pageContext.setAttribute("potext",potext);
pageContext.setAttribute("reasonforedit",reasonforedit);
pageContext.setAttribute("status",status);
pageContext.setAttribute("appstus", appstus);


pageContext.setAttribute("access", access);
pageContext.setAttribute("status", status);
// new fields from from 2
pageContext.setAttribute("minshelf", minremshelflife);
pageContext.setAttribute("totalshelf", totalshelflife);
pageContext.setAttribute("ProfitCenteid", profitcentrecode);
pageContext.setAttribute("ProfitCentedec", profitcentredesc);
pageContext.setAttribute("unitofissuedesc", unitofissuedesc);
pageContext.setAttribute("unitofissuecode", unitofissuecode);
pageContext.setAttribute("serialnodesc",serialnumberprofiledesc);
pageContext.setAttribute("serialno",serialnumberprofilecode);
pageContext.setAttribute("storagebin",storagebin);








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
<form action="Purchaseupdate" method="post">

<script type="text/javascript">
function datalistValidatormdm(modelname) {
	var obj = $("#MdmCodeList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}s
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
	}
		}
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
 function abc()
 {
	 
 var clr="<%=status%>";
 console.log(clr);
 var appstus="<%=appstus%>";
 console.log(appstus);
 if(clr=='Draft')
	 {
	 draftClr();
	 }
 else
	 {
	
	 activclr();
	 }
 if(appstus=='Reject'){
	 draftClr();
 }
 }
 
 function draftClr()
 {	
	 //$("#MDMCode").val('');
	// $("#matcode").val('');
	 $("#PurchasingGroup").val('');
	 $("#PurchaseKeyVal").val('');
	 $("#potext").val('');

	 $("#ptime").val('');
	 $("#OrderUnit").val('');
	 $("#combo").val('');
	// $("#mattype").val('');
	//for form 2
	 $("#minshelf").val('');		
	 $("#UnitDesc").val('');	 
	 $("#totalshelf").val('');
	 $("#storagebin").val('');
	 $("#SerialNo").val('');	

	
	
 }
 
 function activclr()
 {	 $("#reasonforedit").val('');

	 $("#potext").val('');
	 $("#OrderUnit").val('');
	 $("#ptime").val('');
	 //from form 2
	 $("#minshelf").val('');
	 $("#totalshelf").val('');
	 $("#storagebin").val('');
	 $("#SerialNo").val('');
 }
 // new fields from form 2
 function ProfitDesc(){
	console.log($('#Profitd').val());
	var selected =  $("#ProfitList option[value='" + $('#Profitd').val() + "']").attr('data-id');
	
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

 // new fields from form 2
 </script>
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
		      	<input type="text" required list="MdmCodeList" value="${mdmcode }" maxlength="30" onchange="return MdmCode();" readonly onkeypress="return isNumber(event)"   class="form-control input-sm " name="MDMCode"  id="MDMCode"  placeholder="Talend Code" required autocomplete="off" onfocusout="get_description();get_materialcode();get_Plant();get_materialType();"
		      	<c:if test="${status eq 'Active' }"> readonly </c:if>
		      	>
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
		      <input type="text" required list="PlantList" value="${plant}" readonly  onkeypress="return isNumber(event)" onchange="return plants();"   class="form-control input-sm " name="plant"  id="plant" required autocomplete="off" onfocusout="get_PlantDesc();ProfitCenterFunc();" 
		      <c:if test="${status eq 'Active' }"> readonly </c:if>
		      >
		      <datalist id="PlantList">
		      
		      </datalist>
		      <span class="glyphicon glyphicon-search form-control-feedback"></span>			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Purchasing Group</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" required list="PurchasingGroupList" tabindex="1" maxlength="40" value="${purchasinggroup }"  class="form-control input-sm " name="PurchasingGroup"  id="PurchasingGroup"  onchange="return pgroup();" placeholder="Purchasing Group" onfocusout="PurchasingGroupFun()"  required autocomplete="off" 
		      <c:if test="${status eq 'Active' }"> readonly tabindex="-1"</c:if>
		      >
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
		      <input type="text" list="PurchaseKeyValList" tabindex="3" maxlength="5" value="${purchasingvaluekey }"  onchange="return pkeyval();" class="form-control input-sm " name="PurchaseKeyVal"  id="PurchaseKeyVal"  placeholder="Purchasing Value Key"  onfocusout="PurchaseKeyValFun()"   autocomplete="off"
		      <c:if test="${status eq 'Active' }"> readonly tabindex="-1" </c:if>
		      >
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
		      <input type="text" onkeypress="return onlyAlpha(event,this);" tabindex="5" value="${potext }" <c:if test="${access eq 'Read' }"> disabled </c:if> maxlength="132" placeholder="PO Text" class="form-control input-sm " name="potext"  id="potext"  autocomplete="off"  >			   
		      </div>
		    </div>
		    
		    <!--<div class="form-group " <c:if test="${status eq 'Draft' }"> style='display:none;'  </c:if> <c:if test="${appstus eq 'Rejected' }"> style='display:none;'  </c:if>  >
	      <label class="control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text"  class="form-control input-sm" <c:if test="${access eq 'Read' }"> disabled </c:if>  id="reasonforedit" <c:if test="${status eq 'Active' }"> required </c:if> placeholder="Reason for Edit" name="reasonforedit" autocomplete="off">        
	      </div>
	    </div> -->
	    
	 
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
		      <input type="text" tabindex="2" <c:if test="${access eq 'Read' }"> disabled </c:if>
		          <c:choose>
        <c:when test="${grprocessing==null || grprocessing==''}">
          value=""
        </c:when>
        <c:otherwise>
       value="${grprocessing}"
        </c:otherwise> 
    </c:choose>
		      
		       maxlength="3" placeholder="GR. Processing Time"onkeypress="return isNumber(event)" class="form-control input-sm input_text" name="ptime" autocomplete="off" id="ptime" >			   
		      </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Order Unit</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="4" list="OrderUnitList"maxlength="40" <c:if test="${access eq 'Read' }"> disabled </c:if> value="${orderunit }" onchange="return orderunit();" class="form-control input-sm " name="OrderUnit"  id="OrderUnit"  placeholder="Order Unit" onfocusout="OrderUnitFunc()"  autocomplete="off" 
		     
		      >
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
		      		 <input type="text" list="ModelList" tabindex="6"		      <c:if test="${status eq 'Active' }"> readonly tabindex="-1"</c:if>
		      		  maxlength="40" class="form-control input-sm " <c:if test="${access eq 'Read' }"> disabled </c:if> name="Model"  id="Model"  placeholder="Model" value="${modeldesc}"  onfocusout="ModelFunc();" onchange="return model();" autocomplete="off" >
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
		 <div class = "col-md-6">
		 <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Min. Rem. Shelf Life</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="7" class="form-control input-sm "<c:if test="${access eq 'Read' }"> disabled </c:if> placeholder="Min. Rem. Shelf Life"  onkeypress="return isNumber(event)" maxlength="5" 
		       <c:choose>
		        <c:when test="${minshelf==null || minshelf==''}">
		          value=""
		        </c:when>
		        <c:otherwise> value="${minshelf}"
		        </c:otherwise> 
		   		</c:choose>
		   		name="minshelf"  id="minshelf"  onfocusout="ProfitDesc();"  >		   
		      </div>
		    </div>
		    <div class="form-group ">
		    <label class="required control-label col-sm-4">Profit Centre</label>
		    <div class="col-sm-8 input-group">
		    <select class="form-control" tabindex="-1" id="ProfitCenteid" name="ProfitCenteid" readonly>
		    </select>	
		    <select class="form-control input-sm" id="ProfitCentedec" name="ProfitCentedec" style="display:none;">
		    </select>
		    </div>
		    </div>
		    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Unit of Issue</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="UnitList" tabindex="9" value="${unitofissuedesc}" maxlength="40" class="form-control input-sm " name="UnitDesc"  id="UnitDesc"  placeholder="Unit of Issue" onchange="return unitofissue();" autocomplete="off" onfocusout="get_UnitIssue();"
		      <c:if test="${status eq 'Active' }"> readonly tabindex="9"</c:if>
		      >
			      <datalist id="UnitList">
			      <c:forEach items="${listui}" var="pg">
			      	<option value="${pg.text}" data-id="${pg.measureunit}"></option>  
	        	  </c:forEach>
			      </datalist>
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>	
			      <input type="hidden" name="UintID" id="UintID" value="${unitofissuecode}" >	   
		      </div>
		    </div>
		  <div class="form-group " <c:if test="${status eq 'Draft' }"> style='display:none;'   </c:if> <c:if test="${appstus eq 'Rejected' }"> style='display:none;'  </c:if>>
	      <label class="required control-label col-sm-4 ">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="11" class="form-control input-sm" id="reasonforedit" <c:if test="${access eq 'Read' }"> disabled </c:if>  <c:if test="${status eq 'Active' }"> required </c:if> placeholder="Reason for edit" name="reasonforedit" autocomplete="off">        
	      </div>
	    </div>
	    </div>
	    <div class = "col-md-6">
		 <div class="form-group ">
	      <label class="control-label col-sm-4" for="name">Total Shelf Life</label>
	      <div class="col-sm-8 input-group">
	      <input type="text" tabindex="8" <c:if test="${access eq 'Read' }"> disabled </c:if>
	      <c:choose>
	      <c:when test="${totalshelf==null || totalshelf==''}">
	      value=""
	      </c:when>
	      <c:otherwise>
	      value="${totalshelf}"
	      </c:otherwise> 
	      </c:choose>
	      value="${totalshelf}" placeholder="Total Shelf Life" onkeypress="return isNumber(event)" maxlength="5" class="form-control input-sm input_text" name="totalshelf"  id="totalshelf" >			   
		  </div>
		  </div>
		  <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Storage Bin</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" tabindex="10" onkeypress="return onlyAlpha(event,this);"   value="${storagebin}" <c:if test="${access eq 'Read' }"> disabled </c:if> placeholder="Storage Bin" maxlength="10" class="form-control input-sm input_text" name="storagebin"  id="storagebin" >			   
		      </div>
		    </div>
		  <div class="form-group">
		      <label class="control-label col-sm-4" for="name">Serial Number Profile</label>
		      <div class="col-sm-8 input-group">
		      		<input type="text" tabindex="10" list="SerialNoList" value="${serialnodesc}" <c:if test="${access eq 'Read' }"> disabled </c:if> class="form-control input-sm " maxlength="30" name="SerialNo"  id="SerialNo" onchange="serialnolist();" placeholder="Serial Number Profile"  autocomplete="off" onfocusout="get_Serial()">
			      <datalist id="SerialNoList">
			      <c:forEach items="${listno}" var="pg">
			      	<option value="${pg.des}" data-id="${pg.serialno}"></option>   
	        	  </c:forEach>
			      </datalist>   
			      <span class="glyphicon glyphicon-search form-control-feedback"></span>
			      <input type="hidden" name="SerialNoid" id="SerialNoid"  value="${serialno}">         	   
		      </div>
		    </div>
		 </div>  
		 </fieldset>
		 	  <div class="form-group ">
   		 <%
   		if(rolename!=null && role !=null && access!=null)
 	   {
   if(rolename.equals(role)  && access.equals("Read"))
    {
   %>
          <div class="col-md-1 col-md-offset-8"><input type="submit"  class="btn btn-primary form-control disabled"  name="Save" value="Save" onclick="SaveFunc()"/></div>
<div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
  		  <div class="col-md-1"><input type="button" class="btn btn-primary form-control disabled"  name="Clear" value="Clear" onclick="abc()"/></div>
  	    		     <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
  
   <%  
    }
   else
   { 
   %> 
	    <div  class="col-md-1 col-md-offset-8"><input type="submit" class="btn btn-primary form-control<c:if test="${status eq 'Active' }"> disabled </c:if>"  name="Save" onclick="checkform()" value="Save"/></div>
<div class="col-md-1"><button type="submit" class="btn btn-primary  btn-md" name="Submit"  value="Submit">Submit</button></div>
	    <div class="col-md-1"><input type="button" class="btn btn-primary form-control"  name="Clear" value="Clear" onclick="abc()"/></div>
	    		     <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
	    
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
$(".modal").on("hidden.bs.modal", function () {
	  window.location = "Purchasing_Plant_Storage_View.jsp";
	});
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
</script>
</form>


</body>
</html>
