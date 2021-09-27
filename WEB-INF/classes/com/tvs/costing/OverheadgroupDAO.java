package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class OverheadgroupDAO {
	
	

public List<Overheadgroup> getoverheadgroup() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
    PreparedStatement ps=null;
    ResultSet result=null;

        List<Overheadgroup> listvaluationclass = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

        	
        	
        	
        	String sql = "SELECT * FROM \"Overhead_Group_Master\" ";
        	
        	ps =con.prepareStatement(sql);      	
           
             result = ps.executeQuery();
             
            while (result.next()) {
                 String val  = result.getString("Val_A");
                 String overheadgroup= result.getString("Overhead_Group");
                String text = result.getString("Description");

Overheadgroup oh=new Overheadgroup(val,overheadgroup,text);


listvaluationclass.add(oh);
                
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
         
        return listvaluationclass;


}


	
	
}
