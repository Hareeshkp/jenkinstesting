<%@page import="com.tvstyres.customer.model.Customer"%>
<%@page import="com.tvstyres.customer.dao.CustomerDAO"%>
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


String mincust=request.getParameter("mincust");
String maxcust=request.getParameter("maxcust");
String sapcust =request.getParameter("sapcust");
String name=request.getParameter("name");
String legalname =request.getParameter("legalname");
String createdby=request.getParameter("createdby");
String reviewedby =request.getParameter("reviewedby");
String approvedby=request.getParameter("approvedby");
String modifiedby =request.getParameter("modifiedby");
String gstno=request.getParameter("gstno");
String panno =request.getParameter("panno");
String country=request.getParameter("country");
String state =request.getParameter("state");
String customergroup=request.getParameter("customergroup");



String mincreated=request.getParameter("mincreated");
String maxcreated =request.getParameter("maxcreated");

String minmodified=request.getParameter("minmodified");
String maxmodified =request.getParameter("maxmodified");

String minreviewed=request.getParameter("minreviewed");
String maxreviewed =request.getParameter("maxreviewed");


String minapproved=request.getParameter("minapproved");
String maxapproved =request.getParameter("maxapproved");

String distchannel=request.getParameter("distchannel");
String division =request.getParameter("division");

String customerclasific=request.getParameter("customerclasific");
String salesdist =request.getParameter("salesdist");


String minsalesoffice=request.getParameter("minsalesoffice");
String maxsalesoffice =request.getParameter("maxsalesoffice");

String minsalesgroup=request.getParameter("minsalesgroup");
String maxsalesgroup =request.getParameter("maxsalesgroup");















if(minsalesoffice.equals("Select"))
{
	minsalesoffice="1";
}
if(maxsalesoffice.equals("Select"))
{
	maxsalesoffice="9999";
}

if(minsalesgroup.equals("Select"))
{
	minsalesgroup="1";
}
if(maxsalesgroup.equals("Select"))
{
	maxsalesgroup="9999";
}

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


if(mincust!=null && mincust!="" && !mincust.isEmpty())
{
 minmdm=Integer.parseInt(mincust);
}

else
{
	minmdm=1;
}

if(maxcust!=null && maxcust!="" && !maxcust.isEmpty())
{
 maxmdm=Integer.parseInt(maxcust);
}
else
{
	maxmdm=1000000;
}



String sapcustomercode=null;
if(sapcust.isEmpty())
{
	sapcustomercode="Select";
}
else
{
	sapcustomercode=sapcust;
}

String name1=null;
if(name.isEmpty())
{
	name1="Select";
}
else
{
	name1=name;
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
CustomerDAO cd =new CustomerDAO();

try
{

	List<Customer> listc=cd.alllist(minmdm, maxmdm, sapcustomercode, name1, legalname1, createdby1, modifiedby1, reviewedby1, approvedby1, gstno1, panno1, country, state, customergroup, mincreated, maxcreated, minmodified, maxmodified, minreviewed, maxreviewed, minapproved, maxapproved, distchannel, division, customerclasific, salesdist, minsalesoffice, maxsalesoffice, minsalesgroup, maxsalesgroup);
	request.setAttribute("listallvalue",listc);
}
catch(Exception e)
{
	
}




%>


<div class="col-md-1">
</div>
<div class="col-md-12">
<div class="table-responsive"><br>
<table id="myTable" class="display table table-responsive" >
						<thead>
								<tr>
<th>MDMCode</th>
<th>SAPCode</th>
<th>VendorGroup</th>
<th>Title</th>
<th>Name</th>
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

<th>Dist.Channel </th> 
<th>Division </th> 
<th>SalesDistrict </th>
<th>AccountAssignmentGp. </th>
<th>Cust.PriceProcedure </th> 
<th>CustomerStats.Group</th> 
<th>Incoterm </th> 
<th>Inco.Location1 </th>
<th>DeliveryPriority </th>
<th>ShippingCondition</th> 
<th>PriceGroup</th> 
<th>PriceList </th> 
<th>SalesOffice </th> 
<th>SalesGroup </th> 
<th>Currency </th> 
<th>CustomerClassific </th> 
<th>ActivityCode </th> 
<th>PaymentTerm </th> 
<th>GSTNo </th> 
<th>PANNo</th> 
<th>G/LCode </th> 
<th>CustomerGroup1</th> 
<th>CustomerGroup2</th> 
<th>CustomerGroup3</th> 
<th>CustomerGroup4</th> 
<th>CustomerGroup5</th>
<th>CustomerGroup6</th> 
<th>ConditionGroup1 </th> 
<th>ConditionGroup2 </th> 
<th>ConditionGroup3</th> 
<th>ConditionGroup4 </th> 
<th>ConditionGroup5 </th> 
<th>Continent</th>
<th>Attribute2</th> 
<th>Attribute3</th>
<th>Attribute4 </th>
<th>Attribute5</th>
<th>Attribute6 </th> 
<th>Attribute7 </th> 
<th>Attribute8 </th>
<th>Attribute9 </th> 
<th>Attribute10 </th> 
<th>Status </th> 
<th>CreatedBy </th> 
<th>CreatedDate </th> 
<th>ModifiedBy </th> 
<th>ModifiedDate </th> 
<th>ReviewedBy </th> 
<th>ReviewedDate </th> 

<th>ApprovedBy </th> 
<th>ApprovedDate </th>
<th>ApprovalStatus </th> 
<th>ReasonForEdit </th> 
<th>ReasonForReject </th> 
<th>ReasonForBlock </th> 
<th>Block </th> 
<th>Version </th> 
<th>ReviewerUsername </th> 
								</tr>
							</thead>
						 
						   <tbody>
							<c:forEach items="${listallvalue}" var="abcd">
							<tr>
								<td>${abcd.mdm_customer_code}</td> 
								<td>${abcd.sap_customer_code}</td>
								<td>${abcd.customer_group_desc}</td> 
								<td>${abcd.title_desc}</td>
								<td>${abcd.name}</td> 
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
								
								<td>${abcd.distchannel_desc}</td> 
								<td>${abcd.division_desc}</td>
								<td>${abcd.salesdict_desc}</td> 
								<td>${abcd.accountassigngrp_desc}</td>
								<td>${abcd.custpriceproc_desc}</td> 
								<td>${abcd.custstatsgrp_desc}</td>
								<td>${abcd.incoterm_desc}</td> 
								<td>${abcd.inco_location1}</td>
								<td>${abcd.delivery_priority_desc}</td> 
								<td>${abcd.shipping_cond_desc}</td>
								<td>${abcd.pricegrp_desc}</td>
								<td>${abcd.pricelist_desc}</td> 
								
								
		
								
								<td>${abcd.salesoffice_desc}</td>
								<td>${abcd.salesgroup_desc}</td> 
								<td>${abcd.currency_desc}</td> 
								<td>${abcd.custemer_clasific_desc}</td>
								
								
								
								<td>${abcd.activity_code_desc}</td> 
								<td>${abcd.payment_term_desc}</td>
								<td>${abcd.gstno}</td> 
								<td>${abcd.panno}</td> 
								<td>${abcd.glcode}</td>
								
								<td>${abcd.customer_group1_desc}</td>
								<td>${abcd.customer_group2_desc}</td>
								<td>${abcd.customer_group3_desc}</td>
								<td>${abcd.customer_group4_desc}</td>
								<td>${abcd.customer_group5_desc}</td>
								<td>${abcd.customer_group6_desc}</td>
								
								<td>${abcd.condition_group1_desc}</td>
								<td>${abcd.condition_group2_desc}</td>
								<td>${abcd.condition_group3_desc}</td>
								<td>${abcd.condition_group4_desc}</td>
								<td>${abcd.condition_group5_desc}</td>
								
								<td>${abcd.continent_desc}</td>
								<td>${abcd.attribute2_desc}</td>
								<td>${abcd.attribute3_desc}</td>
								<td>${abcd.attribute4_desc}</td>
								<td>${abcd.attribute5_desc}</td>
								<td>${abcd.attribute6_desc}</td>
								<td>${abcd.attribute7_desc}</td>
								<td>${abcd.attribute8_desc}</td>
								<td>${abcd.attribute9_desc}</td>
								<td>${abcd.attribute10_desc}</td>
								
								<td>${abcd.status}</td>
								<td>${abcd.created_by}</td> 
									<td>${abcd.created_date}</td> 
								<td>${abcd.modified_by}</td> 
								<td>${abcd.modified_date}</td> 
								<td>${abcd.reviewed_by}</td>
								<td>${abcd.reviewed_date}</td> 
								<td>${abcd.approved_by}</td> 
								<td>${abcd.approved_date}</td> 
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







