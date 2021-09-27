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


import com.tvs.accounting.Accounting;
import com.tvs.accounting.AccountingDAO;
import com.tvs.accounting.CheckDuplicateDAO;

@WebServlet("/Accountingupdate")
public class AccountingUpdate extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException 
			{  				PrintWriter out=response.getWriter();
				HttpSession session = request.getSession(false);		
				if(session!=null)
				{
				String modifiedby=(String)session.getAttribute("username");		   
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
				Integer valuationcode= null;//Integer.parseInt(valcls); 
				if(valcls!=null && !valcls.isEmpty()){
					valuationcode= Integer.parseInt(valcls); 
					}
//valation class code
				String valuationdesc=request.getParameter("ValuationClass");////valation class description
				String priceControlcode=null;
				String priceControldesc=null;
				String prc =request.getParameter("PriceControl");
				if(prc!=null){
					String prctl[]=prc.split("-");
					 priceControlcode=prctl[1];//price controll code
					 priceControldesc=prctl[0];//pricecontroll desc
				}

				
				String hsncode =request.getParameter("HSNCode");  
			
				
				
				String valuationCatdesc =request.getParameter("ValuationCat"); 
				String valuationCatcode =request.getParameter("ValuationCatid"); 

				
				
				
				String pdetm =request.getParameter("HSw"); //price determination

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
				s.setCreatedby(modifiedby);
				s.setStatus(stus);
				s.setApprovalprocess("Pending");
				s.setReasonforrejection(null);
				
				int status=AccountingDAO.Update(s);
				if(stus.equals("Inactive") )
				{
					stus="Submit";
					s.setStatus(stus);
				    int sss=AccountingDAO.insertaudits(s);
				    		
				}
				if(status>0 && btnStatus.equals("Save"))
				{
					  out.println("<script type=\"text/javascript\">");
					   out.println("alert('Record Saved Sucessfully');");
					   out.println("</script>");
				 
				   RequestDispatcher rd=request.getRequestDispatcher("Accounting.jsp");  
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
				 
				   RequestDispatcher rd=request.getRequestDispatcher("Accounting.jsp");  
				   rd.include(request, response);
					
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
