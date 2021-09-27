package com.tvs.Purchase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;

public class ModelDAO {
	public List<Model> modellist() throws SQLException, ClassNotFoundException
	 
    {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
        List<Model> listmodel = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Model\" ";
        	ps =con.prepareStatement(sql);
        	rs=ps.executeQuery();            
            while (rs.next()) {
                 String code  = rs.getString("Key");
                String desc = rs.getString("Description");
                Model m =new Model(code, desc);
                listmodel.add(m);
            }          
            rs.close();
            rs=null;
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
  			AuditConnection.shutdown(rs, ps, con);
  		}
        return listmodel;


}

}
