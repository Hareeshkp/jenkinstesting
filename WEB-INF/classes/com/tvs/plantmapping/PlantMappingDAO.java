package com.tvs.plantmapping;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tvs.Purchase.Purchase;
import com.tvs.costing.Costing;
import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;
import com.tvs.scrbasic.SCRBasic;

public class PlantMappingDAO {
	 
	//Insert the record for plantmapping
	 public static int insert(PlantMapping e){  
	        int status=0;  
	        Connection con=null;
			PreparedStatement ps=null;
	        try{  
	        	con=ETLConnection.getConnection();
	        	ps=con.prepareStatement("insert into  \"STG_SCR_Plant_Mapping\" (\"MDM_Code\",\"Material_Type_Code\",\"Material_Type_Description\",\"Material_Group_Code\",\"Material_Group_Description\",\"Material_Code\",\"Material_Description\",\"Created_By\",\"Created_Date\",\"Status\",\"Approval_Status\") values(?,?,?,?,?,?,?,?,?,?,?)");  
	        	ps.setInt(1,e.getTalendcode()); 	            
	            ps.setString(2,e.getMaterialtype()); 
	            ps.setString(3,e.getMaterialtypedesc()); 	            
	            ps.setString(4,e.getMaterialgroup());  
	            ps.setString(5,e.getMaterialgroupdesc());  
	            ps.setString(6,e.getMaterialcode());  
                ps.setString(7,e.getDescription());  
                ps.setString(8,e.getCreatedby());              
                ps.setObject(9,new Timestamp(System.currentTimeMillis()));
                ps.setString(10,e.getStatus());
                ps.setString(11,e.getApprovalprocess());

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

	 public static int inserts(String coust[],Integer talendcode){  
	        int status=0;  
	        Connection con=null;
		       PreparedStatement ps=null;
	         try{  
	       
	            con=ETLConnection.getConnection();  
	            String list=null;	        
	            for(int i=0; i<coust.length;i++){	           	
	          	 String insertTableSQL = "INSERT INTO \"STG_DTL_Plant_Mapping\" "
	        			+ "(plant,storages,plantdesc,sdesc,storageid,talendcode) VALUES"
	        			+ "(?,?,?,?,?,?)";
		        ps=con.prepareStatement(insertTableSQL);  
		        list=coust[i];
		        String[] parts = list.split("#");
		        String part1 = parts[0]; 
		        String part2 = parts[1]; 
		        String part3= parts[2];
		        String part4= parts[3];
		        Integer part5=Integer.parseInt(parts[4]);    
	            ps.setString(1,part1);//plant
	            ps.setString(2,part3);//storage
	            ps.setString(3,part2);//plantdesc
	            ps.setString(4,part4);//storagedesc
	            ps.setInt(5,part5);//storagedesc
	            ps.setInt(6,talendcode);//storagedesc
	            status=ps.executeUpdate();  
	          
	           
	            }
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
	 
	 public List<PlantMapping> alllist(String mattype) throws SQLException, ClassNotFoundException  
	    
	    {		 
		 
		 if(mattype.equals("None"))
		 {
			 Connection con=null;
			 	PreparedStatement ps=null;
			 	ResultSet result=null;
			 	String stus="Inactive";
		        List<PlantMapping> listall = new ArrayList<>();
		         try
		         {
		        	 con=ETLConnection.getConnection();
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  p.\"Status\"=?";
		        	 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,stus); 
		             result = ps.executeQuery();	             
		             while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
		            	listall.add(p);
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
		         finally{
		        	ETLConnection.shutdown(result, ps, con);
		        	
		             
		             }	         
		        return listall;
		 }
		 
		 else
		 {
			 
			 Connection con=null;
			 	PreparedStatement ps=null;
			 	ResultSet result=null;
			 	String stus="Inactive";
		        List<PlantMapping> listall = new ArrayList<>();
		         try
		         {
		        	 con=ETLConnection.getConnection();
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  p.\"Status\"=? and p.\"Material_Type_Code\"=?";
		        	 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,stus); 
		        	 ps.setString(2,mattype);
		             result = ps.executeQuery();	             
		             while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
		            	listall.add(p);
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
		         finally{
		        	ETLConnection.shutdown(result, ps, con);
		        	
		             
		             }	         
		        return listall; 
			 
		 }
		 	
	}
	 public List<PlantMapping> userlist2(String username,String mattype,String stat,String apvstatus,Integer vers) throws SQLException, ClassNotFoundException  
	 {
	     Connection con=null;
	     PreparedStatement ps=null;
		 ResultSet result=null;
		 List<PlantMapping> listall = new ArrayList<>();
		 try
		 {
        	 con=ETLConnection.getConnection();
        	 String sql=null;
        	 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", p.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" p where p.\"Created_By\"=? and p.\"Material_Type_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";        	
    		 ps=con.prepareStatement(sql); 	
        	 ps.setString(1,username);
        	 //ps.setString(2,rolemattype);
        	 //ps.setString(3,rolemattype);
        	 ps.setString(2,mattype);
        	 ps.setString(3,stat);
        	 ps.setString(4,stat);
        	 ps.setString(5,apvstatus);
        	 ps.setString(6,apvstatus);
        	 ps.setInt(7,vers);
        	 ps.setInt(8,vers);
        	 System.out.println("==============================================================================");
        	 System.out.print(mattype);
        	 System.out.println(username);
        	 
        	 
             result = ps.executeQuery();	             
             while (result.next()) {	            	
            	Integer mdmcode=result.getInt("MDM_Code");
            	String materialcode=result.getString("Material_Code");
            	String materialcodedesc=result.getString("Material_Description");	            	
            	String materialtypedesc=result.getString("Material_Type_Description");
            	Integer version=result.getInt("version");
            	String uom=result.getString("Basic_UOM_Description");
            	String status=result.getString("Status");
            	String approvalprocess=result.getString("Approval_Status");
            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
            	listall.add(p);
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
         finally{
        	 ETLConnection.shutdown(result, ps, con);
        	 
             }	         
        return listall;
        }

//User based Showing Darft and Active records
	 public List<PlantMapping> userlist(String username,String mattype,String stat,String apvstatus,Integer vers) throws SQLException, ClassNotFoundException  
	    
	    {		 
		 
		
		 
		 
		 	Connection con=null;
		 	PreparedStatement ps=null;
		 	ResultSet result=null;
		
	        List<PlantMapping> listall = new ArrayList<>();
	         try
	         {
	        	 con=ETLConnection.getConnection();
	        	 String sql=null;
	        	 //sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Created_By\"=? and p.\"Material_Type_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	        		 
	             sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?)  or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))  and p.\"Material_Type_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        	 ps=con.prepareStatement(sql); 	
	        	 ps.setString(1,username);
	        	 //ps.setString(2,rolemattype);
	        	 //ps.setString(3,rolemattype);
	        	 ps.setString(2,mattype);
	        	 ps.setString(3,stat);
	        	 ps.setString(4,stat);
	        	 ps.setString(5,apvstatus);
	        	 ps.setString(6,apvstatus);
	        	 ps.setInt(7,vers);
	        	 ps.setInt(8,vers);	        	 
	        	 
	             result = ps.executeQuery();	             
	             while (result.next()) {	            	
	            	Integer mdmcode=result.getInt("MDM_Code");
	            	String materialcode=result.getString("Material_Code");
	            	String materialcodedesc=result.getString("Material_Description");	            	
	            	String materialtypedesc=result.getString("Material_Type_Description");
	            	Integer version=result.getInt("version");
	            	String uom=result.getString("Basic_UOM_Description");
	            	String status=result.getString("Status");
	            	String approvalprocess=result.getString("Approval_Status");
	            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
	            	listall.add(p);
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
	         finally{
	        	 ETLConnection.shutdown(result, ps, con);
	        	 
	             }	         
	        return listall;
	}
	 public List<PlantMapping> userlists1(String username,Integer mcode) throws SQLException, ClassNotFoundException  
	    
	    {		 
		 

		 	Connection con=null;
		 	PreparedStatement ps=null;
		 	ResultSet result=null;
		
	        List<PlantMapping> listall = new ArrayList<>();
	         try
	         {
	        	 con=ETLConnection.getConnection();
	        	 String sql=null;
        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", p.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" p where p.\"Created_By\"=? and p.\"MDM_Code\"=? ";
	        	 //sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Created_By\"=? and p.\"MDM_Code\"=? ";
     		 System.out.println("ooooooooooooooooooooooooooooo");
     		 System.out.println(username+" "+mcode);
	        	 System.out.println(sql);
	        	 ps=con.prepareStatement(sql); 	
	        	 ps.setString(1,username);
	        	 //ps.setString(2,rolemattype);
	        	 //ps.setString(3,rolemattype);
	        	 ps.setInt(2,mcode);
	        	 //System.out.println("Here is your sqll query");
	             //System.out.println(sql);
	        	 
	             result = ps.executeQuery();	             
	             while (result.next()) {	            	
	            	Integer mdmcode=result.getInt("MDM_Code");
	            	String materialcode=result.getString("Material_Code");
	            	String materialcodedesc=result.getString("Material_Description");	            	
	            	String materialtypedesc=result.getString("Material_Type_Description");
	            	Integer version=result.getInt("version");
	            	String uom=result.getString("Basic_UOM_Description");
	            	String status=result.getString("Status");
	            	String approvalprocess=result.getString("Approval_Status");
	            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
	            	listall.add(p);
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
	         finally{
	        	 ETLConnection.shutdown(result, ps, con);
	        	 
	             }	         
	        return listall;
	}


	 public List<PlantMapping> userlists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException  
	    
	    {		 
		 	Connection con=null;
		 	PreparedStatement ps=null;
		 	ResultSet result=null;
		
	        List<PlantMapping> listall = new ArrayList<>();
	         try
	         {
	        	 con=ETLConnection.getConnection();
	        	 String sql=null;
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None')  or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))  and p.\"MDM_Code\"=? ";
	        		 
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);
		        	 ps.setInt(2,mcode);
		        	
	        	 }
	        	 else
	        	 {
             sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Mapping\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?)  or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))  and p.\"MDM_Code\"=? ";
	        		 
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);
		        	 ps.setString(2,rolemattype);
		        	 ps.setString(3,rolemattype);
		        	 ps.setInt(4,mcode);
		        	
	        	 }
	        	 
	             result = ps.executeQuery();	             
	             while (result.next()) {	            	
	            	Integer mdmcode=result.getInt("MDM_Code");
	            	String materialcode=result.getString("Material_Code");
	            	String materialcodedesc=result.getString("Material_Description");	            	
	            	String materialtypedesc=result.getString("Material_Type_Description");
	            	Integer version=result.getInt("version");
	            	String uom=result.getString("Basic_UOM_Description");
	            	String status=result.getString("Status");
	            	String approvalprocess=result.getString("Approval_Status");
	            	PlantMapping p=new PlantMapping(mdmcode, materialcode,materialcodedesc, materialtypedesc, uom, version,status,approvalprocess);
	            	listall.add(p);
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
	         finally{
	        	 ETLConnection.shutdown(result, ps, con);
	        	 
	             }	         
	        return listall;
	}
	 public static PlantMapping getPlantMappingByTalendcode(Integer id){  
			
		   Connection con=null;
	       PreparedStatement ps=null;
	       ResultSet rs=null;
	       PlantMapping p=new PlantMapping();	          
	        try{  
	        	  con=ETLConnection.getConnection(); 
	        	  ps=con.prepareStatement("select * from \"STG_SCR_Plant_Mapping\" where \"MDM_Code\"=?");  	            
	              ps.setInt(1, id);
	              rs=ps.executeQuery();  
	            if(rs.next()){  
	            	p.setTalendcode(rs.getInt("MDM_Code"));
	            	p.setReasonforedit(rs.getString("Reason_For_Edit"));	
	            	p.setStatus(rs.getString("Status"));
	            	p.setApprovalprocess(rs.getString("Approval_Status"));
	            	p.setVersion(rs.getInt("version"));
	            	
	            }  
	            rs.close();
	            rs=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        }catch(Exception ex){ex.printStackTrace();}   
	        finally{
	        	 ETLConnection.shutdown(rs, ps, con);
	        	 
	             }//finally close
	          
	        return p;  
	    }  
	 public static int Update(PlantMapping e){  
	        int status=0;  
	        Connection con=null;
		       PreparedStatement ps=null;
	        
	        try{  
	        	 con=ETLConnection.getConnection();

	             ps=con.prepareStatement("Update  \"STG_SCR_Plant_Mapping\" set \"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Material_Group_Code\"=?,\"Material_Group_Description\"=?,\"Material_Code\"=?,\"Material_Description\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Reason_For_Edit\"=?,\"Status\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=? where \"MDM_Code\"=? "); 
	             ps.setString(1,e.getMaterialtype()); 
	             ps.setString(2,e.getMaterialtypedesc()); 	            
	             ps.setString(3,e.getMaterialgroup());  
	             ps.setString(4,e.getMaterialgroupdesc());  
	             ps.setString(5,e.getMaterialcode());  
                 ps.setString(6,e.getDescription());  
                 ps.setString(7,e.getModifiedby());           
		         ps.setObject(8,new Timestamp(System.currentTimeMillis()));
		         
		         
		         if(e.getReasonforedit().isEmpty())
		         {
			         ps.setString(9,null);

		         }
		         else
		         {
			         ps.setString(9,e.getReasonforedit());

		         }
		         
		         ps.setString(10, e.getStatus());
		         ps.setString(11, e.getApprovalprocess());
		         ps.setString(12, e.getReasonforrejection());
		         ps.setInt(13,e.getTalendcode()); 
	             status=ps.executeUpdate();
	            
	             ps.close();
	             ps=null;
	             con.close();
	             con=null;
	        }catch(Exception ex){ex.printStackTrace();}  	          
	        finally{
	        	
	        	 ETLConnection.shutdown(ps,con);        
	             }//finally close
	        
	        return status;  
	    }  
	 public static int Updatemdm(PlantMapping e){  
	        int status=0;  
	           Connection con=null;
		       PreparedStatement ps=null;
	        
	        try{  
	        	con=ETLConnection.getConnection();
	        	ps=con.prepareStatement("Update  \"STG_SCR_Plant_Mapping\" set \"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Material_Group_Code\"=?,\"Material_Group_Description\"=?,\"Material_Code\"=?,\"Material_Description\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"ReasonForEdit\"=? where \"MDM_Code\"=? ");  
	        	ps.setString(1,e.getMaterialtype()); 
	            ps.setString(2,e.getMaterialtypedesc()); 	            
	            ps.setString(3,e.getMaterialgroup());  
	            ps.setString(4,e.getMaterialgroupdesc());  
	            ps.setString(5,e.getMaterialcode());  
	            ps.setString(6,e.getDescription());  
	            ps.setString(7,e.getModifiedby());         
		        ps.setObject(8,new Timestamp(System.currentTimeMillis()));
		        if(e.getReasonforedit().isEmpty())
		         {
			         ps.setString(9,null);

		         }
		         else
		         {
			         ps.setString(9,e.getReasonforedit());

		         }
		        ps.setInt(10,e.getTalendcode()); 
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

	 public static int Updates(String coust[],Integer talendcode){
		 System.out.println("jjjjjjjjjjjjjjjjjjj");
		 System.out.println(coust);

	        	int status=0;  
	        	Connection con=null;
		        PreparedStatement ps=null;
	         try{  	       
	        	con=ETLConnection.getConnection();	            
	            String list=null;
	        //check null here
	            for(int i=0; i<coust.length;i++){	           	
	          	 String insertTableSQL = "INSERT INTO \"STG_DTL_Plant_Mapping\" "
	        			+ "(plant,storages,plantdesc,sdesc,storageid,talendcode) VALUES"
	        			+ "(?,?,?,?,?,?)";
	          	 
	            	/* String insertTableSQL = "Update   \"Plantmapping\" "
	 	        			+ " set plant=?,storages=?,plantdesc=?,sdesc=?,storageid=? where talendcode=? ";
	          	 
	          	 */
	          	 
		        ps=con.prepareStatement(insertTableSQL);  
		        list=coust[i];
		        String[] parts = list.split("#");
		        String part1 = parts[0]; 
		        String part2 = parts[1]; 
		        String part3= parts[2];
		        String part4= parts[3];
		        Integer part5=Integer.parseInt(parts[4]);	        
	            ps.setString(1,part1);//plant
	            ps.setString(2,part3);//storage
	            ps.setString(3,part2);//plantdesc
	            ps.setString(4,part4);//storagedesc
	            ps.setInt(5,part5);//storagedesc
	            ps.setInt(6,talendcode);//storagedesc
	            status=ps.executeUpdate(); 
	           
	           
	            }	    
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
		        }catch(Exception ex){ex.printStackTrace();}  
	         
	         finally
	         {	
	        	ETLConnection.shutdown(ps, con);
	        	
	          }//finally close
		          
		        return status;  
		    }  
	 
	 public static int UpdateDraft(String coust[],Integer talendcode){  
	        int status=0;  
	        Connection con=null;
		       PreparedStatement ps=null;
	         try{  
	       
	         con=ETLConnection.getConnection();
	            
	            String list=null;
	        //check null here
	            for(int i=0; i<coust.length;i++){
	           	
	          	 String insertTableSQL = "INSERT INTO \"STG_DTL_Plant_Mapping\" "
	        			+ "(plant,storages,plantdesc,sdesc,storageid,talendcode) VALUES"
	        			+ "(?,?,?,?,?,?)";
	          	 
	            	/* String insertTableSQL = "Update   \"STG_DTL_Plant_Mapping\" "
	 	        			+ " set plant=?,storages=?,plantdesc=?,sdesc=?,storageid=?,talendcode=?";
	          	 
	          	 */
	          	 
		        ps=con.prepareStatement(insertTableSQL);  
		        list=coust[i];
		        String[] parts = list.split("#");
		        String part1 = parts[0]; 
		        String part2 = parts[1]; 
		        String part3= parts[2];
		        String part4= parts[3];
		        Integer part5=Integer.parseInt(parts[4]); 
	            ps.setString(1,part1);//plant
	            ps.setString(2,part3);//storage
	            ps.setString(3,part2);//plantdesc
	            ps.setString(4,part4);//storagedesc
	            ps.setInt(5,part5);//storagedesc
	            ps.setInt(6,talendcode);//storagedesc   
	            status=ps.executeUpdate();  
	     
	         
	            }	
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
	 
	 public static int DeleteDraft(Integer talendcode){  
	        int status=0;  
	        Connection con=null;
		       PreparedStatement ps=null;
	         try{  	       
		         con=ETLConnection.getConnection();
		         String insertTableSQL = "Delete FROM   \"STG_DTL_Plant_Mapping\" where talendcode=? ";
		         ps=con.prepareStatement(insertTableSQL); 	     
	             ps.setInt(1,talendcode);//storagedesc
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
	 
	 
	 
	 
	 public static int insertaudit(PlantMapping e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Plant_Mapping_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\")VALUES (?, ?, ?, ?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getCreatedby()); 
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
	 
	 
	 public static int insertaudits(PlantMapping e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Plant_Mapping_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\")VALUES (?, ?, ?, ?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getModifiedby()); 
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
