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

import com.tvs.mrp.MrpApproval;
import com.tvs.mrp.MrpApprovalDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;

/**
 * Servlet implementation class MrpCheckerUpdate
 */
@WebServlet("/MrpCheckerUpdate")
public class MrpCheckerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out =response.getWriter();

		if(session!=null)
		{
			
		
	    String Userid=(String)session.getAttribute("userid");
	   User uu =UserDAO.getUsernameRoleByUserId(Userid);

	   
	 //username
	   String modifiedby=uu.getUsername();
		
		MrpApproval  pl=new MrpApproval();
		
		String tcode= request.getParameter("MDMCode"); 
	    Integer ttcode=Integer.parseInt(tcode);
	    String approval=request.getParameter("Approval");
		String rejectyes=request.getParameter("rejectyes");
		String rejcommants=request.getParameter("rjcomments");
		String plantcode=request.getParameter("plant");

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
		pl.setPlantcode(plantcode);
		pl.setApprovedby(modifiedby);
		pl.setReasonforrejection(rejcommants);
		pl.setTalendcode(ttcode);
		int status=  MrpApprovalDAO.Update(pl);
		int st=MrpApprovalDAO.insertaudit(pl);
		if(status>0)
		{			
			if(approval.equals("Approved"))				
			{
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Approved');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("MRPCheckerView.jsp");  
			       rd.include(request, response);
			}			
			else
			{
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Rejected');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("MRPCheckerView.jsp");  
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
