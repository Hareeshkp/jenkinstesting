package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tvs.dbconnection.AuditConnection;




public class CheckDuplicateUsernameDAO {

	public static boolean check(String username){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;

		try
		{  
	         con=AuditConnection.getConnection();
		     ps=con.prepareStatement("select * from \"User\" where \"Userdisplayname\"=?");  
             ps.setString(1,username);  
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
			e.getStackTrace();
		}
		 finally{
			 	AuditConnection.shutdown(rs, ps, con);
             }//finally close
		
	   return status;  


		}  

}
