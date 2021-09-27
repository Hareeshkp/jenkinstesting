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

public class MixedMRPDAO {
public List<MixedMRP> getMixedMRP() throws SQLException, ClassNotFoundException
 
 {
        List<MixedMRP> listabc = new ArrayList<>();
        Connection con=null;
   	 PreparedStatement ps=null;
   	 ResultSet result=null;
         try
         {
        	con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"MixedMRP\" "; 
        	ps=con.prepareStatement(sql);

             result = ps.executeQuery();
             
            while (result.next()) {
             Integer Code  = result.getInt("MixedMRP");
                String Desc = result.getString("MixedMRPDescription");
                MixedMRP a = new MixedMRP(Code,Desc);                     
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
