package com.tvs.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class LastLoginDAO {
	
	public static Timestamp getlastloginbyuserid(String userid){  

		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		java.sql.Timestamp t=null;
try{  
	
		         con= ETLConnection.getConnection();
		         ps=con.prepareStatement("select \"LoginTime\" from  \"Audit\".\"User_Audit\" where \"Userid\"=? order by  \"LoginTime\" desc  limit 2"  );  
		           ps.setString(1,userid);  
		          rs=ps.executeQuery();  
		        while(rs.next()){  
		        	 t=rs.getTimestamp("LoginTime");
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
		    
		    
		    return t;  
		    
		   	    
}

}
