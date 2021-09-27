package com.tvs.Purchase.controller;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.Purchase.CheckDuplicateDAO;
import com.tvs.Purchase.Purchase;
import com.tvs.Purchase.PurchaseDAO;

import com.tvs.scrbasic.SRCBasicDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;


@WebServlet("/Purchasesave")
public class Purchasesave extends HttpServlet 


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
		//String createdby=(String)session.getAttribute("username");//createdby
	    String tcode= request.getParameter("MDMCode");  
	    Integer ttcode=Integer.parseInt(tcode);//mdmcode    
		String materialcode=request.getParameter("matcode");  //MaterialCode
		String materialcodedesc=request.getParameter("MDesc"); //MaterialDescription	
		String materialtype=request.getParameter("mattype");	
		String materialtypes[]=materialtype.split("-");	
		String materialtypecode=materialtypes[0] ; //MaterialtypeCode
		String materialtypedesc=materialtypes[0]+"-"+materialtypes[1];  //Material type Description		
		String plant=request.getParameter("plant");  //plantcode
		String plantdesc=request.getParameter("plantdesc");  //plantdesc plantdesc	
		String purchasinggroup=request.getParameter("PurchasingGroupid");	
		String purchasinggroupdesc=request.getParameter("PurchasingGroup");
		String purchasingvaluekey=request.getParameter("PurchaseKeyVal");  //purchasekeyval	
		//form 2 parameters
		String mins = request.getParameter("minshelf"); //minshelf
		Integer minshelf=null;
		if(mins.isEmpty())
		{
			 minshelf=null;
		}
		else
		{
			 minshelf =Integer.parseInt(request.getParameter("minshelf")); //minshelf
		}
		String  totals =request.getParameter("totalshelf"); //totalshelf
		 Integer totalshelf=null;
		 if(totals.isEmpty())
		 {
			 totalshelf=null;
		 }
		 
		 else
		 {
			 totalshelf =Integer.parseInt(request.getParameter("totalshelf")); //totalshelf
		 }
		String storagebin=request.getParameter("storagebin");  //storagebin
		String profitcentercode=request.getParameter("ProfitCenteid");  //profitcentercode
		String profitcenterdesc=request.getParameter("ProfitCentedec");  //profitcenterdesc
		String serialnoprofile=request.getParameter("SerialNoid");  //serialnoprofile
		String serialnoprofiledesc=request.getParameter("SerialNo"); 
		String unitofissue=request.getParameter("UintID"); 
		String unitofissuedesc=request.getParameter("UnitDesc");  //unitofissuedesc
		//String profitdesc=request.getParameter("ProfitCentedec");
		// new parameters from form 
		
	
		String ff= request.getParameter("ptime");
		Integer grprocessingtime=null;
		
		if(ff.isEmpty())
		{
			 grprocessingtime=null;
	
		}
		
		else
		{
			 grprocessingtime= Integer.parseInt(request.getParameter("ptime"));  //grprcessingtime	
	
			
		}
		String orderunit=request.getParameter("OrderUnitid");  //orderunit
		String orderunitdesc=request.getParameter("OrderUnit");  //orderunitdesc	
		String model=request.getParameter("Modelid");  //model
		String modeldesc=request.getParameter("Model");  //modeldescription	
		String potext=request.getParameter("potext");  //potext	
		
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
		
		Purchase p=new Purchase();	
		p.setCreatedby(createdby);
		p.setMdmcode(ttcode);
		p.setMaterialcode(materialcode);
		p.setMaterialcodedesc(materialcodedesc);
		p.setMaterialtypecode(materialtypecode);
		p.setMaterialtypedesc(materialtypedesc);
		p.setPlantcode(plant);
		p.setPlantcodecodedesc(plantdesc);
		p.setPurchasegroup(purchasinggroup);
		p.setPurchasegroupdesc(purchasinggroupdesc);
		p.setPurchasekeyvalue(purchasingvaluekey);
		p.setGrprocessingtime(grprocessingtime);
		p.setOrderunit(orderunit);
		p.setOrderunitdesc(orderunitdesc);
		p.setModel(model);
		p.setModeldesc(modeldesc);
		p.setPotext(potext);
		p.setStatus(stus);
		p.setApprovalprocess("Pending");
		// new parameters from form 2
		p.setminshelf(minshelf);
		p.settotalshelf(totalshelf);
		p.setstoragebin(storagebin);
		p.setprofitcentercode(profitcentercode);
		p.setprofitcenterdesc(profitcenterdesc);
		p.setserialnoprofile(serialnoprofile);
		p.setserialnoprofiledesc(serialnoprofiledesc);
		p.setunitofissue(unitofissue);
		p.setunitofissuedesc(unitofissuedesc);
		//p.setprofitdesc(profitdesc);
		// new parameters from form 2
		
		if(CheckDuplicateDAO.check(ttcode,plant))
	    {
	  	
		   out.println("<script type=\"text/javascript\">");
		   out.println("alert('record already exists');");
	       out.println("</script>");
		    RequestDispatcher rd=request.getRequestDispatcher("Purchasing_Plant_Storage_View.jsp");  
		    rd.include(request, response); 
	   } 
		else
		{
		int status=PurchaseDAO.insert(p);	
		
		if(stus.equals("Inactive") )
		{
			stus="Submit";
			p.setStatus(stus);
	        int sss=PurchaseDAO.insertaudit(p);
		}
		
		if(status>0 && btnStatus.equals("Save"))
		{
			   out.println("<script type=\"text/javascript\">");
			   out.println("alert('Record saved sucessfully');");
			   out.println("</script>");	    
			   RequestDispatcher rd=request.getRequestDispatcher("Purchasing_Plant_Storage_View.jsp");  
			   rd.include(request, response);  	 
		}	
		else if(status>0 && btnStatus.equals("Submit"))
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
			   out.println("alert('unable to save');");
			   out.println("</script>");	 
			   RequestDispatcher rd=request.getRequestDispatcher("Purchasing_Plant_Storage_View.jsp");  
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
         