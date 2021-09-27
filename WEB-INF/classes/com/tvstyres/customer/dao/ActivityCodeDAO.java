package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.ActivityCode;

public class ActivityCodeDAO {
	public List<ActivityCode> getActivityCodeList() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<ActivityCode> activitycodelist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 String sql = "SELECT * FROM \"Activity_Code\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                String code= result.getString("ActivityCode");
                String desc = result.getString("Description");
                ActivityCode p =new ActivityCode(code, desc);
                activitycodelist.add(p);
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
        return activitycodelist;


}

}
