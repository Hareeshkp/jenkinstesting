package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.CustPriceProcedure;

public class CustPriceProcedureDAO {
	
	public List<CustPriceProcedure> getCustpricelist() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<CustPriceProcedure> custpricelist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Cust_Pric_Procedure_Master\"";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Cust_Pric_Procedure");
                 String description = result.getString("Description");
                
                 CustPriceProcedure cp =new CustPriceProcedure(code, description);
                 
                custpricelist.add(cp);
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
        return custpricelist;


}



}
