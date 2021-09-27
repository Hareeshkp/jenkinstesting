
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListVendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.dao.ListMaterialDAO"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroup"%>
<%@page import="com.tvs.userconsole.Vendor_VendorGroupDAO"%>
<%@page import="com.tvs.userconsole.Vendor_Material_Type"%>
<%@page import="com.tvs.userconsole.Vendor_Material_Type_DAO"%>
<%@page import="com.tvstyres.vendor.model.PaymentBlock"%>
<%@page import="com.tvstyres.vendor.dao.PaymentBlockDAO"%>
<%@page import="com.tvstyres.vendor.model.IDType"%>
<%@page import="com.tvstyres.vendor.dao.IDTypeDAO"%>
<%@page import="com.tvstyres.vendor.model.Incoterm"%>
<%@page import="com.tvstyres.vendor.dao.IncotermDAO"%>
<%@page import="com.tvstyres.vendor.model.Currency"%>
<%@page import="com.tvstyres.vendor.dao.CurrencyDAO"%>
<%@page import="com.tvstyres.vendor.model.Title"%>
<%@page import="com.tvstyres.vendor.dao.TitleDAO"%>
<%@page import="com.tvstyres.vendor.model.Country"%>
<%@page import="com.tvstyres.vendor.dao.CountryDAO"%>
<%@page import="com.tvstyres.vendor.model.VendorGroup"%>
<%@page import="com.tvstyres.vendor.dao.VendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.model.ActualQMsys"%>
<%@page import="com.tvstyres.vendor.dao.ActualQMsysDAO"%>
<%@page import="com.tvstyres.vendor.model.LegalEntity"%>
<%@page import="com.tvstyres.vendor.dao.LegalEntityDAO"%>
<%@page import="com.tvstyres.vendor.model.GSTFileing"%>
<%@page import="com.tvstyres.vendor.dao.GSTFileingDAO"%>
 <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@page import="com.tvstyres.customer.model.PaymentTerm"%>
<%@page import="com.tvstyres.customer.dao.PaymentTermDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>



 <!--   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

      <script type="text/javascript" src="http://davidstutz.de/bootstrap-multiselect/dist/js/bootstrap-multiselect.js"></script>
      <link rel="stylesheet" type="text/css" href="http://davidstutz.de/bootstrap-multiselect/dist/css/bootstrap-multiselect.css">
      <link rel="stylesheet" type="text/css" href="http://davidstutz.de/bootstrap-multiselect/docs/css/bootstrap-3.3.2.min.css">
      <script type="text/javascript" src="http://davidstutz.de/bootstrap-multiselect/docs/js/bootstrap-3.3.2.min.js"></script> -->
 
<style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}

  <style id="compiled-css" type="text/css">
      .multiselect-container>li>a>label {
  padding: 4px 20px 3px 20px;
}


</style>
<style>
  .required:after {
    content:"*";
    color: red;
  }
</style>
<script>
 
//mdm code generation start
var zzz;
$.ajax({
	
    url : 'VendorCode',
    dataType: 'json',
    'async': false,
    success : function(json) 
    {
    	zzz=json;        	
    	talendcode(zzz);
    }
});
var maxi;
function talendcode()
{    	
	var talendcodes=zzz.slice();    	
	var xyz=1;
	if(talendcodes.length<1)
		{    		
		
				//document.getElementById("MDMCode").value=parseInt(xyz);
				maxi=1;
		}
	else
		{
		
	    		maxi= Math.max.apply(Math,talendcodes);    		
				maxi=maxi+1;	
				var count=maxi;		   
		}
}

function func(){
	$("#mdmcode").val(maxi);

}//mdm code generation end



// address validation
function onlyAddress(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) || (charCode >= 47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}




// pincode validation
function validatepinCode(){
	
	
	 var PCode = document.getElementById('pincode').value;
	
	  var pinn = PCode.length;
	  
	
	  if(pinn>=1)
		  {
		  
  var VCode = document.getElementById('vendorgroupid').value;
  if(VCode =='TV02' || VCode=='TV02A' || VCode=='TV03C' || VCode=='TV03D' )
	  {
	  var PCode = document.getElementById('pincode').value;
	  if( /[^a-zA-Z0-9-]/.test( PCode ) ) {
		  alert('Pincode is not valid!');
	    	 $("#pincode").val("");
	    	 $("#pincode").focus();
	         return false;
	      }
	      return true; 
	  }
  else
	  {
	  
	  var PCode = document.getElementById('pincode').value;
	  var n = PCode.length;
	  if(n==6)
	  {
		  if( /[^0-9]/.test( PCode )) {
			  alert('Pincode is not valid!');
	    	 $("#pincode").val( "");
	    	 $("#pincode").focus();
	         return false;
	      }
		  return true; 
	  }
	  else
		  {
		  alert('Pincode is not valid!');
	    	 $("#pincode").val( "");
	    	 $("#pincode").focus();
	         return false;
		  }
	  }
}
}

//GST Validation (With TIN No. and PAN No.)
function mygst()
{
	   var pan=  document.getElementById("panno").value;
	   var gst = document.getElementById("gstno").value;
	   var l1=pan.length;
	   var l2=gst.length;
	   if(l1>1 && l2>1)
		   {
	   var str1 = gst.substring(2,12);
	   var n= str1.localeCompare(pan);
	    var tin1=document.getElementById("tin").value;
		 var tin2=gst.substring(0,2);
	 if(n==0 && tin1==tin2)
		 {
		 return true;
		 }
	 else
		 {
		 alert("Invalid TIN No. of GST No!!")
		 document.getElementById("gstno").value="  ";
		 return false;
		 }
		   }
  	}
function hello()
{	
	var value = document.getElementById('gstno').value;
	
	if(value.length==15)
		{
	$.ajax({
	    url : 'gst',
	    data: "gstnumber="+value,
	    dataType: 'json',
	    'async': false,
	    success : function(json) 
	    {
	    	
	    	zzz=json;  
	    	gstcode(zzz);
	    }
	});
	
		var gstno=zzz;
		if(gstno=='Active')
		{
		 return true;
		}
	else
		{
		 alert("Please enter the valid GST No")
		  $("#gstno").val("  ");
		 return false;
		}

		}
	
	
}



function checkPanduplication()
{
	
var panno=$('#panno').val();
var mdmvendorcode=$('#mdmcode').val()
var input = $('#panno');
var notRegistered = $('#vendorclass');
var isDuplicate;
if(notRegistered.val()=='0-Not Registered')
{
//var vendorclassid=$('#vendorclassid')
if(input.val()!=null && input.val()!="" )
{
$.ajax({
   'async': false,
type:"POST",
url:"CheckPanDuplicate.jsp",

data : {
		            "panno":panno,
		            "mdmvendorcode":mdmvendorcode
		            
		        },

    cache:false,
    headers: {Accept : "application/json;charset=utf-8"},
    success:function(data)
    {
    isDuplicate= data;
    }
   });

var json = $.parseJSON(isDuplicate);


if(json['isDuplicate']=='yes')
{
alert("Duplicate Record with same Pan number exists!")
 $("#panno").val("");
return false;
}
else
{
return true;
}
}
}
}




function checkVendorduplication()
{
		var firstname=$('#firstname').val();
		var street=$('#street').val();
		var pincode=$('#pincode').val();
		var city=$('#city').val();
		var mdmcode=$('#mdmcode').val();
		
		var panno=$('#panno').val();
		var gstno=$('#gstno').val();
		
		var vendorgroup=$('#vendorgroup').val();

	
		if(vendorgroup=="TV02-Import Material Vendor(Captial)"|| vendorgroup=="TV02A-Import Material Vendor(Non Captial)" || vendorgroup=="TV03C-Service Vendor(Import-Non Captial)" || vendorgroup=="TV03D-Service Vendor(Import-Captial)")
		
			{
			if(firstname !="" && street!="" && pincode!=""  &&  city!="" && mdmcode!="" )
			{
				$.ajax({
					   'async': false,
					type:"POST",
					url:"CheckVendorDuplicate.jsp",
					data : {
							            "firstname":firstname,
							            "street":street,
							            "pincode":pincode,
							            "city":city,
							            "mdmcode":mdmcode,
							            "vendorgroup":vendorgroup
							        },

					    cache:false,
					    headers: {Accept : "application/json;charset=utf-8"},
					    success:function(data)
					    {
					    isDuplicate= data;
					    }
					   });
				var json = $.parseJSON(isDuplicate);
				if(json['isDuplicate']=='yes')
				{
				alert("Duplicate Record with same name,street,pincode and city!")
				return false;
				}
				else
				{
				return true;
				}

			}//if empty check close
			
			}
		
		
		
		
		else
			{
			
			if(firstname !="" && street!="" && pincode!=""  &&  city!="" && mdmcode!="" && gstno!="" && panno!="" )
			{
				
				
				$.ajax({
					   'async': false,
					type:"POST",
					url:"CheckVendorDuplicate.jsp",
					data : {
							            "firstname":firstname,
							            "street":street,
							            "pincode":pincode,
							            "city":city,
							            "mdmcode":mdmcode,
							            "gstno":gstno,
							            "panno":panno,
							            "vendorgroup":vendorgroup
							            
							        },

					    cache:false,
					    headers: {Accept : "application/json;charset=utf-8"},
					    success:function(data)
					    {
					    	
					    	
					    isDuplicate= data;
					    }
					   });
				var json = $.parseJSON(isDuplicate);
				if(json['isDuplicate']=='yes')
				{
				alert("Duplicate Record with same name,street,pincode,city,GSTNo and PANNo!")
				return false;
				}
				else
				{
				return true;
				}

			}//if empty check close
			
			
			}
		
		}//function close
		


// number validation
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

// Alphabets validation
function onlyAlphabets(e, t) {
  try {
      if (window.event) {
          var charCode = window.event.keyCode;
      }
      else if (e) {
          var charCode = e.which;
      }
      else { return true; }
      if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) )
          return true;
      else
          return false;
  }
  catch (err) {
      alert(err.Description);
  }
}

// number and alphabets validations
function onlyAlphanumeric(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) || (charCode > 47 && charCode < 58))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
// name validation
function namevalidate(e, t) {
  try {
      if (window.event) {
          var charCode = window.event.keyCode;
      }
      else if (e) {
          var charCode = e.which;
      }
      else { return true; }
      if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) || (charCode ==45) || (charCode ==46))
          return true;
      else
          return false;
  }
  catch (err) {
      alert(err.Description);
  }
}

// disable enter key
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});


//clear form

function clearform()
{
	  $("#sapvendorcode").val("");
	  $("#vendorgroup").val("");
	  $("#vendorgroupid").val("");
	  $("#vendortypeid").val("");
	  $("#title").val("");
	  $("#firstname").val("");
	  $("#lastname").val("");
	  $("#firstname").val("");
	  $("#name2").val("");
	  $("#legalname").val("");
	  $("#countryid").val("");
	  $("#country").val("");
	  $("#state").val("");
	  $("#stateid").val("");
	  $("#houseno").val("");
	  $("#street").val("");
	  $("#street1").val("");
	  $("#street2").val("");
	  $("#pincode").val("");
	  $("#city").val("");
	  $("#faxnumber").val("");
	  $("#telephoneno").val("");
	  $("#mobile").val("");
	  $("#mailid").val("");
	  $("#gstfileing").val("");
	  $("#gstfileingid").val("");
	  $("#mattype").val("");
	  $("#materiallid").val("");
	  $("#salesperson").val("");
	  $("#saltelephoneno").val("");
	  $("#bankkey").val("");
	  $("#bankname").val("");
	  $("#bankaccno").val("");
	  $("#incoterm").val("");
	  $("#incotermid").val("");
	  $("#currency").val("");
	  $("#currencyid").val("");
	  $("#vendorclass").val("");
	  $("#vendorclassid").val("");
	  $("#gstno").val("");
	  $("#panno").val("");
	  $("#legalentity").val("");
	  $("#legalentityid").val("");
	  $("#glcode").val("");
	  $("#idnum").val("");
	  $("#idtypeid").val("");
	  $("#idtype").val("");
	  $("#actualqmsysid").val("");
	  $("#qmsys").val("");
      $("#paymentblock").val("");
	  $("#paymentblockid").val("");
	  $("#incolocation1").val("");
      $("#my").multiselect("clearSelection");
      $("#my").multiselect( 'refresh' );
	 
}

// on save make required false
function checkform()
{
 
 $("#sapvendorcode").prop("required",false);
/*  $("#title").prop("required",false); */
 $("#lastname").prop("required",false);
 $("#firstname").prop("required",false);
 $("#name2").prop("required",false);
/*  $("#legalname").prop("required",false); */
 /* $("#countryid").prop("required",false);
 $("#country").prop("required",false);
 $("#state").prop("required",false);
 $("#stateid").prop("required",false); */
 $("#houseno").prop("required",false);
 $("#street1").prop("required",false);
 $("#street2").prop("required",false);
 $("#faxnumber").prop("required",false);
 $("#telephoneno").prop("required",false);
 $("#mobile").prop("required",false);
 $("#mailid").prop("required",false);
 $("#gstfileing").prop("required",false);
 $("#gstfileingid").prop("required",false);
 $("#mattype").prop("required",false);
 $("#materiallid").prop("required",false);
 $("#salesperson").prop("required",false);
 $("#saltelephoneno").prop("required",false);
 $("#bankkey").prop("required",false);
 $("#bankname").prop("required",false);
 $("#bankaccno").prop("required",false);
 $("#incoterm").prop("required",false);
 $("#incotermid").prop("required",false);
 $("#currency").prop("required",false);
 $("#currencyid").prop("required",false);
 $("#vendorclass").prop("required",false);
 $("#vendorclassid").prop("required",false);
 $("#gstno").prop("required",false);
 $("#panno").prop("required",false);
 $("#legalentity").prop("required",false);
 
 $("#paymentterm").prop("required",false);
/*  $("#pincode").prop("required",false);
 $("#city").prop("required",false); */
 $("#legalentityid").prop("required",false);
 $("#glcode").prop("required",false);
 $("#idnum").prop("required",false);
 $("#idtypeid").prop("required",false);
 $("#idtype").prop("required",false);
 $("#actualqmsysid").prop("required",false);
 $("#qmsys").prop("required",false);
 $("#paymentblock").prop("required",false);
 $("#paymentblockid").prop("required",false);
 $("#incolocation1").prop("required",false);
 $("#revusername").prop("required",false);
 
 }

function checkforms()
{
	
	var vengroup= document.getElementById('vendorgroup').value
	
	if(vengroup=="TV01-Domestic Material Vendor(Captial)" || vengroup=="TV01A-Domestic Material Vendor(Non Captial)" || vengroup=="TV02-Import Material Vendor(Captial)" || vengroup=="TV02A-Import Material Vendor(Non Captial)" || vengroup=="TV04-Transport Vendor" || vengroup=="TV03B-Service Vendor(Domestic-Captial)" || vengroup=="TV03A-Service Vendor(Domestic-Non Captial)" || vengroup=="TV03C-Service Vendor(Import-Non Captial)" || vengroup=="TV03D-Service Vendor(Import-Captial)" )
		{
		 $("#incoterm").prop("required",true);
		 $("#incolocation1").prop("required",true);
		}
	
 $("#sapvendorcode").prop("required",true);
 $("#lastname").prop("required",true);
 $("#firstname").prop("required",true);

 $("#mobile").prop("required",true);
 $("#mailid").prop("required",true);


 $("#mattype").prop("required",true);


 $("#bankkey").prop("required",true);
 $("#bankname").prop("required",true);
 $("#bankaccno").prop("required",true);
 

 $("#currency").prop("required",true);

 $("#vendorclass").prop("required",true);

 $("#gstno").prop("required",true);
 $("#panno").prop("required",true);
 
 
 $("#paymentterm").prop("required",true);
/*  $("#pincode").prop("required",true);
 $("#city").prop("required",true); */

 $("#glcode").prop("required",true);


 $("#revusername").prop("required",true);
 
 }
 //Edit view Pop pup
  function ShowEditPopup()
  {	
  	  var vgroup=document.getElementById("vg").value; 
  	  var stat=document.getElementById("status").value; 
  	  var apvstat=document.getElementById("approvalstatus").value; 
  	  var ver=document.getElementById("version").value; 
  	  var fn=document.getElementById("fname").value; 
  	  
  	    $.ajax({
  			type: "POST",
  			url: "Vendor_view.jsp",    
  			data : {
		            "vgroup":vgroup,
		            "status":stat,
		            "approvalstatus":apvstat,
		            "version":ver,
		            "fname":fn
		        },
  		
  			cache: false,
  			success: function(response)
  	        {
  	            $("#tableView").html(response);
  	        }
  	    });
  	   
  }
  
  function  Searchbyblock()
  
  {
	 var blk=document.getElementById("block").value; 
	 $.ajax({
			type: "POST",
			url: "Vendor_view2.jsp",    
			data : {
	            "block":blk
	        },
			cache: false,
			success: function(response)
	        {
	            $("#tableView").html(response);
	        }
	    });
  	
  }
 //***********Search and Select Validation********************/
 
function vendorgroupvalidate(modelname) {
	var obj = $("#vendorgrouplist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
function ven(){
	var mg = $("#vendorgroup").val();
	var existingmg = $('h2').text();
	if (vendorgroupvalidate(mg)===false) {
		alert(mg + " is not a valid vendorGroupdd");
		
		$("#vendorgroup").val(existingmg).focus();
		document.getElementById('vendorgroup').value="";
			return false;
	}
	else{
		return true;
	}
}

function titlevalidate(modelname) {
	var obj = $("#titlelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			return true
	}
	return false;
}

function 	Title(){
	var mg = $("#title").val();
	var existingmg = $('h2').text();
	if (titlevalidate(mg)===false) {
		alert(mg + " is not a valid Title");
		$("#title").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}

function countryvalidate(modelname) {
	var obj = $("#countrylist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	Country(){
	var mg = $("#country").val();
	var existingmg = $('h2').text();
	if (countryvalidate(mg)===false) {
		
		alert(mg + " is not a valid Country");
		$("#country").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}

function statevalidate(modelname) {
	var obj = $("#statelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	Statecheck(){
	var mg = $("#state").val();
	var existingmg = $('h2').text();
	if (statevalidate(mg)===false) {
		
		alert(mg + " is not a valid State");
		$("#state").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}



function legalvalidate(modelname) {
	var obj = $("#legalentitylist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	Legalentitycheck(){
	var mg = $("#legalentity").val();
	var existingmg = $('h2').text();
	if (legalvalidate(mg)===false) {
		alert(mg + " is not a valid Legal Entity");
		$("#legalentity").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function actualQMsysvalidate(modelname) {
	var obj = $("#actualqmsyslist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	actualQMsyscheck(){
	var mg = $("#qmsys").val();
	var existingmg = $('h2').text();
	if (actualQMsysvalidate(mg)===false) {
		alert(mg + " is not a valid ActualQMsys");
		$("#qmsys").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function payblkvalidate(modelname) {
	var obj = $("#paymentblocklist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	paymentblkcheck(){
	var mg = $("#paymentblock").val();
	var existingmg = $('h2').text();
	if (payblkvalidate(mg)===false) {
		alert(mg + " is not a valid Payment Block");
		$("#paymentblock").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function idtypevalidate(modelname) {
	var obj = $("#idtypelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function 	IDtypecheck(){
	var mg = $("#idtype").val();
	var existingmg = $('h2').text();
	if (idtypevalidate(mg)===false) {
		alert(mg + " is not a valid ID Type");
		$("#idtype").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}

function datalistincoterm(modelname) {
	var obj = $("#incotermlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function incotermcheck(){
	var mg = $("#incoterm").val();
	var existingmg = $('h2').text();
	if ( datalistincoterm(mg)===false) {
		alert(mg + " is not a valid Incoterm");
		$("#incoterm").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



 function datalistbank(modelname) {
		var obj = $("#bankkeylist").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {			
				return true
		}	
		return false;
	}

	function bankcheck(){
		var mg = $("#bankkey").val();
		var existingmg = $('h2').text();
		if ( datalistbank(mg)===false) {
			alert(mg + " is not a valid Bank Key");
			$("#bankkey").val(existingmg).focus();
				return false;
		}		
		else{
			return true;
		}
	}

	function datalistcurrency(modelname) {
		var obj = $("#currencylist").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {			
				return true
		}	
		return false;
	}

	function currencycheck(){
		var mg = $("#currency").val();
		var existingmg = $('h2').text();
		if ( datalistcurrency(mg)===false) {
			alert(mg + " is not a valid Currency");
			$("#currency").val(existingmg).focus();
				return false;
		}		
		else{
			return true;
		}
	}
	
	
	
	 function datalistvendorclass(modelname) {
			var obj = $("#vendorclasslist").find("option[value='" + modelname + "']");
			if (obj != null && obj.length > 0) {			
					return true
			}	
			return false;
		}

		function vendorclasscheck(){
			var mg = $("#vendorclass").val();
			var existingmg = $('h2').text();
			if ( datalistvendorclass(mg)===false) {
				alert(mg + " is not a valid Vendor Class");
				$("#vendorclass").val(existingmg).focus();
					return false;
			}		
			else{
				return true;
			}
		}
		
		
		 function datalistgstfileing(modelname) {
				var obj = $("#gstfileinglist").find("option[value='" + modelname + "']");
				if (obj != null && obj.length > 0) {			
						return true
				}	
				return false;
			}

			function gstfileingcheck(){
				var mg = $("#gstfileing").val();
				var existingmg = $('h2').text();
				if ( datalistgstfileing(mg)===false) {
					alert(mg + " is not a valid GST Fileing");
					$("#gstfileing").val(existingmg).focus();
						return false;
				}		
				else{
					return true;
				}
			}
			
			
			 function datalistmattype(modelname) {
					var obj = $("#materiallist").find("option[value='" + modelname + "']");
					if (obj != null && obj.length > 0) {			
							return true
					}	
					return false;
				}

				function mattypecheck(){
					var mg = $("#mattype").val();
					var existingmg = $('h2').text();
					if ( datalistmattype(mg)===false) {
						alert(mg + " is not a valid Material Type");
						$("#mattype").val(existingmg).focus();
							return false;
					}		
					else{
						return true;
					}
				}

//*********onfocusout code****************//
function vendorgroupchange(){
	var selected =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-id');		  

	 if (typeof(selected) == 'undefined') {
		 document.getElementById('vendorgroupid').value="";

		}
	 else
		 {
		 document.getElementById('vendorgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
		
function statechange()
{
  
  var selected =  $("#statelist option[value='" + $('#state').val() + "']").attr('data-id');	
  
  if (typeof(selected) == 'undefined') {
		 document.getElementById('stateid').value="";
		}
	 else
		 {
		 document.getElementById('stateid').value =selected;//$('#materialgroupid').val("ssss");

		 }

  
}
		
function IncotermFun() {
	var selected =  $("#incotermlist option[value='" + $('#incoterm').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('incotermid').value="";
		}
	 else
		 {
		 document.getElementById('incotermid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function bankfun()
  {
 var selected =  $("#bankkeylist option[value='" + $('#bankkey').val() + "']").attr('data-id');		
 if (typeof(selected) == 'undefined') 
	 {
		document.getElementById("bankname").value ="";
	 }
 else
	 {
		document.getElementById("bankname").value = selected;
	 } 
}
function countryy()
{
  
  var selected =  $("#countrylist option[value='" + $('#country').val() + "']").attr('data-id');	
  
  if (typeof(selected) == 'undefined') {
		 document.getElementById('countryid').value="";
		}
	 else
		 {
		 document.getElementById('countryid').value =selected;//$('#materialgroupid').val("ssss");
		 }

  
}

function idtypeFun() {
	var selected =  $("#idtypelist option[value='" + $('#idtype').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('idtypeid').value="";
		}
	 else
		 {
		 document.getElementById('idtypeid').value =selected;//$('#materialgroupid').val("ssss");
		 }
}

function gstfileingFun() {
	var selected =  $("#gstfileinglist option[value='" + $('#gstfileing').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('gstfileingid').value="";
		}
	 else
		 {
		 document.getElementById('gstfileingid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

  function mattypeFun() {
	var selected =  $("#materiallist option[value='" + $('#mattype').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('materiallid').value="";
		}
	 else
		 {
		 document.getElementById('materiallid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


    function legalentityFun() {
	var selected =  $("#legalentitylist option[value='" + $('#legalentity').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('legalentityid').value="";
		}
	 else
		 {
		 document.getElementById('legalentityid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

      function paymentblockFun() {
	var selected =  $("#paymentblocklist option[value='" + $('#paymentblock').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('paymentblockid').value="";
		}
	 else
		 {
		 document.getElementById('paymentblockid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


      function qmsysFun() {
	var selected =  $("#actualqmsyslist option[value='" + $('#qmsys').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('actualqmsysid').value="";
		}
	 else
		 {
		 document.getElementById('actualqmsysid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
      //payment term functions
      function datalistpaymentterm(modelname) {
	var obj = $("#paymenttermlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
      function paymenttermcheck(){
    		var mg = $("#paymentterm").val();
    		var existingmg = $('h2').text();
    		if (datalistpaymentterm(mg)===false) {
    			alert(mg + " is not a valid Payment Term");
    			$("#paymentterm").val(existingmg).focus();
    				return false;
    		}		
    		else{
    			return true;
    		}
    	}
      function PaymentTermFun() {
    		var selected =  $("#paymenttermlist option[value='" + $('#paymentterm').val() + "']").attr('data-id');	  
    		 	  	 if (typeof(selected) == 'undefined') {
    			 document.getElementById('paymenttermid').value="";
    			}
    		 else
    			 {
    			 document.getElementById('paymenttermid').value =selected;//$('#materialgroupid').val("ssss");

    			 }
    	}  
//jquery
	
	function onsaveclick()
  {
	  document.getElementById('ssave').value='Save'
	  var result=checkPanduplication();
	  
	  var result2=checkVendorduplication();
	  
	  
	  if(result==false || result2==false )
		  {
return false;
	 
		  }
	  
	  else
		  {
		  
			  return true;
		  }
  }
  
  function onsubmitclick()
  {
	  
    checkforms();
	 
	 document.getElementById('ssave').value=''
	  document.getElementById('ssubmit').value='Submit'
		  var result2=checkVendorduplication();
	  
	  if(result2==false )
	  {
return false;
 
	  }
	  else
		  {
	  return true;
		  }
  }
  
  
	
	$(document).ready(function () {
    $("#form1").submit(function () {
    	var status=(hello() && mygst());
    	
    	
    var a=	document.getElementById("gstno").value;
    	
    	 if(status===true || a=="")
    		 {
    		  $("#save").attr("disabled", true);
   	        $("#submit").attr("disabled", true);
   	        return true;
     		   }
    	else
    		{
    		return false;
    		}

    });
});
  
  
  
  
  $(document).ready(function() {	
	  
	 
	/*   $('#incolocation1').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  $('#fname').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  $('#sapvendorcode').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  
	  $('#lastname').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  
	  $('#firstname').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  
	  $('#name2').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  $('#legalname').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  $('#houseno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
$('#street').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
$('#street1').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
$('#street2').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });

$('#pincode').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
$('#city').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });


$('#idnum').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });

$('#panno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
$('#gstno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
$('#bankaccno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
$('#saltelephoneno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
$('#salesperson').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  

	  
$('#faxnumber').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	    */
	    //for dynamic type id
	    //multi select code

	    //document.multiselect('#actualqmsys');
	    //multi select
		 document.getElementById("panno").disabled = true;
	     document.getElementById("gstno").disabled = true;
		  document.getElementById("currency").readOnly = true;
		  document.getElementById("vendorclass").readOnly = true;
	  $("input[name=title]").on('change',function(){	
			var selected =  $("#titlelist option[value='" + $('#title').val() + "']").attr('data-id');		  

			if (typeof(selected) == 'undefined') {
				 document.getElementById('titleid').value="";
				}
			 else
				 {
				var xyz= document.getElementById('titleid').value =selected;//$('#materialgroupid').val("ssss");
				 }
	  
	  });
	  
		document.getElementById("lastname").readOnly = true;
		document.getElementById("country").readOnly = true;
		document.getElementById("title").readOnly = true;
		document.getElementById("sapvendorcode").readOnly = true;
		
		$("input[name=country]").on('change',function(){		

			$("#state").val('');	
			$("#stateid").val('');
			$("#bankkey").val('');
			$("#bankname").val('');
			var selected =  $("#countrylist option[value='" + $('#country').val() + "']").attr('data-id');		

			  var cid = document.getElementById('countryid').value=selected	
			 
			    $.ajax({
					type: "POST",
					url: "Vendor_Data/State.jsp",
					data: "countryidd="+cid,
					cache: false,
					success: function(data)
			        {
						$(".State").html(data);				
			        }
			    });
		
			  
			  $.ajax({
					type: "POST",
					url: "Vendor_Data/Bank.jsp",
					data: "countrycode="+cid,
					cache: false,
					success: function(data)
			        {
			           $("#bankkeylist").html(data);		            
			        }
			    });
			  
		
		});
		
		
		
		
		$("input[name=vendorgroup]").on('change',function(){	
		    $("#lastname").val('');	
		    $("#state").val('');	
		    $("#stateid").val('');	
		    $("#sapvendorcode").val('');
		    $("#pincode").val('');
		    $("#gstno").val('');
		    $("#panno").val('');
		    $("#bankkey").val('');
			$("#bankname").val('');
			
			var selected =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-type');		  
			if (typeof(selected) == 'undefined') {
				 document.getElementById('vendortypeid').value="";

				}
			 else
				 {
				var xyz= document.getElementById('vendortypeid').value =selected;//$('#materialgroupid').val("ssss");
				 }
if(selected=='D')
	{
	     document.getElementById('country').value='IN-India'
		 var cid=document.getElementById('countryid').value='IN'
		 document.getElementById("country").readOnly = true;
	    

	   $.ajax({
			type: "POST",
			url: "Vendor_Data/State.jsp",
			data: "countryidd="+cid,
			cache: false,
			success: function(data)
	        {
				$(".State").html(data);				
	        }
	    });
	   
	   $.ajax({
			type: "POST",
			url: "Vendor_Data/Bank.jsp",
			data: "countrycode="+cid,
			cache: false,
			success: function(data)
	        {
	           $("#bankkeylist").html(data);		            
	        }
	    });
	   $("#pincode").attr('maxlength','6');

	}
else
	{
	    document.getElementById('country').value=''
		document.getElementById('countryid').value=''
		document.getElementById("country").readOnly = false;
	    $("#state").val('');	
	    $("#pincode").attr('maxlength','10');

	}
	
var vcode =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-id');		  
 var abc=document.getElementById('vendorgroupid').value =vcode;//$('#materialgroupid').val("ssss");
$("#title").val('');	

	
	if(vcode=='TV05')
		{
		document.getElementById("lastname").readOnly = false;
		document.getElementById("sapvendorcode").readOnly = false;
		$("#sapvendorcode").prop("required",true);
		$("#spcode").addClass("required");
		
		document.getElementById("title").readOnly = false;
		   $("#lastname").prop("required",true);	   	
	    	
	    	$("#ln").addClass("required");
	    	document.getElementById("salesperson").readOnly = true;
			document.getElementById("saltelephoneno").readOnly = true;
			
			
			
			
			$("#incoterm").prop("required",false);
			$("#int").removeClass("required");
			$("#incolocation1").prop("required",false);
			$("#inco").removeClass("required");
			

		}
	
	 else if( vcode=='TV06' || vcode=='TV07' || vcode=='TV08' || vcode=='TV09')
		{
		

		$("#incoterm").prop("required",false);
		$("#int").removeClass("required");
		$("#incolocation1").prop("required",false);
		$("#inco").removeClass("required");
	
		
		
		$("#ln").removeClass("required");
		
		document.getElementById("sapvendorcode").readOnly = true;
		$("#sapvendorcode").prop("required",false);
		$("#spcode").removeClass("required");
		
		
		
		
		document.getElementById("incolocation1").readOnly = false;
		document.getElementById("lastname").readOnly = true;
		document.getElementById("title").readOnly = true;

	     document.getElementById('title').value='0003-Company'
	     
        document.getElementById('titleid').value='0003';

	     document.getElementById("salesperson").readOnly = false;
			document.getElementById("saltelephoneno").readOnly = false;
			document.getElementById("incoterm").readOnly = false;
		
		} 
	
	
	
	else
		{
		$("#ln").removeClass("required");
		$("#int").addClass("required");
		document.getElementById("sapvendorcode").readOnly = true;
		$("#sapvendorcode").prop("required",false);
		$("#spcode").removeClass("required");
		$("#incolocation1").prop("required",true);
		$("#inco").addClass("required");
		$("#incoterm").prop("required",true);
		
		document.getElementById("incolocation1").readOnly = false;
		document.getElementById("lastname").readOnly = true;
		document.getElementById("title").readOnly = true;

	     document.getElementById('title').value='0003-Company'
	     
        document.getElementById('titleid').value='0003';

	     document.getElementById("salesperson").readOnly = false;
			document.getElementById("saltelephoneno").readOnly = false;
			document.getElementById("incoterm").readOnly = false;

		}
	
	
	
	 $("#salesperson").val('');
	 $("#saltelephoneno").val('');
	 $("#incoterm").val('');
	 
	 
	 $.ajax({
			type: "POST",
			url: "Vendor_Data/GLCode.jsp",
			data: "vgcode="+vcode,
			cache: false,
			success: function(data)
	        {
				
	           $("#glcode").html(data);		            
	        }
	    });
	 
	 
	 
	 // on vendorgroup change getting vendorgrouptype D/I
	 var selecte =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-type');		  
	 var ventype =	 document.getElementById("vendortypeid").value = selecte;

	 if(ventype=='I')
		{
			 document.getElementById("panno").disabled = true;
		     document.getElementById("gstno").disabled = true;
		     $("#panno").prop("required",false);	
		    	$("#gstno").prop("required",false);
		    	$("#gst").removeClass("required");
		    	$("#pan").removeClass("required");
		    	 var ppp =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-id');		
				 
				 var yyy =	 document.getElementById("vendorgroupid").value = ppp;
		    	
		}
		else
			{
			 var ppp =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-id');		
			 
			 var yyy =	 document.getElementById("vendorgroupid").value = ppp;
if(yyy=='TV05')
{


document.getElementById("gstno").disabled = true;
$("#gstno").prop("required",false);
$("#gst").removeClass("required");

}
else
{


document.getElementById("gstno").disabled = false;

$("#gstno").prop("required",true);
$("#gst").addClass("required");

}
			
			 document.getElementById("panno").disabled = false;
		       $("#panno").prop("required",true);	
		       $("#pan").addClass("required");
			}
		
		if(ventype=='D')
		{
		     document.getElementById('currency').value='INR-Indian Rupee'
			 var cid=document.getElementById('currencyid').value='INR'
			 document.getElementById("currency").readOnly = true;
		}

		else if(typeof(selected) == 'undefined')			
		{
			 document.getElementById("currency").readOnly = true;
			 document.getElementById('currency').value=''
			document.getElementById('currencyid').value=''
		}
		
		else
		 	{	
			   document.getElementById('currency').value=''
				document.getElementById('currencyid').value=''
				document.getElementById("currency").readOnly = false;
			
			}

	 
		
		 $.ajax({
				type: "POST",
				url: "Vendor_Data/Paymentmethods.jsp",
				data: "vendortype="+ventype,
				cache: false,
				success: function(data)
		        {
		           $("#paymentmethods").html(data);		            
		        }
		    });
		 
		 
		 $.ajax({
				type: "POST",
				url: "Vendor_Data/Vendorclass.jsp",
				data: "vendortype="+ventype,
				cache: false,
				success: function(data)
		        {
		           $("#vendorclasslist").html(data);		            
		        }
		    });
		
		
		
		 if(ventype=='I')
			{
			     document.getElementById('vendorclass').value='Not Registered'
				 var cid=document.getElementById('vendorclassid').value='0'
				 document.getElementById("vendorclass").readOnly = true;
			}

			else if(typeof(ventype) == 'undefined')			
			{
				 document.getElementById("vendorclass").readOnly = true;
				 document.getElementById('vendorclass').value=''
				document.getElementById('vendorclass').value=''
			}
			
			else
			 	{	
				
				 var hhh =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('data-id');		  
				 var kkk =	 document.getElementById("vendorgroupid").value = hhh;			
				if(kkk=="TV05")
					{
					    document.getElementById('vendorclass').value='Not Registered'
						 var cid=document.getElementById('vendorclassid').value='0'
						 document.getElementById("vendorclass").readOnly = true;
					}
				else
					{
					        document.getElementById('vendorclass').value=''
							document.getElementById('vendorclassid').value=''
							document.getElementById("vendorclass").readOnly = false;
					}
				}	 
			});
	  
$("input[name=currency]").on('change',function(){
			
			var selected =  $("#currencylist option[value='" + $('#currency').val() + "']").attr('data-id');	  
				 var ccode= document.getElementById('currencyid').value =selected;//$('#materia

		});
		
				 
$("input[name=vendorclass]").on('change',function(){
			
	 $("#gstno").val("");
	 
	 
			var selected =  $("#vendorclasslist option[value='" + $('#vendorclass').val() + "']").attr('data-id');	  
				 var ccode= document.getElementById('vendorclassid').value =selected;//$('#materia

						 
				 if(ccode=='0')
					{
				    document.getElementById("gstno").disabled = true;
					$("#gstno").prop("required",false);
					$("#gst").removeClass("required");
					
					}
				else
					{
				    document.getElementById("gstno").disabled = false;
					$("#gstno").prop("required",true);
					
					$("#gst").addClass("required");
					}				 
						 
						 
		});
				 
			 
		
		function CurrencyFun() {
		 	var selected =  $("#currencylist option[value='" + $('#currency').val() + "']").attr('data-id');	  
			 	  	 if (typeof(selected) == 'undefined') {
				 document.getElementById('currencyid').value="";
				}
			 else
				 {
				 document.getElementById('currencyid').value =selected;//$('#materialgroupid').val("ssss");

				 }
		}
		 
		 
		 function VendorclassFun() {
		 	var selected =  $("#vendorclasslist option[value='" + $('#vendorclass').val() + "']").attr('data-id');	  
			 	  	 if (typeof(selected) == 'undefined') {
				 document.getElementById('vendorclassid').value="";
				}
			 else
				 {
				 document.getElementById('vendorclassid').value =selected;//$('#materialgroupid').val("ssss");

				 }
		}
		//default id type
		//document.getElementById("idtypelist").defaultValue = "BUP007";
		 
		 
		$("input[name=bankkey]").on('change',function(){  
			
			var selected =  $("#bankkeylist option[value='" + $('#bankkey').val() + "']").attr('data-id');		

			 if (typeof(selected) == 'undefined') 
				 {
					document.getElementById("bankname").value ="";
				 }
			 else
				 {
					document.getElementById("bankname").value = selected;
				 }
		 });


		$("input[name=incoterm]").on('change',function(){  
			var selected =  $("#incotermlist option[value='" + $('#incoterm').val() + "']").attr('data-id');		
			document.getElementById("incotermid").value = selected;
		 });
		
		
		 
		 
		 		
		 		$("input[name=state]").on('change',function(){  
		 			
		 			 var sid =  $("#statelist option[value='" + $('#state').val() + "']").attr('data-id');		  
		 				
		 			 var statecode =	 document.getElementById("stateid").value = sid;
		 			
		 			$.ajax({
						type: "POST",
						url: "Vendor_Data/TinNumber.jsp",
						data: "statecode="+statecode,
						cache: false,
						success: function(data)
				        {
							
							    var str = data;
						        var res = str.split(">");
							    var strfst=res[1];
						        firstChar=strfst.substring(0,2);
						        document.getElementById('tin').value =firstChar;
						        
						       
						       		            
				        }
				    });
		 			 
		 			 
		 			 
		 			 
		 			    });
		 		
		 		
		 		$("input[name=gstfileing]").on('change',function(){  
					var selected =  $("#gstfileinglist option[value='" + $('#gstfileing').val() + "']").attr('data-id');		
					document.getElementById("gstfileingid").value = selected;
					
				 });
				
				
		 		
				 $("input[name=mattype]").on('change',function(){  
						var selected =  $("#materiallist option[value='" + $('#mattype').val() + "']").attr('data-id');		
						document.getElementById("materiallid").value = selected;
						
						
					 });
				 
				 //default idtype
				 $("input[name=legalentity]").on('change',function(){  
					 
					 document.getElementById('idtype').value = "BUP007-Entrepreneur's Memorandum Number";
					 document.getElementById('idtypeid').value = "BUP007";
					 
					 });
				 
				 
				 
				  //for dynamic reviewer name
				 $("input[name=vendorgroup]").on('change',function(){
		    			
					 var selected =  $("#vendorgrouplist option[value='" + $('#vendorgroup').val() + "']").attr('value');	
					 
					 
					 
					 if (typeof(selected) == 'undefined') 
					 {
						document.getElementById("vendorgroup").value ="";
					 }
					 
					 else
						 {
						 
					 document.getElementById("vendorgroup").value = selected;
					 var vendorgroupid = document.getElementById('vendorgroup').value; 
					 $.ajax({
				    		type:"POST",
				    		url:"reviewername.jsp",
				    		data : "vendorgroupid="+$('#vendorgroup').val(),
				    		cache:false,
			               headers: {Accept : "application/json;charset=utf-8"},

				    		success:function(data)
				    		{
				    			
				    		    var options =  '<option value=""><strong>Select</strong></option>'; //create your "title" option
				    			var json = $.parseJSON(data);
				    			$.each(json['reviewerNameList'], function(index, element) {
				    				console.log(index, element);
				    	            options += '<option value="'+element+'">'+element+'</option>'; //add the option element as a string
				    				
				    		     });
				    		    $('.revusername').html(options); //replace the selection's html with the new options
				    		    		            
				    		}
				    	})

						 }
				 })
		 		 
				
				 
				 
				 $("input[name=idtype]").on('change',function(){  
						var selected =  $("#idtypelist option[value='" + $('#idtype').val() + "']").attr('data-id');		
						document.getElementById("idtypeid").value = selected;
						
					 });
				 
				
				 $("input[name=paymentblock]").on('change',function(){  
						var selected =  $("#paymentblocklist option[value='" + $('#paymentblock').val() + "']").attr('data-id');		
						document.getElementById("paymentblockid").value = selected;
						
					 });
				 
				
				 $("input[name=qmsys]").on('change',function(){  
						var selected =  $("#actualqmsyslist option[value='" + $('#qmsys').val() + "']").attr('data-id');		
						document.getElementById("actualqmsysid").value = selected;
						
					 });

				
});




</script>
<body onload="func()" oncontextmenu="return false;" >

<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>

<%

String userid =(String) request.getAttribute("myTest");


String role=null;
String rolename=null;
String access=null;
if(userid!=null)
{
	 User uu =UserDAO.getUsernameRoleByUserId(userid);
	 role= uu.getRolename();//rolename in user table
	 Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
	 rolename=rr.getRole();
     access=rr.getVendor();
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



Vendor_Material_Type_DAO vmtd=new Vendor_Material_Type_DAO();
List<Vendor_Material_Type> listmat=vmtd.venmateriallist(rolename);
request.setAttribute("listmat",listmat);

//payment term added
PaymentTermDAO ptd =new PaymentTermDAO();
List<PaymentTerm> listpt =ptd.getPaymentTermList();
request.setAttribute("listpt",listpt);


Vendor_VendorGroupDAO vvgd=new Vendor_VendorGroupDAO();
List<Vendor_VendorGroup> listvg=vvgd.venvendorgrouplist(rolename);
request.setAttribute("listvg",listvg);

List<Vendor> listven=null;
if(userid!=null)
{
	String listmaterial=ListMaterialDAO.getmatlist(rolename);
	String materialcode=listmaterial.substring(0,listmaterial.length()-2);
	String listvendor=ListVendorGroupDAO.getvengrouplist(rolename);
	String vengrpdesc=listvendor.substring(0,listvendor.length()-2);
	 VendorDAO vd=new VendorDAO();
	 listven=vd.getReviewerUsername(materialcode, vengrpdesc);
	 request.setAttribute("listven", listven);
}

request.setAttribute("listven", listven);



CountryDAO cd =new  CountryDAO();
List<Country> listc =cd.getCountrylist();
request.setAttribute("listc", listc);


TitleDAO td =new TitleDAO();
List<Title> listt =td.getTitlelist();
request.setAttribute("listt", listt);

GSTFileingDAO gfd =new GSTFileingDAO();
List<GSTFileing> listgstfile= gfd.getGSTFileinglist();
request.setAttribute("listgstfile", listgstfile);


LegalEntityDAO led =new LegalEntityDAO();
List<LegalEntity> listlegal =led.getLegalEntitylist();
request.setAttribute("listlegal", listlegal);

ActualQMsysDAO aqd =new ActualQMsysDAO();
List<ActualQMsys> listaqsys =aqd.getActualQMlist();
request.setAttribute("listaqsys", listaqsys);

CurrencyDAO ccd =new CurrencyDAO();
List<Currency> listcc=ccd.getCurrencylist();
request.setAttribute("listc",listc);

IncotermDAO ido =new IncotermDAO();
List<Incoterm> listi =ido.getIncotermlist();
request.setAttribute("listi", listi);

IDTypeDAO itd =new IDTypeDAO();
List<IDType> listidtype =itd.getIDTypelist();
request.setAttribute("listidtype", listidtype);

PaymentBlockDAO pbd =new PaymentBlockDAO();
List<PaymentBlock> listpayblk= pbd.getPaymentblocklist();
request.setAttribute("listpayblk", listpayblk);

CurrencyDAO ccdd =new CurrencyDAO();
List<Currency> listcurr=ccdd.getCurrencylist();
request.setAttribute("listcurr",listcurr);
pageContext.setAttribute("access", access);

%>

<form id="form1" action="Vendorsave"  method="post" autocomplete="off" >
	<div class="row" style="margin-top:2%;">
		<div class="col-md-12" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Vendor</h3>
		   </div>   
   		<div class = "panel-body">
   		

<div class="row">
    <div class="form-group col-md-6">
 
		      <label class=" required control-label col-sm-4" for="name">MDM Vendor Code</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" readonly required  tabindex="-1"   class="form-control input-sm "   name="mdmvendorcode"  placeholder="MDM Vendor Code"   id="mdmcode"  autocomplete="off">
		      </div>
		    </div>

  <div class="form-group col-md-6">
		      <label id="spcode" class="control-label col-sm-4" for="name">SAP Vendor Code</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text"  class="form-control input-sm input_text" onkeypress="return onlyAlphanumeric(event,this);" oninput="this.value = this.value.toUpperCase()"   maxlength="10" name="sapvendorcode"   id="sapvendorcode"     placeholder="SAP Vendor Code"   autocomplete="off"  >
			  
		      </div>
		    </div>


</div>
<div class="row">
   		 <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4" for="name">Vendor Group</label>
		      <div class="col-sm-8 input-group">
		       <input  list="vendorgrouplist" required <c:if test="${access eq 'Read' }"> disabled </c:if> class=" form-control input-sm input_text" name="vendorgroup"  id="vendorgroup"  onfocusout="vendorgroupchange()" onchange="return ven();"   placeholder="Vendor Group"  autocomplete="off"  >
		   <datalist id="vendorgrouplist">
		    <c:forEach items="${listvg}" var="c">  		            
		            <option value="${c.vendorgroupdesc}" data-id="${c.vendorgroupcode}" data-type="${c.vendorgrouptype }"> ${c.vendorgroupdesc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="vendorgroupid" id="vendorgroupid" > 	
             <input type="hidden" name="vendortypeid" id="vendortypeid" > 		   
        	    <input type="hidden" id="ssave" name="save"  > 
          <input type="hidden" id="ssubmit" name="submit"  > 
		      </div>
		    </div>  

 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Title</label>
		      <div class="col-sm-8 input-group">
		     <input  list="titlelist" required class=" form-control input-sm input_text" name="title"  id="title" maxlength="50"       onchange="return Title();" autocomplete="off"  >
		   <datalist id="titlelist">
		     <c:forEach items="${listt}" var="c">  		            
		            <option value="${c.title}" data-id="${c.code}" > ${c.title} </option>		             
		        </c:forEach>  
		   </datalist>		
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="titleid" id="titleid" >    
		      </div>
		    </div>

	</div>
	
	<div class="row">
	
		    <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4" for="name">First Name</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text"   onkeypress="return namevalidate(event,this);" oninput="this.value = this.value.toUpperCase()"  class="form-control input-sm "   maxlength="40" name="firstname"  placeholder="First Name"   id="firstname" required autocomplete="off">
		       
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" id ="ln" for="name">Last Name</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" onkeypress="return namevalidate(event,this);"  class="form-control input-sm " oninput="this.value = this.value.toUpperCase()" maxlength="40" name="lastname"  placeholder="Last Name"   id="lastname"  autocomplete="off">
		       
		      </div>
		    </div>
		    
		    </div>
		    
		    
		    
		    <div class="row">
		    
<div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">Name2</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text"   class="form-control input-sm " onkeypress="return namevalidate(event,this);" oninput="this.value = this.value.toUpperCase()"  maxlength="40" name="name2"  placeholder="Name2"   id="name2"  autocomplete="off">
		      </div>
		    </div>

<div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" id ="ln" for="name">Legal Name</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" onkeypress="return namevalidate(event,this);" oninput="this.value = this.value.toUpperCase()" class="form-control input-sm "  maxlength="40" name="legalname"  placeholder="Legal Name"   id="legalname"  autocomplete="off">
		       
		      </div>
		    </div>
</div>


 <div class="row">

		   <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4" for="name">Country</label>
		      <div class="col-sm-8 input-group">
		     <input   list="countrylist" required class=" form-control input-sm input_text" name="country"  id="country"     onchange="return Country()"  placeholder="Country"  autocomplete="off"  >
		   <datalist id="countrylist">
		   <c:forEach items="${listc}" var="c">  		            
		            <option value="${c.description}" data-id="${c.countrycode}"> ${c.description} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="countryid" id="countryid" > 
		      </div>
		    </div>


<div class="form-group col-md-6">
		      <label id="stt" class=" required control-label col-sm-4 mandatory" for="name">State</label>
		      <div class="col-sm-8 input-group">
		      <input  list="statelist" class=" form-control input-sm input_text" name="state"  id="state"  required    placeholder="State" onfocusout="statechange()" onchange="return Statecheck();" autocomplete="off"  >
		   <datalist id="statelist" class="State">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="stateid" id="stateid" > 	   			   
		      </div>
		    </div>

</div>

<div class="row">
		   <div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">House No</label>
		      <div class="col-sm-8 input-group">
				 <input type="text"    class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" maxlength="10" name="houseno"   id="houseno"    placeholder="House No"  autocomplete="off" >
			   	   
		      </div>
		    </div>
		    
		   <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4 mandatory" for="name">Street</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" class="form-control input-sm input_text" onkeypress="return onlyAddress(event,this);" oninput="this.value = this.value.toUpperCase()" name="street"  maxlength="60"  id="street"   placeholder="Street" required  autocomplete="off" >
			   	   
		      </div>
		    </div> 

</div>

<div class="row">

		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory">Street1</label>
		      <div class="col-sm-8 input-group">
				<input type="text" onkeypress="return onlyAddress(event,this);" oninput="this.value = this.value.toUpperCase()"  class="form-control input-sm input_text"  maxlength="40" name="street1"  id="street1"   placeholder="Street1" autocomplete="off" >
			   	   
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Street2</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" onkeypress="return onlyAddress(event,this);" name="street2"  maxlength="40"  id="street2"   placeholder="Street2"   autocomplete="off" >
			   	   
		      </div>
		    </div>

</div>

<div class="row">
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory">Pin Code</label>
		      <div class="col-sm-8 input-group">
				<input type="text"   class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" maxlength="10" name="pincode"  id="pincode"   placeholder="Pin Code" required autocomplete="off" >
			   	   
		      </div>
		    </div>
		      <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 ">City</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text"  class="form-control input-sm input_text" maxlength="40" oninput="this.value = this.value.toUpperCase()" required   name="city" onkeypress="return onlyAlphabets(event,this);"  required  id="city" autocomplete="off"  placeholder="City"  >
			  			   
		      </div>
		    </div>
		    </div>
		    
		    <div class="row">
 <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory">Fax Number</label>
		      <div class="col-sm-8 input-group">
				<input type="text"   class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" maxlength="30" name="faxnumber"  id="faxnumber"   placeholder="Fax Number" autocomplete="off" >
			   	   
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Telephone No</label>
		      <div class="col-sm-8 input-group">
		     		        				       		      <input type="text"  onkeypress="return isNumber(event)"  class="form-control input-sm "   maxlength="15" name="telephoneno"  placeholder="Telephone No"   id="telephoneno"  autocomplete="off">
			  		   
		      </div>
		    </div>	
		    
</div>

  <div class="row">
		   <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Mobile Number</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" required onkeypress="return isNumber(event)"  class="form-control input-sm "  maxlength="15" name="mobile"  placeholder="Mobile"   id="mobile"  autocomplete="off">
			      
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">EMail Id</label>
		      <div class="col-sm-8 input-group">
		      <input type="email" required  title="please enter a valid emailid"  pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"   class="form-control input-sm "  maxlength="241" name="mailid"  placeholder="Email Id"   id="mailid"  autocomplete="off">
		     
		      </div>
		    </div>
		    
		    </div>
		    
		    
		     <div class="row">
		     
  <div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">GST Filing</label>
		      <div class="col-sm-8 input-group">
				     <input type="text" list="gstfileinglist" class="form-control input-sm input_text"  name="gstfileing"  id="gstfileing"   placeholder="GST Filing"  onchange="return gstfileingcheck();" onfocusout="gstfileingFun()" autocomplete="off" >

 <datalist id="gstfileinglist">
		   <c:forEach items="${listgstfile}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.gstfileing}"> ${c.desc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="gstfileingid" id="gstfileingid" > 

			      
		      </div>
		    </div>

  <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory" id ="ln" for="name">Material Type</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" required  list="materiallist"   class="form-control input-sm "   name="mattype"  placeholder="Material Type"   id="mattype" onchange="return mattypecheck();"  onfocusout="mattypeFun()"  autocomplete="off">
		        <datalist id="materiallist">
		     <c:forEach items="${listmat}" var="c">  		            
		            <option value="${c.mattypedesc}" data-id="${c.mattypecode}" > ${c.mattypedesc} </option>		             
		        </c:forEach>  
		   </datalist>		
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="materiallid" id="materiallid" >   
		      </div>
		    </div>
</div>

 <div class="row">
<div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">Sales Person</label>
		      <div class="col-sm-8 input-group">
		     <input type="text" onkeypress="return onlyAlphabets(event,this);" oninput="this.value = this.value.toUpperCase()" class="form-control input-sm "  maxlength="30" name="salesperson"  placeholder="Sales Person"   id="salesperson"  autocomplete="off">
			      
		      </div>
		    </div>
		    
		   <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Sales Person Tel. No</label>
		      <div class="col-sm-8 input-group">
		       <input type="text"  onkeypress="return isNumber(event)"   class="form-control input-sm "  maxlength="16" name="saltelephoneno"  placeholder="Sales Person Tel. No"   id="saltelephoneno"  autocomplete="off">
		  	   			   
		      </div>
		    </div>
</div>
   
   
   <div class="row">
		     <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4 " for="name">Bank Key</label>
		      <div class="col-sm-8 input-group">
 <input  list="bankkeylist" required class=" form-control input-sm input_text" name="bankkey"  id="bankkey" maxlength="15"  onchange="return bankcheck()"   placeholder="Bank Key"  onfocusout="bankfun()"  autocomplete="off"  >
		   <datalist id="bankkeylist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		      </div>
		    </div>
		   <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory" for="name">Bank Name</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" class="form-control input-sm input_text"  name="bankname"    id="bankname" readonly  placeholder="Bank Name"    autocomplete="off" >
			   	   
		      </div>
		    </div>
		   </div>
		   
		    <div class="row">
		    
 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Bank Account No</label>
		      <div class="col-sm-8 input-group">
<input type="text"  class="form-control input-sm input_text"    maxlength="18" name="bankaccno"id="bankaccno"     onkeypress="return isNumber(event);"                                  placeholder="Bank Account No"  required autocomplete="off"  >
			  
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label id="int" class="control-label col-sm-4 ">Incoterm</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text" list="incotermlist" class="form-control input-sm input_text"    name="incoterm"  required  id="incoterm" autocomplete="off" onchange="return incotermcheck()"  placeholder="Incoterm"  >
			  	 <datalist id="incotermlist">
		     <c:forEach items="${listi}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code}" > ${c.description} </option>		             
		        </c:forEach>  
		   </datalist>		
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="incotermid" id="incotermid" >  		   
		      </div>
		    </div>
</div>
   		
   		
   		 <div class="row">
		       <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 " for="name">Currency</label>
		      <div class="col-sm-8 input-group">
 <input  list="currencylist" required class=" form-control input-sm input_text" name="currency"  id="currency"     placeholder="Currency" onfocusout="CurrencyFun()" onchange="return currencycheck()"  autocomplete="off"  >
		   <datalist id="currencylist">
		     <c:forEach items="${listcurr}" var="c">  		            
		            <option value="${c.description}" data-id="${c.currency}" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		           	           <input type="hidden" name="currencyid" id="currencyid" > 		       
		      </div>
		    </div>
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory" for="name">Payment Term</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="paymenttermlist" required class="form-control input-sm input_text"  name="paymentterm"    id="paymentterm" onchange="return paymenttermcheck();"  onfocusout="PaymentTermFun()"  placeholder="Payment Term"   autocomplete="off" >
			   	    <datalist id="paymenttermlist">
		     <c:forEach items="${listpt}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.code}" > ${c.desc} </option>		             
		        </c:forEach>  
		   </datalist>	
<span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="paymenttermid" id="paymenttermid" > 
		      </div>
		    </div>
</div>
<div class="row">
<div class="form-group col-md-6">
   <label class="control-label col-sm-4 mandatory" for="name">Payment Methods</label>
   <div class="col-sm-8 input-group">
         <select class="form-control input-sm "  multiple="multiple" name="paymentmethods" id="paymentmethods" >		
   </select>	
   </div>
   </div>  
   
   <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 " for="name">Vendor Class.(GST Category)</label>
		      <div class="col-sm-8 input-group">
        <input  list="vendorclasslist" required class=" form-control input-sm input_text" name="vendorclass"  id="vendorclass"     placeholder="Vendor Class.(GST Category)" onfocusout="VendorclassFun()" onchange="return vendorclasscheck()"  autocomplete="off"  >
		   <datalist id="vendorclasslist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
		    <input type="hidden" name="vendorclassid" id="vendorclassid" > 
		      </div>
		    </div>


</div>

 <div class="row">
 
		    <div class="form-group col-md-6">
		      <label id="pan" class="control-label col-sm-4" for="name">PAN No</label>
		      <div class="col-sm-8 input-group">
		   		     		        				       		      <input type="text" onkeypress="return return onlyAlphanumeric(event,this);" oninput="this.value = this.value.toUpperCase()" pattern="[A-Z]{5}[0-9]{4}[A-Z]{1}" title="first 5 digits must be alpha numeric, next 4 digit must be numeric,last digit must be alpha numeric characters"  class="form-control input-sm "  maxlength="10" name="panno"  placeholder="PAN No"   id="panno"  autocomplete="off">
    
		      </div>
		    </div>
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Adhaar No</label>
		      <div class="col-sm-8 input-group">
		       <input type="text" onkeypress="return isNumber(event)"   class="form-control input-sm "  maxlength="12" name="adhaarno"  placeholder="Adhaar No"   id="adhaarno"  autocomplete="off">
		  	   			   
		      </div>
		    </div>

</div>

<div class="row">
		    <div class="form-group col-md-6">
		      <label id="gst" class="control-label col-sm-4" for="name">GST No</label>
		      <div class="col-sm-8 input-group">
		     		        		<input type="text" oninput="this.value = this.value.toUpperCase()"  pattern="[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{3}"  title="Please enter valid GST No"  onkeypress="return onlyAlphanumeric(event,this);"  class="form-control input-sm "  maxlength="15" name="gstno"  placeholder="GST No"   id="gstno"  autocomplete="off">
			   	      <input type="hidden" name="tin" id="tin" > 
			   	   <span id="demo"> </span>
		      </div>
		    </div>

 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">GLCode</label>
		      <div class="col-sm-8 input-group">
 <select class="form-control input-sm"  id="glcode" readonly  name="glcode" >		      
		      </select>	
		      </div>
		    </div>   

</div>

<div class="row">
		   <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory">Legal Entity</label>
		      <div class="col-sm-8 input-group">
				<input type="text"  list="legalentitylist"  class="form-control input-sm input_text"   name="legalentity"  id="legalentity"  onchange="return Legalentitycheck();"  onfocusout="legalentityFun()" placeholder="Legal Entity" autocomplete="off" >
			   	 <datalist id="legalentitylist">
		   <c:forEach items="${listlegal}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.legalentity}"> ${c.desc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="legalentityid" id="legalentityid" >    
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">ID Type</label>
		      <div class="col-sm-8 input-group">
		      <input  list="idtypelist" class=" form-control input-sm input_text" name="idtype"  id="idtype"  onchange="return IDtypecheck();"    placeholder="ID Type" onfocusout="idtypeFun()"   autocomplete="off"  >
		   <datalist class = "idtype" id="idtypelist" >
		     <!-- <option data-value="BUP007">BUP007</option> -->
		     <c:forEach items="${listidtype}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.idtype}" > ${c.desc} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="idtypeid" id="idtypeid" > 	   			   
		      </div>
		    </div>

</div>

<div class="row">
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">Identification Number</label>
		      <div class="col-sm-8 input-group">
				     <input type="text"  class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" maxlength="60"  name="idnum"  id="idnum"   placeholder="Identification Number"   autocomplete="off" >
			      
		      </div>
		    </div>
		    
		   <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Payment Block</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" list="paymentblocklist"s class="form-control input-sm input_text"  name="paymentblock"    id="paymentblock"   placeholder="Payment Block" onfocusout="paymentblockFun()"  onchange="return paymentblkcheck();"   autocomplete="off" >
			   	    <datalist id="paymentblocklist">
		     <c:forEach items="${listpayblk}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.code}" > ${c.desc} </option>		             
		        </c:forEach>  
		   </datalist>	
<span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="paymentblockid" id="paymentblockid" > 
		      </div>
		    </div>
</div>
   
   <div class="row">
		     <div class="form-group col-md-6">
		      <label class="control-label col-sm-4" for="name">Actual QM sys</label>
		      <div class="col-sm-8 input-group">
		      <select class="form-control input-sm" multiple="multiple" name = "people" id="people">
		        <c:forEach items="${listaqsys}" var="c">  		
		            <option value="${c.desc}" data-id="${c.code}"> ${c.desc} </option>		             
		        </c:forEach> 
				</select>							  
		      </div>
		    </div>
		   <div class="form-group col-md-6">
		      <label id ="inco" class="control-label col-sm-4 "> Inco. Location1</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text"   class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" maxlength="70"   name="incolocation1"    id="incolocation1" autocomplete="off"  placeholder="Incoterm Description"  >
			  			   
		      </div>
		    </div>
		   
		   </div>
		   
		   <div class="row">
		   <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Reviewer Username</label>
		      <div class="col-sm-8 input-group">
		      <select class="revusername form-control input-sm" required  id="revusername"   name="revusername" >	
		      <option value=''>Select</option>
		      
		      <!--<option value="" > Select </option>	
		      <c:forEach items="${listven}" var="c">  		            
		      <option value="${c.reviewerusername}" > ${c.reviewerusername} </option>	             
		      </c:forEach>
		      <datalist class="reviewusername" id="mg">	
		      </datalist>-->
 	      
		      </select>	
		      </div>
		    </div>   



   		
		    
		    
	     
   		





</div>

   		
   		
		   
<div class="col-md-1 col-md-offset-8"><input type="submit"    id="save"   onclick="return ( onsaveclick() && validatepinCode() &&  checkform())" name="Save" class="btn btn-primary btn-md " <c:if test="${access eq 'Read' }"> disabled="disabled" </c:if>  value="Save"/></div>
<div class="col-md-1"><button type="submit"   id="submit"   onclick="return ( onsubmitclick() && validatepinCode() && checkPanduplication())"  class="btn btn-primary btn-md"  name="Submit" <c:if test="${access eq 'Read' }"> disabled="disabled" </c:if>  value="Submit">Submit</button></div>
<div class="col-md-1"> <button type="button" class="btn btn-primary btn-md" <c:if test="${access eq 'Read' }"> disabled="disabled" </c:if>  onclick="clearform()">Clear</button></div>
<div class="col-md-1"> <button type="button" class="btn btn-primary btn-md" data-toggle="modal" data-target="#myModal" >Edit</button></div>
		     
</div>
</div>
<br><br>
<br><br>
<br><br>
</div>
</div>
   	
   	
   		
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >

    <!-- Modal content-->
    <div class="modal-content">
     <div class="container-fluid" id="data">
 
  
  <div class="row" style="margin-top: 15px;  ">
    <div class="col-sm-12"  align="right">
     <div style="border: 1px solid #DCDCDC;">
    <label class="required">Vendor Group</label>
      <select id="vg" style="margin-right:0px;">

  
     <c:forEach items="${listvg}" var="c">  		            
		            <option value="${c.vendorgroupcode}" data-id="${c.vendorgroupcode}" data-type="${c.vendorgrouptype }"> ${c.vendorgroupdesc} </option>		             
		        </c:forEach> 
 
</select>
<input type="text" onkeypress="return namevalidate(event,this);"    maxlength="40" name="firstname"  placeholder="Vendor Name"   id="fname"  autocomplete="off">
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
    
    
<!--     <label style="font-weight:normal;">Version</label>
 -->        <input type="text" onkeypress="return isNumber(event)"  name="version" id="version" placeholder="Version"  maxlength="5" size="5"> 
         
    
     <button style="margin-top: 5px;margin-bottom: 5px;margin-right: 5px"  type="button" onclick="ShowEditPopup();hide();" class="btn btn-primary">Search</button><br>
     
     </div>
      <div style="border: 1px solid #DCDCDC; margin-top: 20px;margin-bottom: 5px">
       <label class="required">Block</label>
<select  id="block">
   <option value="true"  >True</option>
    <option value="false"  >False</option>
 </select>    <button style="margin-top: 5px;margin-bottom: 5px;margin-right: 5px"  type="button" onclick="Searchbyblock();hide();" class="btn btn-primary">Search</button>
    </div>
   
  </div>
</div>
</div>
   
      <div class="modal-body">
        <span id="tableView">
        </span>
      </div>
      <div class="modal-footer">
        <button type="button" onclick="javascript:window.location='Vendor.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

</div>
<script type="text/javascript">
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
$(".modal").on("hidden.bs.modal", function () {
  window.location = "Vendor.jsp";
});
</script>




</form>
</body>
</html>

