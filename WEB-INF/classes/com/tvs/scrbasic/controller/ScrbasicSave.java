package com.tvs.scrbasic.controller;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.scrbasic.CheckDescriptionDuplicateDAO;
import com.tvs.scrbasic.CheckMDMCodeDAO;
import com.tvs.scrbasic.CheckMatCodeDAO;
import com.tvs.scrbasic.SCRBasic;
import com.tvs.scrbasic.SRCBasicDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;
import com.tvs.plantmapping.PlantMappingDAO;
@WebServlet("/SCRBasicSave")
public class ScrbasicSave extends HttpServlet 
{  
	private static final long serialVersionUID = 1L;
public void doPost(HttpServletRequest request, HttpServletResponse response)  
       throws ServletException, IOException {  
	int status=0;
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
	    String Userid=(String)session.getAttribute("userid");     
	    User uu =UserDAO.getUsernameRoleByUserId(Userid);    //username
	   	//String createdby=uu.getUsername();
	    String tcode= request.getParameter("MDMCode"); 
	    Integer ttcode=Integer.parseInt(tcode);    
		String materialtype =request.getParameter("Materialtypesid");  //Material type Id
		String materialtypedesc=request.getParameter("materialtype");    //Material type descrpition	
		String materialgroup=request.getParameter("materialgroupid");  
		String materialgroupdesc=request.getParameter("materialgroup1");  	
		String materialcode=request.getParameter("MaterialCode");  //MaterialCode
		String count[]=request.getParameterValues("state");   
		
		
		/*
		if(materialcode.isEmpty())
		{
			materialcode="N/A";
		}
		*/
		
		String description=request.getParameter("Description"); //Description	
		String basicuom=request.getParameter("basicuomid");  
		String basicuomdesc=request.getParameter("basicuom"); 	
		String altuom=request.getParameter("AlterNativeUOMid");  
		String altuomdesc=request.getParameter("AlterNativeUOM"); 	
		String f1=request.getParameter("Numerator");
		String Volume = request.getParameter("Volume");
		//String VolumeUnit =  request.getParameter("VolumeUnit");
		String volumeunitcode = request.getParameter("volumeunitid");
		String volumeunitcodedesc = request.getParameter("VolumeUnit");		

		
		Float numerator=null;
		if (f1 != null && f1.length() > 0) {	
			try {
				 numerator = Float.parseFloat(f1);
		    } catch (Exception e) {
			      System.out.println("Something went wrong.");
			    }
			 
		}	
		String f2 =request.getParameter("Denominator"); 	
		Float denominator=null;
		if (f2 != null && f2.length() > 0)
		{		
			try {
				denominator = Float.parseFloat(f2);	
		    } catch (Exception e) {
			      System.out.println("Something went wrong.");
			    }
		}	
		String f3 =request.getParameter("GrossWeight");	
		Float grossweight=null;
		if (f3 != null && f3.length() > 0)
		{
			grossweight = Float.parseFloat(f3);	
		}	
		String f4=request.getParameter("NetWeight"); 	
		Float netweight=null;
		if (f4 != null && f4.length() > 0)
		{
			netweight = Float.parseFloat(f4);
		}
		String hsncode=request.getParameter("HSNCode");  	
		String unitweight=request.getParameter("UnitWeightid");  
		String unitweightdesc=request.getParameter("UnitWeight"); 	
		//Boolean block=Boolean.parseBoolean(request.getParameter("block")); 
		//String reason=request.getParameter("reason");
		String list=null;
	    //check null here
	    
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
		SCRBasic ob =new SCRBasic();
		ob.setTalendcode(ttcode);
		ob.setMaterialtype(materialtype);
		ob.setMaterialtypedesc(materialtypedesc);
		ob.setMaterialgroup(materialgroup);
		ob.setMaterialgroupdesc(materialgroupdesc);
		ob.setMaterialcode(materialcode);
		ob.setDescription(description);
		ob.setAltuom(altuom);
		ob.setAltuomdesc(altuomdesc);
		ob.setBasicuom(basicuom);
		ob.setBasicuomdesc(basicuomdesc);
		ob.setNumerator(numerator);
		ob.setDenominator(denominator);
		ob.setGross(grossweight);
		ob.setNet(netweight);
		ob.setHsncode(hsncode);
		ob.setUnitweight(unitweight);
		ob.setUnitweightdesc(unitweightdesc);
		ob.setCreatedby(createdby);
		ob.setStatus(stus);
		ob.setVolume(Volume);
		//ob.setVolumeUnit(VolumeUnit);
		ob.setvolumeunitcode(volumeunitcode);
		ob.setvolumeunitdesc(volumeunitcodedesc);
		
		if(CheckDescriptionDuplicateDAO.checkdesc(materialtype,description) )
		{
			 out.println("<script type=\"text/javascript\">");
			 out.println("alert('Material description already exists');");
			 out.println("</script>");
		     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
		     rd.include(request, response); 
		}
		
		else if(CheckMatCodeDAO.checkmatcode(materialcode))
		{
			 out.println("<script type=\"text/javascript\">");
			 out.println("alert('Material Code already exists');");
			 out.println("</script>");
		     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
		     rd.include(request, response); 
		}
		else if(count==null || count.length<1)
	    {
	    	
	    	 out.println("<script type=\"text/javascript\">");
			 out.println("alert('please select plant&storage');");
			 out.println("</script>");
	    	 RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
	  	     rd.include(request, response); 
	    }	
		else
		{
			
		if(CheckMDMCodeDAO.check(ttcode))
		{
	
			       Integer xyz=CheckMDMCodeDAO.find();
			   
		           ttcode=xyz+1;
		       
		        	ob.setTalendcode(ttcode);
	
				   status=SRCBasicDAO.insert(ob);
				   int statuss=PlantMappingDAO.inserts(count,ttcode);    //plant&storage 			   
				   if(stus.equals("Inactive") )
					{
						stus="Submit";
						
						ob.setStatus(stus);
	
					int sss=SRCBasicDAO.insertaudit(ob);
	
					}
					
	
				 if(status > 0  && btnStatus.equals("Save"))
					{   					 
	
						 out.println("<script type=\"text/javascript\">");
						 out.println("alert('Record saved sucessfully');");
						 out.println("</script>");
					     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
					     rd.include(request, response);  
	
					}
				 
				 else if(status > 0  && btnStatus.equals("Submit"))
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
					     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
					     rd.include(request, response);	
					}	 
		 
		}
		else
		{
		 status=SRCBasicDAO.insert(ob);  
		  int statuss=PlantMappingDAO.inserts(count,ttcode);    //plant&storage 			   
		 if(stus.equals("Inactive") )
			{
				stus="Submit";
				ob.setStatus(stus);
				int sss=SRCBasicDAO.insertaudit(ob);
	
			}
			
		 
	 	if(status>0  && btnStatus.equals("Save"))
		{   
			 out.println("<script type=\"text/javascript\">");
			 out.println("alert('Record saved sucessfully');");
			 out.println("</script>");
		     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
		     rd.include(request, response);  
		}
	 	
	 	
	 	
	 	 else if(status>0  && btnStatus.equals("Submit"))
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
		     RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_View.jsp");  
		     rd.include(request, response);	
		}
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
         