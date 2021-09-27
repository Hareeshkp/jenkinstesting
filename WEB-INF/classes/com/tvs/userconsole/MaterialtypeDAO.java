package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;


public class MaterialtypeDAO {
	
	
public List<Materialtype> materiallist(String rolename) throws SQLException, ClassNotFoundException
    
    {
    List<Materialtype> listmaterial = new ArrayList<>();

		 Connection con=null;
		 ResultSet result=null;
		 PreparedStatement ps=null;
		 Connection cona=null;
		 ResultSet resulta=null;
		 PreparedStatement psa=null;
         try
         {
        	  con=AuditConnection.getConnection();   
        	  String sql = "SELECT * FROM \"Rolelist\" where \"Rolename\"=?  ";           
        	  ps=con.prepareStatement(sql);
        	  ps.setString(1,rolename);
        	  
              result = ps.executeQuery();             
            while (result.next()) {

                 String type  = result.getString("Material_Type_Code");
                 String desc = result.getString("Material_Type_Description");

                 if(type.equals("None"))
	 
                 {
                	try
                	{

                    	  cona=AuditConnection.getConnection();   
                    	  String sqql = "SELECT * FROM \"Material_Master\" where \"MaterialType\" <> 'None' order by \"Description\"  ";           
                    	  psa=cona.prepareStatement(sqql);
                    	 
                    	  
                          resulta = psa.executeQuery();             
                        while (resulta.next()) {
                             String typpe  = resulta.getString("MaterialType");
                             String dessc = resulta.getString("Description");
                             Materialtype m =new Materialtype(typpe,dessc);
                             listmaterial.add(m);
                	 
                        }
                        
                        resulta.close();
                        resulta=null;
                        psa.close();
                        psa=null;
                        cona.close();
                        cona=null;
                        
                        
                	}
                	 
                	 finally {
                		 AuditConnection.shutdown(resulta, psa, cona);
					}
                	 
                 }
                 
                 
                 
                 
                 
                 else
                 {
                	 Materialtype m =new Materialtype(type,desc);
                     listmaterial.add(m);
                	 
                 }
                
              
               
               
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
        return listmaterial;


}
  
    }

  


