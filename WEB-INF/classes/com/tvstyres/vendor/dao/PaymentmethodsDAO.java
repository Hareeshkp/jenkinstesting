package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.Paymentmethods;

public class PaymentmethodsDAO {
	
	
	
	public List<Paymentmethods> getpaymentmethods(String vendortype) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<Paymentmethods> paymentlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Payment_Method_Master\" where \"Vendor_Type\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,vendortype);
             result = ps.executeQuery();             
            while (result.next()) {
                 String pmethods= result.getString("Payment_Method");
                 
                 Paymentmethods p =new Paymentmethods(pmethods);
                 paymentlist.add(p);
                 
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
        return paymentlist;


}


}
