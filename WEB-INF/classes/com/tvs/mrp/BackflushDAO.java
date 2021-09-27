package com.tvs.mrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class BackflushDAO {
	
	

public List<Backflush> getBackflush() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Backflush> listflush = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	String sql = "SELECT * FROM \"Backflush_Master\" ";
        	ps=con.prepareStatement(sql);

             result = ps.executeQuery();
             
            while (result.next()) {
                 String backflush  = result.getString("Backflush");
                String text = result.getString("Backflush_Desc_");
                     Backflush b=new Backflush(backflush,text);
                     
                listflush.add(b);
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
        return listflush;


}



}
