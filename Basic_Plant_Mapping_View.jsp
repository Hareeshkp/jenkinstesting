<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@ page import="java.sql.*"%> 
<%@ page import="com.tvs.scrbasic.Material" %>
<%@ page import="com.tvs.scrbasic.MaterialDAO" %>
<%@ page import="com.tvs.scrbasic.Uom" %>
<%@ page import="com.tvs.scrbasic.UomDAO" %>
<%@ page import="com.tvs.scrbasic.Weight" %>
<%@ page import="com.tvs.scrbasic.WeightDAO" %>
<%@ page import="com.tvs.subscr.Source" %>
<%@ page import="com.tvs.subscr.SourceDAO" %>
<%@ page import="com.tvs.subscr.Level1DAO" %>
<%@ page import="com.tvs.subscr.Level1" %>
<%@ page import="com.tvs.scrbasic.MaterialGroupDAO" %>
<%@ page import="com.tvs.scrbasic.MaterialGroup" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tvs.userconsole.Materialtype"%>
<%@page import="com.tvs.userconsole.MaterialtypeDAO"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.scrbasic.Volumeunit"%>
<%@page import="com.tvs.scrbasic.VolumeunitDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SCR-BASIC</title>
  <link rel="stylesheet" href="css/form.css">
   <!--  --><link rel="stylesheet" href="css/autocomplete.css">
   
<!--  --><script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jquery.autocomplete.js"></script>

<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<style type="text/css">
.input-sm {
    height: 30px !important;    
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

<!-- from plant mapping -->
<style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
input::-webkit-calendar-picker-indicator { display: none; }
	.stylish-input-group .input-group-addon{
   background: white !important;
}
.stylish-input-group .form-control{
   //border-right:0;
   box-shadow:0 0 0;
   border-color:#ccc;
}
.stylish-input-group button{
   border:0;
   background:transparent;
}

.h-scroll {
   background-color: #fcfdfd;
   height: 260px;
   overflow-y: scroll;
}
.hummingbird-treeview * {
   list-style: none;
   font-size: 14px;
   line-height: 24px;
}

.tooltiptext {
 visibility: hidden;
 width: 100px;
 background-color: white;
 color: gray;
 font-size: 10px;
 text-align: center;
 border-radius: 6px;
 padding: 5px 0;

 /* Position the tooltip */
 position: absolute;
 z-index: 1;
}

i:hover .tooltiptext {
 visibility: visible;
}

i:hover{
cursor: pointer;
}
</style>
<!-- end -->	
<!-- from plant mapping -->
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="https://bootswatch.com/cosmo/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/hummingbird-treeview.css" rel="stylesheet" type="text/css">
<!-- end -->	
<!-- from plant mapping -->
<script type="text/javascript">
$('html').bind('keypress', function(e)
		{
		   if(e.keyCode == 13)
		   {
		      return false;
		   }
		});
		
function onlyAlphabets(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}
function onlydesc(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) ||(charCode ==40)||(charCode ==41)||(charCode ==34)||(charCode ==39)||(charCode ==45)||(charCode ==47)||(charCode ==37)||(charCode ==48)||(charCode ==49)||(charCode ==50)||(charCode ==51)||(charCode ==52)||(charCode ==53)||(charCode ==54)||(charCode ==55)||(charCode ==56)||(charCode ==57))
            return true;
        else
            return false;
    }
    catch (err) {
        alert(err.Description);
    }
}

function onlymcode(e, t) {
    try {
        if (window.event) {
            var charCode = window.event.keyCode;
        }
        else if (e) {
            var charCode = e.which;
        }
        else { return true; }
        if ((charCode > 64 && charCode < 91)  || (charCode > 96 && charCode < 123) ||(charCode ==32) ||(charCode ==48)||(charCode ==49)||(charCode ==50)||(charCode ==51)||(charCode ==52)||(charCode ==53)||(charCode ==54)||(charCode ==55)||(charCode ==56)||(charCode ==57))
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
function check()
{
	checkforms();
	var action = document.getElementById("submit").value;
	var matcode = document.getElementById("MaterialCode").value;
		        	var mat = document.getElementById("Meterial").value;
		       		 if (mat =='ZCP1-Capital Goods')
		        	{
		       			 
		        	if(matcode=='')
		        		{    		
		            alert("Please Enter Material Code");
		            return false;
		        		}
		        	} 
		       			    	
		    else
		    	{
		    	 return true;

				} 
	    
	  }
function check1()
{
	var matcode = document.getElementById("MaterialCode").value;
	var mat = document.getElementById("Meterial").value;
		       		 if (mat =='ZCP1-Capital Goods')
		        	{
		       			 
		        	if(matcode=='')
		        		{    		
		            return false;
		        		}
		        	
		       		 
		       			    	
		    else
		    	{		    	 
		    	return true;
				} 
		        	}
		       		 else
		       			 
		       		 {
		       			 return true;		       			 
		       		 }
	  }






function datalistValidator(modelname) {
	var obj = $("#BasicUom").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {			
			return true
	}	
	return false;
}
function datalistValidators(modelname) {
	var obj = $("#AlterUOM").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function datalistValidatormt(modelname) {
	var obj = $("#customerList").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function datalistValidatormg(modelname) {
	var obj = $("#mg").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function datalistValidatorunit(modelname) {
	var obj = $("#UnitWeightlist").find("option[value='" + modelname + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}

function Materialgroup(){
	console.log("Mdgrop");
	var mg = $("#materialgroup1").val();
	var existingmg = $('h2').text();
	if (datalistValidatormg(mg)===false) {
		
		alert(mg + " is not a valid material group");
		$("#materialgroup1").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}
function Mateialtype(){
	var mt = $("#Meterial").val();
	var existingmt = $('h2').text();
	if (datalistValidatormt(mt)===false) {
		
		alert(mt + " is not a valid material type");
		$("#Meterial").val(existingmt).focus();

			return false;
	}		
	else{
		return true;
	}
}

function basicuoms(){
	var mg = $("#basicuom").val();
	var existingmg = $('h2').text();
	if (datalistValidator(mg)===false) {

		alert(mg + " is not a valid basic uom");
		$("#basicuom").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}

function altuom(){
	var mg = $("#AlterNativeUOM").val();
	var existingmg = $('h2').text();
	if (datalistValidators(mg)===false) {
		
		alert(mg + " is not a valid Alt uom");
		$("#AlterNativeUOM").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}

function unitweight(){
	var mg = $("#UnitWeight").val();
	var existingmg = $('h2').text();
	if (datalistValidatorunit(mg)===false) {
		
		alert(mg + " is not a valid UnitWeight");
		$("#UnitWeight").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
}

$(document).ready(function() {	
	
	
	$("#MaterialCode").prop("readonly",true);
	
	$('#Description').keyup(function(){
	    this.value = this.value.toUpperCase();
	});
	//Material Type
	$("input[name=materialtype]").on('change',function(){ 
		
		var selected =  $("#customerList option[value='" + $('#Meterial').val() + "']").attr('data-id');		  		
		 $("#materialgroup1").val('');
		 $("#GrossWeight").val('');
		 $("#NetWeight").val('');
		

		  var ss=$("#Materialtypesid").val(selected);	
		  var Materialtypesid = document.getElementById('Materialtypesid').value;			 
		    $.ajax({
				type: "POST",
				url: "materialgroup.jsp",
				data: "materialtype="+Materialtypesid,
				cache: false,
				success: function(data)
		        {
									
		           $(".materialcode").html($.trim(data));		            
		        }
		    });
		    if( Materialtypesid =="ZCP1" ){		
		    	$("#asd").prop("disabled",false);
		    	$("#MaterialCode").prop("value",'');
		    	$("#MaterialCode").prop("required",true);		    	
		    	$("#MaterialCode").prop("readonly",true);
		    	$("#mtcode").addClass("required");		    	
		    	
		    
		    }
		    else if(Materialtypesid =="ZFG" || Materialtypesid =="ZPRT" || Materialtypesid =="ZROH" || Materialtypesid=="ZSFG"){
		    	$("#asd").prop("disabled",true);
		    	$("#MaterialCode").prop("value",'');
		    	$("#GrossWeight").prop("required",true);	
		    	$("#NetWeight").prop("required",true);
		    	$("#MaterialCode").prop("required",true);
		    	$("#MaterialCode").prop("readonly",false);
		    	$("#mtcode").addClass("required");		    				    				    	
		    	
		    }
		    
		    else if(Materialtypesid =="ZSCR" )
		    	{
		    		
		    	$("#asd").prop("disabled",true);
		    		
		    	$("#MaterialCode").prop("readonly",true);
		    	//$("#mtcode").removeClass("mandatory");
		    	$("#mtcode").addClass("required");
		    	}
		    else
		    {
		    	$("#MaterialCode").prop("required",false);	
		    	$("#asd").prop("disabled",true);
		    	$("#MaterialCode").prop("value",'');	
		    	$("#MaterialCode").prop("readonly",true);
		    	//$("#mtcode").addClass("mandatory");
		    	$("#mtcode").removeClass("required");
		    	
		    }
		    
		    if(Materialtypesid =="ZFG" || Materialtypesid =="ZSFG" || Materialtypesid =="ZROH" ){
		    	//alert(Materialtypesid);
		    	$("#GrossWeight").prop("disabled",false);
		    	$("#NetWeight").prop("disabled",false);	
		    	$("#grwt").addClass("required");
		    	$("#netwt").addClass("required");
		    	//$("#grwt").removeClass("mandatory");
		    	//$("#netwt").removeClass("mandatory");
		    }
		    else{
		    	$("#GrossWeight").prop("disabled",true);
		    	$("#NetWeight").prop("disabled",true);
		    	$("#grwt").removeClass("required");
		    	$("#netwt").removeClass("required");
		    	//$("#grwt").addClass("mandatory");
		    	//$("#netwt").addClass("mandatory");
		    }
		    
		    //Scrap Function Create
		    var scrap;
		    $.ajax({
		        url : 'sample',
		        dataType: 'json',
		        'async': false,
		        success : function(jsons) 
		        {
		        	scrap=jsons;    	
		        	whenmaterialtypechange(scrap);
		        }		        
		    });
		    function whenmaterialtypechange()
		    {
		    
		    var selected =  $("#customerList option[value='" + $('#Meterial').val() + "']").attr('data-id');
		    
		    if(selected ==="ZSCR" )// mt material type name		
		    	{	console.log("Scrap");

		    	   	var pat="SCP/";
		            var scraparray=scrap.slice(); 
		    		var filterscrap=[];
		    		for (var i = 0; i < scraparray.length; i++) {
		    	      if (scraparray[i].substring(0,4) == pat) {
		    		  filterscrap.push(scraparray[i]); 
		    		  
		    		  }
		    	    }
		    if(filterscrap.length<1)
		    {
		    var cd=document.getElementById("MaterialCode").value=pat+"00000001";//xxx is material code textbox name
		    }
		        else
		            {
		               var lastfour = filterscrap.map(myFu);//last four digit
		    			function myFu(value, index, array) {
		    				  return value.substring(4,13);
		    				}
		    			var res=[];
		    			for (var i=0,l=lastfour.length;i<l;i++) res.push(+lastfour[i]);
		    		 
		    			var maxim= Math.max.apply(Math, res);
		    		        maxim=maxim+1;
		    			
		    			var maxoflasts=""+maxim;
		    			var pads = "00000000"
		    				var answ = pads.substring(0, pads.length - maxoflasts.length) + maxoflasts
		    				document.getElementById("MaterialCode").value=pat+answ;//xxx is material code textbox name
		    		 
		     }
		    }
		    }
	});//Material type
	
	//Material Group
	$("input[name=materialgroup1]").on('change',function(){
		var selected =  $("#mg option[value='" + $('#materialgroup1').val() + "']").attr('data-id');		  
		 var ss= document.getElementById('materialgroup1id').value =selected;//$('#materialgroupid').val("ssss");
		 
	});
	//Basic UOM
	$("input[name=basicuom]").on('change',function(){ 				
	    var selected =  $("#BasicUom option[value='" + $('#basicuom').val() + "']").attr('data-id');
		var ss= document.getElementById('basicuomid').value =selected;
		
	});
	
	//Alternative UOM
	$("input[name=AlterNativeUOM]").on('change',function(){ 
		
		var selected =  $("#AlterUOM option[value='" + $('#AlterNativeUOM').val() + "']").attr('data-id');
		var ss= document.getElementById('mAlterNativeUOMid').value =selected;		  
		
	});
	//UnitWeight
	$("input[name=UnitWeight]").on('change',function(){
		 var selected =  $("#UnitWeightlist option[value='" + $('#UnitWeight').val() + "']").attr('data-id');	
		 var ss= document.getElementById('UnitWeightid').value =selected;
		 
	});
	
	
	
	 function UnitFun() { 
		  var selected =  $("#UnitWeightlist option[value='" + $('#UnitWeight').val() + "']").attr('data-id');		 
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('UnitWeightid').value="";

				}
			 else
				 {
				 document.getElementById('UnitWeightid').value =selected;//$('#materialgroupid').val("ssss");

				 }
	}
	 
	 
	 
	 
	  
	 function AlterNativeUOMFun() { 
		  var selected =  $("#AlterUOM option[value='" + $('#AlterNativeUOM').val() + "']").attr('data-id');		 
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('mAlterNativeUOMid').value="";
				 

				}
			 else
				 {
				 document.getElementById('mAlterNativeUOMid').value =selected;//$('#materialgroupid').val("ssss");

				 }
	}
	 
	 function  BasicUOMFun(){ 
		  var selected =  $("#BasicUom option[value='" + $('#basicuom').val() + "']").attr('data-id');		 
		  if (typeof(selected) == 'undefined') {
				 document.getElementById('basicuomid').value="";

				}
			 else
				 {
				 document.getElementById('basicuomid').value =selected;//$('#materialgroupid').val("ssss");

				 }
	}
	
	//Launch Screen change
	$("input[name=Lsearch1]").on('change',function(){
		
		$("#Lsearch2").val('');	
		$("#Level2").val('');
		var selected =  $("#LsearchList1 option[value='" + $('#Lsearch1').val() + "']").attr('data-id');
		var txt=$("#Level1").val(selected);		
		$.ajax({
			type: "POST",
			url: "level2.jsp",
			data: "materialtype="+selected,
			cache: false,
			success: function(response)
		    {				
		        $("#LsearchList2").html(response);
		    }
		});
		ConcatFunc();
		change();
	});
	//level 2

	//Level3
	$("input[name=Lsearch2]").on('change',function(){
		$("#Lsearch3").val('');	
		$("#Level3").val('');
		var selected =  $("#LsearchList2 option[value='" + $('#Lsearch2').val() + "']").attr('data-id');	
		var txt=$("#Level2").val(selected);		
		$.ajax({
			type: "POST",
			url: "level3.jsp",
			data: "state_id="+selected,
			cache: false,
			success: function(response)
		    {				
		        $("#LsearchList3").html(response);
		    }
		});
		ConcatFunc();
		change();		
		
	});
	//Level4
	$("input[name=Lsearch3]").on('change',function(){		
		var selected =  $("#LsearchList3 option[value='" + $('#Lsearch3').val() + "']").attr('data-id');	
		var txt=$("#Level3").val(selected);		
		ConcatFunc();
		change();
	});
	
	$("input[name=Lsearch4]").on('change',function(){		
		var selected =  $("#LsearchList4 option[value='" + $('#Lsearch4').val() + "']").attr('data-id');	
		var txt=$("#Source").val(selected);		
		ConcatFunc();change();
	});
	var sss;
    $.ajax({
        url : 'sample',
        dataType: 'json',
        'async': false,
        success : function(json) 
        {        	
        	sss=json;        	
        	change();
        }
    });
   
    
	function change()	
	{	//console.log(sss);
		var first=$("#MaterialCodelanch").val();
		if (sss!='')
			{
				
				var codearray=sss.slice();
			    var seven = codearray.map(myFunc);//first seven digit lengths 
				
			    function myFunc(value, index, array) {
					  return value.substring(0,7);
					}
				
				//from here change required
				var filter=[];
				for (var i = 0; i < codearray.length; i++)
				{
				  	if (codearray[i].substring(0,7) == first) {
					  filter.push(codearray[i]); 	  
					  }
				}
		     	var four = filter.map(myFun);//last four digit
				function myFun(value, index, array)
		     	{
				  return value.substring(7,13);
				}
				var result=[];
				for (var i=0,l=four.length;i<l;i++) result.push(+four[i]);
				if(first.length==7)
				{	   
					if(seven.includes(first))
					{
						console.log("true");
					 	var maxi= Math.max.apply(Math, result);
					    maxi=maxi+1;				
						var maxoflast=""+maxi;
						var pad = "00000"
						var ans = pad.substring(0, pad.length - maxoflast.length) + maxoflast 
						$("#MCode").val(first+ans);
					}
					else
					{			
					$("#MCode").val(first+"00001");			
					}
				}
			}
		else{
			$("#MCode").val(first+"00001");	
			}
		
  }
});

</script>
<!-- end -->	
<!-- from plant mapping -->
<script>
	$(document).ready(function(){
		  $('.collapse').collapse('hide');
		 
		});
	
	$(document).ready(function(){
		  $("#ss").click(function(){
			$(".collapse").collapse('toggle');
		  });
		 
		});
	
	
	
	<%--function  SearchbyMDM()
	
	{
	 var mmcode=document.getElementById("mcode").value; 
	
	 $.ajax({
			type: "POST",
			url: "plantmappingview2.jsp",    
			data : {
				"zzz":mmcode
			},
		
			cache: false,
			success: function(response)
			{
				$("#tableView").html(response);
			}
		});
		
	}--%>
	
	// function ShowEditPopup()
	// {	
	// 	 // var sam=set.value;
	// 	  var mattype=document.getElementById("mt").value; 
	// 	  var stat=document.getElementById("status").value; 
	// 	  var apvstat=document.getElementById("approvalstatus").value; 
	// 	  var ver=document.getElementById("version").value; 
	// 		$.ajax({
	// 			type: "POST",
	// 			url: "plantmappingview.jsp",    
	// 			data : {
	// 				"materialtype":mattype,
	// 				"status":stat,
	// 				"approvalstatus":apvstat,
	// 				"version":ver
	// 			},
			
	// 			cache: false,
	// 			success: function(response)
	// 			{
	// 				$("#tableView").html(response);
	// 			}
	// 		});
		   
	// }
	
	
	function myFunction() {
		  var x = document.getElementById("snackbar");
		  x.className = "show";
		  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
		}
</script>
<!-- end -->	
<!-- from plant mapping-->
<style>
	#snackbar {
	  visibility: hidden;
	  min-width: 250px;
	  margin-left: -125px;
	
	  background-color: #333;
	  color: #fff;
	  text-align: center;
	  border-radius: 2px;
	  padding: 16px;
	  position: fixed;
	  z-index: 1;
	  left: 50%;
	  bottom: 30px;
	  font-size: 17px;
	}
	
	#snackbar.show {
	  visibility: visible;
	  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	  animation: fadein 0.5s, fadeout 0.5s 2.5s;
	}
	
	@-webkit-keyframes fadein {
	  from {bottom: 0; opacity: 0;} 
	  to {bottom: 30px; opacity: 1;}
	}
	
	@keyframes fadein {
	  from {bottom: 0; opacity: 0;}
	  to {bottom: 30px; opacity: 1;}
	}
	
	@-webkit-keyframes fadeout {
	  from {bottom: 30px; opacity: 1;} 
	  to {bottom: 0; opacity: 0;}
	}
	
	@keyframes fadeout {
	  from {bottom: 30px; opacity: 1;}
	  to {bottom: 0; opacity: 0;}
	}
	</style>
<!-- end -->
<!-- from plant mapping-->
<script type="text/javascript">
	$(function() {
		
		  $('input[type="checkbox"]').change(checkboxChanged);
	
		  function checkboxChanged() {
			var $this = $(this),
				checked = $this.prop("checked"),
				container = $this.parent(),
				siblings = container.siblings();
	
			container.find('input[type="checkbox"]')
			.prop({
				indeterminate: false,
				checked: checked
			})
			.siblings('label')
			.removeClass('custom-checked custom-unchecked custom-indeterminate')
			.addClass(checked ? 'custom-checked' : 'custom-unchecked');
	
			checkSiblings(container, checked);
		  }
	
		  function checkSiblings($el, checked) {
			var parent = $el.parent().parent(),
				all = true,
				indeterminate = false;
	
			$el.siblings().each(function() {
			  return all = ($(this).children('input[type="checkbox"]').prop("checked") === checked);
			});
	
			if (all && checked) {
			  parent.children('input[type="checkbox"]')
			  .prop({
				  indeterminate: false,
				  checked: checked
			  })
			  .siblings('label')
			  .removeClass('custom-checked custom-unchecked custom-indeterminate')
			  .addClass(checked ? 'custom-checked' : 'custom-unchecked');
	
			  checkSiblings(parent, checked);
			} 
			else if (all && !checked) {
			  indeterminate = parent.find('input[type="checkbox"]:checked').length > 0;
	
			  parent.children('input[type="checkbox"]')
			  .prop("checked", checked)
			  .prop("indeterminate", indeterminate)
			  .siblings('label')
			  .removeClass('custom-checked custom-unchecked custom-indeterminate')
			  .addClass(indeterminate ? 'custom-indeterminate' : (checked ? 'custom-checked' : 'custom-unchecked'));
	
			  checkSiblings(parent, checked);
			} 
			else {
			  $el.parents("li").children('input[type="checkbox"]')
			  .prop({
				  indeterminate: true,
				  checked: false
			  })
			  .siblings('label')
			  .removeClass('custom-checked custom-unchecked custom-indeterminate')
			  .addClass('custom-indeterminate');
			}
		  }
		});
		
		
	function expand() {	
		$('.collapse').collapse('show');
	}
	function collapse() {        	
		$('.collapse').collapse('hide');
	}
	
	</script>
<!-- end -->	
<!-- from plant mapping -->
<style type="text/css">
	* { margin: 0; padding: 0; }
	
	#page-wrap {
	  margin: auto 0;
	}
	
	.treeview {
	  margin: 10px 0 0 20px;
	}
	
	ul { 
	  list-style: none;
	}
	/* insert here */
	/* Unchecked styles */
	
	.treeview .custom-unchecked {
	  background-position: 0 -1px;
	}
	.treeview .custom-unchecked:hover {
	  background-position: 0 -21px;
	}
	
	/* Checked styles */
	
	.treeview .custom-checked { 
	  background-position: 0 -81px;
	}
	.treeview .custom-checked:hover { 
	  background-position: 0 -101px; 
	}
	
	/* Indeterminate styles */
	
	.treeview .custom-indeterminate { 
	  background-position: 0 -141px; 
	}
	.treeview .custom-indeterminate:hover { 
	  background-position: 0 -121px; 
	}
	
	
	
	 i:before {
	  
		font-family: FontAwesome;
		content:"\f068";
		padding-right: 5px;
	}
	 i.collapsed:before {
		
		content:"\f067";
	}
	.treealign{
	padding-left:15px;
	}
	</style>	
<!-- end -->
<script type="text/javascript">
function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}
function isNumberKeyVal(evt, id) {
    try {
        var charCode = (evt.which) ? evt.which : event.keyCode;

        if (charCode == 46) {
            var txt = document.getElementById(id).value;
            if (!(txt.indexOf(".") > -1)) {

                return true;
            }
        }
        if (charCode > 31 && (charCode < 48 || charCode > 57))
            return false;

        return true;
    } catch (w) {
        alert(w);
    }
}
function copy()
{
	document.getElementById('xxx').value = document.getElementById('mcc2').value;
	alert("Material code selected");
	}


function appendUserId(e){
    e.href = e.href + "?id=" + document.getElementById('mcc2').value;
}

function concat() {
    var txtFirstNumberValue = document.getElementById('level1').value;
    var txtSecondNumberValue = document.getElementById('level2').value;
           var txtThirdNumberValue = document.getElementById('level3').value;
           var txtfourthNumberValue = document.getElementById('source').value;


    var result = txtFirstNumberValue+"" +txtSecondNumberValue+""+txtThirdNumberValue+""+txtfourthNumberValue;
    if (!isNaN(result)) 
    {
        document.getElementById('mcc1').value = result;       

        		}
    }

function level1_change(data)
{
	document.getElementById("level1").value = data.value;
	if(data.value ==-1)
		{
		   document.getElementById('mcc2').value = "";

		
		   document.getElementById('level1').value = "";
	   document.getElementById('level2').value = "";
		}
	   document.getElementById('level2').value = "";
		var first=	document.getElementById("mcc1").value;
		if(first.length < 7)
			{
			   document.getElementById('mcc2').value = "";

			}


	concat();

	 var country = $(".abcd").val();
		
	    $.ajax({
			type: "POST",
			url: "level2.jsp",
			data: "materialtype="+country,
			cache: false,
			success: function(response)
	        {
	            $(".pqrs").html(response);
	        }
	    });
}



function level2_change(data)
{
	document.getElementById("level2").value = data.value;
	if(data.value ==-1)
		{
		   document.getElementById('level2').value = "";
		   document.getElementById('level3').value = "";
		   document.getElementById('mcc2').value = "";


		}
	   document.getElementById('level3').value = "";

	concat();

    var state = $(".pqrs").val();
	
	$.ajax({
		type: "POST",
		url: "level3.jsp",
		data: "state_id="+state,
		cache: false,
		success: function(response)
        {
            $(".level3").html(response);
        }
    });
}

function level3_change(data)
{
	document.getElementById("level3").value = data.value;
	if(data.value ==-1)
		{
		   document.getElementById('mcc2').value = "";
		   document.getElementById('level3').value = "";


		}
	concat();


}

function source_change(data)
{
	document.getElementById("source").value = data.value;
	if(data.value ==-1)
		{
		   document.getElementById('mcc2').value = "";
		   document.getElementById('source').value = "";


		}

	concat();

}


function show()
{
	
	document.getElementById("sub").style.display="block";
	document.getElementById("fm1").style.display="none";


	
	}
	
function shows()
{
	document.getElementById("fm1").style.display="block";
	document.getElementById('sub').style.display = 'none';
}

	
	
	
	
	//MDM Code Generate
	var zzz;
    $.ajax({
        url : 'talendcode',
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
    	$("#MDMCode").val(maxi);
    	$("#Meterial").focus()
    	//$("#asd").prop("disabled",true);
    }
    function LaunchS(){    	
    	$( "#BasicView" ).hide();
    	$( "#LaunchScreen" ).show();  
    	$("#Lsearch1").focus()
    }
    function BackFunc(){
    	$( "#BasicView" ).show();
    	$( "#LaunchScreen" ).hide();
    	$( "#rajan" ).hide();
    	
    }
    function Showviewcurrentcode()
    {	
    	 var v=$("#MaterialCodelanch").val();//document.getElementById("mcc1").value; 
    	 
    	    $.ajax({
    			type: "POST",
    			url: "viewcurrentcode.jsp?val="+v,    			
    			cache: false,
    			success: function(response)
    	        {
    	            $("#View").html(response);
    	        }
    	    });
    }
    
    
    function checkv()
    {
   	 var v=$("#MaterialCodelanch").val();//document.getElementById("mcc1").value; 

    	if(v.length<7)
    		{
    		alert("please select all the fields");
    		return false;
    		}
    	if(v.length>=7)
		{
    		Showviewcurrentcode();

		
		}
    		
    		
    	
    }
 function  SearchbyMDM()
    
    {
	 var mmcode=document.getElementById("mcode").value; 

	 $.ajax({
			type: "POST",
			url: "SCR_BasicView2.jsp",    
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
    	  var mattype=document.getElementById("mt").value; 
    	  var stat=document.getElementById("status").value; 
    	  var apvstat=document.getElementById("approvalstatus").value; 
    	  var ver=document.getElementById("version").value; 
    	  var mdmCode=document.getElementById("mcode").value; 
    	    $.ajax({
    			type: "POST",
    			url: "SCR_BasicView.jsp",    
    			data : {
		            "materialtype":mattype,
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
    function  Searchbyblock()
    {
   	 var blk=document.getElementById("block").value; 
	  var mattyp=document.getElementById("mtt").value; 

   	 $.ajax({
   			type: "POST",
   			url: "SCR_BasicView3.jsp",    
   			data : {
   	            "block":blk,
   	            "mattyp":mattyp
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
			url: "CheckerView.jsp",    			
			cache: false,
			success: function(response)
	        {
	            $("#tableView").html(response);
	        }
	    });
    }
    
    //Requried function
    function checkform()
   {
	//$("#Meterial").prop("required",false);
   // $("#MaterialCode").prop("required",false);
    $("#materialgroup1").prop("required",false);	   	
    $("#basicuom").prop("required",false);
    $("#Numerator").prop("required",false); 
    $("#MDMCode").prop("required",false);
  //  $("#Description").prop("required",false);
    $("#AlterNativeUOM").prop("required",false);
    $("#Denominator").prop("required",false);
    $("#GrossWeight").prop("required",false);	   	
    $("#NetWeight").prop("required",false);
    //$("#short").prop("checked",false)
    //$("#short-1").prop("checked",false)
    //$('input[type=checkbox]').prop('checked',false);
   }
   function checkforms()
   {
	   $("#Meterial").prop("required",true);
	   // $("#MaterialCode").prop("required",false);
	   $("#materialgroup1").prop("required",true);
	   $("#Numerator").prop("required",true); 
	   $("#MDMCode").prop("required",true);
	   $("#Description").prop("required",true);
	   $("#basicuom").prop("required",true);
	   $("#AlterNativeUOM").prop("required",true);
	   $("#Denominator").prop("required",true);
	   
   }
 //check material description duplicate
   function checkmaterialdescdup()
   {
   	var materialcodedesc = $("#Description").val();
   	var mattypecode = $("#Meterial").val();
   	//alert(materialcodedesc);
   	//alert(mattypecode);
   	if(materialcodedesc!="" && mattypecode!="")
   	{
   		mattypecode = mattypecode.split("-")[0];
   		$.ajax({
   			'async':false,
   			'type':"POST",
   			url:"checkmatdescdup.jsp",
   			data:{
   				"materialcodedesc":materialcodedesc,
   				"materialtyecode":mattypecode				
   			},
   			cache:false,
   		    headers: {Accept : "application/json;charset=utf-8"},
   		    success:function(data)
   		    {
   		    isDuplicate= data;
   		    }
   		});
   		var json = $.parseJSON(isDuplicate);
   		console.log(json);
   		if(json['isDuplicate']=='yes')
   		{
   		return false;
   		}
   		else
   		{
   		return true;
   		}
   	}
   	else
   	{
   		return true;
   	}
   }

   // check material code duplicate
   function checkmaterialcodedup()
   {
	   //var matcode = document.getElementById("MaterialCode").value;
	   var matcode = $("#MaterialCode").val();
	   if(matcode=!"")
	   	{
		   console.log(matcode);
	   		$.ajax({
	   			'async':false,
	   			'type':"POST",
	   			url:"checkmatcodedup.jsp",
	   			data:{
	   				"materialcode":matcode
	   			},
	   			cache:false,
	   		    headers: {Accept : "application/json;charset=utf-8"},
	   		    success:function(data)
	   		    {
	   		    isDuplicate= data;
	   		    }
	   		});
	   		var json = $.parseJSON(isDuplicate);
	   		console.log(json);
	   		if(json['isDuplicate']=='yes')
	   		{
	   		return false;
	   		}
	   		else
	   		{
	   		return true;
	   		}
	   	}
	   	else
	   	{
	   		return true;
	   	}
	   
   }
   //
   function checkifplantstorageselectedcopy()
   {
   	var result = check1();
   	var result2=$("input:checkbox[name=state]").is(':checked')
   	var result3 = checkmaterialdescdup();
   	//var result4 = checkmaterialcodedup();

   	if($("input:checkbox[name=state]").is(':checked') && result==true && result3==true )
   	{
   		return true;
   	}
   	
       	
   	
       	else if(result==false)
       		{
       		
       		alert("Please select material code")
       		return false;
       		}
   	
       	else if(result2==false)
       		{
       		
       		alert("Please select plant & storage")
       		return false;
       		
       		}
       	else
       	{
			alert("Material Description Already exists!")
       		return false;
       	}
   }
   //
    function checkifplantstorageselected()
    {
    	var result = check1();
    	var result2=$("input:checkbox[name=state]").is(':checked')
    	if($("input:checkbox[name=state]").is(':checked') && result==true )
    	{
    		return true;
    	}
    	
        	
    	
        	else if(result==false)
        		{
        		
        		alert("Please select material code")
        		return false;
        		}
    	
        	else
        		{
        		
        		alert("Please select plant & storage")
        		return false;
        		
        		}
    }
    
//new fields
function volumeunitfunction() { 
	var selected =  $("#VolumeUnitlist option[value='" + $('#VolumeUnit').val() + "']").attr('data-id');	  
	if (typeof(selected) == 'undefined') {
		document.getElementById('volumeunitid').value="";
		}
	 else
		 {
		 document.getElementById('volumeunitid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}
function datalistValidatorvolumeunit(volumeunitvalue) {
	var obj = $("#VolumeUnitlist").find("option[value='" + volumeunitvalue + "']");
	if (obj != null && obj.length > 0) {
			//alert("valid"); // allow form submission
			return true
	}
	//alert("invalid"); // don't allow form submission
	return false;
}
function volumeunitvalue(){
	var mg = $("#VolumeUnit").val();
	if(mg!='')
		{
		
		
	var existingmg = $('h2').text();
	if (datalistValidatorvolumeunit(mg)===false) {
		
		alert(mg + " is not a valid Volume Unit");
		$("#VolumeUnit").val(existingmg).focus();

			return false;
	}		
	else{
		return true;
	}
		}
}
    
    
</script>
<style media="print">
 @page {
  size: auto;
  margin: 0;
       }
</style>
<style>
input::-webkit-calendar-picker-indicator { display: none; }
.optHide{
    visibility: hidden;
    
}

</style>
<script type="text/javascript">

$(document).keydown(function (event) {
    if (event.keyCode == 123) { // Prevent F12
        return false;
    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        return false;
    }
});


</script>
</head>
<body onload="func()" oncontextmenu="return false;">
<div style="overflow: scroll; height : 90%; max-height:600px">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<div id="snackbar">Some text some message..</div>
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<% 
	
//role code 
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
    access=rr.getBasic();
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


pageContext.setAttribute("access",access);

//role code end 

	String code=request.getParameter("id");
	pageContext.setAttribute("mcode", code);	
	//MaterialDAO m = new MaterialDAO();
	//MaterialtypeDAO m =new MaterialtypeDAO();
	Material_Material_Type_DAO m =new Material_Material_Type_DAO();
	UomDAO um =new UomDAO();
	WeightDAO wn =new WeightDAO();	
	VolumeunitDAO VolumeunitDAO = new VolumeunitDAO();
	//Matrial Group DAO
	String id=request.getParameter("materialtype"); 
    MaterialGroupDAO mg = new MaterialGroupDAO();
	try
	{
		List<Volumeunit> VolumeUnitlist =VolumeunitDAO.getvolumeunit();
		request.setAttribute("volumeunitlistvalue", VolumeUnitlist);
		//Matrial Group Code
		List<MaterialGroup> listgp = mg.materialgrouplist(id);
    	request.setAttribute("listgroup",listgp);
		
		List<Material_Material_Type> listm = m.matertialtypelist(rolename);
		//List<Materialtype> listm = m.materiallist(rolename);
		request.setAttribute("listmaterial",listm);		
		
		List<Uom> listu = um.unitlist();
		request.setAttribute("listunits",listu);
		
		List<Weight> listw = wn.weightlist();
		request.setAttribute("listweights",listw);
	
	}
	catch(Exception e)
	{
		
	}
	
%>
<!-- from plant mapping -->
<% 

String mmm=(String)request.getAttribute("plant");
String nnn=(String)request.getAttribute("storage");


String message=null;
String messages=null;

if(mmm !=null && mmm.length()>1 && nnn !=null && nnn.length()>1 )
{

	message = (String)request.getAttribute("plant");
	messages = (String)request.getAttribute("storage");

%>
<script type="text/javascript">
    var msg = "<%=message%>";
    var msgs = "<%=messages%>";

    alert('Storage '+msgs+ ' for plant '+msg+' already exist');
</script>
<%} %>
<%
String abc=(String)request.getAttribute("msg");


String messag=null;

if(abc !=null && abc.length()>1 )
{

	messag = (String)request.getAttribute("msg");

%>
<script type="text/javascript">
    var msgg = "<%=messag%>";

    alert(msgg);
</script>
<%} %>




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

<form action="SCRBasicSave" id="fm1" method="post" onsubmit="">

<c:set var="inn" scope="session" value="${pp}"/>  

<div class="row" style="margin-top:2%;">
<div class="col-md-12" style="padding-left:20px;" id="BasicView">
<div class = "panel panel-primary">
  <div class = "panel-heading">
      <h3 class = "panel-title">Basic & Plant Mapping View</h3>
  </div> 
   <div class = "panel-body">  
   <fieldset class="scheduler-border">
   <legend class="scheduler-border">Basic View</legend> 
   <div class="col-md-6">
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="name">Material Type</label>
      <div class="col-sm-8 input-group">
      <input type="text" tabindex="1" required list="customerList" required class="Materialtypes form-control input-sm input_text" name="materialtype"  id="Meterial" maxlength="50"    placeholder="Material Type"  autocomplete="off" onchange="return Mateialtype();" >
		   <datalist id="customerList">
		   <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.materialtypedesc}" data-id="${c.materialtypecode}"> ${c.materialtypedesc} </option>		             
		        </c:forEach>   
		   </datalist>
		   <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <!-- <option value="${c.description}"><span class="optHide" value="${c.materialtype}"></span></option>  <input type="text" class="form-control input-sm input_text" name="name" id="Meterialtype" value=""  placeholder="Material Type" onkeypress="myFunction(this.value)" onkeyup="myKeyUp()">-->
        <input type="hidden" name="Materialtypesid" id="Materialtypesid" >        
      </div>
    </div>    
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Material Group</label>
      <div class="col-sm-8 input-group">
         <input type="text" tabindex = "2" required list="mg" required class="form-control input-sm"  id="materialgroup1" maxlength="50"  placeholder="Material Group" name="materialgroup1" onfocusout="materialFun();" autocomplete="off"  onchange="return Materialgroup();" /> 
               <!-- <select class="materialgroup dropdowncls" name="materialgroup">
				<option value="-1" >Select</option> 
				</select> -->
		<datalist class="materialcode" id="mg">	
		</datalist>
		<span class="glyphicon glyphicon-search form-control-feedback"></span>
		<input type="hidden" name="materialgroupid" id="materialgroup1id" >
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" id="mtcode" >Material Code</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "4" class="form-control input-sm" required onkeypress="return onlycode(event,this);"  maxlength="40"    id="MaterialCode" name="MaterialCode"  placeholder="Material Code" autocomplete="off">                  
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Basic UOM</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "6" list="BasicUom" autocomplete="off" maxlength="40"  onchange="return basicuoms();" class="form-control input-sm" id="basicuom" placeholder="Basic UOM" onfocus="BasicUOMFun()"  name="basicuom" required>  
        
        <datalist id="BasicUom">
        <c:forEach items="${listunits}" var="uu"> 
            <option value="${uu.text}" data-id="${uu.measureunit}">${uu.text}</option>
        </c:forEach>
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>  
        <input type="hidden" name="basicuomid" id="basicuomid"> 
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Numerator</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "8" class="form-control input-sm" required id="Numerator" placeholder="Numerator" name="Numerator" required autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)" maxlength="5">        
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4 " for="email" id="grwt">Gross Weight</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "10" class="form-control input-sm" id="GrossWeight" placeholder="Gross Weight" name="GrossWeight" autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)" maxlength="13">        
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">HSN Code</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "12" class="form-control input-sm" onkeypress="return isNumber(event)" id="HSNCode" placeholder="HSN Code" name="HSNCode" autocomplete="off" maxlength="16">        
      </div>
    </div>
        <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Volume</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "14" class="form-control input-sm" onkeypress="return isNumber(event)" id="Volume" placeholder="Volume" name="Volume" autocomplete="off" maxlength="13">        
      </div>
    </div>
    
    <!--<div class="form-group ">
      <label class="control-label col-sm-4">Block</label>
      <div class="col-sm-8 input-group">
        <input type="checkbox" class="input-sm" name="block" >        
      </div>
    </div>-->
   </div>
   <div class="col-md-6">
    <div class="form-group">
      <label class="required control-label col-sm-4" for="email"> MDM Material Code</label>
      <div class="col-sm-8 input-group"> 
        <input type="text" tabindex = "-1" class="form-control input-sm sss" required maxlength="30"  readonly id="MDMCode" placeholder="MDM Material Code" name="MDMCode"  autocomplete="off"/>        
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email"> Material Class.Code</label>
      <div class="col-sm-8 input-group">
     <!--  <a href="#" >LaunchScreen</a>--> 
      <input type="button" tabindex = "3" id="asd" class="btn btn-primary" disabled onclick="LaunchS()" value="LaunchScreen">
        <!-- <input type="text" class="form-control input-sm" id="email" placeholder="Material Classification code" name="username"> -->        
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Description</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "5" class="form-control input-sm" id="Description" maxlength="40"  placeholder="Description" name="Description" autocomplete="off" onkeypress="return onlydesc(event,this);" required>        
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Alternative UOM</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex = "7" list="AlterUOM" autocomplete="off" maxlength="40"  onchange="return altuom();" class="form-control input-sm" id="AlterNativeUOM" onfocusout="AlterNativeUOMFun()" placeholder="Alternative UOM" name="AlterNativeUOM" required>
        <datalist id="AlterUOM">
        <c:forEach items="${listunits}" var="uu"> 
            <option value="${uu.text}" data-id="${uu.measureunit}">${uu.text}</option>
        </c:forEach>
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="AlterNativeUOMid" id="mAlterNativeUOMid"  > 
        
      </div>
    </div>    
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Denominator</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex="9" required class="form-control input-sm" id="Denominator" placeholder="Denominator" name="Denominator" required autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)" maxlength="5">        
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email" id="netwt">Net Weight</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex="11" class="form-control input-sm" id="NetWeight" name="NetWeight" placeholder="Net Weight" autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)" maxlength="13" >        
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Unit Weight</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex="13" list="UnitWeightlist" class="form-control input-sm" maxlength="30"  onchange="return unitweight();"id="UnitWeight" name="UnitWeight" placeholder="Unit Weight" onfocusout="UnitFun()" autocomplete="off" >
        <datalist id="UnitWeightlist">
        <c:forEach items="${listweights}" var="wu">
		<option value="${wu.description}" data-id="${wu.unit}" >${wu.description}</option>
		</c:forEach>
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="UnitWeightid" id="UnitWeightid" >        
      </div>
    </div>
    <div class="form-group">
	    <label class="control-label col-sm-4" for ="email">Volume Unit</label>
	    <div class="col-sm-8 input-group">
	    <input type="text" tabindex="15" list ="VolumeUnitlist" class="form-control input-sm input_text" id="VolumeUnit" name="VolumeUnit" onfocusout="volumeunitfunction()" onchange="return volumeunitvalue()" placeholder="Volume Unit" autocomplete="off">
	    <!-- <input type="text" tabindex="15" list ="VolumeUnitlist" class="form-control input-sm input_text" id="VolumeUnit" name="VolumeUnit" onfocusout="VolumeunitFunc()" onchange="return volumeunit();" placeholder="Volume Unit" autocomplete="off">  -->
	    	<datalist id="VolumeUnitlist">
	    	<c:forEach items="${volumeunitlistvalue}" var = "volumeunit">
	    		<option value="${volumeunit.desc}" data-id="${volumeunit.code}">${volumeunit.desc}</option>
	    	</c:forEach>
	    	</datalist>
	    	<span class="glyphicon glyphicon-search form-control-feedback"></span>        
	        <input type="hidden" name="volumeunitid" id="volumeunitid" >
	    </div>     
    </div>	
    <!-- <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Volume Unit</label>
      <div class="col-sm-8 input-group">
        <input type="text" tabindex="15" list="VolumeUnitlist" class="form-control input-sm" maxlength="30" id="VolumeUnit" name="VolumeUnit" placeholder="Volume Unit" autocomplete="off" >
        <datalist id="VolumeUnitlist">
		<option value="ABC" data-id="ABC" >ABC</option>
		<option value="DEF" data-id="DEF" >DEF</option>
		<option value="GHI" data-id="GHI" >GHI</option>
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>
        <input type="hidden" name="volumeunitid" id="volumeunitid" >        
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Reason</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="reason" name="reason" placeholder="Reason" autocomplete="off">        
      </div>
    </div> -->
   </div>
   </fieldset>
   <fieldset class="scheduler-border">
   <legend class="scheduler-border">Plant Mapping View</legend> 
	<div class="col-md-6">
			<div class="form-group">
				<label class="required control-label col-sm-4" for="name">Plant & Storage Location</label>		
				<i class="fa fa-plus" onclick="expand()"> <span class="tooltiptext">Expand all</span></i>
				<i class="fa fa-minus" onclick="collapse()"> <span class="tooltiptext">Collapse all</span></i>
				<div class="col-sm-8  input-group">
					<ul class="treeview" style="overflow:scroll;height: 150px;">
						<%
						Connection con=null;
						PreparedStatement pstmt=null ; 
						ResultSet rs=null;
						ResultSet State=null;
						PreparedStatement ps=null ; 
						try
						{
						con=AuditConnection.getConnection();    
							//create statement
									
							pstmt=con.prepareStatement("select * from \"Plant_Code_Master\""); //sql select query
							rs=pstmt.executeQuery(); //execute query and set in resultset object rs.  
							ps=con.prepareStatement("select * from \"Storage_Loc_Master\""); //sql select query
						State=ps.executeQuery(); //execute quer 
							ArrayList<String> plantcode =new ArrayList<>();
							ArrayList<String> plantdesc =new ArrayList<>();
							
							while(rs.next())
							{
								plantcode.add(rs.getString("PlantCode"));
								plantdesc.add(rs.getString("NameDescription"));
							}
							
							ArrayList<String> plantcod =new ArrayList<>();
							ArrayList<String> storageloc =new ArrayList<>();
							
							ArrayList<String> storagedesc =new ArrayList<>();
							ArrayList<Integer> storageid =new ArrayList<>();

							while(State.next())
							{        	
								plantcod.add(State.getString("Plant"));
								storageloc.add(State.getString("Storagelocation"));
								storagedesc.add(State.getString("DescrOfStorageLoc"));
								storageid.add(State.getInt("Id"));

							}
							for(int i=0;i<plantcode.size();i++)
							{        	
							%>
								
								<li class="last">
								<i  class="fa fa-minus" data-toggle="collapse" data-target="#<%=plantcode.get(i)%>"   aria-expanded="false"></i>
								<input type="checkbox" name="short" id="short"  value="<%=plantcode.get(i)%>">
								<label for="short" class="custom-unchecked"> <%=plantcode.get(i)%></label>
								<ul id="<%=plantcode.get(i)%>" class='collapse in treealign'>
								<%
							for(int j=0;j<storageloc.size();j++){
								if(plantcode.get(i).equals(plantcod.get(j)))	{
											
									%>	
									<li>
										<input type="checkbox" name="state" id="short-1" value="<%=plantcode.get(i)+ "#"+plantdesc.get(i)+"#"+storageloc.get(j)+"#"+storagedesc.get(j)+"#"+storageid.get(j)%>">
										<label for="short-1" class="custom-unchecked"><%=storageloc.get(j)%></label>
									</li>
							<%
								}
							}
							%>

								</ul>
								
								<% 
							}
							State.close();
							State=null;
							ps.close();
							ps=null;

						rs.close();
						rs=null;
						pstmt.close();
						pstmt=null;
							con.close();
							con=null;//close connection
							
						}
					catch(Exception e)
					{
						out.println(e);
					}    
					finally    
					{    	
						AuditConnection.shutdown(rs, pstmt, con);    	
					}
					%>  
        			</li>
					</ul>
				</div>
			</div>
	</div>	
	</fieldset>
   
   <%
   if(rolename!=null && role !=null && access!=null)
   {
   if(rolename.equals(role)  && access.equals("Read"))
    {
   %>
    <div class="col-md-1 col-md-offset-8"><input type="submit"  class="btn btn-primary form-control disabled" name="Save"  value="Save" onclick="SaveFunc()"/></div>
    <div class="col-md-1"><button type="submit"  class="btn btn-primary disabled" name="Submit" id="submit" value="Submit">Submit </button> </div>

    <div class="col-md-1"><a href="Basic_Plant_Mapping_View.jsp"  class="btn btn-primary form-control disabled">Clear</a></div>
    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal" >Edit</button></div>
   
   <%   
   }
   else
   {
   %>
     <div class="col-md-1 col-md-offset-8"><input type="submit" name="Save" id="save" class="btn btn-primary form-control"  value="Save" onclick="return (checkifplantstorageselectedcopy() && checkform())"/></div>
     <div class="col-md-1"><button type="submit" onclick="return(checkifplantstorageselectedcopy() && check())" class="btn btn-primary" name="Submit" id="submit" value="Submit">Submit </button> </div>
     <div class="col-md-1"><a href="Basic_Plant_Mapping_View.jsp"  class="btn btn-primary form-control">Clear</a></div>
     <div class="col-md-1"> <button type="button"  class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
   <%}}%>
   </div>
</div>
</div>

<!-- Script -->
<%
SourceDAO s = new SourceDAO();
Level1DAO l1d=new Level1DAO();
try
{
	List<Level1> listl1 =l1d.maingrouplist();
	request.setAttribute("maingroup",listl1);
	
	List<Source> listl2 =s.itemlist();
	request.setAttribute("listsource",listl2);
	
}


catch(Exception e)
{
	
}
%>




<script type="text/javascript">
	
   
    function SourceCodeFunc(){
		var selected =  $("#LsearchList4 option[value='" + $('#Lsearch4').val() + "']").attr('data-id');	
		var txt=$("#Source").val(selected);		
		ConcatFunc();
	}
	function ConcatFunc(){
		var txtFirstNumberValue =$("#Level1").val(); //document.getElementById('level1').value;
	    var txtSecondNumberValue =$("#Level2").val();// document.getElementById('level2').value;
	    var txtThirdNumberValue =$("#Level3").val(); //document.getElementById('level3').value;
	    var txtfourthNumberValue = $("#Source").val();//document.getElementById('source').value
	    var result = txtFirstNumberValue+"" +txtSecondNumberValue+""+txtThirdNumberValue+""+txtfourthNumberValue;
	    if (!isNaN(result)) 
	    {
	    	$("#MaterialCodelanch").val(result) ;// document.getElementById('mcc1').value = result;       

	    }
	}
	//Materail code Generate
	var sss;
    $.ajax({
        url : 'sample',
        dataType: 'json',
        'async': false,
        success : function(json) 
        {        	
        	sss=json;        	
        	change();
        }
    });
   
    
	function change()	
	{	//console.log(sss);
		var first=$("#MaterialCodelanch").val();
		
		if (sss!='')
			{
				console.log("true");
					//document.getElementById("mcc1").value;
				var codearray=sss.slice();
			    var seven = codearray.map(myFunc);//first seven digit lengths 
				
			    function myFunc(value, index, array) {
					  return value.substring(0,7);
					}
				
				//from here change required
				var filter=[];
				for (var i = 0; i < codearray.length; i++)
				{
				  	if (codearray[i].substring(0,7) == first) {
					  filter.push(codearray[i]); 	  
					  }
				}
		     	var four = filter.map(myFun);//last four digit
				function myFun(value, index, array)
		     	{
				  return value.substring(7,13);
				}
				var result=[];
				for (var i=0,l=four.length;i<l;i++) result.push(+four[i]);
				if(first.length==7)
				{	   
					if(seven.includes(first))
					{
						console.log("true");
					 	var maxi= Math.max.apply(Math, result);
					    maxi=maxi+1;				
						var maxoflast=""+maxi;
						var pad = "00000"
						var ans = pad.substring(0, pad.length - maxoflast.length) + maxoflast 
						$("#MCode").val(first+ans);
					}
					else
					{			
					$("#MCode").val(first+"00001");			
					}
				}
			}
		else{
			$("#MCode").val(first+"00001");	
			}
		
  }
	
	function getInfo(){  
		if(request.readyState==4)
		{  
			var val=request.responseText;  
			document.getElementById('rajan').innerHTML=val;  
		}  
	}  
	
	
	
	
	// serach list validation
	function datalistValidatorlevel1(modelname) {
		var obj = $("#LsearchList1").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function datalistValidatorlevel2(modelname) {
		var obj = $("#LsearchList2").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function datalistValidatorlevel3(modelname) {
		var obj = $("#LsearchList3").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}
	function datalistValidatorsource(modelname) {
		var obj = $("#LsearchList4").find("option[value='" + modelname + "']");
		if (obj != null && obj.length > 0) {
				//alert("valid"); // allow form submission
				return true
		}
		//alert("invalid"); // don't allow form submission
		return false;
	}

	function level1c(){
		var mg = $("#Lsearch1").val();
		var existingmg = $('h2').text();
		if (datalistValidatorlevel1(mg)===false) {
			
			alert(mg + " is not a valid Level1");
			$("#Lsearch1").val(existingmg).focus();

				return false;
		}		
		else{
			return true;
		}
	}

	function level2c(){
		var mg = $("#Lsearch2").val();
		var existingmg = $('h2').text();
		if (datalistValidatorlevel2(mg)===false) {
			
			alert(mg + " is not a valid Level2");
			$("#Lsearch2").val(existingmg).focus();

				return false;
		}		
		else{
			return true;
		}
	}
	function level3c(){
		var mg = $("#Lsearch3").val();
		var existingmg = $('h2').text();
		if (datalistValidatorlevel3(mg)===false) {
			
			alert(mg + " is not a valid Level3");
			$("#Lsearch3").val(existingmg).focus();

				return false;
		}		
		else{
			return true;
		}
	}
	function sourcec(){
		var mg = $("#Lsearch4").val();
		var existingmg = $('h2').text();
		if (datalistValidatorsource(mg)===false) {
			
			alert(mg + " is not a valid Source indicator");
			$("#Lsearch4").val(existingmg).focus();

				return false;
		}		
		else{
			return true;
		}
	}
	
	
	
	
	
</script>



<!-- Lanuch Screen Design -->
<div class="col-md-12" style="padding-left:20px; display:none;" id="LaunchScreen">
<div class = "panel panel-primary">
   <div class = "panel-heading">
      <h3 class = "panel-title">Launch screen</h3>
   </div>   
   <div class = "panel-body">   
      <div class="col-md-6">
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="name">Level1</label>
      <div class="col-sm-8 input-group">
      <input type="text" class="Materialtypes form-control input-sm input_text" readonly name="Level1"  id="Level1"   autocomplete="off">		    
      </div>
    </div>    
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Level2</label>
      <div class="col-sm-8 input-group">
         <input type="text" class="form-control input-sm"  id="Level2" readonly onchange="return level2c();" name="Level2" autocomplete="off"> 
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Level3</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="Level3" readonly name="Level3" onchange="return level3c();" autocomplete="off" >                  
      </div>
    </div>
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Source</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="Source" readonly name="Source"  autocomplete="off" >   
      </div>
    </div>  
    <div class="form-group ">
      <label class="required control-label col-sm-4" for="email">Material Class.Code</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="MaterialCodelanch" readonly name="MaterialCodelanch"  autocomplete="off" >        
      </div>
    </div>  
   </div>
   
   <div class="col-md-6">
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group"> 
        <input type="text" list="LsearchList1" class="form-control input-sm" id="Lsearch1" name="Lsearch1" autocomplete="off"  onchange="return level1c();">
        <datalist id="LsearchList1">
        <c:forEach items="${maingroup}" var="mg">  
            <option value="${mg.description}" data-id="${mg.logic}">${mg.description}</option>
        </c:forEach>
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="LsearchList1id" id="LsearchListid" >   
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
       <input type="text" list="LsearchList2" class="form-control input-sm" id="Lsearch2" name="Lsearch2" onchange="return level2c();" autocomplete="off">
        <datalist id="LsearchList2">        
        </datalist>
        <span class="glyphicon glyphicon-search form-control-feedback"></span>     
        <input type="hidden" name="LsearchList1id" id="LsearchListid" >         
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
         <input type="text" list="LsearchList3" class="form-control input-sm" id="Lsearch3" onchange="return level3c();" name="Lsearch3" autocomplete="off">
        <datalist id="LsearchList3">        
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="LsearchList3id" id="LsearchList3id" >         
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
         <input type="text" list="LsearchList4" class="form-control input-sm" id="Lsearch4" onchange="return  sourcec();" name="Lsearch4" autocomplete="off">
        <datalist id="LsearchList4">        
 		 <c:forEach items="${listsource}" var="so"> 
            <option value="${so.item}" data-id="${so.id}">${so.item}</option>
        </c:forEach>
 
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="LsearchList4id" id="LsearchList4id" > 
      </div>
    </div>    
    <div class="form-group">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="MCode" readonly name="MCode" autocomplete="off">        
      </div>
    </div>
   </div>
   <div class="col-md-2 col-md-offset-7"><input type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#yourModal" onclick="checkv()" value="View Current Code" /></div>
   <div class="col-md-1"><input type="button" class="btn btn-primary form-control"  value="Select" onclick="selectFunc()"/></div>
   <div class="col-md-1"> <input type="button" class="btn btn-primary form-control"  value="Back" onclick="BackFunc()"/></div>
     <div class="col-md-1"> <input type="button" class="btn btn-primary form-control"  value="Clear" onclick="LanuchScreenClr()"/></div>
     
       
   </div>
</div>`	
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
      <div style="border: 1px solid #DCDCDC; margin-top: 20px;margin-bottom: 5px">
      <label >Material Type</label>
      <select id="mtt" >
  
  
  <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.materialtypecode}" > ${c.materialtypedesc} </option>		             
		        </c:forEach>   
 
</select>
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
        <button type="button" onclick="javascript:window.location='Basic_Plant_Mapping_View.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
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


</script>



<div id="yourModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 70%;">

    <!-- Modal content-->
    <div class="modal-content">
   
      <div class="modal-body">
        <span id="View">
        </span>
      </div>
      <div class="modal-footer">
        <button type="button"  class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<div class="col-md-12">
<span id="rajan"> </span>  
</div>



<!-- Launch Screen Scripts for level2  -->
<script type="text/javascript">
function hide() {
	  document.getElementById('data').style.display = 'none';
	}

//$(".modal").on("hidden.bs.modal", function () {
  //  window.location = "Basic_Plant_Mapping_View.jsp";
//});
	//Scrap code generate
function LanuchScreenClr(){
	 $("#Lsearch1").val('');
	 $("#Lsearch2").val('');
	 $("#Lsearch3").val('');
	 $("#Lsearch4").val('');
	 $("#Lsearch5").val('');
	 $("#MCode").val('');
	 $("#Level1").val('');
	 $("#Level2").val('');
	 $("#Level3").val('');
	 $("#Source").val('');
	 $("#MaterialCodelanch").val('');
	}

 function selectFunc(){
	 if($("#MCode").val()!=''){		 
		 var mDcode=$("#MCode").val();
		 $("#MaterialCode").val(mDcode);
		 alert("MaterialCode Selected");
	 }
 }
</script>
<!-- from plant mapping-->
<script src="js/hummingbird-treeview.js"></script>
<script>
$("#treeview").hummingbird();
$( "#checkAll" ).click(function() {
  $("#treeview").hummingbird("checkAll");
  
});
$( "#uncheckAll" ).click(function() {
  $("#treeview").hummingbird("uncheckAll");
});
$( "#collapseAll" ).click(function() {
  $("#treeview").hummingbird("collapseAll");
});
$( "#checkNode" ).click(function() {
  $("#treeview").hummingbird("checkNode",{attr:"id",name: "node-0-2-2",expandParents:false});
});
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!-- end -->
</form>
</div>
</body>
</html>