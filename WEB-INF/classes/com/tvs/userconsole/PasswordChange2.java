package com.tvs.userconsole;

import static com.theromus.sha.Parameters.SHA3_256;
import static com.theromus.utils.HexUtils.convertBytesToString;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

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

@WebServlet("/Passwords")
public class PasswordChange2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
        PrintWriter out =response.getWriter();

        Connection con=null;
        PreparedStatement ps=null;
		   HttpSession session = request.getSession(false);
		   
		   if(session!=null)
		   {
			   
		   
		   
		   
		   
		   String Userid=(String)session.getAttribute("userid");
		   // User uu =UserDAO.getUsernameRoleByUserId(Userid);
           // String modifiedby=uu.getUsername();
		
		    String pass=request.getParameter("password");  
	        byte[] salt =Salt.getSalt();//salting
	        byte[] data = pass.getBytes(StandardCharsets.UTF_8);//password
	    	//byte[] mix_salt_data = new byte[salt.length + data.length];//salting+password
	    	//System.arraycopy(salt, 0,mix_salt_data, 0, salt.length);
	    //	System.arraycopy(data, 0,mix_salt_data, salt.length, data.length);
	    	Keccak keccak = new Keccak();
	    	
	    	String salts=convertBytesToString(keccak.getHash(salt, SHA3_256));
	        String passwords=convertBytesToString(keccak.getHash(data, SHA3_256));//Hashing=salting+password
	        String password=salts.concat(passwords);
	
		int st=0;
		
		  try{  
	        	 con=AuditConnection.getConnection(); 
	        	 ps=con.prepareStatement("update \"User\" set \"Password\"=?,\"Password_Modified_Date\"=?   "+ 
	        		        " where \"Userid\"=?");  
	        	
	            ps.setString(1, password);
                ps.setTimestamp(2,new Timestamp(System.currentTimeMillis()));
	            ps.setString(3,Userid);

	            st =  ps.executeUpdate();  
	          
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
if(st>0)
{
	
	  out.println("<script type=\"text/javascript\">");
	   out.println("alert('Password Changed successfully');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
rd.include(request, response);   
	
}
else
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('User Updation Failed');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("ChangePassword2.jsp");  
rd.include(request, response);        
	
}

	        }catch(Exception ex){ex.printStackTrace();}  
		  
		  finally{

	            AuditConnection.shutdown(ps, con);
	            
	         }//finally

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
