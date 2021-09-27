package com.tvs.version;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.ETLConnection;
public class VendorDAO {
	
	
	


	
public List<Vendor> alllist() throws SQLException, ClassNotFoundException
    
    {
	       Connection con=null;
	       PreparedStatement pst=null;
	       ResultSet rs=null;
	         
       List<Vendor> listall = new ArrayList<>();
        try
        {
       	 
       	con=ETLConnection.getConnection();
        	
    	String sql = "select \"sap_code\",\"mdm_code\",\"pre_val\",\"current_value\",\"Field_name\",\"version\",\"user\",\"Modified_On\" from \"Vendor_Version\"  "; 
          pst =con.prepareStatement(sql);        	
          rs = pst.executeQuery();             
           while (rs.next()) {           
        	   String sapcode=rs.getString("sap_code");
        	   Integer mdmcode=rs.getInt("mdm_code");
        	   String preval=rs.getString("pre_val");
        	   String currval=rs.getString("current_value");
        	   String feildname=rs.getString("Field_name");
	       	   Integer version=rs.getInt("version");
	           String user=rs.getString("user");
	       	   String date=rs.getString("Modified_On");
	       	 Vendor v =new Vendor(sapcode, mdmcode, preval, currval, feildname, version, user, date);
	       	 
	       	 listall.add(v);
	       	 
	       			 

           }          
           rs.close();
           rs=null;
           pst.close();
           pst=null;
           con.close();
           con=null;
           
       } 
        catch (SQLException ex) {
           ex.printStackTrace();
           throw ex;
       }      
        
        finally{
       	 ETLConnection.shutdown(rs, pst, con);    	 
            }//finally close
        return listall;

   }



}
