package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.SalesOffice;

public class SalesOfficeDAO {
	
	public List<SalesOffice> getSalesOfficeList() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<SalesOffice> salesofficelist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 String sql = "select distinct  \"Text\",\"Sales_Office\"  from \"Sales_Office_Master\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                String code= result.getString("Sales_Office");
                String desc = result.getString("Text");
                SalesOffice s =new SalesOffice(code, desc);
                salesofficelist.add(s);
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
        return salesofficelist;


}


}
