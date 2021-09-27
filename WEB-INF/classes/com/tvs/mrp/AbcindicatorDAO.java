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

public class AbcindicatorDAO {


public List<Abcindicator> getAbcindicator() throws SQLException, ClassNotFoundException
    
    
    
    {
	 Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
        List<Abcindicator> listabc = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        
        	String sql = "SELECT * FROM \"ABC_Indicator_Master\" ";
        	ps=con.prepareStatement(sql);
            result = ps.executeQuery();
             
            while (result.next()) {
                 String indicator  = result.getString("ABC_Indicator");
                String text = result.getString("ABC_Indicator_Description");
                Abcindicator a = new Abcindicator(indicator,text);
                     
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
