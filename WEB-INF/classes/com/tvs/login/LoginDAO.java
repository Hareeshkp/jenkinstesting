package com.tvs.login;


import static com.theromus.sha.Parameters.SHA3_256;
import static com.theromus.utils.HexUtils.convertBytesToString;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.theromus.sha.Keccak;
import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;
import com.tvs.scrbasic.SCRBasic;



public class LoginDAO {
	
	public static boolean validate(String userid,String pass){  
		boolean status=false;  
       String dbpass=null;
       
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try
		{  

		con=AuditConnection.getConnection();
	    ps=con.prepareStatement("select * from \"User\" where \"Userid\"=? ");  
		ps.setString(1,userid);  
        rs=ps.executeQuery();  
		
		if(rs.next())
		{
			 dbpass=rs.getString("Password");	
		}
		rs.close();
        rs=null;
        ps.close();
        ps=null;
        con.close();
        con=null;
        byte[] data = pass.getBytes(StandardCharsets.UTF_8);//password
    	Keccak keccak = new Keccak();
    	String passwords=convertBytesToString(keccak.getHash(data, SHA3_256));//Hashing=salting+password
		String dummy=dbpass.substring(64);
		status=dummy.equals(passwords);
			          
		}
		catch(Exception e)
		{
			
		}  
		
		finally 
		
		{
			AuditConnection.shutdown(rs, ps, con);
			
		}
		return status;  


		}  
	
	
	
	
	public static int useraudit(String userid){  
	    int status=0;  
	    Connection con=null;
	    PreparedStatement ps=null;
	    try
	    {  
	    	con=ETLConnection.getConnection();
	        ps=con.prepareStatement("INSERT INTO \"Audit\".\"User_Audit\"(\"Userid\", \"LoginTime\")VALUES (?, ?)"); 
	        ps.setString(1,userid); 	            
	        ps.setObject(2,new Timestamp(System.currentTimeMillis()));   
	        status=ps.executeUpdate();  
	        ps.close();
	        ps=null;
	        con.close();
	        con=null;
	    }
	    catch(Exception ex){ex.printStackTrace();}  
	    finally{	          	 
	      	ETLConnection.shutdown(ps, con);	               
	           }//finally close
	    return status;  
	}  
	
	
	



}
