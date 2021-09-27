package com.tvs.userconsole;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import static com.theromus.sha.Parameters.SHA3_224;
import static com.theromus.sha.Parameters.SHA3_256;
import static com.theromus.sha.Parameters.SHA3_384;
import static com.theromus.sha.Parameters.SHA3_512;
import static com.theromus.sha.Parameters.SHAKE128;
import static com.theromus.sha.Parameters.SHAKE256;
import static com.theromus.utils.HexUtils.convertBytesToString;

import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import com.theromus.sha.Keccak;
import com.theromus.sha.Salt;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	

        PrintWriter out =response.getWriter();

		   HttpSession session = request.getSession(false);
		   
		   if(session!=null)
		   {
		    String Userid=(String)session.getAttribute("userid");
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);
		    String createdby=uu.getUsername();
		String userid =request.getParameter("userid");  
		String username=request.getParameter("username");  

//#################################################################################
		String pass=request.getParameter("password");  
        byte[] salt =Salt.getSalt();//salting
        byte[] data = pass.getBytes(StandardCharsets.UTF_8);//password
    	Keccak keccak = new Keccak();
    	String salts=convertBytesToString(keccak.getHash(salt,SHA3_256));//salting
        String passwords=convertBytesToString(keccak.getHash(data,SHA3_256));//password hashing
        String password=salts.concat(passwords);//Hashing=salting+password

//############################################################################
      
    
		String role =request.getParameter("role");  
		String status=request.getParameter("status");  
		String email=request.getParameter("email");  

		
		if(CheckDuplicateUseridDAO.check(userid))
			
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Userid Already exist');");
			   out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
		rd.include(request, response); 
		}
		
		else if(CheckDuplicateUsernameDAO.check(username))
		
		{
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('Username already exist');");
			   out.println("</script>");
		RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
		rd.include(request, response); 
			
		}
		else
		{
			
		int st=0;
		Connection con=null;
		PreparedStatement ps=null;
		  try{  
	        	 con=AuditConnection.getConnection();

	            ps=con.prepareStatement("insert into  \"User\" (\"Userid\",\"Userdisplayname\",\"Password\",\"Role\",\"Status\",\"Created_By\",\"Created_Date\",\"User_EmailId\",\"Password_Modified_Date\") values(?,?,?,?,?,?,?,?,?)");  
	        
	            ps.setString(1,userid); 
	            
	            ps.setString(2,username); 
	            ps.setString(3,password); 
	            ps.setString(4,role); 
	            ps.setString(5,status); 
	            ps.setString(6,createdby); 
                ps.setObject(7,new Timestamp(System.currentTimeMillis()));
	            ps.setString(8,email); 
	            ps.setTimestamp(9,new Timestamp(System.currentTimeMillis()));
	           
	      
	
	         st =  ps.executeUpdate(); 
	         ps.close();
	         ps=null;
	         con.close();
	         con=null;
	       	            
if(st>0)
{
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('User Created');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
rd.include(request, response);    	
     
	
}
else
{
	
	out.println("<script type=\"text/javascript\">");
    out.println("alert('User Creation Failed');");
    out.println("</script>");
    RequestDispatcher rd=request.getRequestDispatcher("Usercreation.jsp");  
    rd.include(request, response);  
	
}



	        }catch(Exception ex){ex.printStackTrace();}  
	          
		
		  
		  finally 
			
			{
      	 AuditConnection.shutdown(ps, con);
				
			}
		
		}//else close
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
