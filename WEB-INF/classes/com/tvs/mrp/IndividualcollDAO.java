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

public class IndividualcollDAO {
	public List<Individualcoll> getIndividualcoll() throws SQLException, ClassNotFoundException
	 
	 {
		Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet result=null;
	        List<Individualcoll> listabc = new ArrayList<>();
	         try
	         {
	        	 con=AuditConnection.getConnection();
	        	String sql = "SELECT * FROM \"Individual_coll\" "; 
	        	ps=con.prepareStatement(sql);

	            result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("Individual_coll_");
	                String Desc = result.getString("Individual_coll__Description");
	                Individualcoll a = new Individualcoll(Code,Desc);                     
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
