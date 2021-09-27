package com.tvs.accounting.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.tvs.accounting.Accounting;
import com.tvs.accounting.AccountingDAO;
import com.tvs.accounting.CheckDuplicateDAO;
import com.tvs.costing.CostingDAO;

@WebServlet("/Accountingsave")
public class AccountingSave extends HttpServlet {
	static final Logger logger = Logger.getLogger(AccountingSave.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException 
			{  			
		
		        PrintWriter out=response.getWriter();
				HttpSession session = request.getSession(false);	
				if(session!=null)
				{
				String createdby=(String)session.getAttribute("username");		   
				String tcode= request.getParameter("MDMCode");
				Integer mdmcode=Integer.parseInt(tcode);//mdm code
				String materialcode =request.getParameter("matcode");//materialcode
				String mddesc=request.getParameter("MDesc");  //material description
				String plant=request.getParameter("plant");//plantcode
				String plantdesc=request.getParameter("plantdesc");//plant description
				String materialtype=request.getParameter("mattype");
                String materialtypes[]=materialtype.split("-");
                String materialtypecode=materialtypes[1] ; //MaterialtypeCode
				String materialtypedesc=materialtypes[0];  ////Materialtype description
				String valcls=request.getParameter("ValuationClassid");
				
				 logger.debug("valucation class id value: "+valcls);
				Integer valuationcode= null;//Integer.parseInt(valcls); 
				
				if(valcls != null && valcls != ""  ){
					logger.info("setting the value for valuation class code-start");
					valuationcode= Integer.parseInt(valcls); 
					 logger.debug("valucation class id value(integer): "+valuationcode);
					}
//valation class code
				String valuationdesc=request.getParameter("ValuationClass");////valation class description

				String priceControlcode=null;
				String priceControldesc=null;
				String prc =request.getParameter("PriceControl");
				 logger.debug("PriceControl value before split: "+prc);
				if(prc!=null){
					logger.debug("splitting price control" );
					String prctl[]=prc.split("-");
					 priceControlcode=prctl[1];//price controll code
					 priceControldesc=prctl[0];//pricecontroll desc
					 logger.debug("PriceControl code value: "+priceControlcode);
					 logger.debug("PriceControl code value: "+priceControldesc);


				}
				
				

				String hsncode =request.getParameter("HSNCode");  
				String valuationCatcode=null;
				String valuationCatdesc=null;
				String vcat =request.getParameter("ValuationCat"); 
				 logger.debug("ValuationCat value before split: "+vcat);

				if(vcat!=null){
					String vc[]=vcat.split("@");
					 valuationCatcode=vc[1]; //valuation cat. code
					 valuationCatdesc=vc[0];// valuation cat description
					 logger.debug("ValuationCat code value: "+valuationCatcode);
					 logger.debug("ValuationCat desc value: "+valuationCatdesc);

				}
				
				
				
				
				String pdetm =request.getParameter("Pricedetermination"); //price determination
				
				
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
				
				
				Accounting s=new Accounting();
				
				logger.info("setting the value using setter method-started");
				s.setMdmcode(mdmcode);
				
				s.setMaterialcode(materialcode);
				s.setDescription(mddesc);
				
				s.setMaterialtypecode(materialtypecode);
				s.setMaterialtypedesc(materialtypedesc);
				
				s.setPlantcode(plant);
				s.setPlantdesc(plantdesc);
				s.setValuationcode(valuationcode);
				s.setValuationdesc(valuationdesc);
				s.setValuationCatcode(valuationCatcode);
				s.setValuationCatdesc(valuationCatdesc);
				s.setPriceControlcode(priceControlcode);
				s.setPriceControldesc(priceControldesc);
				s.setPriceDeterminationcode(pdetm);
				s.setHsncode(hsncode);				
				s.setCreatedby(createdby);
				s.setStatus(stus);
				s.setApprovalprocess("Pending");
				
				logger.info("setting the value using setter method-completed");
				if(CheckDuplicateDAO.check(mdmcode,plant))
				{
					logger.info("mdmcode-plant unique checking");
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('record already exists');");
					   out.println("</script>");
					   RequestDispatcher rd=request.getRequestDispatcher("Accounting.jsp");  
					   rd.include(request, response);  
					
				}
				
				else
				{
					logger.info("Accounting DAO-Insert-start");
					int status=AccountingDAO.insert(s);
					logger.info("Accounting DAO-Insert-completed");
					if(stus.equals("Inactive") )
					{
						stus="Submit";
						s.setStatus(stus);
						logger.info("Accounting Audit-DAO-Insert-start");
					    int sss=AccountingDAO.insertaudit(s);
					    logger.info("Accounting Audit-DAO-Insert-start");
					    		
					}
				
				
				
				if(status>0  && btnStatus.equals("Save"))
				{
					  out.println("<script type=\"text/javascript\">");
					   out.println("alert('Record Saved Sucessfully');");
					   out.println("</script>");
				 
				   RequestDispatcher rd=request.getRequestDispatcher("Accounting.jsp");  
				   rd.include(request, response);
				   logger.info("saved sucessfully");
				}
				
				else if(status>0 && btnStatus.equals("Submit"))
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Record submitted sucessfully');");
					   out.println("</script>");	    
					   RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
					   rd.include(request, response); 
					   logger.info("submitted sucessfully");
				}
				else
				{
					 out.println("<script type=\"text/javascript\">");
					   out.println("alert('Unable to save');");
					   out.println("</script>");
				 
				   RequestDispatcher rd=request.getRequestDispatcher("Accounting.jsp");  
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
