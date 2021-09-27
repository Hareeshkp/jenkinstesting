package com.tvs.subscr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;



public class Level2DAO {

	
	
	
public List<Level2> subgrouplist1(String pp) throws SQLException, ClassNotFoundException
   
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
        List<Level2> listsubgroup1 = new ArrayList<>();
         try
         {
        con=AuditConnection.getConnection(); 
        String sql ="SELECT * from  \"Sub_Group1\"  where \"Main_Group\"=?";          	
        ps =con.prepareStatement(sql);
        ps.setString(1, pp);
        result = ps.executeQuery(); 
        while(result.next()) {
        	String sub1 = result.getString("Sub_group_1");
            String desc = result.getString("Description");
            Level2 l2 = new Level2(sub1,desc);
            listsubgroup1.add(l2);            
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
        return listsubgroup1;


}
  
  
  
  
  
	
}
