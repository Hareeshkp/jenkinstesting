<%@page import="com.tvs.version.Customer"%>
<%@page import="com.tvs.version.CustomerDAO"%>
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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.min.js"></script>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
 
  <style>
  
  .borderless tr td {
    border: none !important;
  
	border-collapse: collapse;
	
}
tr {
  padding: 0 !important;
 
}
  </style>
   <script>
   //name search
   function filterGlobal () {
    $('#myTable').DataTable().search(
        $('#global_filter').val(),
      
    ).draw();
}
 
function filterColumn ( i ) {
    $('#myTable').DataTable().column( i ).search(
        $('#col'+i+'_filter').val(),
      
    ).draw();
}
 
$(document).ready(function() {
    $('#myTable').DataTable();
 
    $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
 
    $('input.column_filter').on( 'keyup click', function () {
        filterColumn( $(this).parents('tr').attr('data-column') );
    } );
} );
   
   // sapcode search
   

   $.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var min = parseInt( $('#min').val(), 10 );
        var max = parseInt( $('#max').val(), 10 );
        var age = parseFloat( data[0] ) || 0; // use data for the age column
 
        if ( ( isNaN( min ) && isNaN( max ) ) ||
             ( isNaN( min ) && age <= max ) ||
             ( min <= age   && isNaN( max ) ) ||
             ( min <= age   && age <= max ) )
        {
            return true;
        }
        return false;
    }
);
 
$(document).ready(function() {
    var table = $('#myTable').DataTable();
     
    // Event listener to the two range filtering inputs to redraw on input
    $('#min, #max').keyup( function() {
        table.draw();
    } );
} )
   
   //==============================date range===================================================================


    window.onload=function(){
      
// Bootstrap datepicker
$('.input-daterange input').each(function() {
  $(this).datepicker('clearDates');
});

// Set up your table
table = $('#myTable').DataTable({
  "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],
  //paging: false,
 // info: false
});
 
// Extend dataTables search
$.fn.dataTable.ext.search.push(
  function(settings, data, dataIndex) {
    var min = $('#min-date').val();
	
	
    var max = $('#max-date').val();
    var createdAt = data[2] || 0; // Our date column in the table

    if (
      (min == "" || max == "") ||
      (moment(createdAt).isSameOrAfter(min) && moment(createdAt).isSameOrBefore(max))
    ) {
      return true;
    }
    return false;
  }
);

// Re-draw the table when the a date range filter changes
$('.date-range-filter').change(function() {
  table.draw();
});

$('#my-table_filter').hide();

    }

</script>
 <script>
    // tell the embed parent frame the height of the content
    if (window.parent && window.parent.parent){
      window.parent.parent.postMessage(["resultsFrame", {
        height: document.body.getBoundingClientRect().height,
        slug: "hkoqbaex"
      }], "*")
    }
    // always overwrite window.name, in case users try to set it manually
    window.name = "result"
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
CustomerDAO cd=new CustomerDAO();
try
{
	List<Customer> listal=cd.alllist();
request.setAttribute("listall",listal);
}
catch(Exception e)
{
}
%>
<div class="col-md-1">
</div>
<div class="col-md-12">
<div class=""><br>
<div class = "panel panel-primary">
	   <div class = "panel-heading">
	      <h3 class = "panel-title">Customer</h3>
	   </div>   
            <div class="table" >  
  <table class="table borderless"  >
    <thead>
    <tbody>
        <tr align="left" id="filter_col1" data-column="3">
        <td style="font-weight:bold" width="36%" align="left">SAP Code
        <input autocomplete="off" type="text" size=10 id="min" name="min"><strong>To</strong>
		<input autocomplete="off" type="text" size=10 id="max" name="max"></td>
		  <td style="font-weight:bold" width="1%" align="left">Date</td>
        <td width="28%"><div  class="input-group input-daterange" >
 <input type="text" id="min-date" size=10  class=" date-range-filter"  data-date-format="yyyy-mm-dd" > <strong>To</strong>
		<input type="text" id="max-date" size=10 class="date-range-filter" data-date-format="yyyy-mm-dd" >
		</div>
		</td>
		   <td  style="font-weight:bold" align="left" width="1%" > UserId</td>
				<td><input autocomplete="off" type="text" size=10 class="column_filter" id="col3_filter"></td>
      </tr>
    </tbody>
  </table>

	<table id="myTable" class="display table table-responsive"  >
	<thead>
            <tr>
                 <th>SAP Code</th>
                <th>Talend Code</th>
                <th>Date</th>
                <th>UserId</th>
                 <th>Version</th>
                <th>Field Name</th>
                <th>Old Value</th>
                <th>New Value</th>
            </tr>
        </thead>
	 
	   <tbody>
		<c:forEach items="${listall}" var="abcd">
	    <tr>
	    	<td>${abcd.sapcode}</td>
	    	<td>${abcd.mdmcode}</td>   
	    	<td>${abcd.date}</td> 
	    	<td>${abcd.userid}</td> 
	    	<td>${abcd.version}</td> 	    
	    	<td>${abcd.feildname}</td>
	    	
	    	<td>${abcd.pre_value}</td> 
	    	<td>${abcd.curr_value}</td>
	  	</tr>
	 	</c:forEach>                   
		  
	</tbody>
	</table>
</div>
</div>
<br>
</div>

</div>

</body>
</html>







