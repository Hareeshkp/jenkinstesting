package com.tvs.mrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class StrategygroupDAO {
	

public List<Strategygroup> getstratgygroup() throws SQLException, ClassNotFoundException
    
    
    
    {
	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Strategygroup> listabc = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	
        	
        	
        	String sql = "SELECT * FROM \"Strategy_Group_Master\" ";
        	ps=con.prepareStatement(sql);

           
             result = ps.executeQuery();
             
            while (result.next()) {
                 String strategy  = result.getString("StrategyGroup");
                String text = result.getString("StrategyGroupDescription");
                 Strategygroup s=new Strategygroup(strategy,text);                     
                listabc.add(s);
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
        return listabc;


}



}