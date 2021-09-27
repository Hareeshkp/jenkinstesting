package com.tvs.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tvs.dbconnection.AuditConnection;

public class UserloginDAO {
	
	
public static Userlogin getUserloginbyuserid(String userid){  

		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		
Userlogin u=new Userlogin();
try{  
		    	 
		         con= AuditConnection.getConnection();
		         ps=con.prepareStatement("select * from  \"User\" where \"Userid\"=?");  
		           ps.setString(1,userid);  
		       rs=ps.executeQuery();  
		        if(rs.next()){  
		          
		        	u.setEmail(rs.getString("User_EmailId"));
		        	u.setPassword(rs.getString("Password"));
		        	u.setUsername(rs.getString("Userdisplayname"));
		        	u.setPassmodifieddate(rs.getTimestamp("Password_Modified_Date"));
	
		        }  
		        rs.close();
		        rs=null;
		        ps.close();
		        ps=null;
		        con.close();
		        con=null;
		        
		    }catch(Exception ex){ex.printStackTrace();}  
		      
		    finally 
			
			{
				AuditConnection.shutdown(rs, ps, con);
				
			}
		    
		    
		    return u;  
		    
		   	    
}

}
