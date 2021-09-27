
<%@page import="com.tvstyres.vendor.model.Countries"%>
<%@page import="com.tvstyres.vendor.dao.CountriesDAO"%>
<%@page import="com.tvstyres.vendor.model.VendorGroup"%>
<%@page import="com.tvstyres.vendor.dao.VendorGroupDAO"%>
<%@page import="com.tvstyres.vendor.model.LegalEntity"%>
<%@page import="com.tvstyres.vendor.dao.LegalEntityDAO"%>
<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
<%@page import="com.tvs.traceability.Allvalues"%>
<%@page import="com.tvs.traceability.Listall"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>       
         <html lang="en">
<head>
 <title>Table</title>
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
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
 
  <script type="text/javascript">
//number validation
	function isNumber(evt) {
	    evt = (evt) ? evt : window.event;
	    var charCode = (evt.which) ? evt.which : evt.keyCode;
	    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
	        return false;
	    }
	    return true;
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
  
  function filterColumn ( i ) {
		console.log($('#col'+i+'_filter').val());
	    $('#myTable').DataTable().column( i ).search(    		
	        $('#col'+i+'_filter').val()
	      
	    ).draw();
	}
	function filterColumn1 ( i ) {

	    $('#myTable').DataTable().column( i ).search($('#col36_filter').find(":selected").val()).draw();
	}
	 
	 
	function filterColumn2 ( i ) {

	    $('#myTable').DataTable().column( i ).search($('#col2_filter').find(":selected").val()).draw();
	}
	function filterColumn8 ( i ) {

	    $('#myTable').DataTable().column( i ).search($('#col8_filter').find(":selected").val()).draw();
	}
	function filterColumn9 ( i ) {

	    $('#myTable').DataTable().column( i ).search($('#col9_filter').find(":selected").val()).draw();
	}

	
  
  
$(document).ready(function() {
	
	// Bootstrap datepicker
	$('.input-daterange input').each(function() {
	  $(this).datepicker('clearDates');
	});


	 
	// Extend dataTables search
	$.fn.dataTable.ext.search.push(
	  function(settings, data, dataIndex) {
	    var min = $('#min-created-date').val();
		
	    var max = $('#max-created-date').val();
	    var createdAt = data[44] || 0; // Our date column in the table
	    if (
	      (min == "" || max == "") ||
	      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
	    ) {
	      return true;
	    }
	    return false;
	  }
	);
	

	$.fn.dataTable.ext.search.push(
			  function(settings, data, dataIndex) {
			    var min = $('#min-modified-date').val();
				
			    var max = $('#max-modified-date').val();
			    var createdAt = data[46] || 0; // Our date column in the table
			    if (
			      (min == "" || max == "") ||
			      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
			    ) {
			      return true;
			    }
			    return false;
			  }
			);
			
			
			
	$.fn.dataTable.ext.search.push(
			  function(settings, data, dataIndex) {
			    var min = $('#min-reviewed-date').val();
				
			    var max = $('#max-reviewed-date').val();
			    var createdAt = data[48] || 0; // Our date column in the table
			    if (
			      (min == "" || max == "") ||
			      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
			    ) {
			      return true;
			    }
			    return false;
			  }
			);
			
	$.fn.dataTable.ext.search.push(
			  function(settings, data, dataIndex) {
			    var min = $('#min-approved-date').val();
				
			    var max = $('#max-approved-date').val();
			    var createdAt = data[50] || 0; // Our date column in the table
			    if (
			      (min == "" || max == "") ||
			      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
			    ) {
			      return true;
			    }
			    return false;
			  }
			);

	//Re-draw the table when the a date range filter changes
	$('.date-range-filter').change(function() {
	  table.draw();
	});


	
	
	
	
	
$("#count").on('change',function(){		

	  var cid = document.getElementById('count').value;
	
	  var res = cid.split("-");
	  var input=res[0];
	  
	    $.ajax({
			type: "POST",
			url: "Vendor_Data/State2.jsp",
			data: "countryidd="+input,
			cache: false,
			success: function(data)
	        {
				$(".State").html(data);				
	        }
	    });
	  
});
});



    function ShowEditPopup()
{	
	 
  	  var minven = document.getElementById('minvendorcode').value;
  	  var maxven = document.getElementById('maxvendorcode').value;
  	  var sapven = document.getElementById('sapvendorcode').value;
  	  
  	  var firstname = document.getElementById('firstname').value;
 	  var legalname = document.getElementById('legalname').value;
  	  
 	  
 	  var createdby = document.getElementById('createdby').value;
 	  var reviewedby = document.getElementById('reviewedby').value;
 	  var approvedby = document.getElementById('approvedby').value;
 	  var modifiedby = document.getElementById('modifiedby').value;
  	 
 	  var gstno = document.getElementById('gstno').value;
 	  var panno = document.getElementById('panno').value;
 	
 	  var country = document.getElementById('count').value;
 	 
	  var state = document.getElementById('state').value;
	 

	 	 var vendorgroup = document.getElementById('vendergroup').value;
	   
		  var legalentity = document.getElementById('legalentity').value;
		  
		   var mincreated = document.getElementById('min-created-date').value;
		   var maxcreated = document.getElementById('max-created-date').value;
		   
		   var minmodified = document.getElementById('min-modified-date').value;
		   var maxmodified = document.getElementById('max-modified-date').value;
		   
		  
		   var minreviewed = document.getElementById('min-reviewed-date').value;
		   var maxreviewed = document.getElementById('max-reviewed-date').value;
		   
		   var minapproved = document.getElementById('min-approved-date').value;
		   var maxapproved = document.getElementById('max-approved-date').value;
		 
	   
	    $.ajax({
			type: "POST",
			url: "vendorreportview.jsp",    		
			data : {
	            "minven":minven,
	            "maxven":maxven,
	            "sapven":sapven,
	            "firstname":firstname,
	            "legalname":legalname,
	            "createdby":createdby,
	            "reviewedby":reviewedby,
	            "approvedby":approvedby,
	            "modifiedby":modifiedby,
	            "gstno":gstno,
	            "panno":panno,
	            "country":country,
	            "state":state,
	            "vendorgroup":vendorgroup,
	            "legalentity":legalentity,
	            "mincreated":mincreated,
	            "maxcreated":maxcreated,
	            "minmodified":minmodified,
	            "maxmodified":maxmodified,
	            "minreviewed":minreviewed,
	            "maxreviewed":maxreviewed,
	            "minapproved":minapproved,
	            "maxapproved":maxapproved

	        },
			cache: false,
			success: function(response)
	        {
				
	            $("#tableView").html(response);
	        }
	    });
}

</script>

 

</head>


<body>
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>

<%

String Userid =(String) request.getAttribute("myTest");
if(Userid==null)
{
%>
	
	<script type="text/javascript">
	alert('Session timeout!');
window.parent.location.href= "Login.jsp";
</script>
<% 
}


LegalEntityDAO led=new LegalEntityDAO();

VendorDAO vd =new VendorDAO();

try
{


List<LegalEntity> listlegal =led.getLegalEntitylist();
request.setAttribute("listlegal", listlegal);

VendorGroupDAO vgd =new VendorGroupDAO();
List<VendorGroup> listvg =vgd.getVendorgroup();
request.setAttribute("listvg", listvg);
CountriesDAO cd =new CountriesDAO();
List<Countries> listc =cd.getCountrylist();
request.setAttribute("listc", listc);

}
catch(Exception e)
{
}
%>
<div class="col-md-1">
</div>
<div class="col-md-12">
<div class = "panel panel-primary" style="margin-top:2%;">
	   <div class = "panel-heading">
	      <h3 class = "panel-title">Vendor Report</h3>
	   </div>   
	   <div class="panel-body">
	   
	   <div class="container-fluid">
	   
	   <div class="row" style="margin-top:10px;">
  
  
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Vendor Group</label>
    </div>
    
    
 <div class="col-sm-4" >
<table >
     <tr data-column="2">
     <td >
 <select class=" form-control input-sm" style="width:330px;"   id="vendergroup" >	
 <option selected  value="Select">Select</option>
		    <c:forEach items="${listvg}" var="c">  		            
		            <option value="${c.description}"> ${c.description} </option>		             
		        </c:forEach> 
		      </select>	 
     </td>
     </tr>
		       </table>    
		       </div>
      
   <div class="col-sm-2">
     <label class=" control-label"  for="name">Legal Entity</label>
    </div>
     <div class="col-sm-4">
     
     
    <table >
     
      <tr data-column="36">
     
     
     
     <td >
 <select class=" form-control input-sm " style="width:330px;"   id="legalentity" >	
 <option value='Select'>Select</option>
		      
		      <c:forEach items="${listlegal}" var="c">  		            
		            <option value="${c.desc}" > ${c.desc} </option>		             
		        </c:forEach>  
		      </select>	 
     </td>
     </tr>
		       </table>

		        </div>

  </div> 

	   
  <div class="row" style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">MDM Vendor Code</label>
    </div>
     <div class="col-sm-4" >
    
     <table>
     
     <tr>
     <td>
      <input type="text"   class="form-control input-sm " onkeypress="return isNumber(event)" maxlength="10"  name="mdmvendorcode"     id="minvendorcode"  autocomplete="off">
     </td>
      <td>
     <label class=" control-label" for="name">To</label>
     </td>
        <td>
          <input type="text"   class="form-control input-sm " onkeypress="return isNumber(event)" maxlength="10"  name="mdmvendorcode"     id="maxvendorcode"  autocomplete="off">
     </td>
     </tr>
     </table>

     </div>
   




   <div class="col-sm-2" >
     <label class=" control-label" for="name">SAP Vendor Code</label>
    </div>
    <div class="col-sm-4" >
 
   <table>
     
     <tr>
     
     <td>
      <input type="text"   class="form-control input-sm " maxlength="10" onkeypress="return onlyAlphanumeric(event,this);"   name="mdmvendorcode"     id="sapvendorcode"  autocomplete="off">
     
     </td>
     
     
    
     
     </tr>
     
     </table>

</div>    
    

    
  </div>




 <div class="row" style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">First Name</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmvendorkkcode"  placeholder="First Name"   id="firstname"  autocomplete="off">
    </div>
      
   <div class="col-sm-2">
     <label class=" control-label" for="name">Legal Name</label>
    </div>
     <div class="col-sm-4">
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmveorcode"  placeholder="Legal Name"   id="legalname"  autocomplete="off">
    </div>

  </div>


<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Created By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm "    name="mdmvendcode"  placeholder="Created By"   id="createdby"  autocomplete="off">
    </div>
      
   <div class="col-sm-2" >
     <label class=" control-label" for="name">Created Date</label>
    </div>
     <div class="col-sm-4 input-daterange" >
 
     <table>
     
     <tr>
     
     
     
     <td>
      <input type="text" id="min-created-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     
      <td>
     <label class=" control-label" for="name">To</label>
     
     </td>
     
        <td>
      <input type="text" id="max-created-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     </tr>
     
     </table>


</div>    
  </div>


<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Reviewed By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm "   name="mdmvendcode"  placeholder="Reviewed By"   id="reviewedby"  autocomplete="off">
    </div>
      
   <div class="col-sm-2" >
     <label class=" control-label" for="name">Reviewed Date</label>
    </div>
     <div class="col-sm-4 input-daterange" >
 
     <table>
     
     <tr>
     
     
     
     <td>
      <input type="text" id="min-reviewed-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     
      <td>
     <label class=" control-label" for="name">To</label>
     
     </td>
     
        <td>
      <input type="text" id="max-reviewed-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     </tr>
     
     </table>


</div>    
  </div>


<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Approved By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm "    name="mdmvendcode"  placeholder="Approved By"   id="approvedby"  autocomplete="off">
    </div>
      
   <div class="col-sm-2" >
     <label class=" control-label" for="name">Approved Date</label>
    </div>
      <div class="col-sm-4 input-daterange" >
 
     <table>
     
     <tr>
     
     
     
     <td>
      <input type="text" id="min-approved-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     
      <td>
     <label class=" control-label" for="name">To</label>
     
     </td>
     
        <td>
      <input type="text" id="max-approved-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     </tr>
     
     </table>


</div>    
  </div>

<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Modified By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm "    name="mdmvendcode"  placeholder="Modified By"   id="modifiedby"  autocomplete="off">
    </div>
      
   <div class="col-sm-2" >
     <label class=" control-label" for="name">Modified Date</label>
    </div>
    <div class="col-sm-4 input-daterange" >
 
     <table>
     
     <tr>
     
     
     
     <td>
      <input type="text" id="min-modified-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     
      <td>
     <label class=" control-label" for="name">To</label>
     
     </td>
     
        <td>
      <input type="text" id="max-modified-date"  class=" form-control input-sm  date-range-filter"  data-date-format="yyyy-mm-dd"     autocomplete="off">
     
     </td>
     
     </tr>
     
     </table>


</div>    
  </div>
  
  
  
  
  

  
  

<div class="row" style="margin-top:10px;">
  
  
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Country</label>
    </div>
    
    
 <div class="col-sm-4" >
<table >
     <tr data-column="8">
     <td >
 <select class=" form-control input-sm" style="width:330px;" name="country"   id="count" >	
 <option value='Select'>Select</option>
		    <c:forEach items="${listc}" var="c">  		            
		            <option value="${c.description}" > ${c.description} </option>		             
		        </c:forEach> 
		      </select>	 
     </td>
     </tr>
		       </table>    
		       </div>
      
   <div class="col-sm-2">
     <label class=" control-label"  for="name">State</label>
    </div>
     <div class="col-sm-4">
     
     
    <table >
     
      <tr data-column="9">
     
     
     
     <td >
 <select class=" State form-control input-sm " style="width:330px;"   id="state" >	
 <option value='Select'>Select</option>
		      
		     
		      </select>	 
     </td>
     </tr>
		       </table>

		        </div>

  </div> 

<div class="row" style="margin-top:10px;margin-bottom:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">GST No</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm " maxlength="15" oninput="this.value = this.value.toUpperCase()"   name="mdmvendorkkcode"  placeholder="GST No"   id="gstno"  autocomplete="off">
    </div>
      
   <div class="col-sm-2">
     <label class=" control-label" for="name">PAN No</label>
    </div>
     <div class="col-sm-4">
     <input type="text"   class="form-control input-sm " maxlength="10" oninput="this.value = this.value.toUpperCase()"   name="mdmveorcode"  placeholder="PAN No"   id="panno"  autocomplete="off">
    </div>

  </div>
  
</div>



           
					  
					  
					  
					  
					   <div class="col-md-2"> <button type="button" class="btn btn-primary form-control" data-toggle="modal" data-target="#myModal" onclick="ShowEditPopup()">Search</button></div>
		    
	  
   		
   	<!--  -->
   	<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" >
  <div class="modal-dialog" style="width: 95%;">

    <!-- Modal content-->
    <div class="modal-content">
     
      <div class="modal-body">
        <span id="tableView">
        </span>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>	
					  
					  
					  
					


  
  
			</div>
		</div>
  
</div>



</body>
</html>







