package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.customer.model.CustomerClassific;

public class CustomerClassificDAO {
	
	public List<CustomerClassific> getCustomerClassificList() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<CustomerClassific> custclassificlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 String sql = "SELECT * FROM \"Customer_Classific\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                String code= result.getString("CustomerClassific");
                String desc = result.getString("Description");
                CustomerClassific p=new CustomerClassific(code, desc);
                custclassificlist.add(p);
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
        return custclassificlist;


}


}
