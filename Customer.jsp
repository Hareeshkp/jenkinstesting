<%@page import="com.tvstyres.customer.model.SalesOffice"%>
<%@page import="com.tvstyres.customer.dao.SalesOfficeDAO"%>
<%@page import="com.tvstyres.customer.model.SalesDistrict"%>
<%@page import="com.tvstyres.customer.dao.SalesDistrictDAO"%>
<%@page import="com.tvstyres.customer.model.Customer"%>
<%@page import="com.tvstyres.customer.dao.CustomerDAO"%>
<%@page import="com.tvstyres.customer.dao.ListCustomerGroupDAO"%>
<%@page import="com.tvstyres.customer.dao.CustomerGroupDAO2"%>
<%@page import="com.tvstyres.customer.model.ConditionGroup"%>
<%@page import="com.tvstyres.customer.dao.ConditionGroupDAO"%>
<%@page import="com.tvstyres.customer.model.CustomerGroup2"%>
<%@page import="com.tvstyres.customer.model.CustomerGroup"%>
<%@page import="com.tvstyres.customer.dao.CustomerGroupDAO"%>
<%@page import="com.tvstyres.customer.model.Attribute"%>
<%@page import="com.tvstyres.customer.dao.AttributeDAO"%>
<%@page import="com.tvstyres.vendor.model.Currency"%>
<%@page import="com.tvstyres.vendor.dao.CurrencyDAO"%>
<%@page import="com.tvstyres.customer.model.PaymentTerm"%>
<%@page import="com.tvstyres.customer.dao.PaymentTermDAO"%>
<%@page import="com.tvstyres.customer.model.ActivityCode"%>
<%@page import="com.tvstyres.customer.dao.ActivityCodeDAO"%>
<%@page import="com.tvstyres.customer.model.CustomerClassific"%>
<%@page import="com.tvstyres.customer.dao.CustomerClassificDAO"%>
<%@page import="com.tvstyres.customer.model.PriceList"%>
<%@page import="com.tvstyres.customer.dao.PriceListDAO"%>
<%@page import="com.tvstyres.customer.model.Pricegroup"%>
<%@page import="com.tvstyres.customer.dao.PricegroupDAO"%>
<%@page import="com.tvstyres.customer.model.Shipping"%>
<%@page import="com.tvstyres.customer.dao.ShippingDAO"%>
<%@page import="com.tvstyres.customer.model.DeliveryPriority"%>
<%@page import="com.tvstyres.customer.dao.DeliveryPriorityDAO"%>
<%@page import="com.tvstyres.customer.model.Incoterm"%>
<%@page import="com.tvstyres.customer.dao.IncotermDAO"%>
<%@page import="com.tvstyres.customer.model.CustStatsGroup"%>
<%@page import="com.tvstyres.customer.dao.CustStatsGroupDAO"%>
<%@page import="com.tvstyres.customer.model.CustPriceProcedure"%>
<%@page import="com.tvstyres.customer.dao.CustPriceProcedureDAO"%>
<%@page import="com.tvs.userconsole.Customer_CustomerGroup"%>
<%@page import="com.tvs.userconsole.Customer_CustomerGroupDAO"%>
<%@page import="com.tvstyres.vendor.model.Country"%>
<%@page import="com.tvstyres.vendor.dao.CountryDAO"%>
<%@page import="com.tvstyres.customer.model.Title"%>
<%@page import="com.tvstyres.customer.dao.TitleDAO"%>
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


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.5.1/chosen.jquery.min.js"></script>
     
<style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}

 

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
 
//mdm code generation start
var zzz;
$.ajax({
	
    url : 'CustomerCode',
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
	$("#mdmcustomercode").val(maxi);

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
  var VCode = document.getElementById('customergroupid').value;
  if(VCode =='TC03' || VCode=='TC04' || VCode=='TC12B')
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
		  $("#gstno").val( "  ");
		 
		 return false;
		}

	
		}
	
}

function ShowEditPopup()
{	
	 // var sam=set.value;
	  var cgroup=document.getElementById("cg").value; 
	  var stat=document.getElementById("status").value; 
	  var apvstat=document.getElementById("approvalstatus").value; 
	  var ver=document.getElementById("version").value; 
	  var cname=document.getElementById("custname").value; 
	  

	    $.ajax({
			type: "POST",
			url: "CustomerView.jsp",    
			data : {
		            "cgroup":cgroup,
		            "status":stat,
		            "approvalstatus":apvstat,
		            "version":ver,
		            "custname":cname

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
			url: "CustomerView2.jsp",    
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
		 $("#save").attr("disabled", false);
	        $("#submit").attr("disabled", false);
		 return false;
		 }
		   }
  	}




function checkcustomerduplication()
{
		var firstname=$('#name').val();
		var street=$('#street').val();
		var pincode=$('#pincode').val();
		var city=$('#city').val();
		var mdmcode=$('#mdmcustomercode').val();
		
		var gstno=$('#gstno').val();
		var panno=$('#panno').val();
		
		var customergroup=$('#customergroup').val();
	
		
		if(customergroup=="TC03-Export Customers"|| customergroup=="TC04-Deemed Export Customers" || customergroup=="TC12B-TSL - ship To Party" )
			{
			
			if(firstname !="" && street!="" && pincode!=""  &&  city!="" && mdmcode!="" )
			{
				$.ajax({
					   'async': false,
					type:"POST",
					url:"CheckCustomerDuplicate.jsp",
					data : {
							            "firstname":firstname,
							            "street":street,
							            "pincode":pincode,
							            "city":city,
							            "mdmcode":mdmcode,
							            "customergroup":customergroup
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
					url:"CheckCustomerDuplicate.jsp",
					data : {
							            "firstname":firstname,
							            "street":street,
							            "pincode":pincode,
							            "city":city,
							            "mdmcode":mdmcode,
							            "gstno":gstno,
							            "panno":panno,
							            "customergroup":customergroup
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


function validatee() {
 
    if( document.customer.customergroup6.value == "" ) {
       alert( "Please enter the value of Customer Group6 !" );
     
       return false;
    }
    
    if( document.customer.continent.value == "" ) {
        alert( "Please enter the value of Continent !" );
      
        return false;
     }
     
}

  
function clearform()
{
	  
	  $("#customergroup").val("");
	  $("#customergroupid").val("");
	  $("#customertypeid").val("");
	  $("#title").val("");
	  $("#name").val("");
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
	  $("#telno").val("");
	  $("#mobileno").val("");
	  $("#mailid").val("");
	  $("#distchannel").val("");
	  $("#distchannelid").val("");
	  $("#division").val("");
	  $("#divisionid").val("");
	  $("#salesdistrict").val("");
	  $("#salesdistrictid").val("");
	  $("#accassignment").val("");
	  $("#accassignmentid").val("");
	  $("#custprice").val("");
	  $("#custpriceid").val("");
	  $("#customerstats").val("");
	  $("#customerstatsid").val("");
	  $("#incoterm").val("");
	  $("#incotermid").val("");
	  $("#incolocation1").val("");
	  $("#deliverypriority").val("");
	  $("#deliverypriorityid").val("");
	  $("#shipping").val("");
	  $("#shippingid").val("");
	  $("#pricegroup").val("");
	  $("#pricegroupid").val("");
	  $("#price").val("");
	  $("#priceid").val("");
	  $("#salesoffice").val("");
	  $("#salesofficeid").val("");
	  $("#salesgroup").val("");
	  $("#salesgroupid").val("");
	  $("#currency").val("");
	  $("#currencyid").val("");
	  $("#gstno").val("");
	  $("#panno").val("");
	  $("#glcode").val("");
	  $("#custclass").val("");
	  $("#custclassid").val("");
	  $("#paymentterm").val("");
	  $("#paymenttermid").val("");
	  $("#activitycode").val("");
	  $("#activitycodeid").val("");
	  
}

// on save make required false
function checkform()
{
	
	  $("#name2").prop("required",false);
	  $("#mobileno").prop("required",false);
	  $("#mailid").prop("required",false);
	  $("#distchannel").prop("required",false);
	
	  $("#division").prop("required",false);
	
	  $("#salesdistrict").prop("required",false);

	  $("#accassignment").prop("required",false);
	 
	  $("#custprice").prop("required",false);
	
	  $("#customerstats").prop("required",false);
		  $("#incoterm").prop("required",false);
	 
	  $("#incolocation1").prop("required",false);
	  $("#deliverypriority").prop("required",false);
	
	  $("#shipping").prop("required",false);
	 
	  $("#pricegroup").prop("required",false);
	
	  $("#price").prop("required",false);
	  $("#priceid").prop("required",false);
	  $("#salesoffice").prop("required",false);
	
	  $("#salesgroup").prop("required",false);
	 
	  $("#currency").prop("required",false);
	  
	  $("#gstno").prop("required",false);
	  $("#panno").prop("required",false);
	  $("#glcode").prop("required",false);
	  $("#custclass").prop("required",false);
	
	  $("#paymentterm").prop("required",false);
	
	  $("#activitycode").prop("required",false);
	
	  $("#revusername").prop("required",false);
	 
 }
function checkforms()
{
	  $("#mobileno").prop("required",true);
	  $("#mailid").prop("required",true);
	  $("#distchannel").prop("required",true);
	  $("#division").prop("required",true);
	  $("#salesdistrict").prop("required",true);
	  $("#accassignment").prop("required",true);
	  $("#custprice").prop("required",true);
	  $("#customerstats").prop("required",true);
	  $("#incoterm").prop("required",true);
	  $("#incolocation1").prop("required",true);
	  $("#deliverypriority").prop("required",true);
	  $("#shipping").prop("required",true);
	  $("#pricegroup").prop("required",true);
	 
	
	  $("#salesoffice").prop("required",true);
	  $("#salesgroup").prop("required",true);
	  $("#currency").prop("required",true);
	  $("#gstno").prop("required",true);
	  $("#panno").prop("required",true);
	  $("#glcode").prop("required",true);
	  $("#paymentterm").prop("required",true);
	  $("#revusername").prop("required",true);
	 
 }

function customergroupvalidate(modelname) {
	var obj = $("#customergrouplist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function 	Customergroup(){
	var mg = $("#customergroup").val();
	var existingmg = $('h2').text();
	if (customergroupvalidate(mg)===false) {
		
		alert(mg + " is not a valid CustomerGroup");
		$("#customergroup").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}


function titlevalidate(modelname) {
	var obj = $("#titlelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function  Title(){
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

function datalistdistchannel(modelname) {
	var obj = $("#distchannellist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function distchannelcheck(){
	

	var mg = $("#distchannel").val();
	var existingmg = $('h2').text();
	if (datalistdistchannel(mg)===false) {
		alert(mg + " is not a valid Dist Channel");
		$("#distchannel").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistdivision(modelname) {
	var obj = $("#divisionlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function divisioncheck(){
	var mg = $("#division").val();
	var existingmg = $('h2').text();
	if (datalistdivision(mg)===false) {
		alert(mg + " is not a valid Division");
		$("#division").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}






function datalistsalesdist(modelname) {
	var obj = $("#salesdistrictlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function salesdistcheck(){
	var mg = $("#salesdistrict").val();
	var existingmg = $('h2').text();
	if (datalistsalesdist(mg)===false) {
		alert(mg + " is not a valid Sales District");
		$("#salesdistrict").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistacctassign(modelname) {
	var obj = $("#accassignmentlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function acctassigncheck(){
	var mg = $("#accassignment").val();
	var existingmg = $('h2').text();
	if (datalistacctassign(mg)===false) {
		alert(mg + " is not a valid Account Assignment grp");
		$("#accassignment").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistcustprice(modelname) {
	var obj = $("#custpricelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custpricecheck(){
	var mg = $("#custprice").val();
	var existingmg = $('h2').text();
	if (datalistcustprice(mg)===false) {
		alert(mg + " is not a valid Cust Price Procedure");
		$("#custprice").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistcuststats(modelname) {
	var obj = $("#customerstatslist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custstatcheck(){
	var mg = $("#customerstats").val();
	var existingmg = $('h2').text();
	if (datalistcuststats(mg)===false) {
		alert(mg + " is not a valid Cust Stats Group");
		$("#customerstats").val(existingmg).focus();
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
	if (datalistincoterm(mg)===false) {
		alert(mg + " is not a valid Incoterm");
		$("#incoterm").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}





function datalistcurrecny(modelname) {
	var obj = $("#currencylist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function currencycheck(){
	var mg = $("#currency").val();
	var existingmg = $('h2').text();
	if (datalistcurrecny(mg)===false) {
		alert(mg + " is not a valid Currency");
		$("#currency").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistdelivery(modelname) {
	var obj = $("#deliveryprioritylist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function deliverycheck(){
	var mg = $("#deliverypriority").val();
	var existingmg = $('h2').text();
	if (datalistdelivery(mg)===false) {
		alert(mg + " is not a valid Delivery Priority");
		$("#deliverypriority").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistshipping(modelname) {
	var obj = $("#shippinglist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function shippingcheck(){
	var mg = $("#shipping").val();
	var existingmg = $('h2').text();
	if (datalistshipping(mg)===false) {
		alert(mg + " is not a valid Shipping Condition");
		$("#shipping").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistpricegroup(modelname) {
	var obj = $("#pricegrouplist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function pricegroupcheck(){
	var mg = $("#pricegroup").val();
	var existingmg = $('h2').text();
	if (datalistpricegroup(mg)===false) {
		alert(mg + " is not a valid Price Group");
		$("#pricegroup").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistpricelist(modelname) {
	var obj = $("#pricelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function pricelistcheck(){
	var mg = $("#price").val();
	var existingmg = $('h2').text();
	if (datalistpricelist(mg)===false) {
		alert(mg + " is not a valid Price List");
		$("#price").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistsalesoffice(modelname) {
	var obj = $("#salesofficelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function salesofficecheck(){
	var mg = $("#salesoffice").val();
	var existingmg = $('h2').text();
	if (datalistsalesoffice(mg)===false) {
		alert(mg + " is not a valid Sales Office");
		$("#salesoffice").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistsalesgroup(modelname) {
	var obj = $("#salesgrouplist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function salesgroupcheck(){
	var mg = $("#salesgroup").val();
	var existingmg = $('h2').text();
	if (datalistsalesgroup(mg)===false) {
		alert(mg + " is not a valid Sales Group");
		$("#salesgroup").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  
function datalistcustclassific(modelname) {
	var obj = $("#custclasslist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function customerclassificcheck(){
	var mg = $("#custclass").val();
	var existingmg = $('h2').text();
	if (datalistcustclassific(mg)===false) {
		alert(mg + " is not a valid Customer Classific");
		$("#custclass").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  
  
function datalistactivitycode(modelname) {
	var obj = $("#activitycodelist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
function activitycodecheck(){
	var mg = $("#activitycode").val();
	var existingmg = $('h2').text();
	if (datalistactivitycode(mg)===false) {
		alert(mg + " is not a valid Activity Code");
		$("#activitycode").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  
  
  
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

  
  //customer group datlist validation
  
  function datalistcustgroup1(modelname) {
	var obj = $("#customergroup1list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup1check(){
	var mg = $("#customergroup1").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup1(mg)===false) {
		alert(mg + " is not a valid Customer Group1");
		$("#customergroup1").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}

function datalistcustgroup2(modelname) {
	var obj = $("#customergroup2list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup2check(){
	var mg = $("#customergroup2").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup2(mg)===false) {
		alert(mg + " is not a valid Customer Group2");
		$("#customergroup2").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}

function datalistcustgroup3(modelname) {
	var obj = $("#customergroup3list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup3check(){
	var mg = $("#customergroup3").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup3(mg)===false) {
		alert(mg + " is not a valid Customer Group3");
		$("#customergroup3").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistcustgroup4(modelname) {
	var obj = $("#customergroup4list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup4check(){
	var mg = $("#customergroup4").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup4(mg)===false) {
		alert(mg + " is not a valid Customer Group4");
		$("#customergroup4").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistcustgroup5(modelname) {
	var obj = $("#customergroup5list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup5check(){
	var mg = $("#customergroup5").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup5(mg)===false) {
		alert(mg + " is not a valid Customer Group5");
		$("#customergroup5").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistcustgroup6(modelname) {
	var obj = $("#customergroup6list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function custgroup6check(){
	var mg = $("#customergroup6").val();
	var existingmg = $('h2').text();
	if (datalistcustgroup6(mg)===false) {
		alert(mg + " is not a valid Customer Group6");
		$("#customergroup6").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  
  
  
  
function datalistcondgroup1(modelname) {
	var obj = $("#conditiongroup1list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function condgroup1check(){
	var mg = $("#conditiongroup1").val();
	var existingmg = $('h2').text();
	if (datalistcondgroup1(mg)===false) {
		alert(mg + " is not a valid Condition Group1");
		$("#conditiongroup1").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistcondgroup2(modelname) {
	var obj = $("#conditiongroup2list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function condgroup2check(){
	var mg = $("#conditiongroup2").val();
	var existingmg = $('h2').text();
	if (datalistcondgroup2(mg)===false) {
		alert(mg + " is not a valid Condition Group2");
		$("#conditiongroup2").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistcondgroup3(modelname) {
	var obj = $("#conditiongroup3list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function condgroup3check(){
	var mg = $("#conditiongroup3").val();
	var existingmg = $('h2').text();
	if (datalistcondgroup3(mg)===false) {
		alert(mg + " is not a valid Condition Group3");
		$("#conditiongroup3").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistcondgroup4(modelname) {
	var obj = $("#conditiongroup4list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function condgroup4check(){
	var mg = $("#conditiongroup4").val();
	var existingmg = $('h2').text();
	if (datalistcondgroup4(mg)===false) {
		alert(mg + " is not a valid Condition Group4");
		$("#conditiongroup4").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistcondgroup5(modelname) {
	var obj = $("#conditiongroup5list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function condgroup5check(){
	var mg = $("#conditiongroup5").val();
	var existingmg = $('h2').text();
	if (datalistcondgroup5(mg)===false) {
		alert(mg + " is not a valid Condition Group5");
		$("#conditiongroup5").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  
  
  //attribute validation
  
  
  function datalistcontinent(modelname)
{
	var obj = $("#continentlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}

function continentcheck(){
	var mg = $("#continent").val();
	var existingmg = $('h2').text();
	if (datalistcontinent(mg)===false) {
		alert(mg + " is not a valid Continent");
		$("#continent").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistattribute2(modelname)
{
	var obj = $("#attribute2list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute2check(){
	var mg = $("#attribute2").val();
	var existingmg = $('h2').text();
	if (datalistattribute2(mg)===false) {
		alert(mg + " is not a valid Attribute2");
		$("#attribute2").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistattribute3(modelname)
{
	var obj = $("#attribute3list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute3check(){
	var mg = $("#attribute3").val();
	var existingmg = $('h2').text();
	if (datalistattribute3(mg)===false) {
		alert(mg + " is not a valid Attribute3");
		$("#attribute3").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistattribute4(modelname)
{
	var obj = $("#attribute4list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute4check(){
	var mg = $("#attribute4").val();
	var existingmg = $('h2').text();
	if (datalistattribute4(mg)===false) {
		alert(mg + " is not a valid Attribute4");
		$("#attribute4").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistattribute5(modelname)
{
	var obj = $("#attribute5list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute5check(){
	var mg = $("#attribute5").val();
	var existingmg = $('h2').text();
	if (datalistattribute5(mg)===false) {
		alert(mg + " is not a valid Attribute5");
		$("#attribute5").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}



function datalistattribute6(modelname)
{
	var obj = $("#attribute6list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute6check(){
	var mg = $("#attribute6").val();
	var existingmg = $('h2').text();
	if (datalistattribute6(mg)===false) {
		alert(mg + " is not a valid Attribute6");
		$("#attribute6").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistattribute7(modelname)
{
	var obj = $("#attribute7list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute7check(){
	var mg = $("#attribute7").val();
	var existingmg = $('h2').text();
	if (datalistattribute7(mg)===false) {
		alert(mg + " is not a valid Attribute7");
		$("#attribute7").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistattribute8(modelname)
{
	var obj = $("#attribute8list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute8check(){
	var mg = $("#attribute8").val();
	var existingmg = $('h2').text();
	if (datalistattribute8(mg)===false) {
		alert(mg + " is not a valid Attribute8");
		$("#attribute8").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}




function datalistattribute9(modelname)
{
	var obj = $("#attribute9list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute9check(){
	var mg = $("#attribute9").val();
	var existingmg = $('h2').text();
	if (datalistattribute9(mg)===false) {
		alert(mg + " is not a valid Attribute9");
		$("#attribute9").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}


function datalistattribute10(modelname)
{
	var obj = $("#attribute10list").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}




function attribute10check(){
	var mg = $("#attribute10").val();
	var existingmg = $('h2').text();
	if (datalistattribute10(mg)===false) {
		alert(mg + " is not a valid Attribute10");
		$("#attribute10").val(existingmg).focus();
			return false;
	}		
	else{
		return true;
	}
}
  //  datalist validation end
  
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
  
  
  
  function onsaveclick()
  {
	  document.getElementById('ssave').value='Save'
	  
 var result=checkcustomerduplication();
	 
	  if(result==false)
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
      var result=checkcustomerduplication();
	  
	  if(result==false)
		  {
      return false;
		  }
	  else
		  {
		  return true;
		  }
	  
  }
  
  
  
$(document).ready(function() {	
	
	
	/*   $('#incolocation1').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  $('#custname').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  
	  $('#sapcustomercode').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
	  
	  $('#name').keyup(function() {
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

$('#panno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  
$('#gstno').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    });
	  

	  
$('#faxnumber').keyup(function() {
	        $(this).val($(this).val().toUpperCase());
	    }); */
	   
	  
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
	  
		 document.getElementById("country").readOnly = true;
		 document.getElementById("currency").readOnly = true;
		 document.getElementById("panno").disabled = true;
	     document.getElementById("gstno").disabled = true;
		$("input[name=country]").on('change',function(){		

			$("#state").val('');	
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
		
		
		});
		
		//for dynamic reviewer name
		 $("input[name=customergroup]").on('change',function(){
   		
			 var selected =  $("#customergrouplist option[value='" + $('#customergroup').val() + "']").attr('value');	
			 
			
			 if (typeof(selected) == 'undefined') 
			 {
				document.getElementById("customergroup").value ="";
			 }
			 
			 else
				 {
			 document.getElementById("customergroup").value = selected;
			 $.ajax({
		    		type:"POST",
		    		url:"reviewernamecustomer.jsp",
		    		data : "customergroupid="+$('#customergroup').val(),
		    		cache:false,
	               headers: {Accept : "application/json;charset=utf-8"},

		    		success:function(data)
		    		{
		    			console.log(data);
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
		

		
		 
		 
		
		$("input[name=customergroup]").on('change',function(){	
			$("#gstno").val('');	
			$("#panno").val('');	
			  $("#distchannel").val("");
			  $("#distchannelid").val("");
		     /*  $("#salesdistrict").val("");
			  $("#salesdistrictid").val("");
		      $("#salesoffice").val("");
			  $("#salesofficeid").val(""); */
			  
			  $("#pricegroup").val("");
			  $("#pricegroupid").val("");
			  
			  
			
			  
			var selected =  $("#customergrouplist option[value='" + $('#customergroup').val() + "']").attr('data-type');		  

			if (typeof(selected) == 'undefined') {
				 document.getElementById('customertypeid').value="";

				}
			 else
				 {
				var xyz= document.getElementById('customertypeid').value =selected;//$('#materialgroupid').val("ssss");
				 }
			
			var cgrpcode =  $("#customergrouplist option[value='" + $('#customergroup').val() + "']").attr('data-id');		  

			
			if (typeof(cgrpcode) == 'undefined') {
				 document.getElementById('customergroupid').value="";

				}
			 else
				 {
				var xyz= document.getElementById('customergroupid').value =cgrpcode;//$('#materialgroupid').val("ssss");
				 }
			
		
			if(cgrpcode=='TC02')
				{
				$("#cc").addClass("required");
				 $("#custclass").prop("required",true);
				}
			else
				{
				$("#cc").removeClass("required");
				 $("#custclass").prop("required",false);
				
				}
			 $.ajax({
					type: "POST",
					url: "Customer_Data/Distchannel.jsp",
					data: "custgrpcode="+cgrpcode,
					cache: false,
					success: function(data)
			        {
			           $("#distchannellist").html(data);		            
			        }
			    });
			 
			/*  $.ajax({
					type: "POST",
					url: "Customer_Data/SalesOffice.jsp",
					data: "custgrpcode="+cgrpcode,
					cache: false,
					success: function(data)
			        {
			           $("#salesofficelist").html(data);		            
			        }
			    });
			
			 $.ajax({
					type: "POST",
					url: "Customer_Data/SalesDistrict.jsp",
					data: "custgrpcode="+cgrpcode,
					cache: false,
					success: function(data)
			        {
			           $("#salesdistrictlist").html(data);		            
			        }
			    });
			  */
			 
			 
			 $.ajax({
					type: "POST",
					url: "Customer_Data/PriceGroup.jsp",
					data: "custgrpcode="+cgrpcode,
					cache: false,
					success: function(data)
			        {
			           $("#pricegrouplist").html(data);		            
			        }
			    });
			
			 $.ajax({
					type: "POST",
					url: "Customer_Data/GLCode.jsp",
					data: "custgrpcode="+cgrpcode,
					cache: false,
					success: function(data)
			        {
			           $("#glcode").html(data);		            
			        }
			    });
			 if(selected=='D')
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
			 
			 
			 
			 if(selected=='I')
				{
				    
					 document.getElementById("panno").disabled = true;
				     document.getElementById("gstno").disabled = true;
				     $("#panno").prop("required",false);	
				    	$("#gstno").prop("required",false);
				    	$("#gst").addClass("required");
				    	$("#pan").addClass("required");
				}
				
				else
					{
					
					 document.getElementById("panno").disabled = false;
				     document.getElementById("gstno").disabled = false;
				     $("#gst").addClass("required");
				    	$("#pan").addClass("required");
				    	 $("#panno").prop("required",true);	
					    	$("#gstno").prop("required",true);
					}
			 
if(selected =='D')
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
			
		});
	  

		
		
		$("input[name=distchannel]").on('change',function(){
	 		var selected =  $("#distchannellist option[value='" + $('#distchannel').val() + "']").attr('data-id');	  
	 		 var ccode= document.getElementById('distchannelid').value =selected;//$('#materialgroupid').val("ssss");
	 		 $("#division").val('');
	 		 $("#accassignment").val('');
	 		 $("#divisionid").val('');
	 		 $("#accassignmentid").val('');
	 		 $.ajax({
					type: "POST",
					url: "Customer_Data/Division.jsp",
					data: "distchannelcode="+ccode,
					cache: false,
					success: function(data)
			        {
						 				
			           $("#divisionlist").html(data);		            
			        }
			    });
	 		 
	 		 $.ajax({
					type: "POST",
					url: "Customer_Data/Accountassignment.jsp",
					data: "distchannelcode="+ccode,
					cache: false,
					success: function(data)
			        {
						 				
			           $("#accassignmentlist").html(data);		            
			        }
			    });
		
		});
		
		 
		$("input[name=salesoffice]").on('change',function(){
			
			var selected =  $("#salesofficelist option[value='" + $('#salesoffice').val() + "']").attr('data-id');	  
	 		 var ccode= document.getElementById('salesofficeid').value =selected;//$('#materialgroupid').val("ssss");
	 		 $("#salesgroup").val('');
	 		 $("#salesgroupid").val('');
			 $.ajax({
					type: "POST",
					url: "Customer_Data/SalesGroup.jsp",
					data: "salesofficecode="+ccode,
					cache: false,
					success: function(data)
			        {
			           $("#salesgrouplist").html(data);		            
			        }
			    });
	 		 
	 		 
	 		 
	 		}); 
		
		
		$("input[name=state]").on('change',function(){  
 			
			 var sid =  $("#statelist option[value='" + $('#state').val() + "']").attr('data-id');		  
			 var statecode =document.getElementById("stateid").value = sid;
			
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
$("input[name=custprice]").on('change',function(){
			
			var selected =  $("#custpricelist option[value='" + $('#custprice').val() + "']").attr('data-id');	  
	 		 var ccode= document.getElementById('custpriceid').value =selected;//$('#materia
		
		
	});
	 		 
	 		 
	 		 
	$("input[name=customerstats]").on('change',function(){
		
		var selected =  $("#customerstatslist option[value='" + $('#customerstats').val() + "']").attr('data-id');	  
 		 var ccode= document.getElementById('customerstatsid').value =selected;//$('#materia
	
});
		
 		 
 		 
$("input[name=incoterm]").on('change',function(){
		
		var selected =  $("#incotermlist option[value='" + $('#incoterm').val() + "']").attr('data-id');	  
 		 var ccode= document.getElementById('incotermid').value =selected;//$('#materia
	
});
 		 
 		 
$("input[name=currency]").on('change',function(){
	
	var selected =  $("#currencylist option[value='" + $('#currency').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('currencyid').value =selected;//$('#materia

});
		 
		 
$("input[name=deliverypriority]").on('change',function(){
	
	var selected =  $("#deliveryprioritylist option[value='" + $('#deliverypriority').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('deliverypriorityid').value =selected;//$('#materia
});
		 
		 
$("input[name=shipping]").on('change',function(){
	
	var selected =  $("#shippinglist option[value='" + $('#shipping').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('shippingid').value =selected;//$('#materia

});
$("input[name=pricegroup]").on('change',function(){
	
	var selected =  $("#pricegrouplist option[value='" + $('#pricegroup').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('pricegroupid').value =selected;//$('#materia

});
$("input[name=price]").on('change',function(){
	
	var selected =  $("#pricelist option[value='" + $('#price').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('priceid').value =selected;//$('#materia

});
		
		
$("input[name=division]").on('change',function(){
	
	var selected =  $("#divisionlist option[value='" + $('#division').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('divisionid').value =selected;//$('#materia

});
		 
	 
		 
$("input[name=accassignment]").on('change',function(){
	
	var selected =  $("#accassignmentlist option[value='" + $('#accassignment').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('accassignmentid').value =selected;//$('#materia
		 
});
		 
		 
		 
$("input[name=salesdistrict]").on('change',function(){
	
	var selected =  $("#salesdistrictlist option[value='" + $('#salesdistrict').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('salesdistrictid').value =selected;//$('#materia

});
		 
	 
		 
$("input[name=salesgroup]").on('change',function(){
	
	var selected =  $("#salesgrouplist option[value='" + $('#salesgroup').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('salesgroupid').value =selected;//$('#materia
		 
});
		 
		//customerGroup 
$("input[name=customergroup1]").on('change',function(){
	
	var selected =  $("#customergroup1list option[value='" + $('#customergroup1').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup1id').value =selected;//$('#materia

});
$("input[name=customergroup2]").on('change',function(){
	
	var selected =  $("#customergroup2list option[value='" + $('#customergroup2').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup2id').value =selected;//$('#materia
		 
});
$("input[name=customergroup3]").on('change',function(){
	
	var selected =  $("#customergroup3list option[value='" + $('#customergroup3').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup3id').value =selected;//$('#materia
		 
});
$("input[name=customergroup4]").on('change',function(){
	
	var selected =  $("#customergroup4list option[value='" + $('#customergroup4').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup4id').value =selected;//$('#materia
		 
});
$("input[name=customergroup5]").on('change',function(){
	
	var selected =  $("#customergroup5list option[value='" + $('#customergroup5').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup5id').value =selected;//$('#materia
		 
});
$("input[name=customergroup6]").on('change',function(){
	
	var selected =  $("#customergroup6list option[value='" + $('#customergroup6').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('customergroup6id').value =selected;//$('#materia
});
		 
//attribute
$("input[name=continent]").on('change',function(){
	
	var selected =  $("#continentlist option[value='" + $('#continent').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('continentid').value =selected;//$('#materia
				 
});
	
$("input[name=attribute2]").on('change',function(){
	
	var selected =  $("#attribute2list option[value='" + $('#attribute2').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute2id').value =selected;//$('#materia
				 
});
	
$("input[name=attribute3]").on('change',function(){
	
	var selected =  $("#attribute3list option[value='" + $('#attribute3').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute3id').value =selected;//$('#materia
				 
});
$("input[name=attribute4]").on('change',function(){
	
	var selected =  $("#attribute4list option[value='" + $('#attribute4').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute4id').value =selected;//$('#materia
				 
});
$("input[name=attribute5]").on('change',function(){
	
	var selected =  $("#attribute5list option[value='" + $('#attribute5').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute5id').value =selected;//$('#materia
				 
});
$("input[name=attribute6]").on('change',function(){
	
	var selected =  $("#attribute6list option[value='" + $('#attribute6').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute6id').value =selected;//$('#materia
				 
});
$("input[name=attribute7]").on('change',function(){
	
	var selected =  $("#attribute7list option[value='" + $('#attribute7').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute7id').value =selected;//$('#materia
				 
});
$("input[name=attribute8]").on('change',function(){
	
	var selected =  $("#attribute8list option[value='" + $('#attribute8').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute8id').value =selected;//$('#materia
				 
});
$("input[name=attribute9]").on('change',function(){
	
	var selected =  $("#attribute9list option[value='" + $('#attribute9').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute9id').value =selected;//$('#materia
				 
});
$("input[name=attribute10]").on('change',function(){
	
	var selected =  $("#attribute10list option[value='" + $('#attribute10').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('attribute10id').value =selected;//$('#materia
				 
});
	
		 //condition group
		 
		 
$("input[name=conditiongroup1]").on('change',function(){
	
	var selected =  $("#conditiongroup1list option[value='" + $('#conditiongroup1').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('conditiongroup1id').value =selected;//$('#materia
			 
}); 
$("input[name=conditiongroup2]").on('change',function(){
	
	var selected =  $("#conditiongroup2list option[value='" + $('#conditiongroup2').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('conditiongroup2id').value =selected;//$('#materia
			 
});
$("input[name=conditiongroup3]").on('change',function(){
	
	var selected =  $("#conditiongroup3list option[value='" + $('#conditiongroup3').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('conditiongroup3id').value =selected;//$('#materia
			 
});
$("input[name=conditiongroup4]").on('change',function(){
	
	var selected =  $("#conditiongroup4list option[value='" + $('#conditiongroup4').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('conditiongroup4id').value =selected;//$('#materia
			 
});
$("input[name=conditiongroup5]").on('change',function(){
	
	var selected =  $("#conditiongroup5list option[value='" + $('#conditiongroup5').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('conditiongroup5id').value =selected;//$('#materia
			 
});
		 
		 
$("input[name=custclass]").on('change',function(){
	
	var selected =  $("#custclasslist option[value='" + $('#custclass').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('custclassid').value =selected;//$('#materia
			 
});
		 
$("input[name=activitycode]").on('change',function(){
	
	var selected =  $("#activitycodelist option[value='" + $('#activitycode').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('activitycodeid').value =selected;//$('#materia
			 
});
		 
$("input[name=paymentterm]").on('change',function(){
	
	var selected =  $("#paymenttermlist option[value='" + $('#paymentterm').val() + "']").attr('data-id');	  
		 var ccode= document.getElementById('paymenttermid').value =selected;//$('#materia
			 
});
		 

		
		
}); //close document.ready function

function DistFun() {
		var selected =  $("#distchannellist option[value='" + $('#distchannel').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('distchannelid').value="";
		}
	 else
		 {
		 document.getElementById('distchannelid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function DivisionFun() {
	var selected =  $("#divisionlist option[value='" + $('#division').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('divisionid').value="";
		}
	 else
		 {
		 document.getElementById('divisionid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function SalesDistFun() {
	var selected =  $("#salesdistrictlist option[value='" + $('#salesdistrict').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('salesdistrictid').value="";
		}
	 else
		 {
		 document.getElementById('salesdistrictid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


function AcctassignFun() {
	var selected =  $("#accassignmentlist option[value='" + $('#accassignment').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('accassignmentid').value="";
		}
	 else
		 {
		 document.getElementById('accassignmentid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


function CustpriceFun() {
	var selected =  $("#custpricelist option[value='" + $('#custprice').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('custpriceid').value="";
		}
	 else
		 {
		 document.getElementById('custpriceid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function CuststatsFun() {
	var selected =  $("#customerstatslist option[value='" + $('#customerstats').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customerstatsid').value="";
		}
	 else
		 {
		 document.getElementById('customerstatsid').value =selected;//$('#materialgroupid').val("ssss");

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


function DeliveryFun() {
	var selected =  $("#deliveryprioritylist option[value='" + $('#deliverypriority').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('deliverypriorityid').value="";
		}
	 else
		 {
		 document.getElementById('deliverypriorityid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function ShippingFun() {
	var selected =  $("#shippinglist option[value='" + $('#shipping').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('shippingid').value="";
		}
	 else
		 {
		 document.getElementById('shippingid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


function PricegroupFun() {
	var selected =  $("#pricegrouplist option[value='" + $('#pricegroup').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('pricegroupid').value="";
		}
	 else
		 {
		 document.getElementById('pricegroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}


function PricelistFun() {
	var selected =  $("#pricelist option[value='" + $('#price').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('priceid').value="";
		}
	 else
		 {
		 document.getElementById('priceid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function SalesOfficeFun() {
	var selected =  $("#salesofficelist option[value='" + $('#salesoffice').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('salesofficeid').value="";
		}
	 else
		 {
		 document.getElementById('salesofficeid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

function SalesgroupFun() {
	var selected =  $("#salesgrouplist option[value='" + $('#salesgroup').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('salesgroupid').value="";
		}
	 else
		 {
		 document.getElementById('salesgroupid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

//condition group
function Congrp1Fun() {
	var selected =  $("#conditiongroup1list option[value='" + $('#conditiongroup1').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('conditiongroup1id').value="";
		}
	 else
		 {
		 document.getElementById('conditiongroup1id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   

function Congrp2Fun() {
	var selected =  $("#conditiongroup2list option[value='" + $('#conditiongroup2').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('conditiongroup2id').value="";
		}
	 else
		 {
		 document.getElementById('conditiongroup2id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Congrp3Fun() {
	var selected =  $("#conditiongroup3list option[value='" + $('#conditiongroup3').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('conditiongroup3id').value="";
		}
	 else
		 {
		 document.getElementById('conditiongroup3id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Congrp4Fun() {
	var selected =  $("#conditiongroup4list option[value='" + $('#conditiongroup4').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('conditiongroup4id').value="";
		}
	 else
		 {
		 document.getElementById('conditiongroup4id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Congrp5Fun() {
	var selected =  $("#conditiongroup5list option[value='" + $('#conditiongroup5').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('conditiongroup5id').value="";
		}
	 else
		 {
		 document.getElementById('conditiongroup5id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   

//customergroup
function Custgrp1Fun() {
	var selected =  $("#customergroup1list option[value='" + $('#customergroup1').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup1id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup1id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   

function Custgrp2Fun() {
	var selected =  $("#customergroup2list option[value='" + $('#customergroup2').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup2id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup2id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Custgrp3Fun() {
	var selected =  $("#customergroup3list option[value='" + $('#customergroup3').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup3id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup3id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Custgrp4Fun() {
	var selected =  $("#customergroup4list option[value='" + $('#customergroup4').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup4id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup4id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Custgrp5Fun() {
	var selected =  $("#customergroup5list option[value='" + $('#customergroup5').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup5id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup5id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Custgrp6Fun() {
	var selected =  $("#customergroup6list option[value='" + $('#customergroup6').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('customergroup6id').value="";
		}
	 else
		 {
		 document.getElementById('customergroup6id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
//Attribute

function ContinentFun() {
	var selected =  $("#continentlist option[value='" + $('#continent').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('continentid').value="";
		}
	 else
		 {
		 document.getElementById('continentid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   

function Attribute2Fun() {
	var selected =  $("#attribute2list option[value='" + $('#attribute2').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute2id').value="";
		}
	 else
		 {
		 document.getElementById('attribute2id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   

function Attribute3Fun() {
	var selected =  $("#attribute3list option[value='" + $('#attribute3').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute3id').value="";
		}
	 else
		 {
		 document.getElementById('attribute3id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute4Fun() {
	var selected =  $("#attribute4list option[value='" + $('#attribute4').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute4id').value="";
		}
	 else
		 {
		 document.getElementById('attribute4id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute5Fun() {
	var selected =  $("#attribute5list option[value='" + $('#attribute5').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute5id').value="";
		}
	 else
		 {
		 document.getElementById('attribute5id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute6Fun() {
	var selected =  $("#attribute6list option[value='" + $('#attribute6').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute6id').value="";
		}
	 else
		 {
		 document.getElementById('attribute6id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute7Fun() {
	var selected =  $("#attribute7list option[value='" + $('#attribute7').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute7id').value="";
		}
	 else
		 {
		 document.getElementById('attribute7id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute8Fun() {
	var selected =  $("#attribute8list option[value='" + $('#attribute8').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute8id').value="";
		}
	 else
		 {
		 document.getElementById('attribute8id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute9Fun() {
	var selected =  $("#attribute9list option[value='" + $('#attribute9').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute9id').value="";
		}
	 else
		 {
		 document.getElementById('attribute9id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   
function Attribute10Fun() {
	var selected =  $("#attribute10list option[value='" + $('#attribute10').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('attribute10id').value="";
		}
	 else
		 {
		 document.getElementById('attribute10id').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   


function CustomerClassificFun() {
	var selected =  $("#custclasslist option[value='" + $('#custclass').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('custclassid').value="";
		}
	 else
		 {
		 document.getElementById('custclassid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}   


function ActivityCodeFun() {
	var selected =  $("#activitycodelist option[value='" + $('#activitycode').val() + "']").attr('data-id');	  
	 	  	 if (typeof(selected) == 'undefined') {
		 document.getElementById('activitycodeid').value="";
		}
	 else
		 {
		 document.getElementById('activitycodeid').value =selected;//$('#materialgroupid').val("ssss");

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

</script>
</head>
<body onload="func()" oncontextmenu="return false;">

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
     access=rr.getCustomer();
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


CountryDAO cd =new  CountryDAO();
List<Country> listc =cd.getCountrylist();
request.setAttribute("listc", listc);


CurrencyDAO ccdd =new CurrencyDAO();
List<Currency> listcur=ccdd.getCurrencylist();
request.setAttribute("listcur",listcur);

Customer_CustomerGroupDAO ccgd=new Customer_CustomerGroupDAO();
List<Customer_CustomerGroup> cglist=ccgd.custcustomergrouplist(rolename);
request.setAttribute("cglist",cglist);



List<Customer> listcustrev=null;
if(userid!=null)
{
	
	String listcustgrpcode=ListCustomerGroupDAO.getCustgroupcodelist(rolename);
	
	
	String custgrpcode=listcustgrpcode.substring(0,listcustgrpcode.length()-2);
	CustomerDAO ccd =new CustomerDAO();
	listcustrev=ccd.getReviewerUsername(custgrpcode);
	
	
}

request.setAttribute("listcustrev", listcustrev);
TitleDAO td=new TitleDAO();
List<Title> tlist=td.getTitlelist();
request.setAttribute("tlist",tlist);

SalesDistrictDAO sdd =new SalesDistrictDAO();
List<SalesDistrict> listsd=sdd.getSalesDistrictList();
request.setAttribute("listsd",listsd);

SalesOfficeDAO sod=new SalesOfficeDAO();
List<SalesOffice> listso =sod.getSalesOfficeList();
request.setAttribute("listso",listso);




CustPriceProcedureDAO cpp =new CustPriceProcedureDAO();
List<CustPriceProcedure> listcpp=cpp.getCustpricelist();
request.setAttribute("listcpp",listcpp);

CustStatsGroupDAO csgd=new CustStatsGroupDAO();
List<CustStatsGroup>  listcsg=csgd.getCuststatslist();
request.setAttribute("listcsg",listcsg);

IncotermDAO ind =new IncotermDAO();
List<Incoterm> listind =ind.getIncotermlist();
request.setAttribute("listind",listind);

DeliveryPriorityDAO dp =new DeliveryPriorityDAO();
List<DeliveryPriority> listdp =dp.getdeliverylist();
request.setAttribute("listdp",listdp);

ShippingDAO sd =new ShippingDAO();
List<Shipping> listship =sd.getShippinglist();
request.setAttribute("listship",listship);



PriceListDAO pl=new PriceListDAO();
List<PriceList> listpl =pl.getPricelist();
request.setAttribute("listpl",listpl);

CustomerClassificDAO ccd =new CustomerClassificDAO();
List<CustomerClassific> listcc =ccd.getCustomerClassificList();
request.setAttribute("listcc",listcc);

ActivityCodeDAO acd =new ActivityCodeDAO();
List<ActivityCode> listac=acd.getActivityCodeList();
request.setAttribute("listac",listac);

PaymentTermDAO ptd =new PaymentTermDAO();
List<PaymentTerm> listpt =ptd.getPaymentTermList();
request.setAttribute("listpt",listpt);


AttributeDAO ad =new AttributeDAO();
List<Attribute> listatt1=ad.getAttributelist("KATR1");
request.setAttribute("listatt1",listatt1);
List<Attribute> listatt2=ad.getAttributelist("KATR2");
request.setAttribute("listatt2",listatt2);
List<Attribute> listatt3=ad.getAttributelist("KATR3");
request.setAttribute("listatt3",listatt3);
List<Attribute> listatt4=ad.getAttributelist("KATR4");
request.setAttribute("listatt4",listatt4);
List<Attribute> listatt5=ad.getAttributelist("KATR5");
request.setAttribute("listatt5",listatt5);
List<Attribute> listatt6=ad.getAttributelist("KATR6");
request.setAttribute("listatt6",listatt6);
List<Attribute> listatt7=ad.getAttributelist("KATR7");
request.setAttribute("listatt7",listatt7);
List<Attribute> listatt8=ad.getAttributelist("KATR8");
request.setAttribute("listatt8",listatt8);
List<Attribute> listatt9=ad.getAttributelist("KATR9");
request.setAttribute("listatt9",listatt9);
List<Attribute> listatt10=ad.getAttributelist("KATR10");
request.setAttribute("listatt10",listatt10);

 CustomerGroupDAO2 cdd=new CustomerGroupDAO2();
List<CustomerGroup2> listcg1=cdd.getCustomergrouplist("KVGR1");
request.setAttribute("listcg1",listcg1);
List<CustomerGroup2> listcg2=cdd.getCustomergrouplist("KVGR2");
request.setAttribute("listcg2",listcg2);
List<CustomerGroup2> listcg3=cdd.getCustomergrouplist("KVGR3");
request.setAttribute("listcg3",listcg3);
List<CustomerGroup2> listcg4=cdd.getCustomergrouplist("KVGR4");
request.setAttribute("listcg4",listcg4);
List<CustomerGroup2> listcg5=cdd.getCustomergrouplist("KVGR5");
request.setAttribute("listcg5",listcg5);
List<CustomerGroup2> listcg6=cdd.getCustomergrouplist("KDGRP");
request.setAttribute("listcg6",listcg6);

ConditionGroupDAO cgg=new ConditionGroupDAO();
List<ConditionGroup> listcon1 =cgg.getConditiongrouplist("KDKG1");
request.setAttribute("listcon1",listcon1);
List<ConditionGroup> listcon2 =cgg.getConditiongrouplist("KDKG2");
request.setAttribute("listcon2",listcon2);
List<ConditionGroup> listcon3 =cgg.getConditiongrouplist("KDKG3");
request.setAttribute("listcon3",listcon3);
List<ConditionGroup> listcon4 =cgg.getConditiongrouplist("KDKG4");
request.setAttribute("listcon4",listcon4);
List<ConditionGroup> listcon5 =cgg.getConditiongrouplist("KDKG5");
request.setAttribute("listcon5",listcon5);
pageContext.setAttribute("access",access);

%>

<form id="form1" action="Customersave" name="customer"  method="post" >
	<div class="row" id="salesdata" style="margin-top:2%;">
		<div class="col-md-12">
		<div class = "panel panel-primary">

		   <div class = "panel-heading">
		      <h3 class = "panel-title">Customer </h3>
		   </div>   

   		<div class = "panel-body">
   		
   		
   		<fieldset class="scheduler-border">
    <legend class="scheduler-border">General Data</legend>
   



   		<div class="row">
    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">MDM Customer Code</label>
		      <div class="col-sm-8 input-group">
				 <input type="text" readonly  onkeypress="return onlyAddress(event,this);"  class="form-control input-sm input_text" maxlength="60" name="mdmcustomercode"   id="mdmcustomercode"  required  placeholder="Customer Code"  autocomplete="off" >
		      </div>
		    </div>
	    <div class="form-group col-md-6">

		      <label class="control-label col-sm-4" for="name">SAP Customer Code</label>
		      <div class="col-sm-8 input-group">
		      	<input type="text"  class="form-control input-sm input_text"  readonly  maxlength="10" name="sapcustomercode"   id="sapcustomercode"    placeholder="SAP Customer Code"                                    placeholder="MDM Code"  required autocomplete="off"  >
			  
		      </div>
		    </div>
		    </div>
		    
		    <div class="row">
		    
   		  <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Customer Group</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergrouplist" required class=" form-control input-sm input_text" name="customergroup"  id="customergroup"   onchange="return Customergroup();"   placeholder="Customer Group"  autocomplete="off"  >
		   <datalist id="customergrouplist">
		   <c:forEach items="${cglist}" var="c">  		            
		            <option value="${c.customergroupdesc}" data-type="${c.customergrouptype}" data-id="${c.customergroupcode}"> ${c.customergroupdesc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="customergroupid" id="customergroupid" > 	
                <input type="hidden" name="customertypeid" id="customertypeid" > 		   
        	   
		      </div>
		    </div>   		
		    
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Title</label>
		      <div class="col-sm-8 input-group">
		     <input  list="titlelist" required class=" form-control input-sm input_text" name="title"  id="title"     placeholder="Title"  onchange="return Title();" autocomplete="off"  >
		   <datalist id="titlelist">
		   <c:forEach items="${tlist}" var="c">  		            
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
		      <label class="required control-label col-sm-4" for="name">Name</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text"  onkeypress="return namevalidate(event,this);" oninput="this.value = this.value.toUpperCase()"  class="form-control input-sm "  maxlength="40" name="name"  placeholder="Name"   id="name" required autocomplete="off">
		      </div>
		    </div>
	
	 <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" id ="ln" for="name">Name2</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" onkeypress="return namevalidate(event,this);" oninput="this.value = this.value.toUpperCase()"  class="form-control input-sm "   name="name2"  placeholder="Name2"   id="name2"  autocomplete="off">
		       
		      </div>
		    </div>
	
		    </div>
		    <div class="row">
		    
 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Legal Name</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" required onkeypress="return namevalidate(event,this);"  class="required form-control input-sm " oninput="this.value = this.value.toUpperCase()" onkeypress="return onlyAlphabets(event,this);"  maxlength="40" name="legalname"  placeholder="Legal Name"   id="legalname"  autocomplete="off">
		       
		      </div>
		    </div>
		    
		    
		    
		     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Country</label>
		      <div class="col-sm-8 input-group">
		     <input  list="countrylist" required class=" form-control input-sm input_text" name="country"  id="country"   onfocusout="countryy()"  onchange="return Country()"  placeholder="Country"  autocomplete="off"  >
		   <datalist id="countrylist">
		   <c:forEach items="${listc}" var="c">  		            
		            <option value="${c.description}" data-id="${c.countrycode}"> ${c.description} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="countryid" id="countryid" > 
		      </div>
		    </div>
		    
		    
		    </div>
 <div class="row">
  <div class="form-group col-md-6">
		      <label  class="required control-label col-sm-4 mandatory" for="name">State/Region</label>
		      <div class="col-sm-8 input-group">
		      <input  list="statelist" class=" form-control input-sm input_text" name="state" required id="state" maxlength="50"    placeholder="State"  onchange="return Statecheck();" autocomplete="off"  >
		   <datalist id="statelist" class="State">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="stateid" id="stateid" > 	   			   
		      </div>
		    </div>

		   
 <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">House No</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" name="houseno"  maxlength="10"  id="houseno"   placeholder="House No"   autocomplete="off" >
			   	   
		      </div>
		    </div>
		   

</div>

<div class="row">

 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory" for="name">Street</label>
		      <div class="col-sm-8 input-group">
		      <input type="text" class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" onkeypress="return onlyAddress(event,this);" name="Street"  maxlength="60"  id="street"   placeholder="Street" required  autocomplete="off" >
			   	   
		      </div>
		    </div>
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory">Street1</label>
		      <div class="col-sm-8 input-group">
				<input type="text" onkeypress="return onlyAddress(event,this);" oninput="this.value = this.value.toUpperCase()"  class="form-control input-sm input_text"  maxlength="40" name="street1"  id="street1"   placeholder="Street1" autocomplete="off" >
			   	   
		      </div>
		    </div>



</div>

<div class="row">
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
		      <label class="required control-label col-sm-4" for="name">City</label>
		      <div class="col-sm-8 input-group">
				     <input type="text"  onkeypress="return onlyAlphabets(event,this);" class="form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" name="city" maxlength="35" required  id="city"   placeholder="City"  required autocomplete="off" >
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
		     		        				       		      <input type="text"  onkeypress="return isNumber(event)"  class="form-control input-sm "   maxlength="15" name="telno"  placeholder="Telephone No"   id="telno"  autocomplete="off">
			  		   
		      </div>
		    </div>		
		    </div>
 <div class="row">
 
		     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Mobile Number</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text"  onkeypress="return isNumber(event)"  class="form-control input-sm "  maxlength="15" name="mobileno"  placeholder="Mobile" required id="mobileno"  autocomplete="off">
			      
		      </div>
		    </div>
		    
		    
		     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">EMail Id</label>
		      <div class="col-sm-8 input-group">
		      <input type="email"  title="please enter a valid emailid"  pattern="[a-zA-Z0-9.-_]{1,}@[a-zA-Z.-]{2,}[.]{1}[a-zA-Z]{2,}"   class="form-control input-sm "  maxlength="241" name="mailid"  placeholder="Email Id" required id="mailid"  autocomplete="off">
		      </div>
		    </div>
		    </div>
		 
		    </fieldset>
		   
		   
		   
   		<fieldset class="scheduler-border">
    <legend class="scheduler-border">Sales  Data</legend>
    <div class="row">
  <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Distribution Channel</label>
		      <div class="col-sm-8 input-group">
		      <input  list="distchannellist" required class=" form-control input-sm input_text" name="distchannel"  id="distchannel"  onfocusout="DistFun()" onchange="return distchannelcheck();"   placeholder="Distribution Channel"  autocomplete="off"  >
		     
		   <datalist id="distchannellist">
		     
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="distchannelid" id="distchannelid" > 
         <input type="hidden" id="ssave" name="Save"  > 
          <input type="hidden" id="ssubmit" name="Submit"  > 
		      </div>
		    </div>	
		    
		     <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4" for="name">Division</label>
		      <div class="col-sm-8 input-group">
		     <input  list="divisionlist" required class=" form-control input-sm input_text" name="division"  id="division" onchange="return divisioncheck();" maxlength="50"  onfocusout="DivisionFun()"   placeholder="Division"  autocomplete="off"  >
		   <datalist id="divisionlist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="divisionid" id="divisionid" > 
		      </div>
		    </div>
    
    </div>
    
    
        <div class="row">
         <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Sales District</label>
		      <div class="col-sm-8 input-group">
		     <input  list="salesdistrictlist" required class=" form-control input-sm input_text" name="salesdistrict"  id="salesdistrict"   onfocusout="SalesDistFun()"  onchange="return salesdistcheck();"  placeholder="Sales District"  autocomplete="off"  >
		   <datalist id="salesdistrictlist">
		     <c:forEach items="${listsd}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="salesdistrictid" id="salesdistrictid" > 
		      </div>
		    </div>
		    
		     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Account Assignment Gp</label>
		      <div class="col-sm-8 input-group">
		     <input  list="accassignmentlist" required class=" form-control input-sm input_text" name="accassignment"  id="accassignment" maxlength="50" onfocusout="AcctassignFun()"  onchange="return acctassigncheck();"   placeholder="Account Assignment gp"  autocomplete="off"  >
		   <datalist id="accassignmentlist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="accassignmentid" id="accassignmentid" > 
		      </div>
		    </div>
    </div>
    
    
     <div class="row">
     
       <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Cust. Price Procedure</label>
		      <div class="col-sm-8 input-group">
		     <input  list="custpricelist" required value="1-Standard" class=" form-control input-sm input_text" name="custprice"  id="custprice"  onfocusout="CustpriceFun()" onchange="return custpricecheck();"   placeholder="Cust. Price Procedure"  autocomplete="off"  >
		   <datalist id="custpricelist">
		    <c:forEach items="${listcpp}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="custpriceid" id="custpriceid" value="1" > 
		      </div>
		    </div>
			 <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Customer Stats. Group</label>
		      <div class="col-sm-8 input-group">
		     <input  list="customerstatslist" required value="1-A Material" class=" form-control input-sm input_text" name="customerstats"  id="customerstats" maxlength="50"  onfocusout="CuststatsFun()"  onchange="return custstatcheck();" placeholder="Customer Stats. Group"  autocomplete="off"  >
		   <datalist id="customerstatslist">
		     <c:forEach items="${listcsg}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="customerstatsid" id="customerstatsid" value="1" > 
		      </div>
		    </div>
    </div>
    
    
     <div class="row">
       <div class="form-group col-md-6">
		      <label class=" required control-label col-sm-4" for="name">Incoterm</label>
		      <div class="col-sm-8 input-group">
		     <input  list="incotermlist" required class=" form-control input-sm input_text" name="incoterm"  id="incoterm"  onfocusout="IncotermFun()"  onchange="return incotermcheck();" placeholder="Incoterm"  autocomplete="off"  >
		   <datalist id="incotermlist">
		    <c:forEach items="${listind}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="incotermid" id="incotermid" > 
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 mandatory" for="name">Inco. Location1</label>
		      <div class="col-sm-8 input-group">
		      <input  class=" form-control input-sm input_text" oninput="this.value = this.value.toUpperCase()" name="incolocation1"   id="incolocation1" maxlength="16"    placeholder="Inco. Location1" required autocomplete="off"  >
		  	   			   
		      </div>
		    </div>
    </div>
    
    
     <div class="row">
      <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Delivery Priority</label>
		      <div class="col-sm-8 input-group">
		     <input  list="deliveryprioritylist" value="01-High" required class=" form-control input-sm input_text" name="deliverypriority"  id="deliverypriority"  onfocusout="DeliveryFun()" onchange="return deliverycheck();"  placeholder="Delivery Priority"  autocomplete="off"  >
		   <datalist id="deliveryprioritylist">
		   
		   
		     <c:forEach items="${listdp}" var="c">  		            
		            <option value="${c.description}"
		           
		            
		            data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" value="01" name="deliverypriorityid" id="deliverypriorityid" > 
		      </div>
		    </div>
		    <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Shipping Condition</label>
		      <div class="col-sm-8 input-group">
		     <input  list="shippinglist" required value="01-standard" class=" form-control input-sm input_text" name="shipping"  id="shipping" maxlength="50" onfocusout="ShippingFun()"  onchange="return shippingcheck();"  placeholder="Shipping Condition"  autocomplete="off"  >
		   <datalist id="shippinglist">
		    <c:forEach items="${listship}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="shippingid" id="shippingid" value="01" > 
		      </div>
		    </div>
    </div>
    
    
     <div class="row">
     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Price Group</label>
		      <div class="col-sm-8 input-group">
		     <input  list="pricegrouplist" required class=" form-control input-sm input_text" name="pricegroup"  id="pricegroup"  onfocusout="PricegroupFun()" onchange="return pricegroupcheck();"    placeholder="Price Group"  autocomplete="off"  >
		   <datalist id="pricegrouplist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="pricegroupid" id="pricegroupid" > 
		      </div>
		    </div>
		     <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Price List</label>
		      <div class="col-sm-8 input-group">
		     <input  list="pricelist"  class=" form-control input-sm input_text" name="price"  id="price" maxlength="50" onfocusout="PricelistFun()"  onchange="return pricelistcheck();"  placeholder="Price List"  autocomplete="off"  >
		   <datalist id="pricelist">
		    <c:forEach items="${listpl}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="priceid" id="priceid" > 
		      </div>
		    </div>
			
    </div>
    
    
    
     <div class="row">
     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Sales Office</label>
		      <div class="col-sm-8 input-group">
		     <input  list="salesofficelist" required class=" form-control input-sm input_text" name="salesoffice"  id="salesoffice"  onfocusout="SalesOfficeFun()"  onchange="return salesofficecheck();"  placeholder="Sales Office"  autocomplete="off"  >
		   <datalist id="salesofficelist">
		     <c:forEach items="${listso}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="salesofficeid" id="salesofficeid" > 
		      </div>
		    </div>
		      <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Sales Group</label>
		      <div class="col-sm-8 input-group">
		     <input  list="salesgrouplist" required class=" form-control input-sm input_text" name="salesgroup"  id="salesgroup" maxlength="50"  onchange="return salesgroupcheck();"   placeholder="Sales Group"  onfocusout="SalesgroupFun()" autocomplete="off"  >
		   <datalist id="salesgrouplist">
		    
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="salesgroupid" id="salesgroupid" > 
		      </div>
		    </div>
    </div>
    
    
    
     <div class="row">
     <div class="form-group col-md-6">
      <label class="required control-label col-sm-4" for="email"> Customer Group</label>
      <div class="col-sm-8 input-group">
            <input type="button"  id="athft" style="text-decoration: underline;" class="btn btn-link"  onclick="Launchcggroup()" value="Customer Group">
      </div>
    </div>
    <div class="form-group col-md-6">
      <label class="required control-label col-sm-4" for="email"> Attribute</label>
      <div class="col-sm-8 input-group">
            <input type="button"  id="athft" style="text-decoration: underline;" class="btn btn-link"  onclick="LaunchAtt()" value=" Attribute">
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
		      <label id="gst" class="control-label col-sm-4" for="name">GST No</label>
		      <div class="col-sm-8 input-group">
		     		        				       		      <input type="text" oninput="this.value = this.value.toUpperCase()" pattern="[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{3}" title="Please enter valid GST No"  onkeypress="return onlyAlphanumeric(event,this);"  class="form-control input-sm "  maxlength="15" name="gstno"  placeholder="GST No"   id="gstno"  autocomplete="off">
			   	      <input type="hidden" name="tin" id="tin" > 
		      </div>
		    </div>
		    
    </div>
    
      <div class="row">
     <div class="form-group col-md-6">
      <label class="control-label col-sm-4" for="email"> Condition Group</label>
      <div class="col-sm-8 input-group">
            <input type="button"  id="athft" style="text-decoration: underline;" class="btn btn-link"  onclick="Launchcongroup()" value=" Condition Group">
      </div>
    </div>
   		<div class="form-group col-md-6">
		      <label class="required control-label col-sm-4 " for="name">G/L Code</label>
		      <div class="col-sm-8 input-group">
          <select class="form-control input-sm"  id="glcode" readonly  name="glcode" >		      
		      </select>	
		      </div>
		    </div>
    </div>
    
      <div class="row">
     <div class="form-group col-md-6">
		      <label id="cc" class="control-label col-sm-4" for="name">Customer Classific</label>
		      <div class="col-sm-8 input-group">
		       		      <input type="text" list="custclasslist"  class="form-control input-sm " onkeypress="return onlyAlphabets(event,this);"   name="custclass"  placeholder="Customer Classific" onfocusout="CustomerClassificFun()"   id="custclass"  onchange="return customerclassificcheck();" autocomplete="off">
		       
                   <datalist id="custclasslist">
		   <c:forEach items="${listcc}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.code}"> ${c.desc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="custclassid" id="custclassid" > 
		      </div>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label class="control-label col-sm-4 mandatory" for="name">Activity Code</label>
		      <div class="col-sm-8 input-group">
		      <input  list="activitycodelist" class=" form-control input-sm input_text" name="activitycode"  id="activitycode" maxlength="50"    placeholder="Activity Code" onfocusout="ActivityCodeFun()" onchange="return activitycodecheck();" autocomplete="off"  >
		   <datalist id="activitycodelist" >
		    <c:forEach items="${listac}" var="c">  		            
		            <option value="${c.desc}" data-id="${c.code}" > ${c.desc} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="activitycodeid" id="activitycodeid" > 	   			   
		      </div>
		    </div>
    </div>
    <div class="row">
     <div class="form-group col-md-6">
		      <label class="required control-label col-sm-4" for="name">Currency</label>
		      <div class="col-sm-8 input-group">
		     <input  list="currencylist" required class=" form-control input-sm input_text" name="currency"  id="currency"    placeholder="Currency" onfocusout="CurrencyFun()"  onchange="return currencycheck();" autocomplete="off"  >
		   <datalist id="currencylist">
		       <c:forEach items="${listcur}" var="c">  		            
		            <option value="${c.description}" data-id="${c.currency }" > ${c.description} </option>		             
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
   
    
    
    </fieldset>
		    
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
	    
<div class="col-md-1 col-md-offset-8"><input type="submit" id="save" onclick=" return (onsaveclick() && validatepinCode() && checkform())" name="Savee" class="btn btn-primary btn-md"  value="Save"/></div>
<div class="col-md-1"><button type="submit" onclick="return(onsubmitclick() && validatepinCode() && validatee())" class="btn btn-primary btn-md" name="Submite" id="submit"  value="Submit">Submit</button></div>
		     <div class="col-md-1"> <button type="button" class="btn btn-primary btn-md"  onclick="clearform()">Clear</button></div>
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
  <div class="modal-dialog" style="width: 100%;">

    <!-- Modal content-->
    <div class="modal-content">
    <div class="container-fluid" id="data">
 
  
  <div class="row" style="margin-top: 15px;  ">
    <div class="col-sm-12"  align="right">
     <div style="border: 1px solid #DCDCDC;">
    <label class="required" >Customer Group</label>
      <select id="cg" >

  
  <c:forEach items="${cglist}" var="c">  		            
		            <option value="${c.customergroupcode}" > ${c.customergroupdesc} </option>		             
		        </c:forEach>
</select>

 <input type="text" onkeypress="return onlyAlphabets(event,this);"  name="custname" id="custname" placeholder="Customer Name" maxlength="40" > 
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
    
    
    
        <input type="text" placeholder="Version" onkeypress="return isNumber(event)"  name="version" id="version"  maxlength="5" size="5"> 
    
     <button style="margin-top: 5px;margin-bottom: 5px;margin-right: 5px"  type="button" onclick="ShowEditPopup();hide();" class="btn btn-primary">Search</button><br>
     
    </div>
      <div style="border: 1px solid #DCDCDC; margin-top: 20px;margin-bottom: 5px">
       <label >Block</label>
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
        <button type="button" onclick="javascript:window.location='Customer.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script type="text/javascript">
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
$(".modal").on("hidden.bs.modal", function () {
  window.location = "Customer.jsp";
});
</script>
   		
    <!-- attribute form -->


	<div class="row" style="margin-top:2%;display:none;" id="attribute">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Attribute</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
   		<div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Continent</label>
		      <div class="col-sm-8 input-group">
		       <input  list="continentlist"  class=" form-control input-sm input_text" name="continent"  id="continent" onfocusout="ContinentFun()"  placeholder="Continent" onchange="return continentcheck();"  autocomplete="off"  >
		   <datalist id="continentlist">
		     <c:forEach items="${listatt1}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="continentid" id="continentid" > 		   
        	   
		      </div>
		    </div>   		
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute2</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute2list"  class=" form-control input-sm input_text" name="attribute2"  id="attribute2"  placeholder="Attribute2" onfocusout="Attribute2Fun()" onchange="return attribute2check()"  autocomplete="off"  >
		   <datalist id="attribute2list">
		      <c:forEach items="${listatt2}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute2id" id="attribute2id" > 			       
		      </div>
		    </div>
		    
		    
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute3</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute3list"  class=" form-control input-sm input_text" name="attribute3"  id="attribute3"  onfocusout="Attribute3Fun()" onchange="return attribute3check()" placeholder="Attribute3"  autocomplete="off"  >
		   <datalist id="attribute3list">
		      <c:forEach items="${listatt3}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute3id" id="attribute3id" > 			       
		      </div>
		    </div>
		    
		    
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute4</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute4list"  class=" form-control input-sm input_text" name="attribute4"  id="attribute4"  placeholder="Attribute4" onfocusout="Attribute4Fun()" onchange="return attribute4check()"  autocomplete="off"  >
		   <datalist id="attribute4list">
		      <c:forEach items="${listatt4}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute4id" id="attribute4id" > 			       
		      </div>
		    </div>
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute5</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute5list"  class=" form-control input-sm input_text" name="attribute5"  id="attribute5"  placeholder="Attribute5" onfocusout="Attribute5Fun()" onchange="return attribute5check()"  autocomplete="off"  >
		   <datalist id="attribute5list">
		      <c:forEach items="${listatt5}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute5id" id="attribute5id" > 			       
		      </div>
		    </div>
	  
	  
	  <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute6</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute6list"  class=" form-control input-sm input_text" name="attribute6"  id="attribute6"  placeholder="Attribute6" onfocusout="Attribute6Fun()" onchange="return attribute6check()"  autocomplete="off"  >
		   <datalist id="attribute6list">
		      <c:forEach items="${listatt6}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute6id" id="attribute6id" > 			       
		      </div>
		    </div>
		    
		    
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute7</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute7list" class=" form-control input-sm input_text" name="attribute7"  id="attribute7"  placeholder="Attribute7" onfocusout="Attribute7Fun()" onchange="return attribute7check()"  autocomplete="off"  >
		   <datalist id="attribute7list">
		      <c:forEach items="${listatt7}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute7id" id="attribute7id" > 			       
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute8</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute8list"  class=" form-control input-sm input_text" name="attribute8"  id="attribute8"  placeholder="Attribute8" onfocusout="Attribute8Fun()" onchange="return attribute8check()"  autocomplete="off"  >
		   <datalist id="attribute8list">
		      <c:forEach items="${listatt8}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute8id" id="attribute8id" > 			       
		      </div>
		    </div>
	  
	   <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute9</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute9list"  class=" form-control input-sm input_text" name="attribute9"  id="attribute9"  placeholder="Attribute9" onfocusout="Attribute9Fun()" onchange="return attribute9check()"  autocomplete="off"  >
		   <datalist id="attribute9list">
		      <c:forEach items="${listatt9}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute9id" id="attribute9id" > 			       
		      </div>
		    </div>
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Attribute10</label>
		      <div class="col-sm-8 input-group">
            <input  list="attribute10list"  class=" form-control input-sm input_text" name="attribute10"  id="attribute10"  placeholder="Attribute10" onfocusout="Attribute10Fun()" onchange="return attribute10check()"  autocomplete="off"  >
		   <datalist id="attribute10list">
		      <c:forEach items="${listatt10}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="attribute10id" id="attribute10id" > 			       
		      </div>
		    </div>
	  <div class=form-group>
	  <div class="col-md-12	">
		     <div class="col-md-3"><input type="button" onclick="ClearBackAttribute()"  class="btn btn-primary form-control" name="back"  value="Clear"/> </div>
		     <div class="col-md-3"><input type="button" onclick="BackAttribute()"  class="btn btn-primary form-control" name="back"  value="Back"/> </div>
	  </div>
	  </div>
	    </div>
   		
		  	
		   
	</div>
   		
   		</div>
   		<br>
   		</div>
   	</div>

<br><br>
<!-- attribute form end -->


<!-- Condition Group start -->

<div class="row" style="margin-top:2%;display:none;"  id="congroup">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Condition Group</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
   		
   		<div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Condition Group1</label>
		      <div class="col-sm-8 input-group">
		       <input  list="conditiongroup1list"  class=" form-control input-sm input_text" name="conditiongroup1"  id="conditiongroup1"  placeholder="Condition Group1" onfocusout="Congrp1Fun()" onchange="return condgroup1check()"  autocomplete="off"  >
		   <datalist id="conditiongroup1list">
		     <c:forEach items="${listcon1}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="conditiongroup1id" id="conditiongroup1id" > 		   
        	   
		      </div>
		    </div>   	
		    
		    	
		   <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Condition Group2</label>
		      <div class="col-sm-8 input-group">
		       <input  list="conditiongroup2list"  class=" form-control input-sm input_text" name="conditiongroup2"  id="conditiongroup2"  placeholder="Condition Group2" onfocusout="Congrp2Fun()" onchange="return condgroup2check()"   autocomplete="off"  >
		   <datalist id="conditiongroup2list">
		       <c:forEach items="${listcon2}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="conditiongroup2id" id="conditiongroup2id" > 		   
        	   
		      </div>
		    </div>   
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Condition Group3</label>
		      <div class="col-sm-8 input-group">
		       <input  list="conditiongroup3list"  class=" form-control input-sm input_text" name="conditiongroup3"  id="conditiongroup3"  placeholder="Condition Group3" onfocusout="Congrp3Fun()" onchange="return condgroup3check()"   autocomplete="off"  >
		   <datalist id="conditiongroup3list">
		       <c:forEach items="${listcon3}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="conditiongroup3id" id="conditiongroup3id" > 		   
        	   
		      </div>
		    </div>   
		    
		    	
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Condition Group4</label>
		      <div class="col-sm-8 input-group">
		       <input  list="conditiongroup4list"  class=" form-control input-sm input_text" name="conditiongroup4"  id="conditiongroup4"  placeholder="Condition Group4" onfocusout="Congrp4Fun()" onchange="return condgroup4check()"   autocomplete="off"  >
		   <datalist id="conditiongroup4list">
		       <c:forEach items="${listcon4}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="conditiongroup4id" id="conditiongroup4id" > 		   
        	   
		      </div>
		    </div>  
		    
		    
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Condition Group5</label>
		      <div class="col-sm-8 input-group">
		       <input  list="conditiongroup5list"  class=" form-control input-sm input_text" name="conditiongroup5"  id="conditiongroup5"  placeholder="Condition Group5"  onfocusout="Congrp5Fun()" onchange="return condgroup5check()"  autocomplete="off"  >
		   <datalist id="conditiongroup5list">
		       <c:forEach items="${listcon5}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="conditiongroup5id" id="conditiongroup5id" > 		   
        	   
		      </div>
		    </div>  
		    
		    
	    </div>
   		
		     <div class="col-md-3"><input type="button"  class="btn btn-primary form-control" name="Submit" onclick="Clearcongroup()"  value="Clear"/> </div>
		  
		     <div class="col-md-3"><input type="button"  class="btn btn-primary form-control" name="Submit" onclick="Backcongroup()"  value="Back"/> </div>
		   
	
   		</div>
   		</div>
   		</div>
   	</div>
   	
   	
   	
<!-- Condition Group End -->



<!-- CustomerGroup Start -->

<div class="row" style="margin-top:2%;display:none;"  id="cggroup">
		<div class="col-md-6" style="padding-left:20px;">
		<div class = "panel panel-primary">
		   <div class = "panel-heading">
		      <h3 class = "panel-title">Customer Group</h3>
		   </div>   
   		<div class = "panel-body">
   		<div class="col-md-12">
   		
   		<div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Customer Group1</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup1list"  class=" form-control input-sm input_text" name="customergroup1"  id="customergroup1"  placeholder="Customer Group1" onfocusout="Custgrp1Fun()" onchange="return custgroup1check()"  autocomplete="off"  >
		   <datalist id="customergroup1list">
		     <c:forEach items="${listcg1}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup1id" id="customergroup1id" > 		   
        	   
		      </div>
		    </div>   	
		    
		    	
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Customer Group2</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup2list"  class=" form-control input-sm input_text" name="customergroup2"  id="customergroup2"  onfocusout="Custgrp2Fun()" placeholder="Customer Group2" onchange="return custgroup2check()"  autocomplete="off"  >
		   <datalist id="customergroup2list">
		      <c:forEach items="${listcg2}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup2id" id="customergroup2id" > 		   
        	   
		      </div>
		    </div>   	
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Customer Group3</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup3list"  class=" form-control input-sm input_text" name="customergroup3"  id="customergroup3"  placeholder="Customer Group3" onfocusout="Custgrp3Fun()" onchange="return custgroup3check()"  autocomplete="off"  >
		   <datalist id="customergroup3list">
		      <c:forEach items="${listcg3}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup3id" id="customergroup3id" > 		   
        	   
		      </div>
		    </div>   	
		    
		    
		    
		    
		     <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Customer Group4</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup4list"  class=" form-control input-sm input_text" name="customergroup4"  id="customergroup4"  onchange="return custgroup4check()" placeholder="Customer Group4" onfocusout="Custgrp4Fun()"  autocomplete="off"  >
		   <datalist id="customergroup4list">
		      <c:forEach items="${listcg4}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup4id" id="customergroup4id" > 		   
        	   
		      </div>
		    </div>   	
		    
		    <div class="form-group ">
		      <label class="control-label col-sm-4 mandatory" for="name">Customer Group5</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup5list"  class=" form-control input-sm input_text" name="customergroup5"  id="customergroup5"  placeholder="Customer Group5" onfocusout="Custgrp5Fun()" onchange="return custgroup5check()"  autocomplete="off"  >
		   <datalist id="customergroup5list">
		      <c:forEach items="${listcg5}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup5id" id="customergroup5id" > 		   
        	   
		      </div>
		    </div>   
	  
	  
	  <div class="form-group ">
		      <label class="required control-label col-sm-4" for="name">Customer Group6</label>
		      <div class="col-sm-8 input-group">
		       <input  list="customergroup6list"  class=" form-control input-sm input_text" name="customergroup6"  id="customergroup6"  placeholder="Customer Group6" onfocusout="Custgrp6Fun()" onchange="return custgroup6check()"  autocomplete="off"  >
		   <datalist id="customergroup6list">
		      <c:forEach items="${listcg6}" var="c">  		            
		            <option value="${c.description}" data-id="${c.code }" > ${c.description} </option>		             
		        </c:forEach>
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
                <input type="hidden" name="customergroup6id" id="customergroup6id" > 		   
        	   
		      </div>
		    </div>   
	
	    </div>
   		
		     <div class="col-md-3"><input type="button"  class="btn btn-primary form-control" onclick="Clearcggroup()" name="Submit"  value="Clear"/> </div>
		  
		     <div class="col-md-3"><input type="button"  class="btn btn-primary form-control" onclick="Backcggroup()" name="Submit"  value="Back"/> </div>
		   
	
   		</div>
   		</div>
   		</div>
   	</div>




<!-- CustomerGroup End -->

<br><br>
    
<script type="text/javascript">



function LaunchAtt(){    	
  	$( "#salesdata" ).hide();
  	$( "#attribute" ).show();  
  }
  function BackAttribute(){
  	$( "#salesdata" ).show();
  	$( "#attribute" ).hide();
  	
  }
function ClearBackAttribute()
{
	$( "#continent").val('');
  	$( "#attribute2").val('');
  	$( "#attribute3").val('');
  	$( "#attribute4").val('');
  	$( "#attribute5").val('');
  	$( "#attribute6").val('');
  	$( "#attribute7").val('');
  	$( "#attribute8").val('');
  	$( "#attribute9").val('');
  	$( "#attribute10").val('');
  
	
	
	
	}
  
  function saveattribute()
  {
	  
	  
	  if($("#continent").val()!=''){		 
			
			 alert("Attribute Saved!");
		 }
		 
	  if($("#continent").val()==''){		 
			
			 alert("Please enter the continent!");
		 }

	  
  }
  function Launchcongroup(){    	
	  	$( "#salesdata" ).hide();
	  	$( "#congroup" ).show();  
	  }
	  function Backcongroup(){
	  	$( "#salesdata" ).show();
	  	$( "#congroup" ).hide();
	  	
	  }
	  
	  function Clearcongroup()
	  {
		  	$( "#conditiongroup1").val('');
		  	$( "#conditiongroup2").val('');
		  	$( "#conditiongroup3").val('');
		  	$( "#conditiongroup4").val('');
		  	$( "#conditiongroup5").val('');
 
	  }
	  
	  function savecongroup()
	  {
		  
		  if($("#conditiongroup1").val()!='' || $("#conditiongroup2").val()!='' || $("#conditiongroup3").val()!='' || $("#conditiongroup4").val()!='' || $("#conditiongroup5").val()!=''){		 
				
			  alert("ConditionGroup Saved!");
			 }

	  }
	  function Launchcggroup(){    	
		  	$( "#salesdata" ).hide();
		  	$( "#cggroup" ).show();  
		  }
		  function Backcggroup(){
		  	$( "#salesdata" ).show();
		  	$( "#cggroup" ).hide();
		  	
		  }
		  
		  
		  function Clearcggroup()
		  {
			  	$( "#customergroup1" ).val('');
			  	$( "#customergroup2" ).val('');

			  	$( "#customergroup3" ).val('');

			  	$( "#customergroup4" ).val('');

			  	$( "#customergroup5" ).val('');

			  	$( "#customergroup6" ).val('');

		  }
		  
		  function cggroupsave()
		  {
			
			 
			 
			 if($("#customergroup6").val()!=''){		 
					
				 alert("CustomerGroup Saved!");
			 }
			 
		  
		  if($("#customergroup6").val()==''){		 
				
				 alert("Please enter the CustomerGroup6!");
			 }
			  
		  }

</script>

</form>

</body>
</html>

