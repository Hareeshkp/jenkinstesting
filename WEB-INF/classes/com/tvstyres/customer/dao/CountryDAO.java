package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.Country;

public class CountryDAO {

	public List<Country> getCountrylists() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<Country> countrylist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Country_Master\"";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String countrycode= result.getString("Country");
                String description = result.getString("Description");
                
                Country c=new Country(countrycode, description);
                
countrylist.add(c);
                
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
        return countrylist;


}

}
