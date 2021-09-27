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

public class PurchasingvaluekeyDAO {
	
	
public List<Purchasingvaluekey> pkeylist() throws SQLException, ClassNotFoundException
 {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet result=null;
        List<Purchasingvaluekey> listpkey = new ArrayList<>();
         try
         {
        	con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Purchasing_Value_Key_Master\" ";
        	ps =con.prepareStatement(sql);
            result = ps.executeQuery();
            while (result.next()) {
                 String pkey  = result.getString("Purchasing_Value_Key");
                Purchasingvaluekey pk = new Purchasingvaluekey(pkey);                     
                listpkey.add(pk);
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
         
        return listpkey;


}
  

}
