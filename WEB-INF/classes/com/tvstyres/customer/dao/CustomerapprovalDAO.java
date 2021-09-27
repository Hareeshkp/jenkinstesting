package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import com.tvs.dbconnection.ETLConnection;
import com.tvstyres.customer.model.Customerapproval;

public class CustomerapprovalDAO {
	
	public static int update(Customerapproval e){  
        int status=0;  
        	Connection con=null;
        	PreparedStatement ps=null;	        
        try{  
        	 con=ETLConnection.getConnection();
        	 ps=con.prepareStatement("Update \"STG_SCR_Customer\" set \"Approval_Status\"=?,\"Reason_For_Reject\"=?,\"Approved_By\"=?,\"Approved_Date\"=? ,\"Rejected_By\"=? where \"MDM_Customer_Code\"=?");	            
            
             ps.setString(1,e.getApproval_status());
             
             if(e.getReason_for_reject().isEmpty())
	            {
		            ps.setString(2,null); 

	            }
	            else
	            {
		             ps.setString(2,e.getReason_for_reject());	  
	            }
             ps.setString(3,e.getApproved_by());	
             ps.setObject(4,new Timestamp(System.currentTimeMillis()));	
             ps.setString(5,e.getRejected_by());
             ps.setInt(6,e.getMdm_customer_code());
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
	
	public static int reviewerUpdate(Customerapproval e){  
        int status=0;  
        	Connection con=null;
        	PreparedStatement ps=null;	        
        try{  
        	 con=ETLConnection.getConnection();
        	 ps=con.prepareStatement("Update \"STG_SCR_Customer\" set \"Approval_Status\"=?,\"Reason_For_Reject\"=?,\"Reviewed_By\"=?,\"Reviewed_Date\"=?,\"Rejected_By\"=? where \"MDM_Customer_Code\"=?");	            
            
             ps.setString(1,e.getApproval_status());
             
             if(e.getReason_for_reject().isEmpty())
	            {
		            ps.setString(2,null); 

	            }
	            else
	            {
		             ps.setString(2,e.getReason_for_reject());	  
	            }
             ps.setString(3,e.getReviewed_by());	
             ps.setObject(4,new Timestamp(System.currentTimeMillis()));	
             ps.setString(5,e.getRejected_by());	
             ps.setInt(6,e.getMdm_customer_code());
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
	

}
