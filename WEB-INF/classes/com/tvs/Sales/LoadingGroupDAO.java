package com.tvs.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.mrp.Consumptionmode;

public class LoadingGroupDAO {
	public List<LoadingGroup> getLoadingGroup() throws SQLException, ClassNotFoundException
	 
	 {
		Connection con=null;
	    PreparedStatement ps=null;
	    ResultSet result=null;
	        List<LoadingGroup> listabc = new ArrayList<>();
	         try
	         {
	        	 con=AuditConnection.getConnection();
	        	String sql = "SELECT * FROM \"Loading_Grp_Master\" "; 
	        	 ps =con.prepareStatement(sql);

	           result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("LoadingGrp");
	                String Desc = result.getString("LoadingGrp_Description");
	                LoadingGroup a = new LoadingGroup(Code,Desc);                     
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
