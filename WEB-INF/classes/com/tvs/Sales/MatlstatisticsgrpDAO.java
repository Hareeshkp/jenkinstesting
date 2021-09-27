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

public class MatlstatisticsgrpDAO {
	public List<Matlstatisticsgrp> getMatlstatisticsgrp() throws SQLException, ClassNotFoundException
	 
	 {
		Connection con=null;
	    PreparedStatement ps=null;
	    ResultSet result=null;
	        List<Matlstatisticsgrp> listabc = new ArrayList<>();
	         try
	         {
	        	con=AuditConnection.getConnection();
	        	String sql = "SELECT * FROM \"Matl_Statistics_Grp_Master\" ";   
	        	 ps =con.prepareStatement(sql);

	            result = ps.executeQuery();
	             
	            while (result.next()) {
	                String Code  = result.getString("MatlStatisticsGrp");
	                String Desc = result.getString("MatlStatisticsGrpDescription");
	                Matlstatisticsgrp a = new Matlstatisticsgrp(Code,Desc);                     
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
