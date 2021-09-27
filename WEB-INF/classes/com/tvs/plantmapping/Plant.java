package com.tvs.plantmapping;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.costing.Costing;
import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;




public class Plant {
	
	
 
	
public List<String> plantlist(Integer id) throws SQLException, ClassNotFoundException
    
    
    
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet rs=null;
        List<String> plantlist = new ArrayList<>();
         try
         {
        	con=ETLConnection.getConnection();
	        ps=con.prepareStatement("select * from \"STG_DTL_Plant_Mapping\" where talendcode=?");  
        	ps.setInt(1, id);
	        rs=ps.executeQuery();          	
            while (rs.next()) {
                 String plant  = rs.getString("plant");                     
                plantlist.add(plant);
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
         
         finally{
        	 
             ETLConnection.shutdown(rs, ps, con);
             
             }//finally close
         
        return plantlist;


}
  
}