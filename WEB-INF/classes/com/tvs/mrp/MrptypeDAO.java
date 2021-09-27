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

public class MrptypeDAO {
	

public List<Mrptype> getMrptype() throws SQLException, ClassNotFoundException   
    {
        List<Mrptype> listmrp = new ArrayList<>();
        Connection con=null;
      	 PreparedStatement ps=null;
      	 ResultSet result=null;
         try
         {
        	 
        	con=AuditConnection.getConnection();        	
        	String sql = "SELECT * FROM \"MRP_Type\" ";
        	System.out.println("uuuuuuuuiiiiiiiiiiiooooooooooooooo");
        	
        	ps=con.prepareStatement(sql);

           
      result = ps.executeQuery();
             
            while (result.next()) {
            	
            	System.out.println(result.getString("MRP_Type"));
            	System.out.println(result.getString("MRP_Type_Description"));
            	String mrp  = result.getString("MRP_Type");
                String text = result.getString("MRP_Type_Description");
                Mrptype mt = new Mrptype(mrp,text);
                System.out.println(mt);
                listmrp.add(mt);
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
        return listmrp;


}


}
