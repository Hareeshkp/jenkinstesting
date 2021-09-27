package com.tvs.plantmapping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tvs.dbconnection.ETLConnection;


public class CheckMDMCodeDAO {
	
	
	public static boolean check(Integer id){  
		boolean status=false;  
		  Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;

		try{  

	   con=ETLConnection.getConnection();
		      
        ps=con.prepareStatement("select * from \"STG_SCR_Plant_Mapping\" where \"MDM_Code\"=?");  

		ps.setInt(1,id);  
		


		    
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
		 finally{
			 ETLConnection.shutdown(rs, ps, con);
			 
        	
             }//finally close
		
		
		
		
		return status;  


		}  

}
