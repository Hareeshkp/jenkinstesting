package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.SalesDistrict;

public class SalesDistrictDAO {
	
	public List<SalesDistrict> getSalesDistrictList() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<SalesDistrict> salesdistlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 String sql = "select distinct  \"Text\", \"Sales_District\"  from \"Sales_District_Master\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                String code= result.getString("Sales_District");
                String desc = result.getString("Text");
                SalesDistrict d =new SalesDistrict(code, desc);
                salesdistlist.add(d);
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
        return salesdistlist;


}


}
