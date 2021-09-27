package com.tvs.Purchase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.ETLConnection;
import com.tvs.scrbasic.SCRBasic;

public class PurchaseDAO {
	
	//Insert the Record for Purchase
	public static int insert(Purchase e){  
	        int status=0; 
	        Connection con=null;
			PreparedStatement ps=null;
			//ResultSet rs=null;
	        try{  		       
	        	con=ETLConnection.getConnection();	    
	            ps=con.prepareStatement("insert into  \"STG_SCR_Plant_Storage_Purchase\" (\"MDM_Code\",\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Purchasing_Group\",\"Purchasing_Group_Description\",\"GR_Processing_Time\",\"Purchasing_Value_Key\",\"Order_Unit\",\"Order_Unit_Description\",\"PO_Text\",\"Model\",\"Material_Type_Code\",\"Material_Type_Description\",\"Created_By\",\"Created_Date\",\"Status\",\"Approval_Status\",\"Model_Description\",\"Min_Rem_Shelf_Life\",\"Total_shelf_life\",\"Profit_Centre_Code\",\"Profit_Centre_Description\",\"Storage_Bin\",\"Unit_of_issue_Code\",\"Unit_of_issue_Description\",\"Serial_Number_Profile_code\",\"Serial_Number_Profile_Description\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");       
	            ps.setInt(1,e.getMdmcode()); 	            
	            ps.setString(2,e.getMaterialcode()); 
	            ps.setString(3,e.getMaterialcodedesc()); 	            
	            ps.setString(4,e.getPlantcode());  
	            ps.setString(5,e.getPlantcodecodedesc()); 
	            ps.setString(6,e.getPurchasegroup());  
                ps.setString(7,e.getPurchasegroupdesc()); 
                if(e.getGrprocessingtime()!=null)
	            {
    	            ps.setInt(8,e.getGrprocessingtime());  
	            }
	            else
	            {
	            ps.setNull(8,Types.INTEGER);
	            }
	            
                if(e.getPurchasekeyvalue().isEmpty())
                {
    	            ps.setString(9,null); 
                }
                else
                {
    	            ps.setString(9,e.getPurchasekeyvalue()); 

                }
                
                if(e.getOrderunit().isEmpty())
                {
    	            ps.setString(10,null); 

                }
                else
                {
    	            ps.setString(10,e.getOrderunit()); 

                }
                
                if(e.getOrderunitdesc().isEmpty())
                {
    	            ps.setString(11,null); 

                }
                else
                {
    	            ps.setString(11,e.getOrderunitdesc()); 

                }
                
                
                if(e.getPotext().isEmpty())
                {
    	            ps.setString(12,null); 

                }
                else
                {
    	            ps.setString(12,e.getPotext()); 

                }
                
                if(e.getModel().isEmpty())
                {
    	            ps.setString(13,null);

                }
                else
                {
    	            ps.setString(13,e.getModel());

                }
                if( e.getMaterialtypecode().isEmpty())
                {
    	            ps.setString(14,null);

                }
                else
                {
    	            ps.setString(14, e.getMaterialtypecode());

                }
                if(e.getMaterialtypedesc().isEmpty())
                {
    	            ps.setString(15,null);

                }
                else
                {
    	            ps.setString(15, e.getMaterialtypedesc());

                }
               	            
	            ps.setString(16,e.getCreatedby());	           
	            ps.setObject(17,new Timestamp(System.currentTimeMillis()));
	            ps.setObject(18,e.getStatus());	  
	            ps.setString(19,e.getApprovalprocess());	           
	            if(e.getModeldesc().isEmpty())
                {
    	            ps.setString(20,null);

                }
                else
                {
    	            ps.setString(20,e.getModeldesc());

                }
	            if(e.getminshelf()!=null)
	            {
	            	ps.setInt(21,e.getminshelf());
	            }
	            else
	            {
	            	ps.setNull(21,Types.INTEGER);
	            }
	            if(e.gettotalshelf()!=null)
	            {
	            	ps.setInt(22,e.gettotalshelf());
	            }
	            else
	            {
	            	ps.setNull(22,Types.INTEGER);
	            }
	            ps.setString(23,e.getprofitcentercode());
	            ps.setString(24, e.getprofitcenterdesc());
	            if(e.getstoragebin().isEmpty())
	            {
	            	ps.setString(25,null);
	            }
	            else
	            {
	            	ps.setString(25, e.getstoragebin());
	            }
	            if(e.getunitofissue().isEmpty())
	            {
	            	ps.setString(26,null);
	            }
	            else
	            {
	            	ps.setString(26,e.getunitofissue());
	            }
	            if(e.getsunitofissuedesc().isEmpty())
	            {
	            	ps.setString(27,null);
	            }
	            else
	            {
	            	ps.setString(27,e.getsunitofissuedesc());
	            }
	            if(e.getserialnoprofile().isEmpty())
	            {
	            	ps.setString(28,null);
	            }
	            else
	            {
	            	ps.setString(28,e.getserialnoprofile());
	            }
	            if(e.getserialnoprofiledesc().isEmpty())
	            {
	            	ps.setString(29,null);
	            }
	            else
	            {
	            	ps.setString(29,e.getserialnoprofiledesc());
	            }
	            
	            
	            
	            //new parameters from form 2
	            
	            // new parameters from form 2
	            
	            status=ps.executeUpdate(); 	              
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
	        }  
	        catch(Exception ex){ex.printStackTrace();}  	          
	        finally {
	 			ETLConnection.shutdown(ps, con);
	 		}
	        return status;  
	    }  
	 
	 public static int update(Purchase e){  
	        int status=0;  	  
	        Connection con=null;
			PreparedStatement ps=null;
			
	        try{  
	        	con=ETLConnection.getConnection();	        	
	            ps=con.prepareStatement("Update  \"STG_SCR_Plant_Storage_Purchase\" set \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Code\"=?,\"Plant_Description\"=?,\"Purchasing_Group\"=?,\"Purchasing_Group_Description\"=?,\"GR_Processing_Time\"=?,\"Purchasing_Value_Key\"=?,\"Order_Unit\"=?,\"Order_Unit_Description\"=?,\"PO_Text\"=?,\"Model\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Reason_For_Edit\"=?,\"Status\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=?,\"Model_Description\"=?,\"Min_Rem_Shelf_Life\"=?,\"Total_shelf_life\"=?,\"Profit_Centre_Code\"=?,\"Profit_Centre_Description\"=?,\"Storage_Bin\"=?,\"Unit_of_issue_Code\"=?,\"Unit_of_issue_Description\"=?,\"Serial_Number_Profile_code\"=?,\"Serial_Number_Profile_Description\"=? where \"MDM_Code\"=? and \"Plant_Code\"=?");  
	            ps.setString(1,e.getMaterialcode()); 
	            ps.setString(2,e.getMaterialcodedesc()); 	            
	            ps.setString(3,e.getPlantcode());  
	            ps.setString(4,e.getPlantcodecodedesc());  
	            ps.setString(5,e.getPurchasegroup());  
                ps.setString(6,e.getPurchasegroupdesc());  
                if(e.getGrprocessingtime()!=null)
	            {
    	            ps.setInt(7,e.getGrprocessingtime());  
	            }
	            else
	            {
	            ps.setNull(7,Types.INTEGER);
	            }
                if(e.getPurchasekeyvalue().isEmpty())
                {
    	            ps.setString(8,null); 
                }
                else
                {
    	            ps.setString(8,e.getPurchasekeyvalue()); 

                }
                
                if(e.getOrderunit().isEmpty())
                {
    	            ps.setString(9,null); 

                }
                else
                {
    	            ps.setString(9,e.getOrderunit()); 

                }
                
                if(e.getOrderunitdesc().isEmpty())
                {
    	            ps.setString(10,null); 

                }
                else
                {
    	            ps.setString(10,e.getOrderunitdesc()); 

                }
                
                if(e.getPotext().isEmpty())
                {
    	            ps.setString(11,null); 

                }
                else
                {
    	            ps.setString(11,e.getPotext()); 

                }
                
                
                if(e.getModel().isEmpty())
                {
    	            ps.setString(12,null);

                }
                else
                {
    	            ps.setString(12,e.getModel());

                }
                if( e.getMaterialtypecode().isEmpty())
                {
    	            ps.setString(13,null);

                }
                else
                {
    	            ps.setString(13, e.getMaterialtypecode());

                }
                if(e.getMaterialtypedesc().isEmpty())
                {
    	            ps.setString(14,null);

                }
                else
                {
    	            ps.setString(14, e.getMaterialtypedesc());

                }

                
	            //ps.setString(13, e.getMaterialtypecode());
	            //ps.setString(14, e.getMaterialtypedesc());
	            ps.setString(15,e.getModifierby());	           
	            ps.setObject(16,new Timestamp(System.currentTimeMillis())); 
		        ps.setString(17,e.getReasonforedit()); 	  
	            ps.setString(18,e.getStatus());
	            ps.setString(19,e.getApprovalprocess());
	            ps.setString(20, e.getReasonforrejection());
	            
	            
	            if(e.getModeldesc().isEmpty())
                {
    	            ps.setString(21,null);

                }
                else
                {
    	            ps.setString(21,e.getModeldesc());

                }
	            //new fields from form 2
	            if(e.getminshelf()!=null)
	            {
	            	ps.setInt(22,e.getminshelf());
	            }
	            else
	            {
	            	ps.setNull(22,Types.INTEGER);
	            }
	            if(e.gettotalshelf()!=null)
	            {
		            ps.setInt(23,e.gettotalshelf());
	            }
	            else
	            {
	            	ps.setInt(23,Types.INTEGER);
	            }
	            ps.setString(24,e.getprofitcentercode());
	            ps.setString(25,e.getprofitcenterdesc());
	            if(e.getstoragebin().isEmpty())
	            {
	            	ps.setString(26,null);
	            }
	            else
	            {
		            ps.setString(26,e.getstoragebin());
	            }
	            if(e.getunitofissue().isEmpty())
	            {
	            	ps.setString(27,null);
	            }
	            else
	            {
		            ps.setString(27,e.getunitofissue());
	            }
	            
	            if(e.getsunitofissuedesc().isEmpty())
	            {
	            	ps.setString(28,null);
	            }
	            else
	            {
		            ps.setString(28,e.getsunitofissuedesc());
	            }
	            if(e.getserialnoprofile().isEmpty())
	            {
	            	ps.setString(29,null);
	            }
	            else
	            {
		            ps.setString(29,e.getserialnoprofile());
	            }
	            if(e.getserialnoprofiledesc().isEmpty())
	            {
	            	ps.setString(30,null);
	            }
	            else
	            {
		            ps.setString(30,e.getserialnoprofiledesc());
	            }
	            //
	            ps.setInt(31,e.getMdmcode()); 
	            ps.setString(32,e.getPlantcode());
	            status=ps.executeUpdate();  	              
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        }catch(Exception ex){ex.printStackTrace();}  	          
	        finally {
	 			ETLConnection.shutdown( ps, con);
	 		}
	        return status;  
	    }  
	 
	 public static Purchase getPurchaseByTalendcode(Integer id,String plantcode){  
						
	      Purchase p=new Purchase();
	        Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
	        try{   
	             con=ETLConnection.getConnection(); 
	             ps=con.prepareStatement("select * from \"STG_SCR_Plant_Storage_Purchase\" where \"MDM_Code\"=? and \"Plant_Code\"=?");  
	             ps.setInt(1, id);
	             ps.setString(2, plantcode);
	             rs=ps.executeQuery();  
	             if(rs.next()){  
	            	p.setMdmcode(rs.getInt("MDM_Code"));
	            	p.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	p.setMaterialtypedesc(rs.getString("Material_Type_Description"));
	            	p.setMaterialcode(rs.getString("Material_Code"));
	            	p.setMaterialcodedesc(rs.getString("Material_Code_Description"));
	            	p.setPlantcode(rs.getString("Plant_Code"));
	            	p.setPlantcodecodedesc(rs.getString("Plant_Description"));
	            	p.setPurchasegroup(rs.getString("Purchasing_Group"));
	            	p.setPurchasegroupdesc(rs.getString("Purchasing_Group_Description"));
	            	p.setGrprocessingtime(rs.getInt("GR_Processing_Time"));
	            	p.setPurchasekeyvalue(rs.getString("Purchasing_Value_Key"));
	            	p.setOrderunit(rs.getString("Order_Unit"));
	            	p.setOrderunitdesc(rs.getString("Order_Unit_Description"));
	            	p.setPotext(rs.getString("PO_Text"));
	            	p.setModel(rs.getString("Model"));
	            	p.setModeldesc(rs.getString("Model_Description"));
	            	p.setReasonforedit(rs.getString("Reason_For_Edit"));	  
	            	p.setStatus(rs.getString("Status"));
	            	p.setApprovalprocess(rs.getString("Approval_Status"));
	            	p.setVersion(rs.getInt("version"));
	            	//new fields from form 2
	            	p.setminshelf(rs.getInt("Min_Rem_Shelf_Life"));
	            	p.settotalshelf(rs.getInt("Total_Shelf_life"));
	            	p.setprofitcentercode(rs.getString("Profit_Centre_Code"));
	            	p.setprofitcenterdesc(rs.getString("Profit_Centre_Description"));
	            	p.setstoragebin(rs.getString("Storage_Bin"));
	            	p.setunitofissue(rs.getString("Unit_Of_issue_Code"));
	            	p.setunitofissuedesc(rs.getString("Unit_Of_issue_Description"));
	                p.setserialnoprofile(rs.getString("Serial_Number_Profile_Code"));
	                p.setserialnoprofiledesc(rs.getString("Serial_Number_Profile_Description"));
	            	//
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
	
	//
	 public List<Purchase> alllist1() throws SQLException, ClassNotFoundException
	 {
		 Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet result=null;
         List<Purchase> listall = new ArrayList<>();
         try
         {	        	 
        	con=ETLConnection.getConnection();	            
            String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Status\"='Inactive' ";
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
            	String approvalstatus=result.getString("Approval_Status");
                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
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

	 
	 public List<Purchase> alllist(String mattype) throws SQLException, ClassNotFoundException
	 {
		 
		 if(mattype.equals("None"))
		 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	        	 
	        	con=ETLConnection.getConnection();	            
	            String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Status\"='Inactive' ";
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
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
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	        	 
	        	con=ETLConnection.getConnection();	            
	            String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=? ";
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
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
	//Only Userbased showing Approval and active records 
	 public List<Purchase> UserList1(String username,String plantv,String mattype,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException
	 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	      
	        	 String sql=null;
	        	con=ETLConnection.getConnection();
//	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	            	
            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where p.\"Created_By\"=? and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	
            	ps =con.prepareStatement(sql);
  	            ps.setString(1,username);
  	            //ps.setString(2,rolemattype);
  	            //ps.setString(3,rolemattype);
  	            ps.setString(2,mattype);
  	            ps.setString(3,plantv);
  	            ps.setString(4, stat);
  	            ps.setString(5, stat);
  	            ps.setString(6,apvstat);
  	            ps.setString(7, apvstat);
  	            ps.setInt(8,vers);
  	            ps.setInt(9,vers);
	            
	        	
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
	               listall.add(p);
	            }  
	          //  con.commit();
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
	           // ps.setFetchSize(0);
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
	 

	 
	 
	 public List<Purchase> UserList(String username,String rolemattype,String plantv,String mattype,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException
	 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	      
	        	 String sql=null;
	        	con=ETLConnection.getConnection();
	   
	            if(rolemattype.equals("None"))
	            {
	            	//sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	            	
	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	            	ps =con.prepareStatement(sql);
	  	            ps.setString(1,username);
	  	            ps.setString(2,mattype);
	  	            ps.setString(3,plantv);
	  	            ps.setString(4, stat);
	  	            ps.setString(5, stat);
	  	            ps.setString(6,apvstat);
	  	            ps.setString(7, apvstat);
	  	            ps.setInt(8,vers);
	  	            ps.setInt(9,vers);

	            }
	            else
	            {
//	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	            	
	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";	
	            	ps =con.prepareStatement(sql);
	  	            ps.setString(1,username);
	  	            ps.setString(2,rolemattype);
	  	            ps.setString(3,rolemattype);
	  	            ps.setString(4,mattype);
	  	            ps.setString(5,plantv);
	  	            ps.setString(6, stat);
	  	            ps.setString(7, stat);
	  	            ps.setString(8,apvstat);
	  	            ps.setString(9, apvstat);
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
	               listall.add(p);
	            }  
	          //  con.commit();
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
	           // ps.setFetchSize(0);
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
	 
	 public List<Purchase> UserLists1(String username,Integer mcode) throws SQLException, ClassNotFoundException
	 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	      
	        	 String sql=null;
	        	con=ETLConnection.getConnection();

            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where p.\"Created_By\"=? and p.\"MDM_Code\"=? ";	            	
  	            ps =con.prepareStatement(sql);
  	            ps.setString(1,username);
  	            //ps.setString(2,rolemattype);
  	            //ps.setString(3,rolemattype);
  	            ps.setInt(2,mcode);
	  	           
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
	               listall.add(p);
	            }  
	          //  con.commit();
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
	           // ps.setFetchSize(0);
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
 
	  
	 public List<Purchase> UserLists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException
	 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Purchase> listall = new ArrayList<>();
	         try
	         {	      
	        	 String sql=null;
	        	con=ETLConnection.getConnection();
	   
	            if(rolemattype.equals("None"))
	            {
	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"<>'None'))and p.\"MDM_Code\"=? ";	            	
	  	            ps =con.prepareStatement(sql);
	  	            ps.setString(1,username);
	  	            ps.setInt(2,mcode);
	  	            

	            }
	            else
	            {
	            	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Plant_Storage_Purchase\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active'  and p.\"Material_Type_Code\"=?))and p.\"MDM_Code\"=? ";	            	
	  	            ps =con.prepareStatement(sql);
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
	            	String approvalstatus=result.getString("Approval_Status");
	                Purchase p=new Purchase(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,status,approvalstatus);
	               listall.add(p);
	            }  
	          //  con.commit();
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	            
	           // ps.setFetchSize(0);
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
	 public static int insertaudit(Purchase e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Purchase_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getCreatedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmcode());
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

	 
	 public static int insertaudits(Purchase e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Purchase_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getModifierby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmcode());
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
