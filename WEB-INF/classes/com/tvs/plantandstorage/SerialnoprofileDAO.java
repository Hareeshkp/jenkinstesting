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

public class SerialnoprofileDAO {
	
	
public List<Serialnoprofile> seriallist() throws SQLException, ClassNotFoundException
    
    
    
    {
	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Serialnoprofile> listofno = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	String sql = "SELECT * FROM \"Serial_No_Profile\" ";
        	ps=con.prepareStatement(sql);

             result = ps.executeQuery();
             
            while (result.next()) {
                 String no  = result.getString("Serial_no_profile");
                String text = result.getString("Serial_no_profile_Description");
                Serialnoprofile u = new Serialnoprofile(no,text);
                     
                listofno.add(u);
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
        return listofno;


}
  


}
