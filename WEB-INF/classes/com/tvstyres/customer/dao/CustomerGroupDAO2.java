package com.tvstyres.customer.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.CustomerGroup2;

public class CustomerGroupDAO2 {

	
	public List<CustomerGroup2> getCustomergrouplist(String att) throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<CustomerGroup2> cggrouplist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Customer_Group6_Master\" where \"Customer_Group\"=? ";   
        	 ps=con.prepareStatement(sql);
        	 ps.setString(1,att);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("Customer_Group1");
                 String description = result.getString("Text");
                
             CustomerGroup2 cg =new CustomerGroup2(code, description);
             cggrouplist.add(cg);
             
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
        return cggrouplist;


}

}
