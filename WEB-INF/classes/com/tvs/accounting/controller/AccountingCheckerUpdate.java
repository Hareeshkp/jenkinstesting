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

import com.tvs.accounting.AccountingApproval;
import com.tvs.accounting.AccountingApprovalDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;


@WebServlet("/AccountingCheckerUpdate")
public class AccountingCheckerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter out =response.getWriter();

		if(session!=null)
		{
			
	    String Userid=(String)session.getAttribute("userid");   
	    User uu =UserDAO.getUsernameRoleByUserId(Userid);
	    String modifiedby=uu.getUsername();		
		AccountingApproval  pl=new AccountingApproval();		
		String tcode= request.getParameter("MDMCode"); 
	    Integer ttcode=Integer.parseInt(tcode);
	    String approval=request.getParameter("Approval");		
	    String plantcode=request.getParameter("plant");		

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
		pl.setPlantcode(plantcode);
		
		pl.setReasonforrejection(rejcommants);
		pl.setTalendcode(ttcode);
		int status=AccountingApprovalDAO.Update(pl);
		int st=AccountingApprovalDAO.insertaudit(pl);
		if(status>0)
		{			
			if(approval.equals("Approved"))				
			{
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Approved');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("AccountingCheckerView.jsp");  
			       rd.include(request, response);
			}			
			else
			{
				   out.println("<script type=\"text/javascript\">");
				   out.println("alert('Rejected');");
				   out.println("</script>");
			       RequestDispatcher rd=request.getRequestDispatcher("AccountingCheckerView.jsp");  
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
