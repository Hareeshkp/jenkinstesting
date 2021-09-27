package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class Statuslist {
	

	
public List<Status> statuslist() throws SQLException, ClassNotFoundException
    
    
    
    {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
	
        List<Status> liststatus = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

           ps=con.prepareStatement("SELECT * FROM \"Status\" ");

        	
        	
           
            result = ps.executeQuery();
             
            while (result.next()) {
                 String role  = result.getString("status");
               
                     Status s=new Status(role);
                liststatus.add(s);
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
         finally 
			
			{
        	AuditConnection.shutdown(result, ps, con);
        	
			}
		
        return liststatus;


}
  

}
