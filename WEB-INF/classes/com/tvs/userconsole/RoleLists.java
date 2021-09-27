package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;


public class RoleLists {

public List<Role> rolelist() throws SQLException, ClassNotFoundException

    
    {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
        List<Role> listrole = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	 
        	 
 ps=con.prepareStatement("SELECT * FROM \"Rolelist\" ")   ;     	
        	
        	
           
          rs= ps.executeQuery();
             
            while (rs.next()) {
                 String role  = rs.getString("Rolename");
               Role r=new Role(role);
               
                     
                listrole.add(r);
            }   
            rs.close();
            rs=null;
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
 			
 			AuditConnection.shutdown(rs, ps, con);
 			
 		}
        return listrole;


}
  

}
