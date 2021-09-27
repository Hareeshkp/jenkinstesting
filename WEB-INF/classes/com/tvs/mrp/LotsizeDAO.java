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

public class LotsizeDAO {
	


public List<Lotsize> getLotsize() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Lotsize> listsize = new ArrayList<>();
         try
         {
        	 
        	con=AuditConnection.getConnection();        	
        	String sql = "SELECT * FROM \"LOT_Size_Master\" ";
        	ps=con.prepareStatement(sql);

            result = ps.executeQuery();
             
            while (result.next()) {
                 String size  = result.getString("LotSizingProcedure");
                String text = result.getString("LotSizingProcedureDescription");
                Lotsize ls = new Lotsize(size,text);
                     
                listsize.add(ls);
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
        return listsize;


}



}
