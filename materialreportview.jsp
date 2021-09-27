<%@page import="com.tvs.scrbasic.Report"%>
<%@page import="com.tvs.scrbasic.SRCBasicDAO"%>
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
        "lengthMenu": [[5,10, 25, 50, -1], [5,10, 25, 50, "All"]]
    } );
    
});
</script>
</head>


<body oncontextmenu="return false;">
<c:set var="myTest" scope="request" value="${sessionScope.userid}"/>
<%
String Userid =(String) request.getAttribute("myTest");


String minmaterialcode=request.getParameter("minmaterialcode");
String maxmaterialcode=request.getParameter("maxmaterialcode");

String minplantcode=request.getParameter("minplantcode");
String maxplantcode=request.getParameter("maxplantcode");


String materialtype=request.getParameter("materialtype");
String materialgroup =request.getParameter("materialgroup");

String purchasinggroup=request.getParameter("purchasinggroup");
String valuationclass =request.getParameter("valuationclass");
;



String createdby=request.getParameter("createdby");
//String reviewedby =request.getParameter("reviewedby");
String approvedby=request.getParameter("approvedby");
String modifiedby =request.getParameter("modifiedby");

String mincreated=request.getParameter("mincreated");
String maxcreated =request.getParameter("maxcreated");

String minmodified=request.getParameter("minmodified");
String maxmodified =request.getParameter("maxmodified");

//String minreviewed=request.getParameter("minreviewed");
//String maxreviewed =request.getParameter("maxreviewed");


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


if(minmaterialcode!=null && minmaterialcode!="" && !minmaterialcode.isEmpty())
{
 minmdm=Integer.parseInt(minmaterialcode);
}

else
{
	minmdm=1;
}

if(maxmaterialcode!=null && maxmaterialcode!="" && !maxmaterialcode.isEmpty())
{
 maxmdm=Integer.parseInt(maxmaterialcode);
}
else
{
	maxmdm=1000000;
}


String minplant=null;
String maxplant=null;


if(minplantcode!=null && minplantcode!="" && !minplantcode.isEmpty())
{
	minplant=minplantcode;
}

else
{
	minplant="1000";
}

if(maxplantcode!=null && maxplantcode!="" && !maxplantcode.isEmpty())
{
	maxplant=maxplantcode;
}
else
{
	maxplant="9999";
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




try
{

	SRCBasicDAO sb =new SRCBasicDAO();
	List<Report> listreport =sb.reportList(minmdm,maxmdm,minplant,maxplant,materialtype,materialgroup,purchasinggroup,valuationclass,createdby1,mincreated,maxcreated,modifiedby1,minmodified,maxmodified,approvedby1,minapproved,maxapproved);
	request.setAttribute("listallvalue", listreport);


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

<th>PLant</th>
<th>Storage</th>
<th>MaterialType</th>
<th>MaterialGroup</th>
<th>MaterialCode</th>
<th>Description</th>
<th>BasicUOM</th>
 <th>AlternativeUOM</th>
<th>Numerator</th>
<th>Denominator</th>
<th>GrossWeight</th>
<th>NetWeight</th>
<th>HSNCode</th>
<th>UnitWeight</th>
<th>Volume</th>
<th>VolumeUnit</th>

<th>PurchasingGroup</th>
<th>GR.ProcessingTime</th>
 <th>PurchasingValueKey</th>
<th>OrderUnit</th>
<th>POText</th>
<th>Model</th>
<th>Min.Rem.ShelfLife</th>
<th>TotalShelfLife</th>
<th>ProfitCentre</th>
<th>StorageBin</th>
<th>UnitofIssue</th>
<th>SerialNumberProfile</th>

<th>MRPGroup</th>
<th>ABCIndicator</th>
 <th>MRPType</th>
<th>RecordPoint</th>
<th>MRPController</th>
<th>LotSizingProcedure</th>
<th>Min.LotSize</th>
<th>MaximumStockLevel</th>
<th>AssemblyScrap(%)</th>
<th>ProcurementType</th>
<th>SpecialProcurementKey</th>
<th>ProductionStorageLocation</th>

<th>BackFlush</th>
<th>In-HouseProduction</th>
 <th>Co-Product</th>
<th>PlannedDeliv.Time</th>
<th>SchedMarginKey</th>
<th>SafetyStock</th>
<th>Min.SafetyStock</th>
<th>StrategyGroup</th>
<th>BwdConsumptionper</th>
<th>ConsumptionMode</th>
<th>MixedMRP</th>

<th>FwdConsumptionper</th>
<th>Tot.repl.leadtime</th>
<th>AvailabilityCheck</th>
<th>Individuallcoll</th>
<th>ComponentScrap(%)</th>
<th>REMProfile</th>
<th>Repetativemfg</th>


<th>SalesOraganization</th>
<th>Dist.channel</th>
<th>Matlstatisticsgroup</th>
<th>Materialpricegroup</th>
<th>Acct.assignmentgrp</th>
<th>Gen.itemcat.group</th>
<th>Itemcategorygroup</th>

<th>Transportation group</th>
<th>LoadingGroup</th>
<th>Delivering plant</th>
<th>Segment</th>
<th>AspectRatio</th>
<th>Application</th>
<th>Polymer</th>
<th>CC</th>



<th>OverheadGroup</th>
<th>CostingLotSize</th>
<th>MaterialIsCostedwithQtyStr.</th>
<th>Material Related Origin</th>
<th>VarianceKey</th>
<th>Origingroup</th>
<th>DoNotCost</th>
<th>SpecialProcurementCost</th>
<th>ValuationClass</th>
<th>HSNCode</th>
<th>PriceControl</th>
<th>Pricedetermination</th>
<th>ValuationCat.</th>



<th>Status</th>
<th>Created_By</th>
<th>Created_Date</th>
<th>Modified_By</th>
<th>Modified_Date</th>
<th>Approved_By</th>
<th>Approved_Date</th>
<th>Approval_Status</th>
<th>Reason_For_Edit</th>
<th>Reason_For_Reject</th>
<th>Block</th>
<th>Reason_For_Block</th>
<th>Version</th>



								</tr>
	    </thead>
	    
	   <tbody>
		  
		 	    	<c:forEach items="${listallvalue}" var="abcd">
							<tr>
								<td>${abcd.talendcode}</td> 
									<td>${abcd.plant}</td> 
								<td>${abcd.storage}</td>
								<td>${abcd.materialtypedesc}</td>
								<td>${abcd.materialgroupdesc}</td> 
								<td>${abcd.materialcode}</td>
								<td>${abcd.description}</td> 
								<td>${abcd.basicuomdesc}</td>
								 <td>${abcd.altuomdesc}</td> 
								<td>${abcd.numerator}</td>
								<td>${abcd.denominator}</td> 
								<td>${abcd.gross}</td>
								<td>${abcd.net}</td> 
								<td>${abcd.hsncode}</td> 
								<td>${abcd.unitweightdesc}</td>
								<td>${abcd.volume}</td> 
								<td>${abcd.volumeUnit}</td>
								
								<td>${abcd.purchasinggroup}</td> 
								<td>${abcd.grprocessingtime}</td> 
								<td>${abcd.purchasekeyvalue}</td>
								<td>${abcd.orderunitdesc}</td> 
								<td>${abcd.potext}</td>
								<td>${abcd.modeldesc}</td> 
								<td>${abcd.minshelf}</td> 
								<td>${abcd.totalshelf}</td>
								<td>${abcd.profitcenterdesc}</td> 
								<td>${abcd.storagebin}</td>
								<td>${abcd.unitofissuedesc}</td> 
								<td>${abcd.serialnoprofiledesc}</td>
								
								<td>${abcd.mrpgroupcodedesc}</td> 
								<td>${abcd.abcindicatorcodedesc}</td> 
								<td>${abcd.mrptypedesc}</td>
								<td>${abcd.reorderpoint}</td> 
								<td>${abcd.mrpcontrollercodedesc}</td>
								<td>${abcd.lotsizingdesc}</td> 
								<td>${abcd.minlotsize}</td> 
								<td>${abcd.maximamstocklevel}</td>
								<td>${abcd.assemblyscrap}</td> 
								<td>${abcd.procurementtypecodedesc}</td>
								<td>${abcd.specialprocurementcodedesc}</td> 
								<td>${abcd.productionstoragelocationdesc}</td>
								
								
								<td>${abcd.backflushdesc}</td> 
								<td>${abcd.inhouseproduction}</td> 
								<td>${abcd.coproduct}</td>
								<td>${abcd.planneddeliverytime}</td> 
								<td>${abcd.schedmarginkey}</td>
								
								<td>${abcd.saftystock}</td> 
								<td>${abcd.minsaftystock}</td>
								<td>${abcd.strategygroupdesc}</td> 
								<td>${abcd.bwdconsumptionper}</td>
								<td>${abcd.consumptionmodedesc}</td> 
								<td>${abcd.mixedmrpdesc}</td>
								<td>${abcd.forwardconsumptionper}</td> 
								<td>${abcd.totalrepleadtime}</td>
								<td>${abcd.availabilitycheckdesc}</td> 
								<td>${abcd.individualcalldesc}</td>
								<td>${abcd.componenetscrap}</td> 
								<td>${abcd.remprofiledesc}</td>
								<td>${abcd.repetativemfg}</td> 
								
								<td>${abcd.slorgdesc}</td> 
								<td>${abcd.dtchdesc}</td>
								<td>${abcd.mtlstatisticsgrpdesc}</td> 
								<td>${abcd.mtlpricegrpdesc}</td>
								<td>${abcd.acassignmentgrpdesc}</td> 
								<td>${abcd.gencatgrpdesc}</td>
								<td>${abcd.itmcatgrpdesc}</td> 
								<td>${abcd.trngrpdesc}</td>
								<td>${abcd.lodgrpdesc}</td> 
								<td>${abcd.delplantdesc}</td>
								<td>${abcd.segmentdescription}</td> 
								<td>${abcd.aspectratiodescription}</td>
								<td>${abcd.applicationdescription}</td> 
								<td>${abcd.polymerdescription}</td>
								<td>${abcd.ccdescription}</td> 
								
								<td>${abcd.overheaddesc}</td> 
								<td>${abcd.costlotsize}</td>
								<td>${abcd.materiaCosted}</td> 
								<td>${abcd.materelated}</td>
								<td>${abcd.variancepdesc}</td> 
								<td>${abcd.origingroupdesc}</td>
								<td>${abcd.donotcost}</td> 
								<td>${abcd.specialprocurementcostdesc}</td>
								<td>${abcd.valuationclassdesc}</td> 
								<td>${abcd.hsnw}</td>
								<td>${abcd.pricecontroldesc}</td> 
								<td>${abcd.pricedetermination}</td>
								<td>${abcd.valuationcatdesc}</td> 
								
								<td>${abcd.status}</td> 
								<td>${abcd.createdby}</td>
								<td>${abcd.createddate}</td> 
								<td>${abcd.modifiedby}</td>
								<td>${abcd.modifieddate}</td> 
								<td>${abcd.approvedby}</td> 
								<td>${abcd.approveddate}</td>
								<td>${abcd.approvalstatus}</td> 
								<td>${abcd.reasonforedit}</td>
								<td>${abcd.reasonforrejection}</td>
								<td>${abcd.block}</td> 
								<td>${abcd.reasonforblock}</td>
								<td>${abcd.version}</td>
								
								
								
								
							
								<%-- <td>${abcd.gstno}</td>
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
								 --%>
								  	</tr>
							</c:forEach>                   
							  
	 
	</tbody>
	</table>
</div>
</div>

</body>
</html>







