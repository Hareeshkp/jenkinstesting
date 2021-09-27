package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class OrigingroupmasterDAO {
	


public List<Origingroupmaster> getOrigingroupmaster() throws SQLException, ClassNotFoundException
    
    
    
    {
	
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;

        List<Origingroupmaster> listoriginmaster = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Origin_Group_Master\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String companycode  = result.getString("CompanyCode");
                 String origin= result.getString("OriginGroup");
                String text = result.getString("OriginGroupDescription");

Origingroupmaster ogm =new Origingroupmaster(companycode,origin,text);

listoriginmaster.add(ogm);
                
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
        return listoriginmaster;


}


	

}
