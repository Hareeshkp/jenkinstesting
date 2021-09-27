package com.tvs.Purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.tvs.dbconnection.ETLConnection;
import com.tvs.Purchase.PurchaseApproval;

public class PurchaseApprovalDAO {

	public static int Update(PurchaseApproval e){  
        int status=0;  
        	Connection con=null;
	        PreparedStatement ps=null;        
        try{  
        	 con=ETLConnection.getConnection();
             ps=con.prepareStatement("Update  \"STG_SCR_Plant_Storage_Purchase\" set \"Approved_By\" =?,\"Approved_Date\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=? where \"MDM_Code\"=? and \"Plant_Code\"=? ");  
        
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
	        ps.setString(6, e.getPlantcode());
	        
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
	
	 public static int insertaudit(PurchaseApproval e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Purchase_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getApprovalprocess()); 	            
		        ps.setString(2,e.getApprovedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getTalendcode());
		        ps.setString(5,e.getPlantcode());
	
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
