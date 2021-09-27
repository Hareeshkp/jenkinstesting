package com.tvs.costing;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tvs.Purchase.Purchase;
import com.tvs.dbconnection.ETLConnection;
import com.tvs.mrp.Mrp;
import java.sql.Types;

public class CostingDAO {
	public static int insert(Costing e){  
        int status=0;  
        Connection con=null;
		PreparedStatement ps=null;		
        try{  
        	con=ETLConnection.getConnection();
            //ps=con.prepareStatement("insert into  \"STG_SCR_Costing\" (\"MDM_Code\" , \"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Overhead_Group_Code\",\"Overhead_Group_Description\", \"Costing_Lot_Size\",\"Material_Is_Costed_with_Qty_Str\",\"Material_Related_Origin\",\"Variance_Code\",\"Variance_Description\",\"Origin_Group_Code\",\"Origin_Group_Description\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
        	
        	ps=con.prepareStatement("insert into  \"STG_SCR_Costing_Accounting\" (\"MDM_Code\" ,\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Overhead_Group_Code\",\"Overhead_Group_Description\", \"Costing_Lot_Size\",\"Material_Is_Costed_with_Qty_Str\",\"Material_Related_Origin\",\"Variance_Code\",\"Variance_Description\",\"Origin_Group_Code\",\"Origin_Group_Description\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\",\"Valuation_Class_Code\",\"Valuation_Class_Description\",\"Valuation_Cat_Code\",\"Valuation_Cat_Description\",\"Price_Control_Code\",\"Price_Control_Description\",\"Price_Determination_Code\",\"HSN_Code\",\"Valuation_Category_Values\",\"Do_Not_Cost\",\"Special_Procurement_Cost_Code\",\"Special_Procurement_Cost_Description\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
            ps.setInt(1,e.getMdmcode()); 
            ps.setString(2,e.getMaterialcode()); 
            ps.setString(3,e.getDescription());            
            ps.setString(4,e.getPlantcode());  
            ps.setString(5,e.getPlantdesc());    
            
            if(e.getOverheadcode().isEmpty())
            {
                ps.setString(6,null);  

            }
            else
            {
                ps.setString(6,e.getOverheadcode());  

            }
            
            
            if(e.getOverheaddesc().isEmpty())
            {
                ps.setString(7,null);

            }
            else
            {
                ps.setString(7,e.getOverheaddesc());

            }
            
            
            if(e.getCostlotsize().isEmpty())
            {
                ps.setString(8,null); 

            }
            else
            {
                ps.setString(8,e.getCostlotsize()); 

            }
            
            ps.setBoolean(9,e.getMateriaCosted());//bool 
            ps.setBoolean(10,e.getMaterelated()); //bool
            
            if(e.getVariancecode().isEmpty())
            {
                ps.setString(11,null);

            }
            else
            {
                ps.setString(11,e.getVariancecode());

            }
            
            
            if(e.getVariancepdesc().isEmpty())
            {
                ps.setString(12,null); 

            }
            else
            {
                ps.setString(12,e.getVariancepdesc()); 

            }
            
            
            ps.setString(13,e.getOrigingroup());
            ps.setString(14,e.getOrigingroupdesc());
            ps.setString(15,e.getStatus());
            ps.setString(16,e.getCreatedby());
            ps.setObject(17,new Timestamp(System.currentTimeMillis()));
            ps.setString(18,e.getMaterialtypecode());
            ps.setString(19,e.getMaterialtypedesc());              
            ps.setString(20,e.getApprovalprocess()); 
            if(e.getvaluationclasscode()!=null)
            {
	            ps.setInt(21,e.getvaluationclasscode());
            }
            else
            {
            	ps.setNull(21,Types.INTEGER);
            }
            
            //ps.setInt(21, e.getvaluationclasscode());
            ps.setString(22, e.getvaluationclassdesc());
            ps.setString(23, e.getvaluationcatcode());
            ps.setString(24, e.getvaluationcatdesc());
            ps.setString(25, e.getpricecontrolcode());
            ps.setString(26, e.getpricecontroldesc());
            ps.setString(27, e.getpricedetermination());
            ps.setString(28, e.gethsnw());
            ps.setString(29, e.getmultiselectvalc());
            ps.setBoolean(30, e.getdonotcost());
            ps.setString(31, e.getspecialprocurementcostcode());
            ps.setString(32, e.getspecialprocurementcostdesc());


            
            

            status=ps.executeUpdate();              
            
            ps.close();
            ps=null;
            con.close();
            con=null;
        }catch(Exception ex){ex.printStackTrace();}  
         finally {
			ETLConnection.shutdown(ps, con);
		}
        return status;  
    }  

	public static int Update(Costing e){  
        int status=0;  
         Connection con=null;
		 PreparedStatement ps=null;		 
        try{  
        	
        	con=ETLConnection.getConnection();
            ps=con.prepareStatement("Update  \"STG_SCR_Costing_Accounting\" set  \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Description\"=?,\"Overhead_Group_Code\"=?,\"Overhead_Group_Description\"=?, \"Costing_Lot_Size\"=?,\"Material_Is_Costed_with_Qty_Str\"=?,\"Material_Related_Origin\"=?,\"Variance_Code\"=?,\"Variance_Description\"=?,\"Origin_Group_Code\"=?,\"Origin_Group_Description\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=?,\"Valuation_Class_Code\"=?,\"Valuation_Class_Description\"=?,\"Valuation_Cat_Code\" = ?,\"Valuation_Cat_Description\" = ?,\"Price_Control_Code\"=?,\"Price_Control_Description\" = ?,\"Price_Determination_Code\" = ?,\"HSN_Code\" = ?,\"Valuation_Category_Values\" =?,\"Do_Not_Cost\"=?,\"Special_Procurement_Cost_Code\"=?,\"Special_Procurement_Cost_Description\" = ? where \"MDM_Code\"=? and \"Plant_Code\"=?") ;  
        
            ps.setString(1,e.getMaterialcode()); 
            ps.setString(2,e.getDescription());             
            ps.setString(3,e.getPlantdesc());             
            if(e.getOverheadcode().isEmpty())
            {
                ps.setString(4,null);  

            }
            else
            {
                ps.setString(4,e.getOverheadcode());  

            }
            
            
            if(e.getOverheaddesc().isEmpty())
            {
                ps.setString(5,null);

            }
            else
            {
                ps.setString(5,e.getOverheaddesc());

            }
            
            
            if(e.getCostlotsize().isEmpty())
            {
                ps.setString(6,null); 

            }
            else
            {
                ps.setString(6,e.getCostlotsize()); 

            }
            
            ps.setBoolean(7,e.getMateriaCosted());//bool 
            ps.setBoolean(8,e.getMaterelated()); //bool
            
            
            if(e.getVariancecode().isEmpty())
            {
                ps.setString(9,null);

            }
            else
            {
                ps.setString(9,e.getVariancecode());

            }
            
            
            if(e.getVariancepdesc().isEmpty())
            {
                ps.setString(10,null); 

            }
            else
            {
                ps.setString(10,e.getVariancepdesc()); 

            }
            ps.setString(11,e.getOrigingroup());
            ps.setString(12,e.getOrigingroupdesc());
            ps.setString(13,e.getStatus());
            ps.setString(14,e.getModifiedby());
            ps.setObject(15,new Timestamp(System.currentTimeMillis()));
            ps.setString(16,e.getMaterialtypecode());
            ps.setString(17,e.getMaterialtypedesc());  
            ps.setString(18, e.getApprovalprocess());
            ps.setString(19,e.getReasonforrejection());
            //new fields from form 2
            if(e.getvaluationclasscode()!=null)
            {
	            ps.setInt(20,e.getvaluationclasscode());
            }
            else
            {
            	ps.setNull(20,Types.INTEGER);
            }
            //ps.setInt(20,e.getvaluationclasscode());
            ps.setString(21,e.getvaluationclassdesc());
            ps.setString(22,e.getvaluationcatcode());
            ps.setString(23,e.getvaluationcatdesc());
            ps.setString(24,e.getpricecontrolcode());
            ps.setString(25,e.getpricecontroldesc());
            ps.setString(26,e.getpricedetermination());
            ps.setString(27,e.gethsnw());
            ps.setString(28,e.getmultiselectvalc());
            ps.setBoolean(29,e.getdonotcost());
            ps.setString(30,e.getspecialprocurementcostcode());
            ps.setString(31,e.getspecialprocurementcostdesc());            
            //
            ps.setInt(32,e.getMdmcode());             
            ps.setString(33,e.getPlantcode()); 
            status=ps.executeUpdate();   
            
            ps.close();
            ps=null;
            con.close();
            con=null;
            
        }catch(Exception ex){ex.printStackTrace();}  
         finally {
			ETLConnection.shutdown(ps, con);
		}
        return status;  
    }  
	
	 public List<Costing> alllist(String mattype) throws SQLException, ClassNotFoundException	   
	    {
		 
		 
		 if(mattype.equals("None"))
		 {
			    Connection con=null;
				PreparedStatement pst=null;
				ResultSet result=null;
		       
		        List<Costing> listall = new ArrayList<>();
		         try
		         {
		        	 
		        	 con=ETLConnection.getConnection();	        	 
		        	
		             String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Status\"='Inactive' ";
		             pst =con.prepareStatement(sql);
		             result = pst.executeQuery();
		             	            
		            while (result.next()) {	      
			           
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String plantcode=result.getString("Plant_Code");
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);
		            	listall.add(c);
		            }   
		            result.close();
		            result=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null;
		        } 
		         catch (SQLException ex) {
		            ex.printStackTrace();	           
		        }      
		        finally {
					ETLConnection.shutdown(result, pst, con);
				}
		        return listall;
		 }
		 else
		 {
			    Connection con=null;
				PreparedStatement pst=null;
				ResultSet result=null;
		       
		        List<Costing> listall = new ArrayList<>();
		         try
		         {
		        	 
		        	 con=ETLConnection.getConnection();	        	 
		        	
		             String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=? ";
		             pst =con.prepareStatement(sql);
		             pst.setString(1,mattype);
		             result = pst.executeQuery();
		             	            
		            while (result.next()) {	      
			           
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
		            	Integer version=result.getInt("version");
		            	String uom=result.getString("Basic_UOM_Description");
		            	String plantcode=result.getString("Plant_Code");
		            	String status=result.getString("Status");
		            	String approvalprocess=result.getString("Approval_Status");
		            	Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);
		            	listall.add(c);
		            }   
		            result.close();
		            result=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null;
		        } 
		         catch (SQLException ex) {
		            ex.printStackTrace();	           
		        }      
		        finally {
					ETLConnection.shutdown(result, pst, con);
				}
		        return listall;
		 }
		 	
	}
	 
	//
	 public List<Costing> UserList1(String username,String mattype,String plantv,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	   
	    {
		 	Connection con=null;
			PreparedStatement pst=null;
			ResultSet result=null;
	        List<Costing> listall = new ArrayList<>();
	         try
	         {
	        	 //Connection con=null;
	            
	            String sql=null;
	        	 con=ETLConnection.getConnection();	 
	        	 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";			         
	        	 pst =con.prepareStatement(sql);
		         pst.setString(1,username);	  
		         pst.setString(2,mattype);
		         pst.setString(3,plantv);
		         pst.setString(4,stat);
		         pst.setString(5,stat);
		         pst.setString(6,apvstat);
		         pst.setString(7,apvstat);
		         pst.setInt(8,vers);
		         pst.setInt(9,vers);

	        	 
	        	 
		               
		         result = pst.executeQuery(); 	             
	            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
	            		Integer version=result.getInt("version");
	            		String uom=result.getString("Basic_UOM_Description");	            		
	            		String status=result.getString("Status");	
	            		String approvalprocess=result.getString("Approval_Status");
	            		String plantcode=result.getString("Plant_Code");
	            		Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);	            
	            		listall.add(c);
	            }
	            
	            result.close();
	            result=null;
	            pst.close();
	            pst=null;
	            con.close();
	            con=null;
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }      
	        finally {
				ETLConnection.shutdown(result, pst, con);
			}
	        return listall;
	}
	 public List<Costing> UserList(String username,String rolemattype,String mattype,String plantv,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	   
	    {
		 	Connection con=null;
			PreparedStatement pst=null;
			ResultSet result=null;
	        List<Costing> listall = new ArrayList<>();
	         try
	         {
	        	 //Connection con=null;
	            
	            String sql=null;
	        	 con=ETLConnection.getConnection();	   
	        	 
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";			         pst =con.prepareStatement(sql);
			         pst.setString(1,username);	  
			         pst.setString(2,mattype);
			         pst.setString(3,plantv);
			         pst.setString(4,stat);
			         pst.setString(5,stat);
			         pst.setString(6,apvstat);
			         pst.setString(7,apvstat);
			         pst.setInt(8,vers);
			         pst.setInt(9,vers);
			         
	        	 }
	        	 else
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";			         pst =con.prepareStatement(sql);
			         pst.setString(1,username);	  
			         pst.setString(2,rolemattype);
			         pst.setString(3,rolemattype);
			         pst.setString(4,mattype);
			         pst.setString(5,plantv);
			         pst.setString(6,stat);
			         pst.setString(7,stat);
			         pst.setString(8,apvstat);
			         pst.setString(9,apvstat);
			         pst.setInt(10,vers);
			         pst.setInt(11,vers);
	        	 }
		               
		         result = pst.executeQuery(); 	             
	            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
	            		Integer version=result.getInt("version");
	            		String uom=result.getString("Basic_UOM_Description");	            		
	            		String status=result.getString("Status");	
	            		String approvalprocess=result.getString("Approval_Status");
	            		String plantcode=result.getString("Plant_Code");
	            		Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);	            
	            		listall.add(c);
	            }
	            
	            result.close();
	            result=null;
	            pst.close();
	            pst=null;
	            con.close();
	            con=null;
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }      
	        finally {
				ETLConnection.shutdown(result, pst, con);
			}
	        return listall;
	}
	 public List<Costing> UserLists1(String username,Integer mcode) throws SQLException, ClassNotFoundException	   
	    {
		 	Connection con=null;
			PreparedStatement pst=null;
			ResultSet result=null;
	        List<Costing> listall = new ArrayList<>();
	         try
	         {
	        	 //Connection con=null;
	            
	            String sql=null;
	        	con=ETLConnection.getConnection();	 
	        	sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?) or (p.\"Status\"='Active')) and p.\"MDM_Code\"=? ";			    
       		 	System.out.println("===============================");
       		 	System.out.println(sql);
	        	pst =con.prepareStatement(sql);
		        pst.setString(1,username);	  
		        pst.setInt(2,mcode);   
		        System.out.println(pst);
		        result = pst.executeQuery(); 	             
	            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
	            		Integer version=result.getInt("version");
	            		String uom=result.getString("Basic_UOM_Description");	            		
	            		String status=result.getString("Status");	
	            		String approvalprocess=result.getString("Approval_Status");
	            		String plantcode=result.getString("Plant_Code");
	            		Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);	            
	            		listall.add(c);
	            }
	            
	            result.close();
	            result=null;
	            pst.close();
	            pst=null;
	            con.close();
	            con=null;
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }      
	        finally {
				ETLConnection.shutdown(result, pst, con);
			}
	        return listall;
	}
	 public List<Costing> UserLists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException	   
	    {
		 	Connection con=null;
			PreparedStatement pst=null;
			ResultSet result=null;
	        List<Costing> listall = new ArrayList<>();
	         try
	         {
	        	 //Connection con=null;
	            
	            String sql=null;
	        	 con=ETLConnection.getConnection();	   
	        	 
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"MDM_Code\"=? ";			    
	        		 pst =con.prepareStatement(sql);
			         pst.setString(1,username);	  
			         pst.setInt(2,mcode);
			        
			         
	        	 }
	        	 else
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.version,p.\"Plant_Code\",p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=?  and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"MDM_Code\"=? ";			      
	        		 pst =con.prepareStatement(sql);
			         pst.setString(1,username);	  
			         pst.setString(2,rolemattype);
			         pst.setString(3,rolemattype);
			         pst.setInt(4,mcode);
	        	 }
		               
		         result = pst.executeQuery(); 	             
	            while (result.next()) {	            	
		            	Integer mdmcode=result.getInt("MDM_Code");
		            	String materialcode=result.getString("Material_Code");
		            	String materialcodedesc=result.getString("Material_Code_Description");	            	
		            	String materialtypedesc=result.getString("Material_Type_Description");
	            		Integer version=result.getInt("version");
	            		String uom=result.getString("Basic_UOM_Description");	            		
	            		String status=result.getString("Status");	
	            		String approvalprocess=result.getString("Approval_Status");
	            		String plantcode=result.getString("Plant_Code");
	            		Costing c=new Costing(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plantcode,status,approvalprocess);	            
	            		listall.add(c);
	            }
	            
	            result.close();
	            result=null;
	            pst.close();
	            pst=null;
	            con.close();
	            con=null;
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }      
	        finally {
				ETLConnection.shutdown(result, pst, con);
			}
	        return listall;
	}
	 public static Costing getCostingByTalendcode(Integer id,String plant){  
			Costing c=new Costing();
			Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
	        try{  
	        	  
	             con=ETLConnection.getConnection(); 
	             ps=con.prepareStatement("select * from \"STG_SCR_Costing_Accounting\" where \"MDM_Code\"=? and \"Plant_Code\"=? ");  
	            
	             ps.setInt(1, id);
	             ps.setString(2,plant);
	             rs=ps.executeQuery();  
	            if(rs.next()){ 
	            	c.setMdmcode(rs.getInt("MDM_Code"));
	            	c.setPlantcode(rs.getString("Plant_Code"));	            	
	            	c.setOverheaddesc(rs.getString("Overhead_Group_Description"));
	            	c.setCostlotsize(rs.getString("Costing_Lot_Size"));
	            	c.setMateriaCosted(rs.getBoolean("Material_Is_Costed_with_Qty_Str"));
	            	c.setMaterelated(rs.getBoolean("Material_Related_Origin"));
	            	c.setVariancepdesc(rs.getString("Variance_Description"));
	            	c.setOrigingroupdesc(rs.getString("Origin_Group_Description"));
	            	//c.setReasonforedit(rs.getString("ReasonForEdit"));
	            	c.setStatus(rs.getString("Status"));
	            	c.setApprovalprocess(rs.getString("Approval_Status"));
	            	c.setdonotcost(rs.getBoolean("Do_Not_Cost"));
	            	c.setspecialprocurementcostcode(rs.getString("Special_Procurement_Cost_Code"));
	            	c.setspecialprocurementcostdesc(rs.getString("Special_Procurement_Cost_Description"));
	            	c.setvaluationclasscode(rs.getInt("Valuation_Class_Code"));
	            	c.setvaluationclassdesc(rs.getString("Valuation_Class_Description"));
	            	c.setvaluationcatcode(rs.getString("Valuation_Cat_Code"));
	            	c.setvaluationcatdesc(rs.getString("Valuation_Cat_Description"));
	            	c.setpricecontrolcode(rs.getString("Price_Control_Code"));
	            	c.setpricecontroldesc(rs.getString("Price_Control_Description"));
	            	c.setpricedetermination(rs.getString("Price_Determination_Code"));
	            	c.sethsnw(rs.getString("HSN_Code"));
	            	c.setmultiselectvalc(rs.getString("Valuation_Category_Values"));
	            	c.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	c.setMaterialtypedesc(rs.getString("Material_Type_Description"));;
	            	} 
	            rs.close();
	            rs=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();	           
	        }      
	        finally {
				ETLConnection.shutdown(rs, ps, con);
			}
	          
	        return c;  
	    }  
		
	 public static int insertaudit(Costing e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Costing_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
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
	 
	 public static int insertaudits(Costing e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Costing_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getModifiedby()); 
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
