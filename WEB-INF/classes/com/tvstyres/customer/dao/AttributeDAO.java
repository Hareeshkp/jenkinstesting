package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.Attribute;

public class AttributeDAO {

	public List<Attribute> getAttributelist(String att) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Attribute> attributelist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Attribute_Master\" where \"Attribute\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,att);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Continent");
                 String description = result.getString("Description");
                
             Attribute a =new Attribute(code, description);
             attributelist.add(a);
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
        return attributelist;


}

	
	
}
