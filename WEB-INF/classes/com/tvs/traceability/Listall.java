package com.tvs.traceability;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.ETLConnection;

public class Listall {
public List<Allvalues> alllist() throws SQLException, ClassNotFoundException  
{
	       Connection con=null;
	       PreparedStatement pst=null;
	       ResultSet rs=null;
	         
       List<Allvalues> listall = new ArrayList<>();
        try
        {
       	 
       	con=ETLConnection.getConnection();
        	
    	String sql = "(SELECT \"MDM_Vendor_Code\" AS \"MDM_Code\",\"SAP_Vendor_Code\" AS \"SAP_Code\",CONCAT(\"First_Name\",\"Last_Name\") AS \"Name\",\"Created_By\" AS \"Created_By\",\"Created_Date\" AS \"Created_On\",\"Reviewed_By\" AS \"Reviewed_By\",\"Reviewed_Date\" AS \"Reviewed_On\",\"Approved_By\" AS \"Approver\",\"Approval_Status\" AS \"Status\",\"Approved_Date\" AS \"Approved_On\",(CASE WHEN \"SAP_Vendor_Code\" is null OR \"SAP_Vendor_Code\" ='' THEN 'Inactive' ELSE 'Active' END) AS \"SAP_Status\",\"Version\",'Vendor' as \"DocumentType\" FROM public.\"STG_SCR_Vendor\") UNION (SELECT \"MDM_Customer_Code\" AS \"MDM_Code\",\"SAP_Customer_Code\" AS \"SAP_Code\",CONCAT(\"Name\",\"Name2\") AS \"Name\",\"Created_By\" AS \"Created_By\",\"Created_Date\" AS \"Created_On\",\"Reviewed_By\" AS \"Reviewed_By\",\"Reviewed_Date\" AS \"Reviewed_On\",\"Approved_By\" AS \"Approver\",\"Approval_Status\" AS \"Status\",\"Approved_Date\" AS \"Approved_On\",(CASE WHEN \"SAP_Customer_Code\" is null OR \"SAP_Customer_Code\" ='' THEN 'Inactive' ELSE 'Active' END) AS \"SAP_Status\", \"Version\",'Customer' as \"DocumentType\" FROM public.\"STG_SCR_Customer\")"; 
          pst =con.prepareStatement(sql);        	
          rs = pst.executeQuery();             
           while (rs.next()) {           
        	   Integer MDM_Code=rs.getInt("MDM_Code");
        	   String SAP_Code=rs.getString("SAP_Code");
        	   String Name=rs.getString("Name");
        	   String Created_By=rs.getString("Created_By");
        	   String Created_On=rs.getString("Created_On");
        	   String Reviewed_By=rs.getString("Reviewed_By");
	           String Reviewed_On=rs.getString("Reviewed_On");
	       	   String Approver=rs.getString("Approver");
	       	   String Status=rs.getString("Status");
        	   String Approved_On=rs.getString("Approved_On");
	           String SAP_Status=rs.getString("SAP_Status");
	       	   Integer Version=rs.getInt("Version");
	       	   String DocumentType=rs.getString("DocumentType");
	       	   System.out.println("getting all data");
	       	   System.out.println(Version);
	       	 Allvalues allval =new Allvalues(MDM_Code, SAP_Code, Name, Created_By, Created_On, Reviewed_By, Reviewed_On, Approver,Status,Approved_On,SAP_Status,Version,DocumentType);
	       	   listall.add(allval);
	       	 
	       			 

           }          
           rs.close();
           rs=null;
           pst.close();
           pst=null;
           con.close();
           con=null;
           
       } 
        catch (SQLException ex) {
           ex.printStackTrace();
           throw ex;
       }      
        
        finally{
       	 ETLConnection.shutdown(rs, pst, con);    	 
            }//finally close
        return listall;

   }
}
