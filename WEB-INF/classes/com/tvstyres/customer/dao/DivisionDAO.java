package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.Division;

public class DivisionDAO {
	
	
	public List<Division> getdivisionlist(String distcode) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Division> divisionlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT  distinct \"Division\",\"Division_Description\" FROM \"Sales_Data_Control\" where \"Dist_Channel\"=?";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,distcode);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Division");
                 String description = result.getString("Division_Description");
                

                Division d =new Division(code, description);
                divisionlist.add(d);
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
        return divisionlist;


}


}
