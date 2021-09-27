package com.tvs.plantandstorage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.tvs.Purchase.Purchase;
import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class PlantandStorageDAO {
	 public static int insert(PlantandStorage e){  
	        int status=0; 
	        Connection con=null;
			PreparedStatement ps=null;
	        try{  
	        	con=ETLConnection.getConnection();
	            ps=con.prepareStatement("insert into  \"STG_SCR_Plant_Storage\" (\"MDM_Code\",\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Min_Rem_Shelf_Life\",\"Total_shelf_life\",\"Profit_Centre_Code\",\"Profit_Centre_Description\",\"Storage_Bin\",\"Unit_of_issue_Code\",\"Unit_of_issue_Description\",\"Serial_Number_Profile_code\",\"Serial_Number_Profile_Description\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
	        
	            ps.setInt(1,e.getMdmCode()); 	            
	            ps.setString(2,e.getMaterialcode()); 
	            ps.setString(3,e.getMaterialcodedesc()); 	            
	            ps.setString(4,e.getPlantcode());  	            
	            ps.setString(5,e.getPlantdesc()); 
	            
	            if(e.getMinshelf()!=null)
	            {
		            ps.setInt(6,e.getMinshelf());  
	            }
	            else
	            {
	            ps.setNull(6,Types.INTEGER);
	            }
	            
	            if(e.getTotalshelf()!=null)
	            {
		            ps.setInt(7,e.getTotalshelf());  
	            }
	            else
	            {
	            ps.setNull(7,Types.INTEGER);
	            }
	            
	            
	            ps.setString(8,e.getProfitcentrecode()); 
	            ps.setString(9,e.getProfitcentredesc()); 	
	            
	            
	            if(e.getStoragebin().isEmpty())
	            {
		            ps.setString(10,null); 

	            }
	            
	            else
	            {
		            ps.setString(10,e.getStoragebin()); 

	            }
	            
	            if(e.getUnitofissue().isEmpty())
	            {
		            ps.setString(11,null);	            

	            }
	            else
	            {
		            ps.setString(11,e.getUnitofissue());	            
	
	            }
	            
	            
	            if(e.getUnitofissuedesc().isEmpty())
	            {
		            ps.setString(12,null);  

	            }
	            else
	            {
		            ps.setString(12,e.getUnitofissuedesc());  

	            }
	            
	            
	            if(e.getSerial_Number_Profile_code().isEmpty())
	            {
		            ps.setString(13,null); 

	            }
	            else
	            {
		            ps.setString(13,e.getSerial_Number_Profile_code()); 

	            }
	            
	            if(e.getSerial_Number_Profile_Description().isEmpty())
	            {
		            ps.setString(14,null); 

	            }
	            else
	            {
		            ps.setString(14,e.getSerial_Number_Profile_Description()); 

	            }
	            
	            ps.setString(15,e.getStatus());	            
	            ps.setString(16,e.getCreatedby()); 	  
	            ps.setObject(17,new Timestamp(System.currentTimeMillis()));
	            ps.setString(18,e.getMaterialtypecode());	            
	            ps.setString(19,e.getMaterialtypedesc());
	            ps.setString(20,e.getApprovalprocess());
	            status=ps.executeUpdate();  	              
	           
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;  
	        }
	        catch(Exception ex)
	        {
	        	ex.printStackTrace();
	        }  
	        finally {
				ETLConnection.shutdown(ps, con);
			}
	        return status;  
	    }  

	 public static int Update(PlantandStorage e){  
	        int status=0; 
	        Connection con=null;
			PreparedStatement ps=null;
	        try{  
	        	con=ETLConnection.getConnection();
	            ps=con.prepareStatement("Update \"STG_SCR_Plant_Storage\" set \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Code\"=?,\"Plant_Description\"=?,\"Min_Rem_Shelf_Life\"=?,\"Total_shelf_life\"=?,\"Profit_Centre_Code\"=?,\"Profit_Centre_Description\"=?,\"Storage_Bin\"=?,\"Unit_of_issue_Code\"=?,\"Unit_of_issue_Description\"=?,\"Serial_Number_Profile_code\"=?,\"Serial_Number_Profile_Description\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Reason_For_Edit\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=? where \"MDM_Code\"=? and \"Plant_Code\"=? ");  
	            ps.setString(1,e.getMaterialcode()); 
	            ps.setString(2,e.getMaterialcodedesc()); 	            
	            ps.setString(3,e.getPlantcode());  	            
	            ps.setString(4,e.getPlantdesc()); 
	            if(e.getMinshelf()!=null)
	            {
		            ps.setInt(5,e.getMinshelf());  
	            }
	            else
	            {
	            ps.setNull(5,Types.INTEGER);
	            }
	            
	            if(e.getTotalshelf()!=null)
	            {
		            ps.setInt(6,e.getTotalshelf());  
	            }
	            else
	            {
	            ps.setNull(6,Types.INTEGER);
	            }
	            ps.setString(7,e.getProfitcentrecode()); 
	            ps.setString(8,e.getProfitcentredesc()); 	 
	            
	            if(e.getStoragebin().isEmpty())
	            {
		            ps.setString(9,null); 

	            }
	            
	            else
	            {
		            ps.setString(9,e.getStoragebin()); 

	            }
	            
	            if(e.getUnitofissue().isEmpty())
	            {
		            ps.setString(10,null);	            

	            }
	            else
	            {
		            ps.setString(10,e.getUnitofissue());	            
	
	            }
	            
	            
	            if(e.getUnitofissuedesc().isEmpty())
	            {
		            ps.setString(11,null);  

	            }
	            else
	            {
		            ps.setString(11,e.getUnitofissuedesc());  

	            }
	            
	            
	            if(e.getSerial_Number_Profile_code().isEmpty())
	            {
		            ps.setString(12,null); 

	            }
	            else
	            {
		            ps.setString(12,e.getSerial_Number_Profile_code()); 

	            }
	            
	            if(e.getSerial_Number_Profile_Description().isEmpty())
	            {
		            ps.setString(13,null); 

	            }
	            else
	            {
		            ps.setString(13,e.getSerial_Number_Profile_Description()); 

	            }
	            ps.setString(14,e.getStatus());	            
	            ps.setString(15,e.getModifiedby()); 	  
	            ps.setObject(16,new Timestamp(System.currentTimeMillis()));
	            ps.setString(17,e.getMaterialtypecode());	            
	            ps.setString(18,e.getMaterialtypedesc());  
	            
	            if(e.getRegionforedit().isEmpty())
	            {
		            ps.setString(19,null);
	            }
	            else
	            {
		            ps.setString(19,e.getRegionforedit());

	            }
	            
	            ps.setString(20,e.getApprovalprocess());  
	            ps.setString(21,e.getReasonforrejection());
	            ps.setInt(22,e.getMdmCode()); 
	            ps.setString(23,e.getPlantcode());	            
	            status=ps.executeUpdate();
	            
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;   
	        }
	        catch(Exception ex)
	        {
	        	ex.printStackTrace();
	        }  
	        finally {
				ETLConnection.shutdown(ps, con);
			}
	        return status;  
	    }  

	 //Checker show recordes
	 public List<PlantandStorage> alllist(String mattype) throws SQLException, ClassNotFoundException	    
	    {
		 
		 if(mattype.equals("None"))
		 {
			 Connection con=null;
				PreparedStatement ps=null;
				ResultSet result=null;
		        List<PlantandStorage> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();	        	 
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\" ,p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Status\"='Inactive' ";
		        	 ps =con.prepareStatement(sql);
		             result = ps.executeQuery();                 
		            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String plant=result.getString("Plant_Code");	
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	PlantandStorage p=new PlantandStorage(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
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
		         finally {
					ETLConnection.shutdown(result, ps, con);
				}
		        return listall;
			 
		 }
		 else
		 {
			
			 Connection con=null;
				PreparedStatement ps=null;
				ResultSet result=null;
		        List<PlantandStorage> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();	        	 
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\" ,p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=? ";
		        	 ps =con.prepareStatement(sql);
		        	 ps.setString(1,mattype);
		             result = ps.executeQuery();                 
		            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String plant=result.getString("Plant_Code");	
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	PlantandStorage p=new PlantandStorage(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
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
		         finally {
					ETLConnection.shutdown(result, ps, con);
				}
		        return listall;
		 }
		 	
	}
	 //User based Showing the records
	 public List<PlantandStorage> userlist(String username,String rolemattype,String plantv,String mattype,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
	    {
		  
	 	
		
		 
		 
		    Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
	        List<PlantandStorage> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	     
	        	 
	        	 if(rolemattype.equals("None"))
	 		 	{
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None')  or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	 
		        	 ps.setString(2,mattype);
		        	 ps.setString(3,plantv);
		        	 ps.setString(4,stat);
		        	 ps.setString(5,stat);
		        	 ps.setString(6,apvstat);
		        	 ps.setString(7,apvstat);
		        	 ps.setInt(8,vers);
		        	 ps.setInt(9,vers);
	 		 	}
	 		 	else
	 		 	{
	 		 		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?)  or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	 
		        	 ps.setString(2,rolemattype);
		        	 ps.setString(3,rolemattype);
		        	 
		        	 ps.setString(4,mattype);
		        	 ps.setString(5,plantv);
		        	 ps.setString(6,stat);
		        	 ps.setString(7,stat);
		        	 ps.setString(8,apvstat);
		        	 ps.setString(9,apvstat);
		        	 ps.setInt(10,vers);
		        	 ps.setInt(11,vers);
	 		 	}
	        	           
	             result = ps.executeQuery();		             
	            while (result.next()) {	            	
	            	Integer mdmcode=result.getInt("MDM_Code");
	            	String materialcode=result.getString("Material_Code");
	            	String materialcodedesc=result.getString("Material_Code_Description");	            	
	            	String materialtypedesc=result.getString("Material_Type_Description");
	            	Integer version=result.getInt("version");
	            	String uom=result.getString("Basic_UOM_Description");
	            	String plant=result.getString("Plant_Code");	
	            	String status=result.getString("Status");
	            	String approvalprocess=result.getString("Approval_Status");
	            	PlantandStorage p=new PlantandStorage(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
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
	         finally {
	 			ETLConnection.shutdown(result, ps, con);
	 			
	 		}
	        return listall;
	}
	 
	 public List<PlantandStorage> userlists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException	    
	    {
		  
	 	
		
		 
		 
		    Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
	        List<PlantandStorage> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	     
	        	 
	        	 if(rolemattype.equals("None"))
	 		 	{
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None')  or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"MDM_Code\"=?  ";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	 
		        	ps.setInt(2,mcode);
	 		 	}
	 		 	else
	 		 	{
	 		 		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?)  or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"MDM_Code\"=? ";
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
	            	String materialcodedesc=result.getString("Material_Code_Description");	            	
	            	String materialtypedesc=result.getString("Material_Type_Description");
	            	Integer version=result.getInt("version");
	            	String uom=result.getString("Basic_UOM_Description");
	            	String plant=result.getString("Plant_Code");	
	            	String status=result.getString("Status");
	            	String approvalprocess=result.getString("Approval_Status");
	            	PlantandStorage p=new PlantandStorage(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
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
	         finally {
	 			ETLConnection.shutdown(result, ps, con);
	 			
	 		}
	        return listall;
	}
	 
	 public static PlantandStorage getPlantstorageByTalendcode(Integer id,String plantcode){  
			
			
	    PlantandStorage p=new PlantandStorage();
	    Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null; 
	        try{  
	        	 con=ETLConnection.getConnection(); 
	             ps=con.prepareStatement("select * from \"STG_SCR_Plant_Storage\" where \"MDM_Code\"=? and \"Plant_Code\"=?");  
	             ps.setInt(1, id);
	             ps.setString(2, plantcode);
	             rs=ps.executeQuery();  
	            if(rs.next()){  
	            	p.setMdmCode(rs.getInt("MDM_Code"));
	            	p.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	p.setMaterialtypedesc(rs.getString("Material_Type_Description"));
	            	
	            	p.setMaterialcode(rs.getString("Material_Code"));
	            	p.setMaterialcodedesc(rs.getString("Material_Code_Description"));
	            	p.setPlantcode(rs.getString("Plant_Code"));
	            	p.setPlantdesc(rs.getString("Plant_Description"));
	            	p.setMinshelf(rs.getInt("Min_Rem_Shelf_Life"));
	            	p.setTotalshelf(rs.getInt("Total_shelf_life"));
	            
	            	p.setStoragebin(rs.getString("Storage_Bin"));
	            	p.setUnitofissue(rs.getString("Unit_of_issue_Code"));
	            	p.setUnitofissuedesc(rs.getString("Unit_of_issue_Description"));
	            	p.setSerial_Number_Profile_code(rs.getString("Serial_Number_Profile_code"));
	            	p.setSerial_Number_Profile_Description(rs.getString("Serial_Number_Profile_Description"));	            	
	            	p.setRegionforedit(rs.getString("Reason_For_Edit"));
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
	        finally {
				ETLConnection.shutdown(rs, ps, con);
			}
	        return p;  
	    }  
		
		
	 public static int insertaudit(PlantandStorage e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Plant_Storage_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getCreatedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmCode());
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

	 public static int insertaudits(PlantandStorage e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Plant_Storage_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getModifiedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmCode());
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
