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
public class ConsumptionmodeDAO {
	public List<Consumptionmode> getConsumptionmode() throws SQLException, ClassNotFoundException
	 
	 {
		
		Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet result=null;
	        List<Consumptionmode> listabc = new ArrayList<>();
	         try
	         {
	        	 con=AuditConnection.getConnection();
	        	String sql = "SELECT * FROM \"Consumption_Mode_Master\" ";    
	        	ps=con.prepareStatement(sql);

	             result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("Consumptionmode");
	                String Desc = result.getString("ConsumptionmodeDescription");
	                Consumptionmode a = new Consumptionmode(Code,Desc);                     
	                listabc.add(a);
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
