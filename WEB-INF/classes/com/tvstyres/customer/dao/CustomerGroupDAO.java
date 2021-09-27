package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.CustomerGroup;
import com.tvstyres.customer.model.CustomerGroup2;

public class CustomerGroupDAO {
	
public List<CustomerGroup> getCustomergroup() throws SQLException, ClassNotFoundException
 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<CustomerGroup> cglist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Customer_Group_Master\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String customertype  = result.getString("Customer_Type");
                 String customercode= result.getString("Customer_Group");
                String description = result.getString("Description");
                CustomerGroup cg =new CustomerGroup(customertype, customercode, description);
                cglist.add(cg);
                
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
        return cglist;


}



}
