package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.SalesGroup;

public class SalesGroupDAO {

	public List<SalesGroup> getSalesgrouplist(String salesoffice) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<SalesGroup> salesgrouplist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT  distinct \"Sales_Group\",\"Text\"  FROM \"Sales_Office_Group_Mapping\" where \"Sales_Office\"=?";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,salesoffice);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Sales_Group");
                 String description = result.getString("Text");
                
                SalesGroup sg =new SalesGroup(code, description);
                
                salesgrouplist.add(sg);
                
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
        return salesgrouplist;


}

	public List<SalesGroup> getSalesgrouplist() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<SalesGroup> salesgrouplist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT  distinct \"Sales_Group\",\"Text\"  FROM \"Sales_Office_Group_Mapping\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Sales_Group");
                 String description = result.getString("Text");
                
                SalesGroup sg =new SalesGroup(code, description);
                
                salesgrouplist.add(sg);
                
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
        return salesgrouplist;


}

}
