package com.tvs.accounting;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;


import com.tvs.accounting.Accounting;
import com.tvs.costing.Costing;
import com.tvs.dbconnection.ETLConnection;

public class AccountingDAO {
	public static int insert(Accounting e){  
        int status=0;  
        Connection con=null;
        PreparedStatement ps=null;
        try{  
        	
        	con=ETLConnection.getConnection();
            ps=con.prepareStatement("insert into  \"STG_SCR_Accounting\" (\"MDM_Code\",\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Valuation_Class_Code\",\"Valuation_Class_Description\",\"Valuation_Cat_Code\",\"Valuation_Cat_Description\",\"Price_Control_Code\",\"Price_Control_Description\",\"Price_Determination_Code\",\"HSN_Code\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
            ps.setInt(1,e.getMdmcode());             
            ps.setString(2,e.getMaterialcode()); 
            ps.setString(3,e.getDescription());             
            ps.setString(4,e.getPlantcode());  
            ps.setString(5,e.getPlantdesc());      
            
            if(e.getValuationcode()!=null)
            {
                ps.setInt(6,e.getValuationcode());  
            }
            else
            {
            ps.setNull(6,Types.INTEGER);
            }         
            
            if(e.getValuationdesc().isEmpty())
            {
                ps.setString(7,null);

            }
            else
            {
                ps.setString(7,e.getValuationdesc());

            }
            
            
            if(e.getValuationCatcode()==null)
            {
                ps.setString(8,null); 

            }
            else
            {
                ps.setString(8,e.getValuationCatcode()); 

            }
            
            
            if( e.getValuationCatdesc()==null)
            {
                ps.setString(9,null); 

            }
            else
            {
                ps.setString(9,e.getValuationCatdesc()); 

            }
            ps.setString(10,e.getPriceControlcode());
            ps.setString(11,e.getPriceControldesc());
            ps.setString(12,e.getPriceDeterminationcode()); 
            if(e.getHsncode().isEmpty())
            {
                ps.setString(13,null);

            }
            else
            {
                ps.setString(13,e.getHsncode());

            }
            ps.setString(14,e.getStatus());
            ps.setString(15,e.getCreatedby());
            ps.setObject(16,new Timestamp(System.currentTimeMillis()));
            ps.setString(17,e.getMaterialtypecode());
            ps.setString(18,e.getMaterialtypedesc()); 
            ps.setString(19,e.getApprovalprocess());         

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
	
	public static int Update(Accounting e){  
        int status=0;  
        Connection con=null;
        PreparedStatement ps=null;
        try{  
        	con=ETLConnection.getConnection();
            ps=con.prepareStatement("Update  \"STG_SCR_Accounting\" set \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Description\"=?,\"Valuation_Class_Code\"=?,\"Valuation_Class_Description\"=?,\"Valuation_Cat_Code\"=?,\"Valuation_Cat_Description\"=?,\"Price_Control_Code\"=?,\"Price_Control_Description\"=?,\"Price_Determination_Code\"=?,\"HSN_Code\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=? where \"MDM_Code\" =? and \"Plant_Code\"=? ");  
            ps.setString(1,e.getMaterialcode()); 
            ps.setString(2,e.getDescription());             
            ps.setString(3,e.getPlantdesc());             
            if(e.getValuationcode()!=null)
            {
                ps.setInt(4,e.getValuationcode());  
            }
            else
            {
            ps.setNull(4,Types.INTEGER);
            }         
            
            if(e.getValuationdesc().isEmpty())
            {
                ps.setString(5,null);

            }
            else
            {
                ps.setString(5,e.getValuationdesc());

            }
            
            
            if(e.getValuationCatcode()==null)
            {
                ps.setString(6,null); 

            }
            else
            {
                ps.setString(6,e.getValuationCatcode()); 

            }
            
            
            if(e.getValuationCatdesc()==null)
            {
                ps.setString(7,null); 

            }
            else
            {
                ps.setString(7,e.getValuationCatdesc()); 

            }
            
            ps.setString(8,e.getPriceControlcode());
            ps.setString(9,e.getPriceControldesc());
            ps.setString(10,e.getPriceDeterminationcode()); 
            
            if(e.getHsncode().isEmpty())
            {
                ps.setString(11,null);

            }
            else
            {
                ps.setString(11,e.getHsncode());

            }
            ps.setString(12,e.getStatus());
            ps.setString(13,e.getCreatedby());
            ps.setObject(14,new Timestamp(System.currentTimeMillis()));
            ps.setString(15,e.getMaterialtypecode());
            ps.setString(16,e.getMaterialtypedesc());            
            ps.setString(17,e.getApprovalprocess());
            ps.setString(18,e.getReasonforrejection());
            ps.setInt(19,e.getMdmcode()); 
            ps.setString(20,e.getPlantcode());  
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
	public List<Accounting> alllist1() throws SQLException, ClassNotFoundException	    
	{
		Connection con=null;
        PreparedStatement ps=null;
        ResultSet result=null;
        List<Accounting> listall = new ArrayList<>();
         try
         {
        	  con=ETLConnection.getConnection();	           
        	  String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Costing_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Status\"='Inactive'";
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
            	Accounting a=new Accounting(mdmcode, materialcode, materialcodedesc, version, uom, materialtypedesc,plant,status,approvalprocess);
            	listall.add(a);
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

	
public List<Accounting> alllist(String mattype) throws SQLException, ClassNotFoundException	    
{
	
	if(mattype.equals("None"))
	{
		Connection con=null;
        PreparedStatement ps=null;
        ResultSet result=null;
        List<Accounting> listall = new ArrayList<>();
         try
         {
        	  con=ETLConnection.getConnection();	           
        	  String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Status\"='Inactive'";
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
            	Accounting a=new Accounting(mdmcode, materialcode, materialcodedesc, version, uom, materialtypedesc,plant,status,approvalprocess);
            	listall.add(a);
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
        List<Accounting> listall = new ArrayList<>();
         try
         {
        	  con=ETLConnection.getConnection();	           
        	  String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=?";
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
            	Accounting a=new Accounting(mdmcode, materialcode, materialcodedesc, version, uom, materialtypedesc,plant,status,approvalprocess);
            	listall.add(a);
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
public List<Accounting> UserList(String username,String rolemattype,String mattype,String plantv,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
 {
		 	Connection con=null;
	        PreparedStatement pst=null;
	        ResultSet result=null;
	        
	        List<Accounting> listall = new ArrayList<>();
	         try
	         {

	        	 con=ETLConnection.getConnection();
	        	 String sql=null;
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
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
			         
	        	 }
	        	 else
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        		 pst =con.prepareStatement(sql); 
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
	            	String plant=result.getString("Plant_Code");
	            	String status=result.getString("Status");	
	            	String approvalprocess=result.getString("Approval_Status");
	            	Accounting a=new Accounting(mdmcode, materialcode, materialcodedesc, version, uom, materialtypedesc,plant,status,approvalprocess);
	            	listall.add(a);
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
	 
public List<Accounting> UserLists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException	    
{
		 	Connection con=null;
	        PreparedStatement pst=null;
	        ResultSet result=null;
	        
	        List<Accounting> listall = new ArrayList<>();
	         try
	         {

	        	 con=ETLConnection.getConnection();
	        	 String sql=null;
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"MDM_Code\"=?";
	        		 pst =con.prepareStatement(sql); 
			         pst.setString(1,username);	
			        pst.setInt(2,mcode);
			         
	        	 }
	        	 else
	        	 {
	        		 sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Accounting\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"MDM_Code\"=? ";
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
	            	String plant=result.getString("Plant_Code");
	            	String status=result.getString("Status");	
	            	String approvalprocess=result.getString("Approval_Status");
	            	Accounting a=new Accounting(mdmcode, materialcode, materialcodedesc, version, uom, materialtypedesc,plant,status,approvalprocess);
	            	listall.add(a);
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
	 public static Accounting getAccountingByTalendcode(Integer id,String plantcode){ 			
	      Accounting a=new Accounting();	
	      Connection con=null;
	        PreparedStatement ps=null;
	        ResultSet rs=null;
	        try{  	        	  
	              con=ETLConnection.getConnection(); 
	              ps=con.prepareStatement("select * from \"STG_SCR_Accounting\" where \"MDM_Code\"=? and \"Plant_Code\"=?");  	            
	              ps.setInt(1, id);
	              ps.setString(2,plantcode);
	              rs=ps.executeQuery();  
	            if(rs.next()){ 	            	
	            	a.setMdmcode(rs.getInt("MDM_Code"));	            	
	                a.setMaterialcode(rs.getString("Material_Code"));
	                a.setDescription(rs.getString("Material_Code_Description"));
	                a.setPlantcode(rs.getString("Plant_Code"));
	                a.setPlantdesc(rs.getString("Plant_Description"));        
	                a.setValuationcode(rs.getInt("Valuation_Class_Code"));
	                a.setValuationdesc(rs.getString("Valuation_Class_Description"));	                
	            	a.setValuationCatcode(rs.getString("Valuation_Cat_Code"));
	            	a.setValuationCatdesc(rs.getString("Valuation_Cat_Description"));
	            	a.setPriceControlcode(rs.getString("Price_Control_Code"));
	            	a.setPriceControldesc(rs.getString("Price_Control_Description"));
	            	a.setPriceDeterminationcode(rs.getString("Price_Determination_Code"));	            	
	            	a.setHsncode(rs.getString("HSN_Code"));
	            	a.setStatus(rs.getString("Status"));
	            	a.setApprovalprocess(rs.getString("Approval_Status"));	
	            	a.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	
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
	        return a;  
	    }  
		
	 public static int insertaudit(Accounting e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Accounting_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
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
	 public static int insertaudits(Accounting e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Accounting_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
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
