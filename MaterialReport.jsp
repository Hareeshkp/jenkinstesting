<%@page import="com.tvs.accounting.Valuationclass"%>
<%@page import="com.tvs.accounting.ValuationclassDAO"%>
<%@page import="com.tvs.plantmapping.PlantCode"%>
<%@page import="com.tvs.plantmapping.PlantCodeDAO"%>
<%@page import="com.tvs.Purchase.Purchasinggroup"%>
<%@page import="com.tvs.Purchase.PurchasinggroupDAO"%>
<%@page import="com.tvs.scrbasic.Material"%>
<%@page import="com.tvs.scrbasic.MaterialDAO"%>
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

	
$("#materialtype").on('change',function(){		

	  var cid = document.getElementById('materialtype').value;
	  var res = cid.split("-");
	  var input=res[0];
	 
	    $.ajax({
			type: "POST",
			url: "materialgroup2.jsp",
			data: "materialtype="+input,
			cache: false,
			success: function(data)
	        {
				$("#materialgroup").html(data);				
	        }
	    });
	  
});

});



    function ShowEditPopup()
{	
	 
  	  var minmaterial = document.getElementById('minmaterialcode').value;
  	  var maxmaterial = document.getElementById('maxmaterialcode').value;
  	  
    	var minplant = document.getElementById('minplantcode').value;
	  var maxplant = document.getElementById('maxplantcode').value;
	
	  var materialtype = document.getElementById('materialtype').value;
 	  var materialgroup = document.getElementById('materialgroup').value;
	  
 	  var purchasinggroup = document.getElementById('purchasinggroup').value;
 	  var valuationclass = document.getElementById('valuationclass').value;
 	
 	  var createdby = document.getElementById('createdby').value;
/*  	  var reviewedby = document.getElementById('reviewedby').value;
 */ 	  var approvedby = document.getElementById('approvedby').value;
 	  var modifiedby = document.getElementById('modifiedby').value;

		  
		   var mincreated = document.getElementById('min-created-date').value;
		   var maxcreated = document.getElementById('max-created-date').value;
		   
		   var minmodified = document.getElementById('min-modified-date').value;
		   var maxmodified = document.getElementById('max-modified-date').value;
		   
		/*   
		   var minreviewed = document.getElementById('min-reviewed-date').value;
		   var maxreviewed = document.getElementById('max-reviewed-date').value;
		    */
		   var minapproved = document.getElementById('min-approved-date').value;
		   var maxapproved = document.getElementById('max-approved-date').value;
		 
	   
	    $.ajax({
			type: "POST",
			url: "materialreportview.jsp",    		
			data : {
	            "minmaterial":minmaterial,
	            "maxmaterial":maxmaterial,
	            "minplant":minplant,
	            "maxplant":maxplant,
	            "materialtype":materialtype,
	            "materialgroup":materialgroup,
	            "purchasinggroup":purchasinggroup,
	            "valuationclass":valuationclass,
	            "createdby":createdby,
	            "approvedby":approvedby,
	            "modifiedby":modifiedby,
	            "mincreated":mincreated,
	            "maxcreated":maxcreated,
	            "minmodified":minmodified,
	            "maxmodified":maxmodified,
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




try
{


	    MaterialDAO m = new MaterialDAO();
    	List<Material> listm = m.materiallist();
		request.setAttribute("listmaterial",listm);
		
      
		PlantCodeDAO pc =new PlantCodeDAO();
		List<PlantCode> listp =pc.getPlantCodes();
		request.setAttribute("listplant",listp);

       ValuationclassDAO vcd=new ValuationclassDAO();
       List<Valuationclass> listv =vcd.getValuationclass();
		request.setAttribute("listvlist",listv);


PurchasinggroupDAO pda =new PurchasinggroupDAO();
List<Purchasinggroup> listg = pda.pgrouplist();
request.setAttribute("listpgroup",listg);

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
	      <h3 class = "panel-title">Material Report</h3>
	   </div>   
	   <div class="panel-body">
	   
	   <div class="container-fluid">
	   
	   <div class="row" style="margin-top:10px;">
  
  
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Material Type</label>
    </div>
    
    
 <div class="col-sm-4" >
<table >
     <tr data-column="2">
     <td >
 <select class=" form-control input-sm" style="width:330px;"   id="materialtype" >	
 <option selected  value="Select">Select</option>
		    <c:forEach items="${listmaterial}" var="c">  		            
		            <option value="${c.description}"> ${c.description} </option>		             
		        </c:forEach> 
		      </select>	 
     </td>
     </tr>
		       </table>    
		       </div>
      
   <div class="col-sm-2">
     <label class=" control-label"  for="name">Material Group </label>
    </div>
     <div class="col-sm-4">
     
     
    <table >
     
      <tr data-column="36">
     
     
     
     <td >
 <select class=" form-control input-sm " style="width:330px;"   id="materialgroup" >	
 <option value='Select'>Select</option>
		      
		      
		      </select>	 
     </td>
     </tr>
		       </table>

		        </div>

  </div> 

	   
  <div class="row" style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">MDM  Code</label>
    </div>
     <div class="col-sm-4" >
    
     <table>
     
     <tr>
     <td>
      <input type="text"   class="form-control input-sm " onkeypress="return isNumber(event)" maxlength="10"  name="mdmvendorcode"     id="minmaterialcode"  autocomplete="off">
     </td>
      <td>
     <label class=" control-label" for="name">To</label>
     </td>
        <td>
          <input type="text"   class="form-control input-sm " onkeypress="return isNumber(event)" maxlength="10"  name="mdmvendorcode"     id="maxmaterialcode"  autocomplete="off">
     </td>
     </tr>
     </table>

     </div>
   




  <div class="col-sm-2">
     <label class=" control-label"  for="name">Purchasing Group </label>
    </div>
     <div class="col-sm-4">
     
     
    <table >
     
      <tr data-column="36">
     
     
     
     <td >
 <select class=" form-control input-sm " style="width:330px;"   id="purchasinggroup" >	
 <option value='Select'>Select</option>
		       <c:forEach items="${listpgroup}" var="pg">
			      	<option value=" ${pg.desc}" >${pg.desc}</option>  
	        	  </c:forEach>
		      
		      </select>	 
     </td>
     </tr>
		       </table>

		        </div>

  </div> 


<div class="row" style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Plant  Code</label>
    </div>
      <div class="col-sm-4" >
<table>
     
     <tr>
     
     
     
     <td>
<select class=" form-control input-sm"  name="country" style="width:155px"   id="minplantcode" >	
 <option value='Select'>Select</option>
		    <c:forEach items="${listplant}" var="c">  		            
		            <option value="${c.plant}" > ${c.plant} </option>		             
		        </c:forEach>
		      </select>	      
     </td>
     
     
      <td>
     <label class=" control-label" for="name">To</label>
     
     </td>
        <td>
<select class=" form-control input-sm"  name="country" style="width:155px"   id="maxplantcode" >	
 <option value='Select'>Select</option>
		     <c:forEach items="${listplant}" var="c">  		            
		            <option value="${c.plant}" > ${c.plant} </option>		             
		        </c:forEach>
		      </select>	      
     </td>
     
     </tr>
     
     </table>
    </div>



  <div class="col-sm-2">
     <label class=" control-label"  for="name">Valuation Class </label>
    </div>
     <div class="col-sm-4">
     
     
    <table >
     
      <tr data-column="36">
     
     
     
     <td >
 <select class=" form-control input-sm " style="width:330px;"   id="valuationclass" >	
 <option value='Select'>Select</option>
		   
		       <c:forEach items="${listvlist}" var="c">  		            
		            <option value="${c.valuationclass}" > ${c.valuationclass} </option>		             
		        </c:forEach>
		      </select>	 
     </td>
     </tr>
		       </table>

		        </div>

  </div> 



 


<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Created By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmvendcode"  placeholder="Created By"   id="createdby"  autocomplete="off">
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


<!-- <div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Reviewed By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmvendcode"  placeholder="Reviewed By"   id="reviewedby"  autocomplete="off">
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
 -->

<div class="row"  style="margin-top:10px;">
     <div class="col-sm-2" >
     <label class=" control-label" for="name">Approved By</label>
    </div>
     <div class="col-sm-4" >
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmvendcode"  placeholder="Approved By"   id="approvedby"  autocomplete="off">
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
     <input type="text"   class="form-control input-sm " oninput="this.value = this.value.toUpperCase()"   name="mdmvendcode"  placeholder="Modified By"   id="modifiedby"  autocomplete="off">
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







