package com.tvs.mrp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class ProcurementtypeDAO {


public List<Procurementtype> getProcurementtype() throws SQLException, ClassNotFoundException
    
    
    
    {
        List<Procurementtype> listproc = new ArrayList<>();
        Connection con=null;
     	 PreparedStatement ps=null;
     	 ResultSet result=null;
         try
         {
        	 
        	con=AuditConnection.getConnection();

        	
        	
        	
        	String sql = "SELECT * FROM \"Procurement_Type_Master\"";
        	ps=con.prepareStatement(sql);

            result = ps.executeQuery();
             
            while (result.next()) {
                 String group  = result.getString("Procurement_type");
                String text = result.getString("Procurement_type_Desc_");
                Procurementtype pt = new Procurementtype(group,text);
                     
                listproc.add(pt);
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
         finally {
	   			
        	 AuditConnection.shutdown(result, ps, con);
        	 
		}
        return listproc;


}

	
}
