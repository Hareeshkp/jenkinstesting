package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;



public class ApprovalDAO {

	
public static int update(Approval e){  
	        int status=0;  
	        	Connection con=null;
	        	PreparedStatement ps=null;	        
	        try{  
	        	 con=ETLConnection.getConnection();
	        	 ps=con.prepareStatement("Update \"STG_SCR_Basic\" set \"Approval_Status\"=?,\"Reject_Reason\"=?,\"Approved_By\"=?,\"Approved_Date\"=? where \"MDM_Code\"=?");	            
	            
	             ps.setString(1,e.getApprovalprocess());
	             
	             if(e.getReasonforrejection().isEmpty())
		            {
			            ps.setString(2,null); 

		            }
		            else
		            {
			             ps.setString(2,e.getReasonforrejection());	  
		            }
	             ps.setString(3,e.getApprovedby());	
	             ps.setObject(4,new Timestamp(System.currentTimeMillis()));	
	             ps.setInt(5,e.getTalendcode());
	             status=ps.executeUpdate();  	              
	             
	             ps.close();
	             ps=null;
	             con.close();
	             con=null;
	        }catch(Exception ex){ex.printStackTrace();}  
	        finally{
	          	 ETLConnection.shutdown(ps, con);
	               }//finally close
	        return status;  
	    }  



public static int insertaudit(Approval e){  
    int status=0;  
    Connection con=null;
    PreparedStatement ps=null;
    try
    {  
    	con=ETLConnection.getConnection();
        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Basic_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\")VALUES (?, ?, ?, ?);"); 
        ps.setString(1,e.getApprovalprocess()); 	            
        ps.setString(2,e.getApprovedby()); 
        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
        ps.setInt(4,e.getTalendcode());
        
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
