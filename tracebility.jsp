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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap.min.js"></script>
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
  <style>
  .material-switch > input[type="checkbox"] {
    display: none;   
}

.material-switch > label {
    cursor: pointer;
    height: 0px;
    position: relative; 
    width: 40px;  
}

.material-switch > label::before {
    background: rgb(0, 0, 0);
    box-shadow: inset 0px 0px 10px rgba(0, 0, 0, 0.5);
    border-radius: 8px;
    content: '';
    height: 16px;
    margin-top: -8px;
    position:absolute;
    opacity: 0.3;
    transition: all 0.4s ease-in-out;
    width: 40px;
}
.material-switch > label::after {
    background: rgb(255, 255, 255);
    border-radius: 16px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.3);
    content: '';
    height: 24px;
    left: -4px;
    margin-top: -8px;
    position: absolute;
    top: -4px;
    transition: all 0.3s ease-in-out;
    width: 24px;
}
.material-switch > input[type="checkbox"]:checked + label::before {
    background: inherit;
    opacity: 0.5;
}
.material-switch > input[type="checkbox"]:checked + label::after {
    background: inherit;
    left: 20px;
}  
.tbltd{
width:255px;
}

  </style>
   <script>
   //name search
   function filterGlobal () {
    $('#myTable').DataTable().search(
        $('#global_filter').val()
      
    ).draw();
}
 
function filterColumn ( i ) {
	console.log($('#col'+i+'_filter').val());
    $('#myTable').DataTable().column( i ).search(    		
        $('#col'+i+'_filter').val()
      
    ).draw();
}
function filterColumn1 ( i ) {
    $('#myTable').DataTable().column( i ).search($('#col12_filter').find(":selected").val()).draw();
}
 
function setallvalue()
{
	 $('#someSwitchOptionPrimary').val('allvalue');
}
$(document).ready(function() {
    $('#myTable').DataTable();
    
    
    oTable = $('#myTable').DataTable();   //pay attention to capital D, which is mandatory to retrieve "api" datatables' object, as @Lionel said
    $('#myInputTextField').keyup(function(){
          oTable .columns( 0 ).search($(this).val()).draw() ;
    })
    
     $('#myInputTextField1').keyup(function(){
          oTable .columns( 1 ).search($(this).val()).draw() ;
    })
    
      $('#myInputTextField2').keyup(function(){
          oTable .columns( 2 ).search($(this).val()).draw() ;
    })
    
     $('#myInputTextField3').keyup(function(){
          oTable .columns( 3 ).search($(this).val()).draw() ;
    })
    
      $('#myInputTextField5').keyup(function(){
          oTable .columns( 5 ).search($(this).val()).draw() ;
    })
    
    
      $('#myInputTextField7').keyup(function(){
          oTable .columns( 7 ).search($(this).val()).draw() ;
    })
 
    $('input.global_filter').on( 'keyup click', function () {
        filterGlobal();
    } );
 
    $('input.column_filter').on( 'keyup click', function () {
    	console.log('saranraaaj kumaaar');
    	
    	console.log($(this).parents('tr').attr('data-column'));
    	console.log($('option:selected', this).attr('value'));
        filterColumn( $(this).parents('tr').attr('data-column') );
    } );
    $('select').on('change', function() {
        filterColumn1( $(this).parents('tr').attr('data-column') );
    	
    	});
    $('#someSwitchOptionPrimary').click(function () {
    	if($(this).val()=='maxvalue')
    	{
    		setallvalue();
    	}
    	else if($(this).val()=='allvalue')
    	{
    		console.log("saranrajk");
    	}
    });

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
   
 
// Set up your table
table = $('#myTable').DataTable({
  "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]],
  //paging: false,
 // info: false
});
 

$('#my-table_filter').hide();
    

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
Listall allval =new Listall();
try
{
List<Allvalues> listal=allval.alllist();
request.setAttribute("listallvalues",listal);
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
	      <h3 class = "panel-title">Traceability</h3>
	   </div>   
	   <div class="panel-body">
            <div class="" style="overflow-x: scroll;" >  
					  <table class="table borderless">
						<thead>
						<tbody>	 
						<tr align="left" id="filter_col1" data-column="0">
						
						<td style="font-weight:bold">MDMCode</td>
						 <td ><input autocomplete="off" type="text"  id="myInputTextField" placeholder="MDM Code"></td>
						 <td style="font-weight:bold">SAPCode</td>
						  <td><input autocomplete="off" type="text"   id="myInputTextField1" placeholder="SAP Code"></td>
					
						</tr>
						 
						 
						 <tr>
						 <td style="font-weight:bold">Description/Name</td>
						 <td ><input autocomplete="off" type="text"   id="myInputTextField2" placeholder="Description/Name"></td>
						 <td style="font-weight:bold">Creator Name</td>
						  <td><input autocomplete="off" type="text"  id="myInputTextField3" placeholder="Creator Name"></td>
						 
						 </tr>
						 
						 <tr>
						 	 <td style="font-weight:bold">Reviewer Name</td>
						 <td ><input autocomplete="off" type="text"   id="myInputTextField5" placeholder="Reviewer Name"></td>
						 	 <td style="font-weight:bold">Approver Name</td>
						  <td><input autocomplete="off" type="text"   id="myInputTextField7" placeholder="Approver Name"></td>
						 
						 </tr>
						
						 
						
						 
						 
						 
						 <tr align="left" id = "filter_col1" data-column="12"><td style="font-weight:bold" align="left" width="1%"> Type </td>
						 <td align ="left" class="tbltd" id="col12_filter">
						 <select id="col12_filter">
							<option value="">Select</option> 
							<option value = "Vendor">Vendor</option>
							<option value = "Customer">Customer</option>
						 </select></td>
						 </tr>
						</tbody>
					  </table>
					  
					  <table id="myTable" class="display table table-responsive" >
						<thead>
								<tr>
									<th>MDM_Code</th>
									<th>SAP_Code</th>
									<th>Name</th>
									<th>Created By</th>
									<th>Created On</th>
									<th>Reviewed By</th>
									<th>Reviewed On</th>
									<th>Approver</th>
									<th>Status</th>
									<th>Approved On</th>
									<th>SAP Status</th>
									<th>Version</th>
									<th>DocumentType</th>  
								</tr>
							</thead>
						 
						   <tbody>
							<c:forEach items="${listallvalues}" var="abcd">
							<tr>
								<td>${abcd.mdmcode}</td> 
								<td>${abcd.sapcode}</td>
								<td>${abcd.name}</td>
								<td>${abcd.createdby}</td>
								<td>${abcd.createdon}</td>
								<td>${abcd.reviewedby}</td>
								<td>${abcd.reviewedon}</td>
								<td>${abcd.approver}</td>
								<td>${abcd.status}</td>
								<td>${abcd.approvedon}</td>
								<td>${abcd.sapstatus}</td>
								<td>${abcd.version}</td>
								<td>${abcd.documenttype}</td>	  	</tr>
							</c:forEach>                   
							  
						</tbody>
						</table>



  
  
			</div>
		</div>
  
</div>

</div>

</body>
</html>







