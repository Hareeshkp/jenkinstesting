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

public class SpecialprocurementDAO {
	

public List<Specialprocurement> getSpecialprocurement() throws SQLException, ClassNotFoundException

    {
	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Specialprocurement> listsproc = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();        	
        	String sql = "SELECT  distinct \"Special_procurement\",\"Long_Text\" FROM \"Special_Procurement_Master\" ";
        	ps=con.prepareStatement(sql);
            result = ps.executeQuery();
             
            while (result.next()) {
                 String sproc  = result.getString("Special_procurement");
                String text = result.getString("Long_Text");
                Specialprocurement sp = new Specialprocurement(sproc,text);
                     
                listsproc.add(sp);
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
        return listsproc;


}

	

}
