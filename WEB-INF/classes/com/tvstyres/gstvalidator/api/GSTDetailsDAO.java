package com.tvstyres.gstvalidator.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;


public class GSTDetailsDAO {
	
	
	
	public static GSTDetails getGSTDetails(){  
		
		 Connection con=null;
	    PreparedStatement pst=null;
	    ResultSet rs=null;

	    GSTDetails obj =new GSTDetails();
	    try{  
	  con=AuditConnection.getConnection();
	  pst=con.prepareStatement("select * from \"GSTDetails\"");   
	  rs=pst.executeQuery();  
	  if(rs.next()){  
		  obj.setTokenurl(rs.getString("Token_URL"));
		  obj.setUsername(rs.getString("Username"));
		  obj.setPassword(rs.getString("Password"));
		  obj.setGsturl(rs.getString("GST_URL"));
		  obj.setClientcode(rs.getString("ClientCode"));
		  obj.setGst(rs.getString("GSTIN"));
  
	  } 
	  rs.close();
	  rs=null;
	  pst.close();
	  pst=null;
	  con.close();
	  con=null;
	}catch(Exception ex){ex.printStackTrace();}            

	finally{
		 AuditConnection.shutdown(rs, pst, con);        
	  }//finally close

	return obj;  
	}  


}
