package com.tvs.mrp.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.mrp.CheckDuplicateDAO;
import com.tvs.mrp.Mrp;
import com.tvs.mrp.MrpDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;







@WebServlet("/MrpSave")
public class MrpSave extends HttpServlet 
{  
	private static final long serialVersionUID = 1L;

public void doPost(HttpServletRequest request, HttpServletResponse response)  
       throws ServletException, IOException {  
 
	PrintWriter out =response.getWriter();
	String createdby = null;
	HttpSession session = request.getSession(false);
	if(session!=null)
	{
		String Userid = (String) session.getAttribute("userid");
		User uu = UserDAO.getUsernameRoleByUserId(Userid); // username
		createdby = uu.getUsername();// createdby

	}

	if (createdby != null  )
	{	
		//String createdby=(String)session.getAttribute("username");
		String tcode= request.getParameter("MDMCode"); 
		Integer ttcode=Integer.parseInt(tcode);
    
	String materialcode =request.getParameter("matcode");  //materialcode
	String materialdesc=request.getParameter("MDesc");  //Materialdesc
	
	String materialtype=request.getParameter("mattype");
	
	String materialtypes[]=materialtype.split("-");
	
	
	String materialtypecode=materialtypes[0] ; //MaterialtypeCode
	String materialtypedesc=materialtypes[0]+"-"+materialtypes[1];  //Material type Description
	
	
	String plantcode=request.getParameter("plant");  //plantcode
	String plantdesc=request.getParameter("plantdesc");  //plantdesc
	
	 
	
	String mrpgroupcode=request.getParameter("Mrpgroupid");  //Mrpgroup code
	String mrpgroupdesc=request.getParameter("Mrpgroup");//mrpgroupdescription
	
	String abcindicatorcode=request.getParameter("ABCIndicatorid");  //ABCIndicator code
	String abcindicatordesc=request.getParameter("ABCIndicator");//ABCIndicator description
	
	String mrptypecode=request.getParameter("MrpTypeid");  //MrpType code
	String mrptypedesc=request.getParameter("MrpType");//mrptype description
	
	String rpoint=request.getParameter("recordpoint");
	
	Integer recoderpoint=null;
	if (rpoint != null && rpoint.length() > 0)
	{
		 recoderpoint=Integer.parseInt(rpoint);//recordpoint	
	}
	String mrpcontrollercode=request.getParameter("MrpControllerid"); //MrpController code 
	String mrpcontrollerdesc=request.getParameter("MrpController");//mrpcontrollerdesc
	
	String lotsizingcode=request.getParameter("LotSizingProcedureid");  //LotSizingProcedure code
	String lotsizingdesc=request.getParameter("LotSizingProcedure");//description
	
	String minslotsize=request.getParameter("minlotsize");  //minlotsize
	String maxstocklevel=request.getParameter("maxstocklevel");//maxstocklevel
	
	String ascrap=request.getParameter("assemblyscrap");	
	Integer assemblyscrap=null;
	if (ascrap != null && ascrap.length() > 0) {	
	 assemblyscrap=Integer.parseInt(ascrap);//assemblyscrap
	
	}
	
	String procurementtypecode=request.getParameter("ProcurementTypeid"); //ProcurementType code 
	String procurementtypedesc=request.getParameter("ProcurementType");//ProcurementType description
	
	String specialprocurementcode=request.getParameter("SpecialProcurementKeyid"); //SpecialProcurementKey code 
	String specialprocurementdesc=request.getParameter("SpecialProcurementKey");//SpecialProcurementdescription
	
	
	String productionstoragelocationcode=request.getParameter("ProductionStorageLocid");  //ProductionStorageLoc code
	String productionstoragelocationdesc=request.getParameter("ProductionStorageLoc");//ProductionStorageLoc description
	
	String backflushcode=request.getParameter("BackFlushid");  //BackFlush code
	String backflushdesc=request.getParameter("BackFlush");//BackFlushdescription
	
	String inhouseproduction=request.getParameter("inhouseproduction");  //inhouseproduction
	
	String coprod =request.getParameter("CoProduct");//coproduct
	
	Boolean coproduct =false;
	if(coprod !=null && coprod.length() > 0){      
		coproduct=true;  
	}
	
	
	String  schedmarginkey=request.getParameter("SchedMarginKey");//SchedMarginKeycode-description same
	String pdeltime=request.getParameter("planneddelivtime");
	Integer plantdeliverytime=null;
	if (pdeltime != null && pdeltime.length() > 0) {
		 plantdeliverytime=Integer.parseInt(pdeltime);//planneddelivtime	
	}
	
	String saftystock=request.getParameter("safetystock");  //safetystock
	String minsaftystock=request.getParameter("minsafetystock");//minsafetystock
	
	
	String strategygroupcode=request.getParameter("StrategyGroupid");  //StrategyGroup code
	String strategygroupdesc=request.getParameter("StrategyGroup");//StrategyGroup description
	
	String bwdconsup=request.getParameter("bwdconsumptionper");
	Integer bwdconsumption=null;
	if (bwdconsup != null && bwdconsup.length() > 0) {
		 bwdconsumption=Integer.parseInt(bwdconsup);//bwdconsumptionper
	}	
	String consumptionmodecode=request.getParameter("ConsumptionModeid");  
	String consumptionmodedesc=request.getParameter("ConsumptionMode");//ConsumptionMode description
	
	String mixedmrpcode=request.getParameter("MixedMRPid");  //MixedMRP code
	String mixedmrpdesc=request.getParameter("MixedMRP");//MixedMRP description
	
	
	String fwdconsump=request.getParameter("fwdconsumptionper");
	Integer fwdconsumptionper=null;
	if (fwdconsump != null && fwdconsump.length() > 0) {
	 fwdconsumptionper=Integer.parseInt(fwdconsump);//fwdconsumptionper	
	}
	
	String totalrepll=request.getParameter("Totreplleadtime");
	Integer totalreplleadtime=null;
	if (totalrepll != null && totalrepll.length() > 0) {
	 totalreplleadtime=Integer.parseInt(totalrepll);//Totreplleadtime
	}	
	
	String availitycheckcode=request.getParameter("AvailabilityCheckid");
	String availitycheckdesc=request.getParameter("AvailabilityCheck");//AvailabilityCheck description
	
	String individualcollcode=request.getParameter("Individuallcollid");//code
	
	String individualcolldesc=request.getParameter("Individuallcoll");//Individuallcoll description
	
	String compscrap=request.getParameter("componentscrap");
	Integer componenetscrap=null;
	if (compscrap != null && compscrap.length() > 0) {
	componenetscrap=Integer.parseInt(compscrap);//componentscrap	
	}	
	
	
	String  remprofilecode=request.getParameter("REMProfileid");//REMProfile code
	String remprofiledesc=request.getParameter("REMProfile");  //REMProfiledesc
	
	String repmfg=request.getParameter("Repetativemfg");//Repetativemfg
	
	
	
	Boolean repetativemfg =false;
	if(repmfg !=null && repmfg.length() > 0){      
		repetativemfg=true;  
	}
	
	String status=request.getParameter("unitweight");// no as per now
	String btnStatus= request.getParameter("Save"); 
	if(btnStatus == null){
		btnStatus=request.getParameter("Submit");	
	}
	String stus=null;
	if(btnStatus.equals("Save")){	
		stus="Draft";
	}
	else{
		
		stus="Inactive";
	}
	
	
	
	
	Mrp m =new Mrp();
	
	
	m.setMdmcode(ttcode);
	m.setMaterialcode(materialcode);
	m.setMaterialcodedesc(materialdesc);
	m.setMaterialtypecode(materialtypecode);
	m.setMaterialtypedesc(materialtypedesc);
	
	m.setPlantcode(plantcode);
	m.setPlantdesc(plantdesc);
	m.setMrpgroupcode(mrpgroupcode);
	m.setMrpgroupcodedesc(mrpgroupdesc);
	m.setAbcindicatorcode(abcindicatorcode);
	m.setAbcindicatorcodedesc(abcindicatordesc);
	m.setMrptypecode(mrptypecode);
	m.setMrptypedesc(mrptypedesc);
	m.setReorderpoint(recoderpoint);
	m.setMrpcontrollercode(mrpcontrollercode);
	m.setMrpcontrollercodedesc(mrpcontrollerdesc);
	m.setLotsizingcode(lotsizingcode);
	m.setLotsizingdesc(lotsizingdesc);
	
	m.setMinlotsize(minslotsize);
	m.setMaximamstocklevel(maxstocklevel);
	m.setAssemblyscrap(assemblyscrap);
	m.setProcurementtypecode(procurementtypecode);
	m.setProcurementtypecodedesc(procurementtypedesc);
	m.setSpecialprocurementcode(specialprocurementcode);
	m.setSpecialprocurementcodedesc(specialprocurementdesc);
	m.setProductionstoragelocationcode(productionstoragelocationcode);
	m.setProductionstoragelocationdesc(productionstoragelocationdesc);
	
	m.setBackflushcode(backflushcode);
	m.setBackflushdesc(backflushdesc);
	m.setInhouseproduction(inhouseproduction);
	m.setCoproduct(coproduct);
	m.setSchedmarginkey(schedmarginkey);
	m.setPlanneddeliverytime(plantdeliverytime);
	m.setSaftystock(saftystock);
	m.setMinsaftystock(minsaftystock);
	m.setStrategygroupcode(strategygroupcode);
	m.setStrategygroupdesc(strategygroupdesc);
	m.setBwdconsumptionper(bwdconsumption);
	
	m.setConsumptionmodecode(consumptionmodecode);
	m.setConsumptionmodedesc(consumptionmodedesc);
	m.setMixedmrpcode(mixedmrpcode);
	m.setMixedmrpdesc(mixedmrpdesc);
	
	m.setForwardconsumptionper(fwdconsumptionper);
	m.setTotalrepleadtime(totalreplleadtime);
	
	m.setAvailabilitycheckcode(availitycheckcode);
	m.setAvailabilitycheckdesc(availitycheckdesc);
	m.setIndividualcallcode(individualcollcode);
	m.setIndividualcalldesc(individualcolldesc);
	m.setComponenetscrap(componenetscrap);
	m.setRemprofilecode(remprofilecode);
	m.setRemprofiledesc(remprofiledesc);
	m.setRepetativemfg(repetativemfg);
	m.setStatus(stus);
	m.setCreatedby(createdby);
	m.setApprovalprocess("Pending");
	
	
	if(CheckDuplicateDAO.check(ttcode,plantcode))
	{
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('record already exists');");
		   out.println("</script>");
		   RequestDispatcher rd=request.getRequestDispatcher("MRP.jsp");  
		   rd.include(request, response);  
		
	}
	
	else
	{
		
	
	
	int statu=MrpDAO.insert(m); 
	
	
	if(statu>0 && btnStatus.equals("Save"))
	{
	    
		out.println("<script type=\"text/javascript\">");
		   out.println("alert('Record saved sucessfully');");
		   out.println("</script>");
	RequestDispatcher rd=request.getRequestDispatcher("MRP.jsp");  
	rd.include(request, response);
	}
	
	
	else if(statu>0 && btnStatus.equals("Submit"))
	{
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('Record submitted sucessfully');");
		   out.println("</script>");	    
		   RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
		   rd.include(request, response); 
		
	}
	
	else
	{
		out.println("<script type=\"text/javascript\">");
		   out.println("alert('Unable to save');");
		   out.println("</script>");
	
	RequestDispatcher rd=request.getRequestDispatcher("MRP.jsp");  
	rd.include(request, response);
	}
	}
    }//if close
    
    else
    {
   	           out.println("<script type=\"text/javascript\">");
			   out.println("alert('Session timeout!');");
			   out.println("window.parent.location.href= \"Login.jsp\"");
			   out.println("</script>");	    
			  // RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
			 //  rd.include(request, response);  
    }	

   }  
}
         