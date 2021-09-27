package com.tvs.Sales.Controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.Purchase.PurchaseDAO;
import com.tvs.Sales.CheckDuplicateDAO;
import com.tvs.Sales.Sales;
import com.tvs.Sales.SalesDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;



@WebServlet("/Salessave")
public class SalesSave extends HttpServlet
{
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
			String salesorgdesc=request.getParameter("SalesOraganization");  
			String salesorgcode=request.getParameter("SalesOraganizationid");  
			String matstsgrpdesc=request.getParameter("Matlstatisticsgroup");  //MaterialCode
			String matstsgrpcode=request.getParameter("Matlstatisticsgroupid");
			String assingrpdesc=request.getParameter("Acctassignmentgrp");  
			String assingrpcode=request.getParameter("Acctassignmentgrpid"); 
		
			String itmgrpdesc=request.getParameter("Itemcategorygroup");  
			String itmgrpcode=request.getParameter("Itemcategorygroupid"); 
			String ldgrpdesc=request.getParameter("LoadingGroup");  
			String ldgrpcode=request.getParameter("LoadingGroupid"); 		
			
			String distchdesc=request.getParameter("Distchannel");  
			String distchcode=request.getParameter("Distchannelid"); 
			String mtlgrpdesc=request.getParameter("Materialpricegroup");  
			String mtlgrpcode=request.getParameter("Materialpricegroupid");
			String genitmgrpdesc=request.getParameter("Genitemcatgroup");  
			String genitmgrpcode=request.getParameter("Genitemcatgroupid"); 
			String trangrpdesc=request.getParameter("Transportationgroup");  
			String trangrpcode=request.getParameter("Transportationgroupid");		
			String delgrpdesc=request.getParameter("Deliveringplant");  
			String delgrpcode=request.getParameter("Deliveringplantid"); 
			//new fields
			String segmentcode = request.getParameter("segmentid");
			String segmentdescription = request.getParameter("segment");
			
			String applicationcode = request.getParameter("applicationid");
			String applicationdescription = request.getParameter("application");
			
			String cccode = request.getParameter("ccid");
			String ccdescription = request.getParameter("cc");
			
			String aspectratiocode = request.getParameter("aspectratioid");
			String aspectratiodescription = request.getParameter("aspectratio");
			
			String polymercode = request.getParameter("polymerid");
			String polymerdescription = request.getParameter("polymer");
			//new fields


			
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
			
			Sales s=new Sales();
			
			s.setMdmcode(mdmcode);
			
			s.setMaterialcode(materialcode);
			s.setDescription(mddesc);		
			s.setMaterialtypecode(materialtypecode);	
			s.setMaterialtypedesc(materialtypedesc);		
			s.setPlantcode(plant);
			s.setPlantdesc(plantdesc);
			s.setSlorgcode(salesorgcode);
			s.setSlorgdesc(salesorgdesc);
			s.setDtchcode(distchcode);
			s.setDtchdesc(distchdesc);
			s.setMtlstatisticsgrpcode(matstsgrpcode);
			s.setMtlstatisticsgrpdesc(matstsgrpdesc);
			s.setMtlpricegrpcode(mtlgrpcode);
			s.setMtlpricegrpdesc(mtlgrpdesc);
			s.setAcassignmentgrpcode(assingrpcode);
			s.setAcassignmentgrpdesc(assingrpdesc);
			s.setGencatgrpcode(genitmgrpcode);
			s.setGencatgrpdesc(genitmgrpdesc);
			s.setItmcatgrpcode(itmgrpcode);
			s.setItmcatgrpdesc(itmgrpdesc);
			s.setTrngrpcode(trangrpcode);
			s.setTrngrpdesc(trangrpdesc);
			s.setLodgrpcode(ldgrpcode);
			s.setLodgrpdesc(ldgrpdesc);
			s.setDelplantcode(delgrpcode);
			s.setDelplantdesc(delgrpdesc);
			s.setStatus(stus);
			s.setCreatedby(createdby);
			//new fields
			s.setsegmentcode(segmentcode);
			s.setsegmentdescription(segmentdescription);
			s.setapplicationcode(applicationcode);
			s.setapplicationdescription(applicationdescription);
			s.setcccode(cccode);
			s.setccdescription(ccdescription);
			s.setaspectratiocode(aspectratiocode);
			s.setaspectratiodescription(aspectratiodescription);	
			s.setpolymercode(polymercode);
			s.setpolymerdescription(polymerdescription);
					
			//new fields
			s.setApprovalprocess("Pending");
			
	
	
			if(CheckDuplicateDAO.check(mdmcode,plant,distchcode))
			{
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('record already exists');");
				   out.println("</script>");
				   RequestDispatcher rd=request.getRequestDispatcher("Sales.jsp");  
				   rd.include(request, response);  
				
			}
			
			else
			{
				int status=SalesDAO.insert(s); 
	
				if(stus.equals("Inactive") )
				{
					stus="Submit";
					s.setStatus(stus);
			        int sss=SalesDAO.insertaudit(s);
				}
			
			if(status>0 && btnStatus.equals("Save"))
			{
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Record saved sucessfully');");
				   out.println("</script>");
			 
			   RequestDispatcher rd=request.getRequestDispatcher("Sales.jsp");  
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
				
			   RequestDispatcher rd=request.getRequestDispatcher("Sales.jsp");  
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
