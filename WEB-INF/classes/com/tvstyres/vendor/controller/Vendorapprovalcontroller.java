package com.tvstyres.vendor.controller;

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
import com.tvstyres.vendor.dao.VendorapprovalDAO;
import com.tvstyres.vendor.model.Vendoraproval;



/**
 * Servlet implementation class Approval
 */
@WebServlet("/vendorApproval")
public class Vendorapprovalcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession(false);
			PrintWriter out =response.getWriter();
			String role=null;
			String rolename=null;
			String access=null;
			
			
			
		  if(session!=null )
          {
			  String Userid=(String)session.getAttribute("userid");	
			    User uu =UserDAO.getUsernameRoleByUserId(Userid);	
			    role= uu.getRolename();//rolename in user table
			    Role rr=RoleDAO.getRoleByRoleName(role);//rolename in rolelist  table
				
			     access=rr.getVendor();
			     
			  
			    String approvedby=uu.getUsername();	
		    Vendoraproval v=new Vendoraproval();
		    String ccode= request.getParameter("mdmvendorcode");  
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
					v.setApproval_status(approvalstatus);
					v.setApproved_by(approvedby);
					v.setReason_for_reject(rejectmsg);
					v.setMdm_vendor_code(mdmcode);
					v.setRejected_by(access);
					status=VendorapprovalDAO.update(v);
					}
					else
					{
						v.setApproval_status(approvalstatus);
						v.setReviewed_by(approvedby);
						v.setReason_for_reject(rejectmsg);
						v.setMdm_vendor_code(mdmcode);
						v.setRejected_by(access);
						status=VendorapprovalDAO.reviewerUpdate(v);
					}
				}
			}
			
			
			
			else
			
			{
				
				if(reviewstatus !=null && reviewstatus.equals("Review"))
				{
					approvalstatus="Reviewed";
					v.setApproval_status(approvalstatus);
					v.setReviewed_by(approvedby);
					v.setReason_for_reject(rejectmsg);
					v.setMdm_vendor_code(mdmcode);
					 status=VendorapprovalDAO.reviewerUpdate(v);
				}
				else
				{
					approvalstatus="Approved";
					v.setApproval_status(approvalstatus);
					v.setApproved_by(approvedby);
					v.setReason_for_reject(rejectmsg);
					v.setMdm_vendor_code(mdmcode);
					status=VendorapprovalDAO.update(v);
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
				       RequestDispatcher rd=request.getRequestDispatcher("Vendor_Checkerview.jsp");  
				       rd.include(request, response);
				}		
				
				
				if(approvalstatus.equals("Reviewed"))				
				{
					   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Approved');");
					   out.println("</script>");
				       RequestDispatcher rd=request.getRequestDispatcher("Vendor_Reviewerview.jsp");  
				       rd.include(request, response);
				}		
				
				if(approvalstatus.equals("Rejected"))
				{
					if(access.equals("Approval"))
					{
						   out.println("<script type=\"text/javascript\">");
						   out.println("alert('Rejected');");
						   out.println("</script>");
					       RequestDispatcher rd=request.getRequestDispatcher("Vendor_Checkerview.jsp");  
					       rd.include(request, response);
					}
					else
					{
						   out.println("<script type=\"text/javascript\">");
						   out.println("alert('Rejected');");
						   out.println("</script>");
					       RequestDispatcher rd=request.getRequestDispatcher("Vendor_Reviewerview.jsp");  
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
          }
		  
	}	

}