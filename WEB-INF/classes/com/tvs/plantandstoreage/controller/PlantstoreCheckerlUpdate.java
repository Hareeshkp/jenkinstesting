package com.tvs.plantandstoreage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.plantandstorage.PlantstoreApproval;
import com.tvs.plantandstorage.PlantstoreApprovalDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;

/**
 * Servlet implementation class PlantstoreCheckerlUpdate
 */
@WebServlet("/PlantstoreCheckerlUpdate")
public class PlantstoreCheckerlUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out =response.getWriter();

		if(session!=null)
		{
			
		
	    String Userid=(String)session.getAttribute("userid");
	   User uu =UserDAO.getUsernameRoleByUserId(Userid);

	   
	 //username
	   String modifiedby=uu.getUsername();
		
		PlantstoreApproval pl=new PlantstoreApproval();
		String plantcode= request.getParameter("plant"); 

		String tcode= request.getParameter("MDMCode"); 
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
		pl.setPlantcode(plantcode);
		pl.setApprovalprocess(approval);
		pl.setApprovedby(modifiedby);
		pl.setReasonforrejection(rejcommants);
		pl.setTalendcode(ttcode);
		int status= PlantstoreApprovalDAO.Update(pl);
		int st=PlantstoreApprovalDAO.insertaudit(pl);
		if(status>0)
		{			
			if(approval.equals("Approved"))				
			{
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Approved');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("PlantStorageCheckerView.jsp");  
			       rd.include(request, response);
			}			
			else
			{
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Rejected');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("PlantStorageCheckerView.jsp");  
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
