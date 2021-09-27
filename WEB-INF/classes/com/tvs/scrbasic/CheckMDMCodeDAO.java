package com.tvs.scrbasic;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.ETLConnection;
public class CheckMDMCodeDAO {

	public static boolean check(Integer id){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Basic\" where \"MDM_Code\"=?");  
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
            }
		
	return status;  


		}  
	
	
	
	public static Integer find(){  
		
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
	       Integer mcode=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select MAX(\"MDM_Code\") from \"STG_SCR_Basic\"");  
		     rs=ps.executeQuery();  
		     if(rs.next())
		     {
		    	 mcode=rs.getInt(1);
		    	 
		     }
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
               }
		
	        return mcode;  


		}  


}
