package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;


public class MaterialDAO {
	
	public List<Material> materiallist() throws SQLException, ClassNotFoundException
    
    
    
    {
		 Connection con=null;
		 ResultSet result=null;
		 PreparedStatement ps=null;
        List<Material> listmaterial = new ArrayList<>();
         try
         {
        	  con=AuditConnection.getConnection();   
        	  String sql = "SELECT * FROM \"Material_Master\" ";           
        	  ps=con.prepareStatement(sql);
              result = ps.executeQuery();             
            while (result.next()) {
                 String type  = result.getString("MaterialType");
                String desc = result.getString("Description");
                Material mt = new Material(type,desc);                     
                listmaterial.add(mt);
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
        return listmaterial;


}
  
  
  
  
 
	
	
	

}
