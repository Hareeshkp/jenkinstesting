<%@page import="com.tvs.userconsole.Material_Material_Type"%>
<%@page import="com.tvs.userconsole.Material_Material_Type_DAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="java.sql.*"%>
        <%@page import="com.tvs.userconsole.RoleDAO"%>
<%@page import="com.tvs.userconsole.UserDAO"%>
<%@page import="com.tvs.userconsole.User"%>
<%@page import="com.tvs.userconsole.Role"%>
<%@ page import="com.tvs.scrbasic.Material" %>
<%@ page import="com.tvs.scrbasic.MaterialDAO" %>
<%@ page import="com.tvs.scrbasic.Uom" %>
<%@ page import="com.tvs.scrbasic.UomDAO" %>
<%@ page import="com.tvs.scrbasic.Weight" %>
<%@page import="com.tvs.scrbasic.SRCBasicDAO"%>
<%@page import="com.tvs.scrbasic.SCRBasic"%>
<%@ page import="com.tvs.scrbasic.WeightDAO" %>
<%@ page import="com.tvs.subscr.Source" %>
<%@ page import="com.tvs.subscr.SourceDAO" %>
<%@ page import="com.tvs.subscr.Level1DAO" %>
<%@ page import="com.tvs.subscr.Level1" %>
<%@ page import="com.google.gson.Gson" %>
<%@page import="com.tvs.talendcodes.TalendcodesDAO"%>
<%@page import="com.tvs.talendcodes.Talendcodes"%>
<%@page import="com.tvs.scrbasic.Volumeunit"%>
<%@page import="com.tvs.scrbasic.VolumeunitDAO"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page import="com.tvs.plantmapping.Storages"%>
<%@page import="com.tvs.plantmapping.Plant"%> 
<%@page import="com.tvs.dbconnection.AuditConnection"%>

    
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SCR-BASIC</title>
  <link rel="stylesheet" href="css/form.css">  
<script type="text/javascript" src="js/Customjs.js"></script>

<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.css">
<link rel="stylesheet" href="./bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="./bower_components/font-awesome/css/font-awesome.min.css">

<script src="./bower_components/jquery/dist/jquery.min.js"></script>
<script src="./bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="./bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="./bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- Tree Node -->
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link href="https://bootswatch.com/cosmo/bootstrap.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- from plant mapping edit -->
<style type="text/css">
.input-sm {
    height: 30px !important;    
}
input::-webkit-calendar-picker-indicator { display: none; }
</style>

<style type="text/css">
btn,.btn-primary, .btn-primary:hover, .btn-primary:active, .btn-primary:visited {
    background-color: #1151AA !important;
}
</style>
<!-- From plant mapping edit -->
<style>
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

<!-- end -->
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

//function isNumber(evt) {
  //  evt = (evt) ? evt : window.event;
   // var charCode = (evt.which) ? evt.which : evt.keyCode;
    //if (charCode > 31 && (charCode < 48 || charCode > 57)) {
      //  return false;
    //}
    //return true;
//}
function isNumber(evt)
{
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode != 46 && charCode > 31 
      && (charCode < 48 || charCode > 57))
       return false;

    return true;
}
function checkform()
{
	$("#Meterial").prop("required",false);
 $("#MaterialCode").prop("required",false);
 $("#materialgroup1").prop("required",false);	   	
 $("#basicuom").prop("required",false);
 $("#Numerator").prop("required",false); 
 $("#MDMCode").prop("required",false);
 $("#Description").prop("required",false);
 $("#AlterNativeUOM").prop("required",false);
 $("#Denominator").prop("required",false);
 $("#GrossWeight").prop("required",false);	   	
 $("#NetWeight").prop("required",false);
}

function check()
{
	checkforms()
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
function checkforms()
{
	   $("#Meterial").prop("required",true);
	   // $("#MaterialCode").prop("required",false);
	   $("#materialgroup1").prop("required",true);
	   $("#Numerator").prop("required",true); 
	   $("#MDMCode").prop("required",true);
	   $("#Description").prop("required",true);
	   $("#AlterNativeUOM").prop("required",true);
	   $("#Denominator").prop("required",true);
	   
}




function checkifplantstorageselected()
{
	if($("input:checkbox[name=state]").is(':checked'))
	{
		return true;
	}
	else
	{
		//console.log("saranrajkumar");
		//console.log($("input:checkbox[name=state]").is(':checked'))
		//console.log($('input[name=normal]').prop(':checked').val());
		alert("please select plant&storage");
		return false;
	}    	
}


//from plant mapping edit
$(document).ready(function(){
	  $('.collapse').collapse('hide');
	 
	});
    $(function() {

$('input[type="checkbox"]').on('change',checkboxChanged);

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

  console.log(checked);
  console.log(container);
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
      console.log("if");
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
      console.log("elseif");
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
        console.log("else");
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

// ----- end ------

$(document).ready(function() {
    	
	
	$('#Description').keyup(function(){
	    this.value = this.value.toUpperCase();
	});
	
	//Material Type
		$("input[name=materialtype]").on('change',function(){ 
		
		var selected =  $("#customerList option[value='" + $('#Meterial').val() + "']").attr('data-id');		  
		
		 $("#materialgroup1").val('');

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
		    else
		    {
		    	$("#MaterialCode").prop("required",false);	
		    	$("#asd").prop("disabled",true);
		    	$("#MaterialCode").prop("value",'');	
		    	$("#MaterialCode").prop("readonly",true);
		    	
		    	
		    }
		    
		    if(Materialtypesid =="ZFG" || Materialtypesid =="ZSFG" || Materialtypesid =="ZROH" ){
		    	//alert(Materialtypesid);
		    	$("#GrossWeight").prop("disabled",false);
		    	$("#NetWeight").prop("disabled",false);	
		    	$("grwt").addClass("required");
		    	$("netwt").addClass("required");		    	
		    	//$("#grwt").removeClass("mandatory");
		    	//$("#netwt").removeClass("mandatory");
		    }
		    else{
		    	$("#GrossWeight").prop("disabled",true);
		    	$("#NetWeight").prop("disabled",true);
		    	$("#gewt").removeClass("required");
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
<!-- from plant mapping edit-->
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
<script type="text/javascript">

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
	var mg = $("#materialgroup1").val();
	if(mg!='')
		{
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
}

function Materialtype(){
	var mt = $("#Meterial").val();
	if(mt!='')
		{
		
		
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

function materialFun()
{
	var selected =  $("#mg option[value='" + $('#materialgroup1').val() + "']").attr('data-id');		  
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('materialgroup1id').value="";

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
	
	
		if(mg!='')
			{
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
}





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
    function hide() {
  	  document.getElementById('data').style.display = 'none';
  	}
    $(".modal").on("hidden.bs.modal", function () {
        window.location = "SCR_Basic.jsp";
    });
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
    
</script>

<script type="text/javascript">
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
$(document).ready(function() {
	$("#asd").prop("disabled",true);

	//UnitWeight
	$("input[name=UnitWeight]").on('change',function(){
		 var selected =  $("#UnitWeightlist option[value='" + $('#UnitWeight').val() + "']").attr('data-id');	
		 var ss= document.getElementById('UnitWeightid').value =selected;
		 
	});
	
	
})
// lanunch Screen
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
 
 
 function mattype()
 {
	 var selected =  $("#customerList option[value='" + $('#Meterial').val() + "']").attr('data-id');		  
	  
	 	  if (typeof(selected) == 'undefined') {
			 document.getElementById('Materialtypesid').value="";
			}
		 else
			 {
			 document.getElementById('Materialtypesid').value =selected;//$('#materialgroupid').val("ssss");
			 var abc=selected;
			 
			 var Materialtypesid=abc;
		    	var abbc= document.getElementById("clr").value;

			 if( Materialtypesid =="ZCP1" ){
			    	
			    	$("#asd").prop("disabled",true);
			    	$("#MaterialCode").prop("required",true);			    	
			    	$("#MaterialCode").prop("readonly",true);
			    	$("#mtcode").addClass("required");		    				    	
			    
			    }
			    else if(Materialtypesid =="ZFG" || Materialtypesid =="ZPRT" || Materialtypesid =="ZROH" || Materialtypesid=="ZSFG"){
			    	$("#asd").prop("disabled",true);
			    	$("#GrossWeight").prop("required",true);	
			    	$("#NetWeight").prop("required",true);
			    	$("#MaterialCode").prop("required",true);
			    	$("#mtcode").addClass("required");		    				    				    	
			    	if(abbc=="Active")
			    		{
				    	$("#MaterialCode").prop("readonly",true);

			    		}
			    	else
			    		{
				    	$("#MaterialCode").prop("readonly",true);

			    		}
			    	var abc= document.getElementById("clr").value;

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
			    	//$("#MaterialCode").prop("value",'');	
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
			    	//$("#grwt").addClass("mandatory");
			    	//$("#netwt").addClass("mandatory");
			    	$("#grwt").removeClass("required");
			    	$("#netwt").removeClass("required");
			    }
			    
			 
			  var asdbc=  document.getElementById('Materialtypesid').value
			
			 $.ajax({
					type: "POST",
					url: "materialgroup.jsp",
					data: "materialtype="+asdbc,
					cache: false,
					success: function(data)
			        {
						
						
			           $(".materialcode").html($.trim(data));		            
			        }
			    });
			 }
	 
 }
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

 
 function calc()
 {
   if (document.getElementById('block').checked) 
   {
       document.getElementById('block').value = true;
	   	$("#reason").prop("required",true);
		   $("#reason").prop("readonly",false);

       
   } 
   else
	   {
	   	$("#reason").prop("required",false);
		   $("#reason").prop("readonly",true);
	    	$("#reason").val('');


	   }
 }
 
//



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

function Showviewcurrentcode()
{	
	 var v=$("#MaterialCodelanch").val();//document.getElementById("mcc1").value; 
	 
	    $.ajax({
			type: "POST",
			url: "viewcurrentcode.jsp?val="+v,    			
			cache: false,
			success: function(response)
	        {
	            $("#tableView").html(response);
	        }
	    });
}


function checkv()
{
	 var v=$("#MaterialCodelanch").val();//document.getElementById("mcc1").value; 

	if(v.length<7)
		{
		alert("please select all the feild");
		return false;
		}
	else
		{
		Showviewcurrentcode();
		}
	
}
//new fields
function LoadVolumeUnit() {
	  var selected =  $("#VolumeUnitlist option[value='" + $('#VolumeUnit').val() + "']").attr('data-id');	  
	
	 
	 if (typeof(selected) == 'undefined') {
		 document.getElementById('volumeunitid').value="";

		}
	 else
		 {
		 document.getElementById('volumeunitid').value =selected;//$('#materialgroupid').val("ssss");

		 }
}

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



/* function check()
{
		   
		        
		        	var matcode = document.getElementById("MaterialCode").value;
		        	var mat = document.getElementById("Meterial").value;
		       		 if (mat =='Capital Goods')
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
	    
	  } */
</script>


</head>

 
<body onload="Chkboxcalc();UnitFun();AlterNativeUOMFun();BasicUOMFun();mattype();volumeunitfunction();" oncontextmenu="return false;" >
<div style="overflow: scroll; height : 90%; max-height:600px">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>


	<% 
	String userid =(String) request.getAttribute("myTest");
	
	String role=null;
	String rolename=null;
	String access=null;
	//String mattype = null;
	if(userid!=null)
	{
		User uu =UserDAO.getUsernameRoleByUserId(userid);
		 role= uu.getRolename();//rolename in user table
		Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
		 rolename=rr.getRole();
	     access=rr.getBasic();
	     //from plant mapping edit
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
	//MaterialDAO m = new MaterialDAO();
	//from plant mapping edit
	TalendcodesDAO td =new TalendcodesDAO();
	// ----------- end -----
	Material_Material_Type_DAO m =new Material_Material_Type_DAO();
	//MaterialtypeDAO m =new MaterialtypeDAO();
	UomDAO um =new UomDAO();
	WeightDAO wn =new WeightDAO();
	Integer sid=Integer.parseInt(request.getParameter("id"));  
	SCRBasic r =SRCBasicDAO.getSCRBasicByTalendcode(sid);
	Integer talendcode=r.getTalendcode();
	String mt=r.getMaterialtype();
	String mtdesc=r.getMaterialtypedesc();//	
	String mg=r.getMaterialgroup();
	String mgdesc=r.getMaterialgroupdesc();//
	String mc=r.getMaterialcode();//	
	String desc=r.getDescription();		
	String bu=r.getBasicuom();
	String budesc=r.getBasicuomdesc();
	String Alteruom=r.getAltuom();//
	String AlterUomdesc=r.getAltuomdesc();	
	Float numerator=r.getNumerator();
	Float denominator=r.getDenominator();	
	Float gross=r.getGross();
	Float net=r.getNet();
	String hsn=r.getHsncode();
	String Unweight=r.getUnitweight();	
	String Unitdesc=r.getUnitweightdesc();
	String reason=r.getReason();
	String reasonedit=r.getReasonforedit();
	Boolean blck=r.getBlock();	
	String status=r.getStatus();
	String appstus=r.getApprovalstatus();
	//newly added fields
	System.out.println("zzzzzzzzzzzzzzzzzzz");
	System.out.println(r.getVolumeUnit());
	pageContext.setAttribute("volume",r.getVolume());
	//pageContext.setAttribute("volumeunit",r.getVolumeUnit());
	pageContext.setAttribute("volumeunit",r.getvolumeunitdesc());
	// ------------- end -------
	pageContext.setAttribute("talendcode",talendcode);
	pageContext.setAttribute("Unweight",Unweight);
	pageContext.setAttribute("Unitdesc",Unitdesc);
	pageContext.setAttribute("reason",reason);
	pageContext.setAttribute("status",status);
	pageContext.setAttribute("mt",mt);
	pageContext.setAttribute("mtdesc", mtdesc);
	
	pageContext.setAttribute("mg",mg,PageContext.SESSION_SCOPE);
	pageContext.setAttribute("mgdesc", mgdesc);
	
	pageContext.setAttribute("mc", mc);
	pageContext.setAttribute("bu", bu);
	pageContext.setAttribute("budesc",budesc);
	
	pageContext.setAttribute("numerator",numerator);
	pageContext.setAttribute("hsn",hsn);

	pageContext.setAttribute("gross",gross);
	pageContext.setAttribute("blck",blck);
	pageContext.setAttribute("reasonedit",reasonedit);
	pageContext.setAttribute("desc",desc);
	pageContext.setAttribute("Alteruom", Alteruom);
	pageContext.setAttribute("AlterUomdesc",AlterUomdesc);
	pageContext.setAttribute("denominator",denominator);
	
	pageContext.setAttribute("net",net);
	
	pageContext.setAttribute("appstus", appstus);
	pageContext.setAttribute("status", status);
	// from plant mapping edit
	Plant pp=new Plant();
	Storages s1= new Storages();
	List<String> list1=pp.plantlist(sid);
	List<Integer> list2=s1.storagelist(sid);	
	// -- end --




try
{
//List<Materialtype> listm = m.materiallist(rolename);
//request.setAttribute("listmaterial",listm);


List<Material_Material_Type> listm = m.matertialtypelist(rolename);
request.setAttribute("listmaterial",listm);


List<Uom> listu = um.unitlist();
request.setAttribute("listunits",listu);

List<Weight> listw = wn.weightlist();
request.setAttribute("listweights",listw);

VolumeunitDAO VolumeunitDAO = new VolumeunitDAO();
List<Volumeunit> volumeunitlistvalue =VolumeunitDAO.getvolumeunit();
request.setAttribute("volumeunitlistvalue", volumeunitlistvalue);

/* if(mattype.equals("None"))
{
	List<Talendcodes> listtd =td.plantmapplist();
	request.setAttribute("listtd",listtd);
}

else
{
	List<Talendcodes> listtd =td.plantmapplist(mattype);
	request.setAttribute("listtd",listtd);			
}
 */

}
catch(Exception e)
{
	
}

%>
<c:set var="search" value='"' />
<c:set var="replace" value='\\"' />

<form action="ScrbasicPlantDraft" id="fm1" method="post">
 <script type="text/javascript">
 
 
 function Chkboxcalc()
 {	
	
   if (document.getElementById('block').value=="true") 
   {   $('#block').prop('checked', true);
   }
   
   var Materialtypesid=$('#Meterial').val();
  
   if(Materialtypesid=="Capital Goods"){
	   
	   <%
	   if(rolename!=null && role !=null && access!=null){
	   if(rolename.equals(role)  && access.equals("Read"))
	    {   
	   %>	
	   
	   $("#asd").prop("disabled",true);
	   <% }
	   
	   else
	   {
		   
	   
	   %>
	   
	   $("#asd").prop("disabled",false);

	   <% 
	   }}
	   %>
	   
	   
   }
   else{
	   $("#asd").prop("disabled",true);
   }
   
   
   
   
   if( Materialtypesid=="Finished Product" || Materialtypesid=="Semi Finished" ||Materialtypesid=="Raw materials"){
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
    console.log("else");
   	//$("#grwt").addClass("mandatory");
   	//$("#netwt").addClass("mandatory");
  	$("#grwt").removeClass("required");
	$("#netwt").removeClass("required");
   }
   var qqq="<%=status%>";
   document.getElementById("clr").value=qqq;

   
 }
 
 

 function abc()
 {
	 
 var clr="<%=status%>";
 var appstus="<%=appstus%>";
 console.log(appstus);
 if(clr=='Draft')
	 {
	 console.log("asdf");
	 draftClr();
	 }
 else
	 {
	
	 activclr();
	 }
 if(appstus=='Rejected'){
	 draftClr();
 }
 }
 

 
 $('html').bind('keypress', function(e)
			{
			   if(e.keyCode == 13)
			   {
			      return false;
			   }
			});
 function draftClr()
 {
	 //for plant mapping
	 $("label").removeClass("custom-checked");		
	 $('label').prop('checked', false);
	 $('#short').prop('checked', false);
	 $('#short-1').prop('checked', false);
	 $('.checkboxLabel').prop('checked', false);
	 // --- end --
	 $("#materialgroup1").val('');
	
	 $("#basicuom").val('');
	 $("#Numerator").val('');
	 $("#GrossWeight").val('');
	 $("#HSNCode").val('');
	   	$("#asd").prop("disabled",true);

	
	 $("#AlterNativeUOM").val('');
	 $("#Denominator").val('');
	 $("#NetWeight").val('');
	 $("#UnitWeight").val(''); 
	 $("#Volume").val('');
	 $("#VolumeUnit").val('');
 }
 
 function activclr()
 {
	 //for plant mapping
	 $("label").removeClass("custom-checked");		
	 $('label').prop('checked', false);
	 $('#short').prop('checked', false);
	 $('#short-1').prop('checked', false);
	 // --- end --
	 $("#GrossWeight").val('');
	 $("#NetWeight").val('');
	 $("#UnitWeight").val('');
	 $("#reason").val('');

	 $("#reasonforedit").val('');
	 $("#Volume").val('');
	 $("#VolumeUnit").val('');
	 document.getElementById("id").style.display = "none";
     document.getElementById('block').value = false;
     document.getElementById('block').checked=false;

 }
 //new fields
 
 </script>
<input type="hidden" name="clr" id="clr" >       
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
	      <label class="required control-label col-sm-4" for="name">Material Type:</label>
	      <div class="col-sm-8 input-group">
	      <input type="text" tabindex="-1" list="customerList" readonly maxlength="50" required class="Materialtypes form-control input-sm input_text" name="materialtype"  id="Meterial" value="${mtdesc }"  onchange="return Materialtype();" placeholder="Material Type" 
	       <c:if test="${status eq 'Active' }"> readonly </c:if>
	      >
			   <datalist id="customerList">
			  <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.materialtypedesc}" data-id="${c.materialtypecode}"> ${c.materialtypedesc} </option>		             
		        </c:forEach>  
			   </datalist>  
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>      
	        <input type="hidden" name="Materialtypesid" id="Materialtypesid" >        
	      </div>
    	</div> 
    	<div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">Material Group</label>
	      <div class="col-sm-8 input-group">
	         <input type="text" tabindex="1" list="mg" value="${mgdesc}" class="form-control input-sm" maxlength="50"  required   id="materialgroup1" placeholder="Material Group" name="materialgroup1"  onfocusout="materialFun()"    onchange="return Materialgroup();" autocomplete="off"  
	         <c:if test="${status eq 'Active' }"> readonly </c:if>
	         >     
			<datalist class="materialcode" id="mg">	
			</datalist>
			<span class="glyphicon glyphicon-search form-control-feedback"></span>
			<input type="hidden" name="materialgroupid" value ="${mg}" 

			    id="materialgroup1id" >
	      </div>
    	</div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" id="mtcode" for="email">Material Code</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="3" class="materialcode form-control input-sm" onkeypress="return isNumber(event)" maxlength="40"   value="${mc }" id="MaterialCode" name="MaterialCode"  placeholder="Material Code" autocomplete="off" 
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >                  
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">Basic UOM</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="5" list="BasicUom" class="form-control input-sm" maxlength="40"  value="${budesc }" id="basicuom" placeholder="Basic UOM" name="basicuom" onchange="return basicuoms();" onfocusout="BasicUOMFun()"
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        required >  
	        
	        <datalist id="BasicUom">
	        <c:forEach items="${listunits}" var="uu"> 
	            <option value="${uu.text}" data-id="${uu.measureunit}">${uu.text}</option>
	        </c:forEach>
	        </datalist>    
	        <span class="glyphicon glyphicon-search form-control-feedback"></span>
	        <input type="hidden" name="basicuomid" id="basicuomid" > 
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">Numerator</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="7" class="form-control input-sm" 
	        
	        <c:choose>
        <c:when test="${numerator==null || numerator==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${numerator}"
        </c:otherwise> 
    </c:choose>
	        
	         id="Numerator" placeholder="Numerator" name="Numerator" maxlength="5"  autocomplete="off" required onkeypress="return isNumberKeyVal(event,this.id)"
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="control-label col-sm-4" for="email" id="grwt">Gross Weight</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="9" class="form-control input-sm" id="GrossWeight" 
	        
	        
	          <c:choose>
        <c:when test="${gross==null || gross==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${gross}"
        </c:otherwise> 
    </c:choose>
	         placeholder="Gross Weight" name="GrossWeight" autocomplete="off" required onkeypress="return isNumberKeyVal(event,this.id)" maxlength="10"
	       
	        >        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="control-label col-sm-4" for="email">HSN Code</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="11" class="form-control input-sm" onkeypress="return isNumber(event)" value="${hsn}" maxlength="16"  id="HSNCode"  placeholder="HSN Code" name="HSNCode" autocomplete="off" 
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div>
	     <div class="form-group ">
	      <label class="control-label col-sm-4" for="email">Volume</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="13" class="form-control input-sm" value="${volume}" maxlength="16"  id="Volume"  placeholder="Volume" name="Volume" autocomplete="off" 
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div>
	    <div class="form-group " <c:if test="${status eq 'Draft'}"> style='display:none;' </c:if> <c:if test="${appstus eq 'Rejected'}"> style='display:none;' </c:if>
	    >
	     
	      <label class="control-label col-sm-4">Block</label>
	      <div class="col-sm-8 input-group">
	        <input type="checkbox" tabindex="15" class="input-sm" name="block" value="${blck}" id="block"  onclick="calc();">        
	      </div>
	    </div>
	    <div class="form-group " <c:if test="${status eq 'Draft'}"> style='display:none;' </c:if> <c:if test="${appstus eq 'Rejected'}"> style='display:none;' </c:if>
	    >
	      <label class="required control-label col-sm-4">Reason for Edit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex="17" class="form-control input-sm" maxlength="250"  onkeypress="return onlyAlphabets(event,this);" maxlength="30"  id="reasonforedit"  placeholder="Reason for Edit"  <c:if test="${status eq 'Active' }"> required </c:if> name="reasonforedit" autocomplete="off">        
	      </div>
	    </div>
	   </div>
	   
	   <div class="col-md-6">
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">MDM Material Code</label>
	      <div class="col-sm-8 input-group"> 
	        <input type="text" tabindex = "-1" class="form-control input-sm sss" maxlength="30"  id="MDMCode" placeholder="MDM Material Code" name="MDMCode" value="${talendcode}" readonly autocomplete="off"/>        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email"> Material Class.Code</label>
	      <div class="col-sm-8 input-group">
	     <!--  <a href="#" >LaunchScreen</a>--> 
	      <input type="button" tabindex = "2" id="asd" class="btn btn-primary <c:if test="${status eq 'Active'}" > disabled </c:if>" disabled onclick="LaunchS()"  value="LaunchScreen"
	      <c:if test="${status eq 'Active' }"> readonly </c:if>
	      >	                
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">Description</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "4" readonly class="form-control input-sm" value="${fn:replace(desc, '"', '&quot;')}" maxlength="40"  required id="Description" placeholder="Description" name="Description" autocomplete="off"
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="required control-label col-sm-4" for="email">Alternative UOM</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "6" list="AlterUOM" class="form-control input-sm" maxlength="40" value="${AlterUomdesc}" id="AlterNativeUOM" onchange="return altuom()" placeholder="Alternative UOM" name="AlterNativeUOM" onfocusout="AlterNativeUOMFun()"
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	         required >
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
	        <input type="text" tabindex = "8" class="form-control input-sm" id="Denominator"  required
	        
	        <c:choose>
        <c:when test="${denominator==null || denominator==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${denominator}"
        </c:otherwise> 
    </c:choose>
	        
	       placeholder="Denominator" name="Denominator" maxlength="5"  autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)"
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="control-label col-sm-4" for="email" id="netwt">Net Weight</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "10" class="form-control input-sm" id="NetWeight" required
	        
	         <c:choose>
        <c:when test="${net==null || net==''}">
          value=""
        </c:when>
        <c:otherwise>
         value="${net}"
        </c:otherwise> 
    </c:choose>
	        
	         name="NetWeight" placeholder="Net Weight" maxlength="13"  autocomplete="off" onkeypress="return isNumberKeyVal(event,this.id)" maxlength="10" 
	       
	        >        
	      </div>
	    </div>
	    <div class="form-group ">
	      <label class="control-label col-sm-4" for="email">Unit Weight</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "12" list="UnitWeightlist" class="form-control input-sm" maxlength="30"   value="${Unitdesc}" onchange="return unitweight();" id="UnitWeight" name="UnitWeight" placeholder="Unit Weight" autocomplete="off" onfocusout="UnitFun()" 
	        <c:if test="${status eq 'Active' }">  </c:if>
	        >
	        <datalist id="UnitWeightlist">
	        <c:forEach items="${listweights}" var="wu">
			<option value="${wu.description}" data-id="${wu.unit}" >${wu.description}</option>
			</c:forEach>
	        </datalist>  
	        <span class="glyphicon glyphicon-search form-control-feedback"></span>
	        <input type="hidden" name="UnitWeightid" id="UnitWeightid"  >        
	      </div>
	    </div>
	    <div class="form-group ">
		      <label class="control-label col-sm-4" for="name">Volume unit</label>
		      <div class="col-sm-8 input-group">
		      	 <input type="text" tabindex="13" list ="VolumeUnitlist" class="form-control input-sm input_text" value="${volumeunit}" id="VolumeUnit" name="VolumeUnit" onfocusout="volumeunitfunction()" onchange="return volumeunitvalue()" placeholder="Volume Unit" autocomplete="off">
		      	<!-- <input type="text" tabindex="13" list="VolumeUnitlist" value="${volumeunit}" class="form-control input-sm input_text" name="VolumeUnit"  id="VolumeUnit" onfocusout="VolumeunitFunc()" onchange="return volumeunit();" placeholder="Volume Unit" autocomplete="off">  -->
			   <datalist id="VolumeUnitlist">
			   <c:forEach items="${volumeunitlistvalue}" var="volumeunit">
			      	<option value="${volumeunit.desc}" data-id="${volumeunit.code}">${volumeunit.desc}</option>  
	        	  </c:forEach>
			   </datalist>		
			   <span class="glyphicon glyphicon-search form-control-feedback"></span>        
		        <input type="hidden" name="volumeunitid" id="volumeunitid" >
		      </div>
		</div>
	    <!--  <div class="form-group ">
	      <label class="control-label col-sm-4" for="email">Volume Unit</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "14" class="form-control input-sm" value="${volumeunit}" maxlength="16"  id="VolumeUnit"  placeholder="VolumeUnit" name="VolumeUnit" autocomplete="off" 
	        <c:if test="${status eq 'Active' }"> readonly </c:if>
	        >        
	      </div>
	    </div> -->
	    
	    
	    <div class="form-group " id="id" <c:if test="${status eq 'Draft'  }"> style='display:none;' </c:if><c:if test="${appstus eq 'Rejected'}"> style='display:none;' </c:if> >
	      <label class="control-label col-sm-4 " for="email">Blocked Reason</label>
	      <div class="col-sm-8 input-group">
	        <input type="text" tabindex = "16" <c:if test="${empty reason}" > readonly </c:if> class="form-control input-sm" maxlength="250"  onkeypress="return onlyAlphabets(event,this);"   id="reason" name="reason" value="${reason}" placeholder="Blocked Reason" autocomplete="off"
	        
	        >        
	      </div>
	    </div>
   	 </div> 
   	 </fieldset>
	<fieldset class="scheduler-border">
   	<legend class="scheduler-border">Plant Mapping View</legend> 
	<div class="col-md-6">
		   <div class="form-group">
		   <label class="required control-label col-sm-4" for="name">Plant & Storage Location</label>
		   
		    <i class="fa fa-plus" onclick="expand()"><span class="tooltiptext">Expand all</span></i>
		    		   		    <i class="fa fa-minus" onclick="collapse()"><span class="tooltiptext">Collapse all</span></i>
		    
		    <div class="col-sm-8  input-group">
		   <ul class="treeview" style="overflow:scroll;height: 150px;">
  <%
  Connection con=null;
  PreparedStatement pstmt=null ; 
  PreparedStatement ps=null ; 

  ResultSet rs=null;
  ResultSet State=null;
    try
    {
      con=AuditConnection.getConnection();    
                
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
	            <input type="checkbox" name="short" id="short"
	            
	             <% 
	        	for(int m1=0;m1<list1.size();m1++)
	        	{
			    if ((plantcode.get(i)).equals(list1.get(m1))) {
			    	
			    	%>
			    	checked
			    	<% 
			       

			    }
			   }
		    
		    %>     
	            
	            
              value="<%=plantcode.get(i)%>"             
            >
            <label for="short"           
	        	       
             > <%=plantcode.get(i)%></label>
				 <ul id="<%=plantcode.get(i)%>" class='collapse in treealign'>
				 <%
				 for(int j=0;j<storageloc.size();j++){
				 if(plantcode.get(i).equals(plantcod.get(j)))	{
				
				 %>	
                 <li>
                     <input type="checkbox"
                     
                     
                     
                     
                     
                     
                     
                       name="state" id="short-1" value="<%=plantcode.get(i)+ "#"+plantdesc.get(i)+"#"+storageloc.get(j)+"#"+storagedesc.get(j)+"#"+storageid.get(j)%>" 
                      <% 
                     for(int m1=0;m1<list2.size();m1++)
					      {
					    if (storageid.get(j).equals(list2.get(m1))) {      
					        out.print("checked");

					    }
					    }
                     
                     
                     
                  
    
					   %>>
                     <label for="short-1" 
                     <% 
                     for(int m1=0;m1<list2.size();m1++)
					      {
					    if (storageid.get(j).equals(list2.get(m1))) {      
					        out.print("class=\"custom-checked\"");

					    }
					    }
    
					   %>
					  ><%=storageloc.get(j)%></label>
					                 
					        <%
					 }
				 %></li><% 
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
    <div class="col-md-1 col-md-offset-8"><input type="submit" disabled class="btn btn-primary form-control" name="Save"  value="Save" onclick="SaveFunc()"/></div>
    <div class="col-md-1"><button type="submit" class="btn btn-primary disabled btn-md" name="Submit"  value="Submit">Submit</button></div>
    <div class="col-md-1"><input type="button"  class="btn btn-primary form-control" name="clear"  value="Clear"  onclick="abc()"/></div>
    <div class="col-md-1"> <button type="button" class="btn btn-primary form-control"  data-toggle="modal" data-target="#myModal" onclick="ShowEditPopup()">Edit</button></div>
   
   <%
    }  
   else
   {
   %>
     <div class="col-md-1 col-md-offset-8"><input type="submit" name="Save" class="btn btn-primary form-control"  value="Save" onclick="return (checkifplantstorageselected() && checkform())"/></div>
     <div class="col-md-1"><button type="submit" onclick="return (checkifplantstorageselected() && check())" class="btn btn-primary" name="Submit" id="submit" value="Submit">Submit </button> </div>
     <!--<div class="col-md-1"><button type="submit" onclick ="return (checkifplantstorageselected() && check())" class="btn btn-primary btn-md" name="Submit"  value="Submit">Submit</button></div>-->
     <div class="col-md-1"><input type="button"  class="btn btn-primary form-control" name="clear"  value="Clear"  onclick="abc()"/></div>
     <div class="col-md-1"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" >Edit</button></div>
   
   <%}}%>
	
</div>	   
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
</script>

<% 

}
catch(Exception e)
{
	
}

%>


<!-- Lanuch Screen Design -->
<div class="col-md-12" style="padding-left:20px; display:none;" id="LaunchScreen">
<div class = "panel panel-primary">
   <div class = "panel-heading">
      <h3 class = "panel-title">Launch screen</h3>
   </div>   
   <div class = "panel-body">   
      <div class="col-md-6">
    <div class="form-group ">
      <label class="control-label col-sm-4" for="name">Level1</label>
      <div class="col-sm-8 input-group">
      <input type="text" class="Materialtypes form-control input-sm input_text" readonly name="Level1"  id="Level1" autocomplete="off">		    
      </div>
    </div>    
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Level2</label>
      <div class="col-sm-8 input-group">
         <input type="text" class="form-control input-sm"  id="Level2" readonly  name="Level2" autocomplete="off"> 
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Level3</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="Level3" readonly name="Level3" autocomplete="off" >                  
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Source</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="Source" readonly name="Source" autocomplete="off" >   
      </div>
    </div>  
    <div class="form-group ">
      <label class="control-label col-sm-4" for="email">Material Class.Code</label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="MaterialCodelanch" readonly name="MaterialCodelanch"  autocomplete="off" >        
      </div>
    </div>  
   </div>
   
   <div class="col-md-6">
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group"> 
        <input type="text" list="LsearchList1" class="form-control input-sm" id="Lsearch1" onchange="return level1c();" name="Lsearch1" autocomplete="off" >
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
       <input type="text" list="LsearchList2" class="form-control input-sm" id="Lsearch2" onchange="return level2c();" name="Lsearch2" autocomplete="off">
        <datalist id="LsearchList2">        
        </datalist>
        <span class="glyphicon glyphicon-search form-control-feedback"></span>     
        <input type="hidden" name="LsearchList1id" id="LsearchListid" >         
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
         <input type="text" list="LsearchList3" class="form-control input-sm" id="Lsearch3" name="Lsearch3" onchange="return level3c();" autocomplete="off">
        <datalist id="LsearchList3">        
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="LsearchList3id" id="LsearchList3id" >         
      </div>
    </div>
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
         <input type="text" list="LsearchList4" class="form-control input-sm" id="Lsearch4" name="Lsearch4" onchange="return sourcec();" autocomplete="off">
        <datalist id="LsearchList4">        
 		 <c:forEach items="${listsource}" var="so"> 
            <option value="${so.item}" data-id="${so.id}">${so.item}</option>
        </c:forEach>
 
        </datalist>  
        <span class="glyphicon glyphicon-search form-control-feedback"></span>   
        <input type="hidden" name="LsearchList4id" id="LsearchList4id" > 
      </div>
    </div>    
    <div class="form-group ">
      <label class="control-label col-sm-2" for="email"></label>
      <div class="col-sm-8 input-group">
        <input type="text" class="form-control input-sm" id="MCode" name="MCode" autocomplete="off">        
      </div>
    </div>
    
   </div>
      
   <div class="col-md-2 col-md-offset-7"><input type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" onclick="checkv()" value="View Current Code" /></div>
   <div class="col-md-1"><input type="button" class="btn btn-primary form-control"  value="Select" onclick="selectFunc()"/></div>
   <div class="col-md-1"> <input type="button" class="btn btn-primary form-control"  value="Back" onclick="BackFunc()"/></div>
          <div class="col-md-1"> <input type="button" class="btn btn-primary form-control"  value="Clear" onclick="LanuchScreenClr()"/></div>
     
       
   </div>
</div>
</div>
</form>
<div class="col-md-12">
<span id="rajan"> </span>  
</div>
</div>



<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 80%;">

    <!-- Modal content-->
    <div class="modal-content">
    
    <div class="container-fluid" id="data">
  <div class="row" style="margin-top: 15px; ">
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
        <button type="button" onclick="javascript:window.location='SCR_Basic.jsp'" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</body>
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
function hide() {
	  document.getElementById('data').style.display = 'none';
	}
$(".modal").on("hidden.bs.modal", function () {
    window.location = "Basic_Plant_Mapping_View.jsp";
});
function ClearFunc(){
	$("#Meterial").val('');
}
function ClearActiveFunc(){
	$("#GrossWeight").val('');
}
function ClearFunc(){
	 console.log($("#clr").val());
	 if(clr=="Draft"){
		 $("Meterial").val('');
		 $("materialgroup1").val('');
		 $("MaterialCode").val('');
		 $("GrossWeight").val('');
		 $("HSNCode").val('');
	 }
	 else{
		 
		 $("Denominator").val('');
	 }
}
</script>
<!-- Launch Screen Scripts for level2  -->
<script type="text/javascript">

	//Scrap code generate



	
 function selectFunc(){
	 if($("#MCode").val()!=''){		 
		 var mDcode=$("#MCode").val();
		 $("#MaterialCode").val(mDcode);
		 alert("MaterialCode Selected");
	 }
	 
 }
	
 
 //View Current Page descrpition
 
	
</script>


</html>