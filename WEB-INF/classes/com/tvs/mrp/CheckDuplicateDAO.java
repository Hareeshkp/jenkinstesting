package com.tvs.mrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class CheckDuplicateDAO {
	
	
	public static boolean check(Integer id,String plantcode){  
		boolean status=false;  
		Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet rs=null;

		try{  

		 con=ETLConnection.getConnection();
		      
       ps=con.prepareStatement("select * from \"STG_SCR_MRP\" where \"MDM_Code\"=? and \"Plant_Code\"=?");  

		ps.setInt(1,id);  
		ps.setString(2,plantcode);  

		    
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
		  finally {
	  			
ETLConnection.shutdown(rs, ps, con);

			}
		return status;  


		}  

}
