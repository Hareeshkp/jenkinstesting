package com.tvs.accounting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.mrp.Remprofile;

public class ValuationclassDAO {
	

public List<Valuationclass> getValuationclass() throws SQLException, ClassNotFoundException
   
    {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
        List<Valuationclass> listvaluationclass = new ArrayList<>();
         try
         {        	 
        	con=AuditConnection.getConnection();         
        	String sql = "SELECT * FROM \"Valuation_Class\" ";
           	ps =con.prepareStatement(sql);
            result = ps.executeQuery();              
            while (result.next()) {
                
                String text = result.getString("Description");
                Valuationclass v=new Valuationclass(text);
                listvaluationclass.add(v);                
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
        return listvaluationclass;


}





}
