package com.tvstyres.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.userconsole.Role;
import com.tvs.userconsole.RoleDAO;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;
import com.tvstyres.customer.dao.CustomerapprovalDAO;
import com.tvstyres.customer.model.Customerapproval;
import com.tvstyres.vendor.dao.VendorapprovalDAO;
import com.tvstyres.vendor.model.Vendoraproval;



/**
 * Servlet implementation class Approval
 */
@WebServlet("/customerApproval")
public class Customerapprovalcontrollel extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession(false);
			PrintWriter out =response.getWriter();
			String role=null;
			String rolename=null;
			String access=null;
		  if(session!=null)
          {
		    String Userid=(String)session.getAttribute("userid");	
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);	
		    role= uu.getRolename();//rolename in user table
		    Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
		     access=rr.getVendor();
		    String approvedby=uu.getUsername();	
		    Customerapproval c=new Customerapproval();
		    String ccode= request.getParameter("mdmcustomercode");  
		    Integer mdmcode=Integer.parseInt(ccode);		
			String approvalstatus=request.getParameter("Approval");	
			String reviewstatus=request.getParameter("Review");	
			
			String rejectmsg=request.getParameter("rjcomments");	
			int status=0;
			if(approvalstatus==null && reviewstatus==null){
				
				approvalstatus=request.getParameter("rejectyes");

				if(approvalstatus.equals("Yes")){
					approvalstatus="Rejected";
					
					if(access.equals("Approval"))
					{
					c.setApproval_status(approvalstatus);
					c.setApproved_by(approvedby);
					c.setReason_for_reject(rejectmsg);
					c.setMdm_customer_code(mdmcode);
					c.setRejected_by(access);
					status=CustomerapprovalDAO.update(c);
					}
					else
					{
						c.setApproval_status(approvalstatus);
						c.setReviewed_by(approvedby);
						c.setReason_for_reject(rejectmsg);
						c.setMdm_customer_code(mdmcode);
						c.setRejected_by(access);
						status=CustomerapprovalDAO.reviewerUpdate(c);
					}
				}
			}
			
			
			
			else
			
			{
				//Button change
				if(reviewstatus !=null && reviewstatus.equals("Approve"))
				{
					approvalstatus="Reviewed";				
					c.setApproval_status(approvalstatus);
					c.setReviewed_by(approvedby);
					c.setReason_for_reject(rejectmsg);
					c.setMdm_customer_code(mdmcode);
					status=CustomerapprovalDAO.reviewerUpdate(c);
					
				}
				else
				{
					approvalstatus="Approved";
					c.setApproval_status(approvalstatus);
					c.setApproved_by(approvedby);
					c.setReason_for_reject(rejectmsg);
					c.setMdm_customer_code(mdmcode);
					status=CustomerapprovalDAO.update(c);
					
					
				}
				
			}
			
			
			
	   // int st=VendorBasicApprovalDAO.insertaudit(c);
			if(status>0)
			{			
				if(approvalstatus.equals("Approved"))				
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Approved');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Customer_Checkerview.jsp");  
				       rd.include(request, response);
				}		
				
				
				if(approvalstatus.equals("Reviewed"))				
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Approved');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Customer_Reviewerview.jsp");  
				       rd.include(request, response);
				}		
				
				if(approvalstatus.equals("Rejected"))
				{
					if(access.equals("Approval"))
					{
						   out.println("<script type=\"text/javascript\">");
						   out.println("alert('Rejected');");
						   out.println("</script>");
					       RequestDispatcher rd=request.getRequestDispatcher("Customer_Checkerview.jsp");  
					       rd.include(request, response);
					}
					else
					{
						   out.println("<script type=\"text/javascript\">");
						   out.println("alert('Rejected');");
						   out.println("</script>");
					       RequestDispatcher rd=request.getRequestDispatcher("Customer_Reviewerview.jsp");  
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