package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.Vendorclass;


public class VendorclassDAO {
	
	
	public List<Vendorclass> getVenclasslist(String vtype) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Vendorclass> vlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Gst_Vendor_Class_Master\" where \"VendorType\"=? ";   
        	 ps=con.prepareStatement(sql);
             ps.setString(1,vtype);

             result = ps.executeQuery();        
            while (result.next()) {
                 String vclass= result.getString("GST_Vendor_Class");
                 String description = result.getString("Description");
                 
                 Vendorclass v =new Vendorclass(vclass, description);
                 vlist.add(v);
                 
                
            }     
            
         result.close();
   	     result=null;
   	     ps.close();
   	     ps=null;
   	     con.close();
   	     con=null; 
             
        } 
         catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
         finally{
 		 	
 			AuditConnection.shutdown(result, ps, con);
 			
 			
          }//finally close
        return vlist;


}

}
