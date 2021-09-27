package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;
import com.tvs.scrbasic.SCRBasic;

public class UserDAO {
	
	
	

	public static User getRoleByUserName(String username){  
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
                User u=new User();

	        try{  
	        	 
	           con= AuditConnection.getConnection();
	           ps=con.prepareStatement("select \"Role\" from  \"User\" where \"Userdisplayname\"=?");  
	            ps.setString(1,username);  
	           rs=ps.executeQuery();  
	            if(rs.next()){  
	                u.setRolename(rs.getString("Role"));
	                u.setUsername(rs.getString("Userdisplayname"));
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
		

	
public List<User> userdetails() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
	
        List<User> userdetails = new ArrayList<>();
         try
         {
        	 
         con=AuditConnection.getConnection();

        	
        ps =con.prepareStatement("select * from \"User\" ");
        	
           
          result = ps.executeQuery();
             
            while (result.next()) {

                String rolename=result.getString("Role");
                String username=result.getString("Userdisplayname");
                
            	String userid=result.getString("Userid");
            	String status=result.getString("Status");
            	String email=result.getString("User_EmailId");


                     User uobj=new User(rolename, username, userid, status,email);
          
            	
                     userdetails.add(uobj);
            }     
            
            result.close();
            result=null;
            ps.close();
            ps=null;
            con.close();
            con=null;
             
        } 
         
         
         catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
         finally 
			
			{
     	AuditConnection.shutdown(result, ps, con);
     	
			}
		
        return userdetails;


}
  
public static User getUserdetailsByUserid(String userid){  
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
    User u= new User() ;       
      try{  
      	 
      	

         con=AuditConnection.getConnection() ;
         ps=con.prepareStatement("select * from \"User\" where \"Userid\"=?");  
          ps.setString(1,userid);  
          rs=ps.executeQuery();  
          if(rs.next()){  
          	
        	  u.setUserid(rs.getString("Userid"));
        	  u.setUsername(rs.getString("Userdisplayname"));
        	  u.setRolename(rs.getString("Role"));
        	  u.setStatus(rs.getString("Status"));
        	  u.setEmail(rs.getString("User_EmailId"));
        	  
        	  

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
		
	public static User getUsernameRoleByUserId(String userid){  
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
        User u=new User();

    try{  
    	 
        con= AuditConnection.getConnection();
        ps=con.prepareStatement("select * from  \"User\" where \"Userid\"=?");  
        ps.setString(1,userid);  
        rs=ps.executeQuery();  
        if(rs.next()){  
           
        	  u.setRolename(rs.getString("Role"));
              u.setUsername(rs.getString("Userdisplayname"));
          
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
