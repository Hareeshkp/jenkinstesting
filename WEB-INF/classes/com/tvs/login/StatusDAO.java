package com.tvs.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.tvs.dbconnection.AuditConnection;

public class StatusDAO {
	
	
	public static boolean status(String userid,String stats){  
		boolean status=false;  
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{ 
	     con=AuditConnection.getConnection();
		 ps=con.prepareStatement("select * from \"User\" where \"Userid\"=? and \"Status\"=?");  
		ps.setString(1,userid);  
		ps.setString(2,stats);  
        rs=ps.executeQuery();  
		status=rs.next();  
		
		rs.close();
        rs=null;
        ps.close();
        ps=null;
        con.close();
        con=null;
		          
		}

		catch(Exception e)
		{
			
		}  
	     finally 
		
		{
			
			AuditConnection.shutdown(rs, ps, con);
			
		}
		
		
		
		return status;  


		}  

}
