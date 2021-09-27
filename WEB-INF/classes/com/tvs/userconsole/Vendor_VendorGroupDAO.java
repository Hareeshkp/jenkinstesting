package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class Vendor_VendorGroupDAO {

	public List<Vendor_VendorGroup> ventypeforvendor(String rolename) throws SQLException, ClassNotFoundException

	{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	List<Vendor_VendorGroup> listven = new ArrayList<>();
	try {
	con = AuditConnection.getConnection();

	String sql = "SELECT * FROM \"Role_Vendor_VendorGroup\" where \"Rolename\" =? ";

	ps = con.prepareStatement(sql);
	ps.setString(1,rolename);
	rs = ps.executeQuery();

	while (rs.next()) 
	{
	String role = rs.getString("Rolename");
	String vencode = rs.getString("Vendor_Group_Code");
	String ventype = rs.getString("Vendor_Group_Type");
	String vendesc = rs.getString("Vendor_Group_Description");
	Vendor_VendorGroup vvg =new Vendor_VendorGroup(role, vencode, ventype, vendesc);
	listven.add(vvg);
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

	return listven;

	}

	public static int insert_Vendor_Vendor_Group(Vendor_VendorGroup e){  
	   int status=0;  
	   Connection con=null;
	   PreparedStatement ps=null;
	   try
	   {  
	    con=AuditConnection.getConnection();
	       ps=con.prepareStatement("INSERT INTO \"Role_Vendor_VendorGroup\"(\"Rolename\", \"Vendor_Group_Type\",\"Vendor_Group_Code\", \"Vendor_Group_Description\")VALUES (?, ?, ?,?);");
	       ps.setString(1,e.getRolename());            
	       ps.setString(2,e.getVendorgrouptype());
	       ps.setString(3,e.getVendorgroupcode());
	       ps.setString(4,e.getVendorgroupdesc());

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

	public static int delete_Vendor_Vendor_Group(String role){  
		   int status=0;  
		   Connection con=null;
		   PreparedStatement ps=null;
		   try
		   {  
		       con=AuditConnection.getConnection();
		       ps=con.prepareStatement("Delete from  \"Role_Vendor_VendorGroup\" where \"Rolename\"=?");
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

	
	
public List<Vendor_VendorGroup> venvendorgrouplist(String rolename) throws SQLException, ClassNotFoundException
    
    {
    List<Vendor_VendorGroup> listvengroup = new ArrayList<>();

		 Connection con=null;
		 ResultSet result=null;
		 PreparedStatement ps=null;
         try
         {
        	  con=AuditConnection.getConnection();   
        	  String sql = "SELECT * FROM \"Role_Vendor_VendorGroup\" where \"Rolename\"=?  ";           
        	  ps=con.prepareStatement(sql);
        	  ps.setString(1,rolename);
              result = ps.executeQuery();             
            while (result.next()) {
                 String code  = result.getString("Vendor_Group_Code");
                 String type  = result.getString("Vendor_Group_Type");
                 String desc = result.getString("Vendor_Group_Description");
                 Vendor_VendorGroup vvg =new Vendor_VendorGroup(code, type, desc);
                 listvengroup.add(vvg);
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
        return listvengroup;


}

}
