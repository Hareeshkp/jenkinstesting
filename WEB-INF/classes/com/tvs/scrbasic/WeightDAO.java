package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class WeightDAO {

	
	
	
public List<Weight> weightlist() throws SQLException, ClassNotFoundException
    
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
        List<Weight> listweight = new ArrayList<>();
         try
         {
        	 
        	  con=AuditConnection.getConnection();        
        	String sql = "SELECT * FROM \"Weight_unit_Master\" ";
        	ps =con.prepareStatement(sql);
            result = ps.executeQuery();
             
            while (result.next()) {
                 String unit  = result.getString("Weightunit");
                String text = result.getString("WeightunitDescription");
                Weight w = new Weight(unit,text);                     
                listweight.add(w);
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
        return listweight;


}
  
}
