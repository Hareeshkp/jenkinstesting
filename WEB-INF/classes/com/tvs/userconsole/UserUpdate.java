package com.tvs.userconsole;

import static com.theromus.sha.Parameters.SHA3_256;
import static com.theromus.utils.HexUtils.convertBytesToString;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.theromus.sha.Keccak;
import com.theromus.sha.Salt;
import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

@WebServlet("/UserUpdate")
public class UserUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			
		   HttpSession session = request.getSession(false);
	          PrintWriter out =response.getWriter();

		   if(session!=null)
		   {
			   
			   
			   
		   
		    String Userid=(String)session.getAttribute("userid");
		    
		    
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);

		    String modifiedby=uu.getUsername();
		    
		    
		    
			String userid=request.getParameter("userid");  

	    	String username=request.getParameter("username");  

	 
		String role =request.getParameter("role");  
		String status=request.getParameter("status");  
		String email=request.getParameter("email");  
		//#################################################################################
				String pass=request.getParameter("password");  
				String password=null;
				if(!pass.isEmpty())
				{
					    byte[] salt =Salt.getSalt();//salting
				        byte[] data = pass.getBytes(StandardCharsets.UTF_8);//password
				    	Keccak keccak = new Keccak();
				    	String salts=convertBytesToString(keccak.getHash(salt,SHA3_256));//salting
				        String passwords=convertBytesToString(keccak.getHash(data,SHA3_256));//password hashing
				        password=salts.concat(passwords);//Hashing=salting+password
				}
		//############################################################################
		int st=0;
		Connection con=null;
		PreparedStatement ps=null;
		  try{  
	        	 con=AuditConnection.getConnection();
	        	
	        	 if(password==null)
	        	 {
	        		 ps=con.prepareStatement("update \"User\" set \"Userdisplayname\"=?,\"Role\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"User_EmailId\"=? "+ 
		        		        " where \"Userid\"=?");   
	        		 
	        		 
	        		  ps.setString(1,username); 
	  	            ps.setString(2,role); 
	  	            ps.setString(3,status); 
	  	            ps.setString(4,modifiedby); 
	                  ps.setObject(5,new Timestamp(System.currentTimeMillis()));
	                  ps.setObject(6,email);
	  	           
	  	            ps.setString(7,userid); 

	        	 }
	        	 else
	        	 {
	        		 ps=con.prepareStatement("update \"User\" set \"Userdisplayname\"=?,\"Role\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"User_EmailId\"=?,\"Password\"=? "+ 
		        		        " where \"Userid\"=?");  
	        		  ps.setString(1,username); 
	  	            ps.setString(2,role); 
	  	            ps.setString(3,status); 
	  	            ps.setString(4,modifiedby); 
	                  ps.setObject(5,new Timestamp(System.currentTimeMillis()));
	                  ps.setObject(6,email);
	  	            ps.setString(7,password); 
	  	            ps.setString(8,userid); 

	        		 
	        	 }
	        	
	        	
	        	
	        		          
	          

	          
	           
	            

	         st =  ps.executeUpdate();  
	    
	         ps.close();
	         ps=null;
	         con.close();
	         con=null;
	            
if(st>0)
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('User Details Updated');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
rd.include(request, response);   
	
}
else
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('User Updation Failed');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
rd.include(request, response);        
	
}

	        }catch(Exception ex){ex.printStackTrace();}  
	          
		
		  finally 
			
			{
    	 
				AuditConnection.shutdown(ps, con);
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
