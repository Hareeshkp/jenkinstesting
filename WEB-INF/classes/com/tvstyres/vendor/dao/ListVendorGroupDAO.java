package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.State;

public class ListVendorGroupDAO {
	
	public static String getvengrouplist(String rolename) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<String> matlist = new ArrayList<>();
        StringBuilder b=new StringBuilder();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Role_Vendor_VendorGroup\"  where \"Rolename\" =?";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,rolename);
             result = ps.executeQuery(); 
             System.out.println("Here is you sql query");
             System.out.println(sql);
             System.out.println(rolename);
            while (result.next()) {
                 String countrycode  = result.getString("Vendor_Group_Description");
                b.append(countrycode).append("','");
            }     
            
            b.insert(0,"'");
           
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
        return b.toString();


}




}
