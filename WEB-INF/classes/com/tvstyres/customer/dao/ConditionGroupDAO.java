package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.ConditionGroup;

public class ConditionGroupDAO {
	
	public List<ConditionGroup> getConditiongrouplist(String att) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<ConditionGroup> congrouplist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Condition_Group_Master\" where \"Condition_Group\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,att);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Condition_group_1");
                 String description = result.getString("Description");
                ConditionGroup cg=new ConditionGroup(code, description);
                congrouplist.add(cg);
             
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
         
         finally{
 		 	
 			AuditConnection.shutdown(result, ps, con);
 			
          }//finally close
        return congrouplist;


}


}
