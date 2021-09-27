package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.PaymentBlock;

public class PaymentBlockDAO {
	public List<PaymentBlock> getPaymentblocklist() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<PaymentBlock> payblklist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Payment_Block\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Payment_block");
                String description = result.getString("Description");
                PaymentBlock pb =new PaymentBlock(code, description);
                payblklist.add(pb);
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
        return payblklist;


}

}
