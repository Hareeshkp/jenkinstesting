package com.tvs.subscr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class SourceDAO {
	public List<Source> itemlist() throws SQLException, ClassNotFoundException

	
	 {
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
	        List<Source> listitem = new ArrayList<>();
	         try
	         {
	        	 con=AuditConnection.getConnection();     
	        	
	        	String sql = "SELECT * FROM \"Source_Indicator\"";
	        	ps =con.prepareStatement(sql);	        	
	            result = ps.executeQuery();	           
	            while (result.next()) {
	                 String id  = result.getString("Id");
	                String item = result.getString("Name");
	                Source s = new Source(id,item);	                     
	                listitem.add(s);
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
	         
	        return listitem;


	}
	  
	  
	  

}
