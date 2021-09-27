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


public class MrpgroupDAO {
	


public List<Mrpgroup> getMrpgroup(String plant) throws SQLException, ClassNotFoundException
    
    
    
    {
	  Connection con=null;
   	 PreparedStatement ps=null;
   	 ResultSet result=null;
        List<Mrpgroup> listunit = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();        	
        	
        	
        	String sql = "SELECT  distinct \"MRP_Group\",\"Name\" FROM \"MRP_Group\" where \"Plant\"=? ";
        	ps=con.prepareStatement(sql);
             ps.setString(1,plant);
           
            result = ps.executeQuery();
             
            while (result.next()) {
                 String group  = result.getString("MRP_Group");
                String text = result.getString("Name");
                Mrpgroup u = new Mrpgroup(group,text);
                     
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
