package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.Pricegroup;

public class PricegroupDAO {
	
	public List<Pricegroup> getPricegrouplist(String custgrpcode) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Pricegroup> pricegrouplist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Price_Group_Master\" where \"Customer_Group_Code\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,custgrpcode);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Price_Group");
                 String description = result.getString("Description");
                
Pricegroup p=new Pricegroup(code, description);
pricegrouplist.add(p);

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
        return pricegrouplist;


}



}
