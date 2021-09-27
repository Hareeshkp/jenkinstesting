package com.tvs.costing.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.costing.CheckDuplicateDAO;
import com.tvs.costing.Costing;
import com.tvs.costing.CostingDAO;
import com.tvs.mrp.MrpDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;

@WebServlet("/CostingSave")
public class CostingSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
	throws ServletException, IOException 
	{  
		
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
				
				Integer mdmcode=Integer.parseInt(tcode);
				    
				String materialcode =request.getParameter("matcode");
				String mddesc=request.getParameter("MDesc");  
				  //Material type Id
				String materialtype=request.getParameter("mattype");
				String materialtypes[]=materialtype.split("-");
				String materialtypecode=materialtypes[0] ; //MaterialtypeCode
				String materialtypedesc=materialtypes[0]+"-"+materialtypes[1];  //Material type Description	
				String plant=request.getParameter("plant");
				String plantdesc=request.getParameter("plantdesc");
				String overheaddesc=request.getParameter("OverheadGroup");  
				String overheadcode=request.getParameter("OverheadGroupid");  
				
			     String[] chkSms=request.getParameterValues("MateriaCostedlid");
			     Boolean materiaCosted =false;
			     if(chkSms !=null && chkSms.length > 0){      
			    	 materiaCosted=true;  
			     }
				
				
				String variancepdesc=request.getParameter("VarianceKey");
				String variancecode=request.getParameter("VarianceKeyid");  
				
				String costlotsize=request.getParameter("costlotsize"); 
				
				
				
				String[] chksms=request.getParameterValues("MaterialRelatedOriginid");
			     Boolean materelated =false;
			     if(chksms !=null && chksms.length > 0){      
			    	 materelated=true;  
			     }
			     
				
				
				
				//String origingroup=request.getParameter("Origingroup");  //this on split
				
				String  Origingroupdesc=request.getParameter("Origingroup");  
				
				String valuationclassdesc = request.getParameter("ValuationClass");
				String valuationclasscode = request.getParameter("ValuationClassid");
				String pricecontrol[] = request.getParameter("PriceControl").split("-");
				String pricecontrolcode = pricecontrol[1];
				String pricecontroldesc = pricecontrol[0];
						
				String valuationcat = request.getParameter("ValuationCat");
				String valuationcatcode = "";
				String valuationcatdesc = "";
				String hsnw = request.getParameter("HSNCode");
				String pricedetermination =  request.getParameter("Pricedetermination");
				String multiselectvalc[] = request.getParameterValues("multiselectvalc"); 
				String multiselectvaltodb = "";
				if(multiselectvalc!=null && multiselectvalc.length >=1)
				{
					for(int i=0;i<multiselectvalc.length;i++)
					{
						multiselectvaltodb += multiselectvalc[i]+",";
					}
				}
				String[] chkdonotcost=request.getParameterValues("donotcost");
			     Boolean donotcost =false;
			     if(chkdonotcost !=null && chkdonotcost.length > 0){      
			    	 donotcost=true;  
			     }
			    String Specialprocurementcostid = request.getParameter("specialprocurementcostid");
			    String specialprocurementcostdesc = request.getParameter("specialprocurementcost"); 
			    if(valuationcat!=null){
					String vc[]=valuationcat.split("@");
					valuationcatcode=vc[1]; //valuation cat. code
					valuationcatdesc=vc[0];// valuation cat description
				}
				String Origingroupcode= request.getParameter("Origingroupid"); 
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
				
				
				
				Costing s=new Costing();
				
				s.setMdmcode(mdmcode);
				
				s.setMaterialcode(materialcode);
				s.setDescription(mddesc);
				s.setMaterialtypecode(materialtypecode);
				s.setMaterialtypedesc(materialtypedesc);
				
				s.setPlantcode(plant);
				s.setPlantdesc(plantdesc);
				s.setOverheadcode(overheadcode);
				s.setOverheaddesc(overheaddesc);
				s.setMateriaCosted(materiaCosted);
				s.setMaterelated(materelated);
				s.setVariancecode(variancecode);
				s.setVariancepdesc(variancepdesc);
				s.setCostlotsize(costlotsize);
				s.setOrigingroup(Origingroupcode);		
				s.setOrigingroupdesc(Origingroupdesc);
				
				s.setStatus(stus);
				s.setCreatedby(createdby);
				s.setApprovalprocess("Pending");
				//new fields from form2
				//s.setvaluationclasscode(Integer.parseInt(valuationclasscode));
				if(valuationclasscode!=null && valuationclasscode.length() != 0)
				{
					s.setvaluationclasscode(Integer.parseInt(valuationclasscode));
				}
				else
				{
					s.setvaluationclasscode(null);
				}
				s.setvaluationclassdesc(valuationclassdesc);
				s.setpricecontrolcode(pricecontrolcode);
				s.setpricecontroldesc(pricecontroldesc);
				s.setpricedetermination(pricedetermination);
				s.setvaluationcatcode(valuationcatcode);
				s.setvaluationcatdesc(valuationcatdesc);
				s.sethsnw(hsnw);
				s.setmultiselectvalc(multiselectvaltodb);
				s.setspecialprocurementcostcode(Specialprocurementcostid);
				s.setspecialprocurementcostdesc(specialprocurementcostdesc);
				s.setdonotcost(donotcost);
				//
			
				if(CheckDuplicateDAO.check(mdmcode,plant))
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('record already exists');");
					   out.println("</script>");
					   RequestDispatcher rd=request.getRequestDispatcher("Costing_Accounting_View.jsp");  
					   rd.include(request, response);  
					
				}
				
				else
				{
				
				int status=CostingDAO.insert(s);
				
				if(stus.equals("Inactive") )
				{
					stus="Submit";
					s.setStatus(stus);
				    int sss=CostingDAO.insertaudit(s);
				    		
				}
				if(status>0 && btnStatus.equals("Save"))
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Record saved sucessfully');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Costing_Accounting_View.jsp");  
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
					   out.println("alert('Unable to save');");
					   out.println("</script>");
				   RequestDispatcher rd=request.getRequestDispatcher("Costing_Accounting_View.jsp");  
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
