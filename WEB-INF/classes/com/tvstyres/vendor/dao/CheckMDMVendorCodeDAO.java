package com.tvstyres.vendor.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.tvs.dbconnection.ETLConnection;
public class CheckMDMVendorCodeDAO {
	
	
	
	public static boolean checkForDuplicatePan(String panno,String vendorcodeclass,Integer mdmcode)
	{
		boolean status=false; 
		Connection con=null;
		PreparedStatement ps=null;
        ResultSet rs=null;
        try
        {
        	con = ETLConnection.getConnection();
        	ps = con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"PAN_No\"=? and \"VendorClass_Code\"=? and \"MDM_Vendor_Code\" != ?");
        	ps.setString(1,panno);
        	ps.setString(2,vendorcodeclass);
        	ps.setInt(3, mdmcode);
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

	
	
	
	
	
	
	
	
	
	
	public static boolean check(String name,String address,String pincode,String city,Integer mdmcode){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"First_Name\"=? and \"Street\"=? and \"Pin_Code\"=? and \"City\"=? and \"MDM_Vendor_Code\" != ?"); 
		     ps.setString(1,name);
		     ps.setString(2,address);
		     ps.setString(3,pincode);
		     ps.setString(4,city);
		     ps.setInt(5, mdmcode);
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
		     ps=con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"First_Name\"=? and \"Street\"=? and \"Pin_Code\"=? and \"City\"=? and \"GST_No\"=? and \"PAN_No\"=?  and \"MDM_Vendor_Code\" != ?"); 
		     ps.setString(1,name);
		     ps.setString(2,address);
		     ps.setString(3,pincode);
		     ps.setString(4,city);
		     ps.setString(5,gstno);
		     ps.setString(6,panno);
		     ps.setInt(7, mdmcode);
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
	
	
	public static boolean check(Integer id){  
		
		   boolean status=false;  
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
		try
		{  
	         con=ETLConnection.getConnection();
		     ps=con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"MDM_Vendor_Code\"=?");  
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
		     ps=con.prepareStatement("select MAX(\"MDM_Vendor_Code\") from \"STG_SCR_Vendor\"");  
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
