package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.CustStatsGroup;

public class CustStatsGroupDAO {
	
	
	public List<CustStatsGroup> getCuststatslist() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<CustStatsGroup> custstatslist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Customer_Stats_Group_Master\"";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Customer_Stats_Group");
                 String description = result.getString("Description");
                
CustStatsGroup cg =new CustStatsGroup(code, description)    ;             
custstatslist.add(cg);
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
        return custstatslist;


}



}
