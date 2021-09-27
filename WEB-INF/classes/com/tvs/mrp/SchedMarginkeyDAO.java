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

public class SchedMarginkeyDAO {
	
public List<SchedMarginkey> getSchedMarginkey() throws SQLException, ClassNotFoundException
 {
     List<SchedMarginkey> listabc = new ArrayList<>();
     Connection con=null;
	 PreparedStatement ps=null;
	 ResultSet result=null;
         try
         {        	 
            con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Sched_Margin_Key\" ";
        	ps=con.prepareStatement(sql);

            result = ps.executeQuery();
             
            while (result.next()) 
            {
               String smkey  = result.getString("SMKEY");                
               SchedMarginkey a = new SchedMarginkey(smkey);                     
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
