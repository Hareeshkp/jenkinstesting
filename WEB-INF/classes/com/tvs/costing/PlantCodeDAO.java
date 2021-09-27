package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.ETLConnection;


public class PlantCodeDAO {
public List<PlantCode> plantcodelist1() throws SQLException, ClassNotFoundException
    
    {
	
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet rs=null;
	
        List<PlantCode> plantlist = new ArrayList<>();
         try
         {
        	 
        	 con=ETLConnection.getConnection();
        	 ps=con.prepareStatement("select distinct \"Plant_Code\" from \"STG_SCR_Costing_Accounting\" order by \"Plant_Code\"  ");  
             rs=ps.executeQuery(); 
       
             
            while (rs.next()) {
                 String plant  = rs.getString("Plant_Code");                     
                 PlantCode pc =new PlantCode(plant);
               plantlist.add(pc);
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
         finally{
        	 ETLConnection.shutdown(rs, ps, con);
             }//finally close
		
        return plantlist;


}
  

public List<PlantCode> plantcodelist(String mattyperole) throws SQLException, ClassNotFoundException
    
    {
	
	 Connection con=null;
     PreparedStatement ps=null;
     ResultSet rs=null;
	
        List<PlantCode> plantlist = new ArrayList<>();
         try
         {
        	 
        	 con=ETLConnection.getConnection();
        	 
        	 if(mattyperole.equals("None"))
        	 {
        		 ps=con.prepareStatement("select distinct \"Plant_Code\" from \"STG_SCR_Costing\" order by \"Plant_Code\"  ");  
		             rs=ps.executeQuery();  
        	 }
	           
        	 else
        	 {
        		 ps=con.prepareStatement("select distinct \"Plant_Code\" from \"STG_SCR_Costing\" where \"Material_Type_Code\"=? order by \"Plant_Code\"  ");
        		 ps.setString(1, mattyperole);
		          rs=ps.executeQuery();  
        	 }
       
             
            while (rs.next()) {
                 String plant  = rs.getString("Plant_Code");
                     
                 PlantCode pc =new PlantCode(plant);
               plantlist.add(pc);
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
         finally{
        	 ETLConnection.shutdown(rs, ps, con);
             }//finally close
		
        return plantlist;


}
  


}
