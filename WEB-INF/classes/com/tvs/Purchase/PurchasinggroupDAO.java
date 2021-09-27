package com.tvs.Purchase;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;


public class PurchasinggroupDAO {
	
	
	
public List<Purchasinggroup> pgrouplist() throws SQLException, ClassNotFoundException
  
    {
		Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet result=null;
        List<Purchasinggroup> listpgroup = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
       
        	String sql = "SELECT * FROM \"Purchasing_Group_Master\" ";           
        	ps =con.prepareStatement(sql);
            result = ps.executeQuery();
             
            while (result.next()) {
            	String pgroup  = result.getString("Purchasing_Group");
                String desc = result.getString("Description_p__group");
                Purchasinggroup pg = new Purchasinggroup(pgroup,desc);                     
                listpgroup.add(pg);
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
        return listpgroup;


}
  

}
