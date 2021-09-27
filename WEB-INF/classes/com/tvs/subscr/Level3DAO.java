package com.tvs.subscr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
public class Level3DAO {
	
	
	
public List<Level3> subgrouplist2(String pp) throws SQLException, ClassNotFoundException
    
    
    
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
        List<Level3> listsubgroup2 = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 String sql="SELECT * from  \"Sub_Group2\"  where \"Sub_group_I\"=?";        	
        	 ps =con.prepareStatement(sql);
        	 ps.setString(1,pp);
             result = ps.executeQuery(); 
	        while(result.next()) {	
	        	String sub2 = result.getString("Sub_group_II");	        	
	            String desc = result.getString("Description");
	            Level3 l3 = new Level3(sub2,desc);
	            listsubgroup2.add(l3);
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
        return listsubgroup2;


}
  
  
  
  

}
