package com.tvs.mrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class AvailabilitycheckDAO {
	

public List<Availabilitycheck> getAvailability() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Availabilitycheck> listavailability = new ArrayList<>();
         try
         {
        	 
        	  con=AuditConnection.getConnection();

        	
        	
        	
        	String sql = "SELECT * FROM \"Availability_Check_Master\" ";
        	ps=con.prepareStatement(sql);
           result = ps.executeQuery();
             
            while (result.next()) {
            	
            	String availabilitycheck  = result.getString("Availabilitycheck");
                String text = result.getString("AvailabilitycheckDescription");
                Availabilitycheck a =new Availabilitycheck(availabilitycheck,text);
                listavailability.add(a);
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
         finally {
 			
        	 AuditConnection.shutdown(result, ps, con);
        	 
		}
         
        return listavailability;


}


}
