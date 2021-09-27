package com.tvs.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.tvs.Sales.SalesApproval;
import com.tvs.dbconnection.ETLConnection;

public class SalesApprovalDAO {
	public static int Update(SalesApproval  e){  
        int status=0;  
        	Connection con=null;
	        PreparedStatement ps=null;        
        try{  
        	 con=ETLConnection.getConnection();
             ps=con.prepareStatement("Update  \"STG_SCR_Sales\" set \"Approved_By\" =?,\"Approved_Date\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=? where \"MDM_Code\"=?  and \"Plant_Code\"=? and \"Dist_Channel_Code\"=?   ");  
        
            ps.setString(1,e.getApprovedby()); 
            ps.setObject(2,new Timestamp(System.currentTimeMillis())); 	            
            ps.setString(3,e.getApprovalprocess());  
            if(e.getReasonforrejection().isEmpty())
            {
                ps.setString(4,null);             

            }
            else
            {
                ps.setString(4,e.getReasonforrejection());             

            }
	        ps.setInt(5,e.getTalendcode()); 
	        ps.setString(6,e.getPlantcode());
	        ps.setString(7,e.getDistchannelcode());

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
	
	
	 public static int insertaudit(SalesApproval e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Sales_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\",\"Dist_Channel_Code\",\"Dist_Channel_Description\")VALUES (?, ?, ?, ?,?,?,?);"); 
		        ps.setString(1,e.getApprovalprocess()); 	            
		        ps.setString(2,e.getApprovedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getTalendcode());
		        ps.setString(5,e.getPlantcode());
		        ps.setString(6,e.getDistchannelcode());
		        ps.setString(7,e.getDistchanneldesc());
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
