package com.tvs.Material;
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


public class MaterialCodeDAO {
public List<String> materialcodelist() throws SQLException, ClassNotFoundException
    
    
    
    {
        List<String> listcode = new ArrayList<>();
        Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
         try
         {
        	 
        	 con=ETLConnection.getConnection();
        	
        	String sql = "SELECT * FROM \"STG_SCR_BASIC\" ";
           ps =con.prepareStatement(sql);
           
             result = ps.executeQuery();
             
            while (result.next()) {
                 String code  = result.getString("Material_Code");
               
               // MaterialCode mt = new MaterialCode(code);
                     
                listcode.add(code);
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
         finally 
			
			{
				AuditConnection.shutdown(result, ps, con);
				
			}
		    
        return listcode;


}
  
  
}
