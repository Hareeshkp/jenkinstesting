package com.tvs.subscr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;



public class Level1DAO {
	
	
	
public List<Level1> maingrouplist() throws SQLException, ClassNotFoundException
    
    
    
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
        List<Level1> listmain = new ArrayList<>();
         try
         {        	 
        	  con=AuditConnection.getConnection();        	  
        	  String sql = "SELECT * FROM \"Main_Group\"  ";
        	  ps =con.prepareStatement(sql);
              result = ps.executeQuery(); 
             while (result.next()) {
                String logic  = result.getString("Logic");
                String desc = result.getString("Description");
                Level1 l1 = new Level1(logic,desc);                     
                listmain.add(l1);
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
        return listmain;


}
  
  
  
  
 
	

}
