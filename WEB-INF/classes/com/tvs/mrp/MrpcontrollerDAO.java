package com.tvs.mrp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class MrpcontrollerDAO {
	
	
	


public List<Mrpcontroller> getMrpcontroller(String plant) throws SQLException, ClassNotFoundException
 {
        List<Mrpcontroller> listunit = new ArrayList<>();
        Connection con=null;
      	 PreparedStatement ps=null;
      	 ResultSet result=null;
         try
         {
        	con=AuditConnection.getConnection();
        	String sql = "SELECT  distinct \"MRPcontroller\",\"MRPcontrollername\" FROM \"MRP_Controller_Master\" where \"Plant\"=? ";
        	ps=con.prepareStatement(sql);
        	ps.setString(1,plant);
            result = ps.executeQuery();             
            while (result.next()) {
                 String cont  = result.getString("MRPcontroller");
                String text = result.getString("MRPcontrollername");
                Mrpcontroller mc = new Mrpcontroller(cont,text);                     
                listunit.add(mc);
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
