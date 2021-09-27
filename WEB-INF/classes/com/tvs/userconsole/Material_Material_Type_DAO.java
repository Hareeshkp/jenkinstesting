package com.tvs.userconsole;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;

public class Material_Material_Type_DAO {
	
	public List<Material_Material_Type> matertialtypelist(String rolename) throws SQLException, ClassNotFoundException

	{
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	List<Material_Material_Type> listmat = new ArrayList<>();
	try {
	con = AuditConnection.getConnection();
	
	String sql = "SELECT * FROM \"Role_Material_MaterialType\" where \"Rolename\" =? ";
	ps = con.prepareStatement(sql);
	ps.setString(1,rolename);
	rs = ps.executeQuery();
	while (rs.next()) {
	String role = rs.getString("Rolename");
	String mattypecode = rs.getString("Material_Type_Code");
	//String mattypedesc = rs.getString("Material_Type_Description").split("-")[1];
	String mattypedesc = rs.getString("Material_Type_Description");
	Material_Material_Type mmt = new Material_Material_Type(role, mattypecode, mattypedesc);

	listmat.add(mmt);
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

	return listmat;

	}

	public static int insert_Material_Material_Type(Material_Material_Type e){  
	   int status=0;  
	   Connection con=null;
	   PreparedStatement ps=null;
	   try
	   {  
	    con=AuditConnection.getConnection();
	       ps=con.prepareStatement("INSERT INTO \"Role_Material_MaterialType\"(\"Rolename\", \"Material_Type_Code\", \"Material_Type_Description\")VALUES (?, ?, ?);");
	       ps.setString(1,e.getRolename());            
	       ps.setString(2,e.getmaterialtypecode());
	       ps.setString(3,e.getmaterialtypedesc());
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
	
	public static int delete_Material_Material_Type(String role){  
		   int status=0;  
		   Connection con=null;
		   PreparedStatement ps=null;
		   try
		   {  
		    con=AuditConnection.getConnection();
		       ps=con.prepareStatement("DELETE from   \"Role_Material_MaterialType\"     where \"Rolename\"=?");
		       //ps.setString(1,e.getMattypecode());
		      // ps.setString(2,e.getMattypedesc());
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

	
public List<Vendor_Material_Type> venmateriallist(String rolename) throws SQLException, ClassNotFoundException
    
    {
    List<Vendor_Material_Type> listmaterial = new ArrayList<>();

		 Connection con=null;
		 ResultSet result=null;
		 PreparedStatement ps=null;
         try
         {
        	  con=AuditConnection.getConnection();   
        	  String sql = "SELECT * FROM \"Role_Vendor_MaterialType\" where \"Rolename\"=?  ";           
        	  ps=con.prepareStatement(sql);
        	  ps.setString(1,rolename);
              result = ps.executeQuery();             
            while (result.next()) {
                 String type  = result.getString("Material_Type_Code");
                 String desc = result.getString("Material_Type_Description");
                 Vendor_Material_Type vmt =new Vendor_Material_Type(type, desc);
                 listmaterial.add(vmt);
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
        return listmaterial;


}


}
