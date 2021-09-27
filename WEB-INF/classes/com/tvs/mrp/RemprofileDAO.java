package com.tvs.mrp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class RemprofileDAO {
	
	

public List<Remprofile> getRemprofile() throws SQLException, ClassNotFoundException
    
    
    
    {
        List<Remprofile> listrefprofile = new ArrayList<>();
        Connection con=null;
    	 PreparedStatement ps=null;
    	 ResultSet result=null;
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	
        	
        	
        	String sql = "SELECT * FROM \"REM_profile\" ";
        	ps=con.prepareStatement(sql);

           result = ps.executeQuery();
             
            while (result.next()) {
                 String remprofile  = result.getString("REMprofile");
                String text = result.getString("REMprofileDescription");

              Remprofile r=new Remprofile(remprofile,text);
              listrefprofile.add(r);
                
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
        return listrefprofile;


}




	

}
