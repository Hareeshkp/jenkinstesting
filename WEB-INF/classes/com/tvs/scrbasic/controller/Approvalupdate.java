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

import com.tvs.scrbasic.Approval;
import com.tvs.scrbasic.ApprovalDAO;
import com.tvs.scrbasic.SRCBasicDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;


/**
 * Servlet implementation class Approval
 */
@WebServlet("/Approval")
public class Approvalupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 HttpSession session = request.getSession(false);
			PrintWriter out =response.getWriter();

			
			if(session!=null)
			{
				
			
		    String Userid=(String)session.getAttribute("userid");	
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);		   
		   //username
		    String modifiedby=uu.getUsername();		   
		    String tcode= request.getParameter("MDMCode"); 
		    Integer ttcode=Integer.parseInt(tcode);		    
			String approval=request.getParameter("Approval");		
			String rejectyes=request.getParameter("rejectyes");		
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
			Approval a=new Approval();
			a.setApprovalprocess(approval);
			a.setApprovedby(modifiedby);
			a.setReasonforrejection(rejcommants);
			a.setTalendcode(ttcode);					
			int status=ApprovalDAO.update(a);
			
			int sat=ApprovalDAO.insertaudit(a);
	
			if(status>0)
			{			
				if(approval.equals("Approved"))				
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Approved');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_Checker_View.jsp");  
				       rd.include(request, response);
				}			
				else
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Rejected');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Basic_Plant_Mapping_Checker_View.jsp");  
				       rd.include(request, response);
				}
			}			
	}	//if close
			
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
