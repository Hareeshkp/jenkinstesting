package com.tvs.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class DistChannelDAO {
	public List<DistChannel> getDistChannel() throws SQLException, ClassNotFoundException
	 
	 {
		
		Connection con=null;
	    PreparedStatement ps=null;
	    ResultSet result=null;

	        List<DistChannel> listabc = new ArrayList<>();
	         try
	         {
	        	 con=AuditConnection.getConnection();
	        	String sql = "SELECT * FROM \"Distribution_Channel_Master\" ";    
	        	 ps=con.prepareStatement(sql);
	             result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("DistributionChannel");
	                String Desc = result.getString("DistributionChannelDescription");
	                DistChannel a = new DistChannel(Code,Desc);                     
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
