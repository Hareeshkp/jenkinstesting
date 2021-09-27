package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class SpecialProcurementDAO {
	
	public List<SpecialProcurement> getSpecialProcure() throws SQLException,ClassNotFoundException
	{
		 Connection con=null;
	     PreparedStatement ps=null;
	     ResultSet result=null;
	     List<SpecialProcurement> listspecialprocurement = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT distinct \"Special_procurement\",\"Long_Text\" FROM \"Special_Procurement_Master\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String procurementcode  = result.getString("Special_procurement");
                 String procurementdesc= result.getString("Long_Text");                
                 SpecialProcurement spl =new SpecialProcurement(procurementcode,procurementdesc);
                 listspecialprocurement.add(spl);
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
        return listspecialprocurement;


		
	}

}
