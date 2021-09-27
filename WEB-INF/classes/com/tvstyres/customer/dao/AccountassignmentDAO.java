package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.Accountassignment;

public class AccountassignmentDAO {
	
	
	public List<Accountassignment> getaccassignlist(String distcode) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Accountassignment> accsssignlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT distinct \"Account_AssignmentGp\",\"Account_Description\" FROM \"Sales_Data_Control\" where \"Dist_Channel\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,distcode);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Account_AssignmentGp");
                 String description = result.getString("Account_Description");
                
Accountassignment a=new Accountassignment(code, description);
   accsssignlist.add(a);
               
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
        return accsssignlist;


}


}
