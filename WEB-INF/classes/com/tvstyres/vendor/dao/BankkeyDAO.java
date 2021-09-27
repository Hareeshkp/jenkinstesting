package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.Bankkey;

public class BankkeyDAO {
	
	public List<Bankkey> getBanklist( String id) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Bankkey> banklist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Bank_Detail_Master\" where \"Bank_Country\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,id);
             result = ps.executeQuery();             
            while (result.next()) {
                 String bankkey= result.getString("Bank_Key");
                 String bankname = result.getString("Name_of_bank");
Bankkey b =new Bankkey(bankkey,bankname);
banklist.add(b);
                
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
        return banklist;


}



}
