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

public class ProductionStorageLocationDAO {
	public List<ProductionStorageLocation> getProductionStorageLocation(String plant) throws SQLException, ClassNotFoundException
	 
	 {
	        List<ProductionStorageLocation> listabc = new ArrayList<>();
	        Connection con=null;
	     	 PreparedStatement ps=null;
	     	 ResultSet result=null;
	         try
	         {
	            con=AuditConnection.getConnection();
	        	String sql = "SELECT  distinct \"DescrOfStorageLoc\",\"Storagelocation\" FROM \"Storage_Loc_Master\" where \"Plant\"=? ";     
	        	ps=con.prepareStatement(sql);
ps.setString(1,plant);
	            result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("Storagelocation");
	                String Desc = result.getString("DescrOfStorageLoc");
	                ProductionStorageLocation a = new ProductionStorageLocation(Code,Desc);                     
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
