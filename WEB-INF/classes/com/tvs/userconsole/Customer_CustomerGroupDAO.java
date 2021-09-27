package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class Customer_CustomerGroupDAO {

	
	public List<Customer_CustomerGroup> custtypeforcustomer(String rolename) throws SQLException, ClassNotFoundException

	{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	List<Customer_CustomerGroup> listcust = new ArrayList<>();
	try {
	con = AuditConnection.getConnection();
	String sql = "SELECT * FROM \"Role_Customer_CustomerGroup\" where \"Rolename\" =? ";
	ps = con.prepareStatement(sql);
	ps.setString(1,rolename);
	rs = ps.executeQuery();
	while (rs.next()) 
	{
	String role = rs.getString("Rolename");
	String vencode = rs.getString("Customer_Group_Code");
	String ventype = rs.getString("Customer_Group_Type");
	String vendesc = rs.getString("Customer_Group_Description");
	Customer_CustomerGroup ccg=new Customer_CustomerGroup(role, vencode, ventype, vendesc);
	listcust.add(ccg);
	}
	rs.close();
	rs = null;
	ps.close();
	ps = null;
	con.close();
	con = null;

	}
	catch (SQLException ex) {
	ex.printStackTrace();
	throw ex;
	}
	finally {
	AuditConnection.shutdown(rs, ps, con);
	} // finally
	return listcust;
	}

	
	public static int insert_Customer_Customer_Group(Customer_CustomerGroup e){  
	   int status=0;  
	   Connection con=null;
	   PreparedStatement ps=null;
	   try
	   {  
	    con=AuditConnection.getConnection();
	       ps=con.prepareStatement("INSERT INTO \"Role_Customer_CustomerGroup\"(\"Rolename\", \"Customer_Group_Type\",\"Customer_Group_Code\", \"Customer_Group_Description\")VALUES (?, ?, ?,?);");
	       ps.setString(1,e.getRolename());            
	       ps.setString(2,e.getCustomergrouptype());
	       ps.setString(3,e.getCustomergroupcode());
	       ps.setString(4,e.getCustomergroupdesc());
	       status=ps.executeUpdate();  
	       ps.close();
	       ps=null;
	       con.close();
	       con=null;
	   }
	   catch(Exception ex){ex.printStackTrace();}  
	   finally{          
	    AuditConnection.shutdown(ps, con);              
	          }//finally close
	   return status;  
	}  

	public static int delete_Customer_Customer_Group(String role){  
		   int status=0;  
		   Connection con=null;
		   PreparedStatement ps=null;
		   try
		   {  
		       con=AuditConnection.getConnection();
		       ps=con.prepareStatement("Delete from  \"Role_Customer_CustomerGroup\" where \"Rolename\"=?");
		       ps.setString(1,role);            
		       status=ps.executeUpdate();  
		       ps.close();
		       ps=null;
		       con.close();
		       con=null;
		   }
		   catch(Exception ex){ex.printStackTrace();}  
		   finally{          
		    AuditConnection.shutdown(ps, con);              
		          }//finally close
		   return status;  
		}  

	
	
public List<Customer_CustomerGroup> custcustomergrouplist(String rolename) throws SQLException, ClassNotFoundException
    
    {
    List<Customer_CustomerGroup> listcustgroup = new ArrayList<>();

		 Connection con=null;
		 ResultSet result=null;
		 PreparedStatement ps=null;
         try
         {
        	  con=AuditConnection.getConnection();   
        	  String sql = "SELECT * FROM \"Role_Customer_CustomerGroup\" where \"Rolename\"=?  ";           
        	  ps=con.prepareStatement(sql);
        	  ps.setString(1,rolename);
              result = ps.executeQuery();             
            while (result.next()) {
                 String code  = result.getString("Customer_Group_Code");
                 String type  = result.getString("Customer_Group_Type");
                 String desc = result.getString("Customer_Group_Description");
                 
                 Customer_CustomerGroup ccg =new Customer_CustomerGroup(code, type, desc);
                 listcustgroup.add(ccg);
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
        return listcustgroup;


}

}
