package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class VariancekeyDAO {
	

public List<Variancekey> getvariancekey() throws SQLException, ClassNotFoundException
    
    
    
    {
	
	Connection con=null;
    PreparedStatement ps=null;
    ResultSet result=null;
        List<Variancekey> listvariancekey = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

         	String sql = "SELECT * FROM \"Variance_Key\" ";
         	ps =con.prepareStatement(sql);   
            result = ps.executeQuery();
             
            while (result.next()) {
                 String valkey  = result.getString("Variance_Key");
                 String text= result.getString("Variance_Key_Description");
            

Variancekey v=new Variancekey(valkey,text);

listvariancekey.add(v);

                
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
        return listvariancekey;


}


	

}
