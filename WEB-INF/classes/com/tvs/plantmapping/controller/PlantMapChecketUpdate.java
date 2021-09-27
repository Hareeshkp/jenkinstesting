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

import com.tvs.plantmapping.PlantMapApproval;
import com.tvs.plantmapping.PlantMapApprovalDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;


@WebServlet("/PlantMapChecketUpdate")
public class PlantMapChecketUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();

		HttpSession session = request.getSession(false);
		
		if(session!=null)
		{
			
		
	    String Userid=(String)session.getAttribute("userid");
	   User uu =UserDAO.getUsernameRoleByUserId(Userid);

	   
	 //username
	   String modifiedby=uu.getUsername();
		
		PlantMapApproval pl=new PlantMapApproval();
		
		String tcode= request.getParameter("MDMCdoe"); 
	    Integer ttcode=Integer.parseInt(tcode);
	    String approval=request.getParameter("Approval");
		String rejcommants=request.getParameter("rjcomments");
		
		if(approval==null){
			approval=request.getParameter("rejectyes");
			if(approval.equals("Yes")){
				approval="Rejected";
			}
		}
		else{
			approval="Approved";
		}
		pl.setApprovalprocess(approval);
		pl.setApprovedby(modifiedby);
		pl.setReasonforrejection(rejcommants);
		pl.setTalendcode(ttcode);
		int status=PlantMapApprovalDAO.Update(pl);
		int stt=PlantMapApprovalDAO.insertaudit(pl);
		if(status>0)
		{
			
			if(approval.equals("Approved"))				
			{
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Approved');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("plantmappingcheckerview.jsp");  
			       rd.include(request, response);
			}			
			else
			{
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Rejected');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("plantmappingcheckerview.jsp");  
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
