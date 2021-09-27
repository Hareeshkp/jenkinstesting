package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class RoleDAO {

	public static Role getRoleByRoleName(String rolename){  
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Role r =new Role();
		    try{  
		    	 
		         con= AuditConnection.getConnection();
		      ps=con.prepareStatement("select * from  \"Rolelist\" where \"Rolename\"=?");  
		        ps.setString(1,rolename);  
		    rs=ps.executeQuery();  
		        if(rs.next()){  
		        	r.setRole(rs.getString("Rolename"));
		        	r.setBasic(rs.getString("SCR_Basic"));
		        	r.setPlantStoragePurchase(rs.getString("SCR_Plant_Storage_Purchase"));
		        	r.setCostingAccounting(rs.getString("SCR_Costing_Accounting"));
//		        	r.setPlantmapping(rs.getString("SCR_Plantmapping"));
//		        	r.setPurchasing(rs.getString("SCR_Plant_Storage_Purchase"));
		        	r.setMrp(rs.getString("SCR_MRP"));
//		        	r.setPlantstorage(rs.getString("SCR_PlantAndStorage"));
		            r.setSales(rs.getString("SCR_Sales"));
//		        	r.setCosting(rs.getString("SCR_Costing_Accounting"));
		            r.setCostingAccounting(rs.getString("SCR_Costing_Accounting"));
//		        	r.setAccounting(rs.getString("SCR_Accounting"));
		        	
		             r.setCustomer(rs.getString("SCR_Customer"));
		             r.setVendor(rs.getString("SCR_Vendor"));
		             r.setMdmadmin(rs.getBoolean("IsMDMAdmin"));
		           
		        }  
		        rs.close();
		        rs=null;
		        ps.close();
		        ps=null;
		        con.close();
		        con=null;
		        
		    }catch(Exception ex){ex.printStackTrace();}  
		      
		    finally 
			
			{
				
				AuditConnection.shutdown(rs, ps, con);
				
			}
		    
		    
		    return r;  
		    
		   	    
}
	
	
	
public List<Role> roledetails() throws SQLException, ClassNotFoundException
    
    
    
    {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
        List<Role> roledetails = new ArrayList<>();
         try
         {
        	 
        	 con=AuditConnection.getConnection();
              ps=con.prepareStatement("select * from \"Rolelist\" ");
        	 result = ps.executeQuery();
             
            while (result.next()) {
            
                String role=result.getString("Rolename");
                String basic=result.getString("SCR_Basic");
//            	String plantmapping=result.getString("SCR_Plantmapping");
            	String purchasing=result.getString("SCR_Plant_Storage_Purchase");
            	String mrp=result.getString("SCR_MRP");
//            	String plantstorage=result.getString("SCR_PlantAndStorage");
            	String sales=result.getString("SCR_Sales");
            	String costing=result.getString("SCR_Costing_Accounting");
//            	String costing=result.getString("SCR_Costing");
//            	String accounting=result.getString("SCR_Accounting");
            	//customer
            	String customer=result.getString("SCR_Customer");
            	//vendor
            	String vendor=result.getString("SCR_Vendor");
            	String createdby=result.getString("Created_By");
            	Object createddate=result.getString("Created_Date");
            	String modifiedby=result.getString("Modified_By");
            	String modifieddate=result.getString("Modified_Date");
            	Boolean mdmadmins=result.getBoolean("IsMDMAdmin");
            	Role obj=new Role(role, basic, purchasing, mrp, sales, costing, customer, vendor, createdby, createddate, modifiedby, modifieddate, mdmadmins);
                roledetails.add(obj);


//Role obj=new Role(role, basic, plantmapping, purchasing, mrp, plantstorage, sales, costing, accounting, customer, vendor, createdby, createddate, modifiedby, modifieddate, mdmadmins);
//            	
//                     roledetails.add(obj);
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
         
         
         finally 
 		
 		{
 			
 			AuditConnection.shutdown(result, ps, con);
 			
 		}
        return roledetails;


}




	
}
