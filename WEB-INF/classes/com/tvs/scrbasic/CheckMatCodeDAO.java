package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.border.EtchedBorder;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class CheckMatCodeDAO {
	
	public static boolean checkmatcode(String desc){  
		boolean status=false;  
      if(desc.length()>=3)
      {
    	  
      
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{  

		 con=ETLConnection.getConnection();		      
         ps=con.prepareStatement("select * from \"STG_SCR_Basic\" where \"Material_Code\"=?");  
      
		 ps.setString(1,desc);  		    
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
      }
		return status;  


		}  

}
