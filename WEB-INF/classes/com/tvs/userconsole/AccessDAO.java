package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class AccessDAO {
	

public List<Access> accesslist() throws SQLException, ClassNotFoundException
       
    {
	Connection con=null;
    PreparedStatement ps=null;
    ResultSet rs=null;
	
        List<Access> listaccess = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();

         	String sql = "SELECT * FROM \"Access\" ";
           
        	
        	 ps=con.prepareStatement(sql);
             rs = ps.executeQuery();
             
            while (rs.next()) {
                 String access  = rs.getString("access");
               
                 Access a=new Access(access);
                 
                listaccess.add(a);
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
        	    
             
             AuditConnection.shutdown(rs, ps, con);
             
         }//finally
         
         
         
        return listaccess;


}

public List<MaterialAcess> materialaccesslist() throws SQLException, ClassNotFoundException

{
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

    List<MaterialAcess> listaccess = new ArrayList<>();
     try
     {
    	 
    	 con=AuditConnection.getConnection();

     	String sql = "SELECT * FROM \"Material_Access\" ";
       
    	
    	 ps=con.prepareStatement(sql);
         rs = ps.executeQuery();
         
        while (rs.next()) {
             String access  = rs.getString("access");
           
             MaterialAcess a=new MaterialAcess(access);
             
            listaccess.add(a);
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
    	    
         
         AuditConnection.shutdown(rs, ps, con);
         
     }//finally
     
     
     
    return listaccess;


}

  


}
