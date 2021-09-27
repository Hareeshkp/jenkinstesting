package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.State;

public class StateDAO {
	
	public List<State> getStatelist(String ccode) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<State> statelist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Country_State_Code_Master\"  where \"Country\" =?";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,ccode);
             result = ps.executeQuery();             
            while (result.next()) {
                 String countrycode  = result.getString("Country");
                 String statecode= result.getString("Region");
                 String description = result.getString("Description");
                State s=new State(countrycode, statecode, description);
                 statelist.add(s);
                
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
        return statelist;


}




}
