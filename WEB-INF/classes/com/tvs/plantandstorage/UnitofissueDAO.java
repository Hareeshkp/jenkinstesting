package com.tvs.plantandstorage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;


public class UnitofissueDAO {
public List<Unitofissue> unitlist() throws SQLException, ClassNotFoundException
    
    
    
    {
        List<Unitofissue> listunit = new ArrayList<>();
        Connection con=null;
   	 PreparedStatement ps=null;
   	 ResultSet result=null;
         try
         {
        	 
        	  con=AuditConnection.getConnection();	
        	String sql = "SELECT * FROM \"UOM_Master\" ";
        	ps=con.prepareStatement(sql);

           result = ps.executeQuery();
             
            while (result.next()) {
                 String unit  = result.getString("Intmeasunit");
                String text = result.getString("Measurementunittext");
                Unitofissue u = new Unitofissue(unit,text);
                     
                listunit.add(u);
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
        return listunit;


}
  


}
