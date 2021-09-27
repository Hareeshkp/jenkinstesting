package com.tvs.plantmapping.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.plantmapping.PlantMapping;
import com.tvs.plantmapping.PlantMappingDAO;
import com.tvs.scrbasic.SCRBasic;
import com.tvs.scrbasic.SRCBasicDAO;

@WebServlet("/PlantmappingUpdate")
public class PlantmappingUpdate extends HttpServlet 

{  
private static final long serialVersionUID = 1L;
public void doPost(HttpServletRequest request, HttpServletResponse response)  
       throws ServletException, IOException { 
	PrintWriter out =response.getWriter();	

    HttpSession session = request.getSession(false);
    
    if(session!=null)
    {
    
    String modifiedby=(String)session.getAttribute("username");	
	PlantMapping ob =new PlantMapping();	
    String tcode= request.getParameter("MDMCdoe");  
    Integer ttcode=Integer.parseInt(tcode);	
    String coust[]=request.getParameterValues("state");  
    
    
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
    if(coust==null || coust.length<1)
    {    	
    	 request.setAttribute("msg","please select plant&storage");
    	 RequestDispatcher rd=request.getRequestDispatcher("plant.jsp");  
  	     rd.include(request, response); 
    }    
    else
    {
    int statuss=PlantMappingDAO.Updates(coust,ttcode); 
	String x =request.getParameter("MaterialType");	
	String abc[]=x.split("-");	
	String materialtype=abc[1]; 	
	String materialtypedesc=abc[0]; 	
	String y =request.getParameter("Materialgroup"); 	
	String xyz[]=y.split("@");
	String materialgroup=  xyz[1];
	String materialgroupdesc=xyz[0];
	String materialcode=request.getParameter("MaterialId");  
	String description=request.getParameter("MaterialDesc"); 

	String reasonforedit=request.getParameter("reasonforedit"); 	
	ob.setTalendcode(ttcode);	
	ob.setMaterialtype(materialtype);
	ob.setMaterialtypedesc(materialtypedesc);
	ob.setModifiedby(modifiedby);
	ob.setReasonforedit(reasonforedit);	
	ob.setMaterialgroup(materialgroup);
	ob.setMaterialgroupdesc(materialgroupdesc);	
	ob.setMaterialcode(materialcode);	
	ob.setDescription(description);
	ob.setStatus(stus);
	ob.setApprovalprocess("Pending");
	ob.setReasonforrejection(null);		
	int status=PlantMappingDAO.Update(ob); 
	
	if(status>0 && btnStatus.equals("Save"))
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Record saved sucessfully');");
		out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("plant.jsp");  
		rd.include(request, response);
	}
	
	else if(status>0 && btnStatus.equals("Submit"))
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Record saved sucessfully');");
		out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("home.jsp");  
		rd.include(request, response);
	}

	else	
	{
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Unable to save');");
		out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("plant.jsp");  
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
