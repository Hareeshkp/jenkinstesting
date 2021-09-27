<%@page import="com.tvstyres.vendor.model.Vendor"%>
<%@page import="com.tvstyres.vendor.dao.VendorDAO"%>
<%@page import="com.tvs.userconsole.Role"%>

<%@page import="com.tvs.userconsole.RoleDAO"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.util.*" %>
              <%@ page import="java.sql.*"%>
      
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

   <script>
$(document).ready(function(){
   // $('#myTable').dataTable();
    $('#myTable').DataTable( {
        "lengthMenu": [[3,10, 25, 50, -1], [3,10, 25, 50, "All"]]
    } );
    
});
</script>
</head>


<body oncontextmenu="return false;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<%
String Userid =(String) request.getAttribute("myTest");


String minven=request.getParameter("minven");
String maxven=request.getParameter("maxven");
String sapcode =request.getParameter("sapven");
String firstname=request.getParameter("firstname");
String legalname =request.getParameter("legalname");
String createdby=request.getParameter("createdby");
String reviewedby =request.getParameter("reviewedby");
String approvedby=request.getParameter("approvedby");
String modifiedby =request.getParameter("modifiedby");
String gstno=request.getParameter("gstno");
String panno =request.getParameter("panno");
String country=request.getParameter("country");
String state =request.getParameter("state");
String vendorgroup=request.getParameter("vendorgroup");
String legalentity =request.getParameter("legalentity");



String mincreated=request.getParameter("mincreated");
String maxcreated =request.getParameter("maxcreated");

String minmodified=request.getParameter("minmodified");
String maxmodified =request.getParameter("maxmodified");

String minreviewed=request.getParameter("minreviewed");
String maxreviewed =request.getParameter("maxreviewed");


String minapproved=request.getParameter("minapproved");
String maxapproved =request.getParameter("maxapproved");


if(mincreated.isEmpty())
{
	mincreated="1900-01-01";
}

if(maxcreated.isEmpty())
{
	maxcreated="9999-01-01";
}

if(minmodified.isEmpty())
{
	minmodified="1900-01-01";
}

if(maxmodified.isEmpty())
{
	maxmodified="9999-01-01";
}

if(minreviewed.isEmpty())
{
	minreviewed="1900-01-01";
}

if(maxreviewed.isEmpty())
{
	maxreviewed="9999-01-01";
}

if(minapproved.isEmpty())
{
	minapproved="1900-01-01";
}

if(maxapproved.isEmpty())
{
	maxapproved="9999-01-01";
}

Integer minmdm=null;
Integer maxmdm=null;


if(minven!=null && minven!="" && !minven.isEmpty())
{
 minmdm=Integer.parseInt(minven);
}

else
{
	minmdm=1;
}

if(maxven!=null && maxven!="" && !maxven.isEmpty())
{
 maxmdm=Integer.parseInt(maxven);
}
else
{
	maxmdm=1000000;
}



String sapvendorcode=null;
if(sapcode.isEmpty())
{
	sapvendorcode="Select";
}
else
{
	sapvendorcode=sapcode;
}

String firstname1=null;
if(firstname.isEmpty())
{
	firstname1="Select";
}
else
{
	firstname1=firstname;
}

String legalname1=null;
if(legalname.isEmpty())
{
	legalname1="Select";
}
else
{
	legalname1=legalname;
}

String gstno1=null;
if(gstno.isEmpty())
{
	gstno1="Select";
}
else
{
	gstno1=gstno;
}

String panno1=null;
if(panno.isEmpty())
{
	panno1="Select";
}
else
{
	panno1=panno;
}

String createdby1=null;
if(createdby.isEmpty())
{
	createdby1="Select";
}
else
{
	createdby1=createdby;
}

String modifiedby1=null;
if(modifiedby.isEmpty())
{
	modifiedby1="Select";
}
else
{
	modifiedby1=modifiedby;
}


String reviewedby1=null;
if(reviewedby.isEmpty())
{
	reviewedby1="Select";
}
else
{
	reviewedby1=reviewedby;
}

String approvedby1=null;
if(approvedby.isEmpty())
{
	approvedby1="Select";
}
else
{
	approvedby1=approvedby;
}

if(Userid==null)
{
%>
	
	<script type="text/javascript">
	alert('Session timeout!');
window.parent.location.href= "Login.jsp";
</script>
	
<% 

}
RoleDAO rd =new RoleDAO();
VendorDAO vd =new VendorDAO();
try
{
List<Role> listal = rd.roledetails();
request.setAttribute("listall",listal);

List<Vendor> listall=vd.alllists(minmdm, maxmdm, sapvendorcode, firstname1, legalname1, createdby1, modifiedby1, reviewedby1, approvedby1, gstno1, panno1, country, state, vendorgroup, legalentity,mincreated,maxcreated,minmodified,maxmodified,minreviewed,maxreviewed,minapproved,maxapproved);
request.setAttribute("listallvalue",listall);


}
catch(Exception e)
{
	
}




%>


<div class="col-md-1">
</div>
<div class="col-md-12">
<div class="table-responsive"><br>

	<table id="myTable" class="display table table-responsive"  >
	<thead>
	    <tr>
				
<th>MDMCode</th>
<th>SAPCode</th>
<th>VendorGroup</th>
<th>Title</th>
<th>FirstName</th>
<th>LastName</th>


 <th>Name2</th>
<th>LegalName</th>
<th>Country</th>
<th>State</th>
<th>HouseNo</th>
<th>Street</th>
<th>Street1</th>
<th>Street2</th>
<th>PinCode</th>
<th>City</th>
<th>FaxNumber</th>

<th>MobileNo</th>
<th>TelephoneNo</th>
<th>EMailId</th>
<th>GST_Fileing</th>
<th>MaterialType</th>
<th>SalesPerson</th>
<th>SalesPersonTeleNo</th>


<th>BankKey</th>
<th>BankName</th>
<th>BankAccountNo</th>
<th>Incoterm</th>
<th>Currency</th>
<th>Payment_Term</th>
<th>Payment_Methods</th>



<th>VendorClass</th>
<th>GSTNo</th>
<th>PANNo</th>
<th>AdhaarNo</th>
<th>GL_Code</th>



<th>Legal_Entity</th>
<th>ID_Type</th>
<th>Identification_Number</th>
<th>Payment_Block</th>
<th>Actual_QM_sys</th>
<th>Inco_Location1</th>

<th>Status</th>
<th>Created_By</th>
<th>Created_Date</th>
<th>Modified_By</th>
<th>Modified_Date</th>
<th>Reviewed_By</th>
<th>Reviewed_Date</th>
<th>Approved_By</th>
<th>Approved_Date</th>
<th>Approval_Status</th>
<th>Reason_For_Edit</th>
<th>Reason_For_Reject</th>
<th>Block</th>
<th>Reason_For_Block</th>
<th>Version</th>
<th>Reviewer_Username</th> 
								</tr>
	    </thead>
	    
	   <tbody>
		  
		 	    	<c:forEach items="${listallvalue}" var="abcd">
							<tr>
								<td>${abcd.mdm_vendor_code}</td> 
								<td>${abcd.sap_vendor_code}</td>
								<td>${abcd.vendor_group_desc}</td> 
								<td>${abcd.title_desc}</td>
								<td>${abcd.firstname}</td> 
								<td>${abcd.lastname}</td>
															 
								
								 <td>${abcd.name2}</td> 
								<td>${abcd.legalname}</td>
								<td>${abcd.country_desc}</td> 
								<td>${abcd.state_desc}</td>
								
								<td>${abcd.houseno}</td> 
								<td>${abcd.street}</td>
								<td>${abcd.street1}</td> 
								<td>${abcd.street2}</td>
								
								<td>${abcd.pincode}</td> 
								<td>${abcd.city}</td>
								<td>${abcd.fax_number}</td> 
								
								<td>${abcd.mobile_no}</td>
								<td>${abcd.telephone_no}</td> 
								<td>${abcd.emailid}</td>
								<td>${abcd.gst_fileing_desc}</td> 
								<td>${abcd.material_type_desc}</td>
								<td>${abcd.sales_person}</td> 
								<td>${abcd.sales_person_tele_no}</td>
								
								
								<td>${abcd.bankkey}</td> 
								<td>${abcd.bankname}</td>
								<td>${abcd.bankaccountno}</td> 
								<td>${abcd.incoterm_desc}</td>
								<td>${abcd.currency_desc}</td> 
								<td>${abcd.paymentterm_desc}</td>
								<td>${abcd.payment_methods}</td>
								
								
								
								
								<td>${abcd.vendorclass_desc}</td> 
								<td>${abcd.gstno}</td>
								<td>${abcd.panno}</td> 
								<td>${abcd.adhaarno}</td> 
								<td>${abcd.glcode}</td>
								
								
								
								<td>${abcd.legal_entity_desc}</td> 
								<td>${abcd.id_type_desc}</td>
								<td>${abcd.identification_no}</td> 
								<td>${abcd.payment_block_desc}</td> 
								<td>${abcd.actual_qm_sys_desc}</td>
								<td>${abcd.inco_location1}</td> 
								
								<td>${abcd.status}</td>
								<td>${abcd.created_by}</td> 
									<td>${abcd.createdbydate}</td>
								<td>${abcd.modified_by}</td> 
								<td>${abcd.modifiedbydate}</td> 
								<td>${abcd.reviewed_by}</td>
								<td>${abcd.reviewedbydate}</td>
								<td>${abcd.approved_by}</td> 
								<td>${abcd.approvedbydate}</td> 
								<td>${abcd.approval_status}</td> 
								<td>${abcd.reason_for_edit}</td> 
								<td>${abcd.reason_for_reject}</td>
								<td>${abcd.block}</td> 
								<td>${abcd.reason_for_block}</td>
								<td>${abcd.version}</td> 
								<td>${abcd.reviewerusername}</td> 
								
								  	</tr>
							</c:forEach>                   
							  
	 
	</tbody>
	</table>
</div>
</div>

</body>
</html>