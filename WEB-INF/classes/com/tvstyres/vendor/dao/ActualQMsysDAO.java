package com.tvstyres.vendor.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.ActualQMsys;
public class ActualQMsysDAO {
	public List<ActualQMsys> getActualQMlist() throws SQLException, ClassNotFoundException
	 
    {
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet result=null;
        List<ActualQMsys> actualqmlist = new ArrayList<>();
         try
         {
        	 con=AuditConnection.getConnection();
        	String sql = "SELECT * FROM \"Actual_QM_sys\" ";   
        	 ps=con.prepareStatement(sql);
             result = ps.executeQuery();             
            while (result.next()) {
                 String code= result.getString("actual_QM_sys");
                String description = result.getString("Description");
                ActualQMsys aqs =new ActualQMsys(code, description);
                actualqmlist.add(aqs);
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
        return actualqmlist;


}


}
