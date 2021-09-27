package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class MaterialGroupDAO {
	
	
public List<MaterialGroup> materialgrouplist(String y) throws SQLException, ClassNotFoundException
     {
		Connection con=null;
		PreparedStatement stmt=null;
		ResultSet result=null;
        List<MaterialGroup> listmtgroup = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	 stmt=con.prepareStatement("SELECT * from  \"Material_Group_Master\" where \"Material_Type\"=?");  
        	 stmt.setString(1,y);             
        	 result = stmt.executeQuery();         
        while(result.next()) {
        	String mtid = result.getString("Material_Group");
            String mtname = result.getString("Material_Group_Desc_");         
            MaterialGroup mg = new MaterialGroup(mtid,mtname);
            listmtgroup.add(mg);           

        }
        result.close();
        result=null;
        stmt.close();
        stmt=null;
        con.close();
        con=null;
        }          
         
         
         catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         finally {
AuditConnection.shutdown(result,stmt, con);	}
        return listmtgroup;


}
  
  
  
  
  
	
	
	

}
