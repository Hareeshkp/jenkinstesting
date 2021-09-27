package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.tvs.dbconnection.ETLConnection;
public class CheckMDMCodeDAO {

	public static boolean check(String name,String address,String pincode,String city,Integer mdmcode){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Customer\" where \"Name\"=? and \"Street\"=? and \"Pin_Code\"=? and \"City\"=? and \"MDM_Customer_Code\" != ?");  
		     ps.setString(1,name);
		     ps.setString(2,address);
		     ps.setString(3,pincode);
		     ps.setString(4,city);
		     ps.setInt(5,mdmcode);
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
	
	
	public static boolean check(String name,String address,String pincode,String city,String gstno,String panno,Integer mdmcode){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Customer\" where \"Name\"=? and \"Street\"=? and \"Pin_Code\"=? and \"City\"=? and \"GST_No\"=? and \"PAN_No\"=? and \"MDM_Customer_Code\" != ?");  
		     ps.setString(1,name);
		     ps.setString(2,address);
		     ps.setString(3,pincode);
		     ps.setString(4,city);
		     ps.setString(5,gstno);
		     ps.setString(6,panno);
		     
		     ps.setInt(7,mdmcode);
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
		     ps=con.prepareStatement("select MAX(\"MDM_Customer_Code\") from \"STG_SCR_Customer\"");  
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


	public static boolean check(Integer id){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Customer\" where \"MDM_Customer_Code\"=?");  
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


}
