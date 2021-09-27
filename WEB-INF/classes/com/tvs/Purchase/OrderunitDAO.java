package com.tvs.Purchase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;


public class OrderunitDAO {
	
	

public List<Orderunit> unitlist() throws SQLException, ClassNotFoundException
 
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
        List<Orderunit> listunit = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"UOM_Master\" ";
        	ps =con.prepareStatement(sql);
        	rs=ps.executeQuery();            
            while (rs.next()) {
                 String unit  = rs.getString("Intmeasunit");
                String text = rs.getString("Measurementunittext");
                Orderunit u = new Orderunit(unit,text);                     
                listunit.add(u);
            }          
            rs.close();
            rs=null;
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
  			ETLConnection.shutdown(rs, ps, con);
  		}
        return listunit;


}
  

}
