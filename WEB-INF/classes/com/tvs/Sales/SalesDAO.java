package com.tvs.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tvs.Purchase.Purchase;
import com.tvs.Sales.Sales;
import com.tvs.dbconnection.ETLConnection;
import com.tvs.mrp.Mrp;


public class SalesDAO {

	public static int insert(Sales e){  
        int status=0;  
        Connection con=null;
		PreparedStatement ps=null;
        try{  
        	con=ETLConnection.getConnection();
            ps=con.prepareStatement("insert into  \"STG_SCR_Sales\" (\"MDM_Code\" ,\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"Sales_organisation_Code\",\"Sales_organisation_Description\",\"Dist_Channel_Code\",\"Dist_Channel_Description\",\"Matl_statistics_grp_Code\",\"Matl_statistics_grp_Description\",\"Material_Price_Grp_Code\",\"Material_Price_Grp_Description\",\"Acct_assignment_grp_Code\",\"Acct_assignment_grp_Description\",\"Gen_item_cat__grp_Code\",\"Gen_item_cat__grp_Description\",\"Item_category_group_Code\",\"Item_category_group_Description\",\"Transportation_Group_Code\",\"Transportation_Group_Description\",\"Loading_Group_Code\",\"Loading_Group_Description\",\"Delivering_Plant_Code\",\"Delivering_Plant_Description\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\",\"Segment\",\"Segment_Description\",\"Application\",\"Application_Description\",\"CC\",\"CC_Description\",\"Aspect Ratio\",\"Aspect_Ratio_Description\",\"Polymer\",\"Polymer_Description\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
            ps.setInt(1,e.getMdmcode());             
            ps.setString(2,e.getMaterialcode()); 
            ps.setString(3,e.getDescription());            
            ps.setString(4,e.getPlantcode());  
            ps.setString(5,e.getPlantdesc());             
            ps.setString(6,e.getSlorgcode());  
            ps.setString(7,e.getSlorgdesc());
            ps.setString(8,e.getDtchcode()); 
            ps.setString(9,e.getDtchdesc()); 
            
            if(e.getMtlstatisticsgrpcode().isEmpty())
            {
                ps.setString(10,null);

            }
            else
            {
                ps.setString(10,e.getMtlstatisticsgrpcode());

            }
            
            
            if(e.getMtlstatisticsgrpdesc().isEmpty())
            {
                ps.setString(11,null);             

            }
            else
            {
                ps.setString(11,e.getMtlstatisticsgrpdesc());             

            }
            
            if(e.getMtlpricegrpcode().isEmpty())
            {
                ps.setString(12,null);

            }
            else
            {
                ps.setString(12,e.getMtlpricegrpcode());

            }
            
            if(e.getMtlpricegrpdesc().isEmpty())
            {
                ps.setString(13,null);

            }
            else
            {
                ps.setString(13,e.getMtlpricegrpdesc());

            }
            
            ps.setString(14,e.getAcassignmentgrpcode());
            ps.setString(15,e.getAcassignmentgrpdesc());  
            ps.setString(16,e.getGencatgrpcode()); 
            ps.setString(17,e.getGencatgrpdesc());             
            ps.setString(18,e.getItmcatgrpcode());  
            ps.setString(19,e.getItmcatgrpdesc());  
            ps.setString(20,e.getTrngrpcode());  
            ps.setString(21,e.getTrngrpdesc()); 
            ps.setString(22,e.getLodgrpcode());  
            ps.setString(23,e.getLodgrpdesc()); 
            
            if(e.getDelplantcode().isEmpty())
            {
                ps.setString(24,null); 

            }
            else
            {
                ps.setString(24,e.getDelplantcode()); 

            }
            
            if(e.getDelplantdesc().isEmpty())
            {
                ps.setString(25,null); 

            }
            else
            {
                ps.setString(25,e.getDelplantdesc()); 

            }
            
            ps.setString(26,e.getStatus());
            ps.setString(27,e.getCreatedby());
            ps.setObject(28,new Timestamp(System.currentTimeMillis()));
            ps.setString(29,e.getMaterialtypecode());
            ps.setString(30,e.getMaterialtypedesc());
            ps.setString(31,e.getApprovalprocess());
            
            if(e.getsegmentcode().isEmpty())
            {
            	ps.setString(32, null);
            }
            else
            {
            	ps.setString(32,e.getsegmentcode());
            }
            if(e.getsegmentdescription().isEmpty())
            {
            	ps.setString(33, null);
            }
            else
            {
            	ps.setString(33,e.getsegmentdescription());
            }
            
            if(e.getapplicationcode().isEmpty())
            {
            	ps.setString(34, null);
            }
            else
            {
            	
            	ps.setString(34,e.getapplicationcode());
            }            
            if(e.getapplicationdescription().isEmpty())
            {
            	ps.setString(35, null);
            }
            else
            {
            	ps.setString(35,e.getapplicationdescription());
            }
            
            if(e.getcccode().isEmpty())
            {
            	ps.setString(36, null);
            }
            else
            {
            	ps.setString(36,e.getcccode());
            }  
            if(e.getccdescription().isEmpty())
            {
            	ps.setString(37, null);
            }
            else
            {
            	ps.setString(37,e.getccdescription());
            } 
            
            if(e.getaspectratiocode().isEmpty())
            {
            	ps.setString(38, null);
            }
            else
            {
            	ps.setString(38,e.getaspectratiocode());
            }
            
            if(e.getaspectratiodescription().isEmpty())
            {
            	ps.setString(39, null);
            }
            else
            {
            	ps.setString(39,e.getaspectratiodescription());
            }            
            if(e.getpolymercode().isEmpty())
            {
            	ps.setString(40, null);
            }
            else
            {
            	ps.setString(40,e.getpolymercode());
            }
            
            if(e.getpolymerdescription().isEmpty())
            {
            	ps.setString(41, null);
            }
            else
            {
            	ps.setString(41,e.getpolymerdescription());
            }            
            
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
	
	public static int Update(Sales e){  
        int status=0;  
        Connection con=null;
		PreparedStatement ps=null;
        try{  
        	con=ETLConnection.getConnection();
            ps=con.prepareStatement("Update \"STG_SCR_Sales\" set \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Code\"=?,\"Plant_Description\"=?,\"Sales_organisation_Code\"=?,\"Sales_organisation_Description\"=?,\"Dist_Channel_Code\"=?,\"Dist_Channel_Description\"=?,\"Matl_statistics_grp_Code\"=?,\"Matl_statistics_grp_Description\"=?,\"Material_Price_Grp_Code\"=?,\"Material_Price_Grp_Description\"=?,\"Gen_item_cat__grp_Code\"=?,\"Gen_item_cat__grp_Description\"=?,\"Item_category_group_Code\"=?,\"Item_category_group_Description\"=?,\"Transportation_Group_Code\"=?,\"Transportation_Group_Description\"=?,\"Loading_Group_Code\"=?,\"Loading_Group_Description\"=?,\"Delivering_Plant_Code\"=?,\"Delivering_Plant_Description\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Reason_For_Edit\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=?,\"Acct_assignment_grp_Code\"=?,\"Acct_assignment_grp_Description\"=?,\"Segment\"=?,\"Segment_Description\"=?,\"Aspect Ratio\"=?,\"Aspect_Ratio_Description\"=?,\"Application\"=?,\"Application_Description\"=?,\"Polymer\"=?,\"Polymer_Description\"=?,\"CC\"=?,\"CC_Description\"=? where \"MDM_Code\"=? and \"Plant_Code\"=? and \"Dist_Channel_Code\"=? ");         
            ps.setString(1,e.getMaterialcode()); 
            ps.setString(2,e.getDescription());            
            ps.setString(3,e.getPlantcode());  
            ps.setString(4,e.getPlantdesc());             
            ps.setString(5,e.getSlorgcode());  
            ps.setString(6,e.getSlorgdesc());
          
            ps.setString(7,e.getDtchcode()); 
            ps.setString(8,e.getDtchdesc());  

            if(e.getMtlstatisticsgrpcode().isEmpty())
            {
                ps.setString(9,null);

            }
            else
            {
                ps.setString(9,e.getMtlstatisticsgrpcode());

            }
            
            
            if(e.getMtlstatisticsgrpdesc().isEmpty())
            {
                ps.setString(10,null);             

            }
            else
            {
                ps.setString(10,e.getMtlstatisticsgrpdesc());             

            }
            
            if(e.getMtlpricegrpcode().isEmpty())
            {
                ps.setString(11,null);

            }
            else
            {
                ps.setString(11,e.getMtlpricegrpcode());

            }
            
            if(e.getMtlpricegrpdesc().isEmpty())
            {
                ps.setString(12,null);

            }
            else
            {
                ps.setString(12,e.getMtlpricegrpdesc());

            }
            
            ps.setString(13,e.getGencatgrpcode()); 
            ps.setString(14,e.getGencatgrpdesc());             
            ps.setString(15,e.getItmcatgrpcode());  
            ps.setString(16,e.getItmcatgrpdesc());  
            ps.setString(17,e.getTrngrpcode());  
            ps.setString(18,e.getTrngrpdesc());
            ps.setString(19,e.getLodgrpcode());  
            ps.setString(20,e.getLodgrpdesc()); 
            if(e.getDelplantcode().isEmpty())
            {
                ps.setString(21,null); 

            }
            else
            {
                ps.setString(21,e.getDelplantcode()); 

            }
            
            if(e.getDelplantdesc().isEmpty())
            {
                ps.setString(22,null); 

            }
            else
            {
                ps.setString(22,e.getDelplantdesc()); 

            }
            ps.setString(23,e.getStatus());
            ps.setString(24,e.getModifiedby());
            ps.setObject(25,new Timestamp(System.currentTimeMillis()));
            ps.setString(26,e.getMaterialtypecode());
            ps.setString(27,e.getMaterialtypedesc());
            ps.setString(28,e.getReasonforedit()); 
            ps.setString(29, e.getApprovalprocess());
            ps.setString(30,e.getReasonforrejection());
            
            
            ps.setString(31,e.getAcassignmentgrpcode());
            ps.setString(32,e.getAcassignmentgrpdesc());
            //new fields
            
            if(e.getsegmentcode().isEmpty())
            {
            	ps.setString(33, null);
            }
            else
            {
            	ps.setString(33,e.getsegmentcode());
            }
            if(e.getsegmentdescription().isEmpty())
            {
            	ps.setString(34, null);
            }
            else
            {
            	ps.setString(34,e.getsegmentdescription());
            }
            
            if(e.getapplicationcode().isEmpty())
            {
            	ps.setString(35, null);
            }
            else
            {
            	ps.setString(35,e.getapplicationcode());
            }            
            if(e.getapplicationdescription().isEmpty())
            {
            	ps.setString(36, null);
            }
            else
            {
            	ps.setString(36,e.getapplicationdescription());
            }
            
            if(e.getcccode().isEmpty())
            {
            	ps.setString(37, null);
            }
            else
            {
            	ps.setString(37,e.getcccode());
            }  
            if(e.getccdescription().isEmpty())
            {
            	ps.setString(38, null);
            }
            else
            {
            	ps.setString(38,e.getccdescription());
            } 
            
            if(e.getaspectratiocode().isEmpty())
            {
            	ps.setString(39, null);
            }
            else
            {
            	ps.setString(39,e.getaspectratiocode());
            }
            
            if(e.getaspectratiodescription().isEmpty())
            {
            	ps.setString(40, null);
            }
            else
            {
            	ps.setString(40,e.getaspectratiodescription());
            }            
            if(e.getpolymercode().isEmpty())
            {
            	ps.setString(41, null);
            }
            else
            {
            	ps.setString(41,e.getpolymercode());
            }
            
            if(e.getpolymerdescription().isEmpty())
            {
            	ps.setString(42, null);
            }
            else
            {
            	ps.setString(42,e.getpolymerdescription());
            }
            //new fields

            ps.setInt(43,e.getMdmcode()); 
            ps.setString(44,e.getPlantcode());  
            ps.setString(45,e.getDtchcode()); 
            
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
	
	
	//Checker based showing data
	public List<Sales> alllist1() throws SQLException, ClassNotFoundException	    
    {
		Connection con=null;
		 PreparedStatement ps=null;
		 ResultSet result=null;
       List<Sales> listall = new ArrayList<>();
        try
        {	        	 
       	 con=ETLConnection.getConnection();	        	
       	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where p.\"Status\"='Inactive' ";
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
           		String dcode=result.getString("Dist_Channel_Code");
           		String ddesc=result.getString("Dist_Channel_Description");

           		String status=result.getString("Status");
           		String approvalprocess=result.getString("Approval_Status");
           		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
           		listall.add(s);
           } 
           result.close();
           result=null;
           ps.close();
           ps=null;
           con.close();
           con=null;
       } catch (SQLException ex) {
           ex.printStackTrace();
           throw ex;
       } 
       finally {
			ETLConnection.shutdown(result, ps, con);
		}
       return listall;		
}
 

	 public List<Sales> alllist(String mattype) throws SQLException, ClassNotFoundException	    
	    {
		 
		 if(mattype.equals("None"))
		 {
			 Connection con=null;
			 PreparedStatement ps=null;
			 ResultSet result=null;
	        List<Sales> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	        	
	        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where p.\"Status\"='Inactive' ";
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
	            		String dcode=result.getString("Dist_Channel_Code");
	            		String ddesc=result.getString("Dist_Channel_Description");

	            		String status=result.getString("Status");
	            		String approvalprocess=result.getString("Approval_Status");
	            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
	            		listall.add(s);
	            } 
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        } catch (SQLException ex) {
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
	        List<Sales> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	        	
	        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=? ";
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
	            		String dcode=result.getString("Dist_Channel_Code");
	            		String ddesc=result.getString("Dist_Channel_Description");

	            		String status=result.getString("Status");
	            		String approvalprocess=result.getString("Approval_Status");
	            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
	            		listall.add(s);
	            } 
	            result.close();
	            result=null;
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        } catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        } 
	        finally {
				ETLConnection.shutdown(result, ps, con);
			}
	        return listall;
			 
		 }
			
	}
	 
	//only for User view  created current user records
	 public List<Sales> UserList1(String username,String mattype,String plantv,String distc,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
	 {	
		
			Connection con=null;
			PreparedStatement pst=null;
			ResultSet rs=null;
		    
		        List<Sales> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and p.\"Dist_Channel_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
		        	 pst =con.prepareStatement(sql); 
		             pst.setString(1,username);	
		             pst.setString(2,mattype);
		             pst.setString(3,plantv);
		             pst.setString(4,distc);
		             pst.setString(5,stat);
		             pst.setString(6,stat);
		             pst.setString(7,apvstat);
		             pst.setString(8,apvstat);
		             pst.setInt(9,vers);
		             pst.setInt(10,vers);
		        	
		        	 /*if(rolemattype.equals("None"))
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and p.\"Dist_Channel_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,mattype);
			             pst.setString(3,plantv);
			             pst.setString(4,distc);
			             pst.setString(5,stat);
			             pst.setString(6,stat);
			             pst.setString(7,apvstat);
			             pst.setString(8,apvstat);
			             pst.setInt(9,vers);
			             pst.setInt(10,vers);
		        	 }
		        	 else
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and p.\"Dist_Channel_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,rolemattype);	
			             pst.setString(3,rolemattype);	
			             pst.setString(4,mattype);
			             pst.setString(5,plantv);
			             pst.setString(6,distc);
			             pst.setString(7,stat);
			             pst.setString(8,stat);
			             pst.setString(9,apvstat);
			             pst.setString(10,apvstat);
			             pst.setInt(11,vers);
			             pst.setInt(12,vers);
		        	 }*/
		        	 
		        	 
		        	 	            
		             rs = pst.executeQuery();                
		            while (rs.next()) {		            	
		            		Integer mdmcode=rs.getInt("MDM_Code");
		            		String materialcode=rs.getString("Material_Code");
		            		String materialcodedesc=rs.getString("Material_Code_Description");	            	
		            	 	String materialtypedesc=rs.getString("Material_Type_Description");
		            		Integer version=rs.getInt("version");
		            		String uom=rs.getString("Basic_UOM_Description");
		            		String plant=rs.getString("Plant_Code");
		            		String dcode=rs.getString("Dist_Channel_Code");
		            		String status=rs.getString("Status");
		            		String approvalprocess=rs.getString("Approval_Status");
		            		String ddesc=rs.getString("Dist_Channel_Description");

		            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
		            		listall.add(s);
		            } 
		            rs.close();
		            rs=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null; 
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		            throw ex;
		        }   
		         finally {
						ETLConnection.shutdown(rs, pst, con);
					}
		        return listall;
		}

	public List<Sales> UserList(String username,String rolemattype,String mattype,String plantv,String distc,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
	 {	
		
			Connection con=null;
			PreparedStatement pst=null;
			ResultSet rs=null;
		    
		        List<Sales> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();
		        	
		        	 if(rolemattype.equals("None"))
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and p.\"Dist_Channel_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,mattype);
			             pst.setString(3,plantv);
			             pst.setString(4,distc);
			             pst.setString(5,stat);
			             pst.setString(6,stat);
			             pst.setString(7,apvstat);
			             pst.setString(8,apvstat);
			             pst.setInt(9,vers);
			             pst.setInt(10,vers);
		        	 }
		        	 else
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and p.\"Dist_Channel_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,rolemattype);	
			             pst.setString(3,rolemattype);	
			             pst.setString(4,mattype);
			             pst.setString(5,plantv);
			             pst.setString(6,distc);
			             pst.setString(7,stat);
			             pst.setString(8,stat);
			             pst.setString(9,apvstat);
			             pst.setString(10,apvstat);
			             pst.setInt(11,vers);
			             pst.setInt(12,vers);
		        	 }
		        	 
		        	 
		        	 	            
		             rs = pst.executeQuery();                
		            while (rs.next()) {		            	
		            		Integer mdmcode=rs.getInt("MDM_Code");
		            		String materialcode=rs.getString("Material_Code");
		            		String materialcodedesc=rs.getString("Material_Code_Description");	            	
		            	 	String materialtypedesc=rs.getString("Material_Type_Description");
		            		Integer version=rs.getInt("version");
		            		String uom=rs.getString("Basic_UOM_Description");
		            		String plant=rs.getString("Plant_Code");
		            		String dcode=rs.getString("Dist_Channel_Code");
		            		String status=rs.getString("Status");
		            		String approvalprocess=rs.getString("Approval_Status");
		            		String ddesc=rs.getString("Dist_Channel_Description");

		            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
		            		listall.add(s);
		            } 
		            rs.close();
		            rs=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null; 
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		            throw ex;
		        }   
		         finally {
						ETLConnection.shutdown(rs, pst, con);
					}
		        return listall;
		}
	public List<Sales> UserLists1(String username,Integer mcode) throws SQLException, ClassNotFoundException	    
	 {	
		
			Connection con=null;
			PreparedStatement pst=null;
			ResultSet rs=null;
		    
		        List<Sales> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"MDM_Code\"=?";
		        	 pst =con.prepareStatement(sql); 
		             pst.setString(1,username);	
		             pst.setInt(2,mcode);
		        	
		        	 /*if(rolemattype.equals("None"))
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"MDM_Code\"=?";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setInt(2,mcode);
			             
		        	 }
		        	 else
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"MDM_Code\"=? ";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,rolemattype);	
			             pst.setString(3,rolemattype);	
			             pst.setInt(4,mcode);
			             
		        	 }*/
		        	 
		        	 
		        	 	            
		             rs = pst.executeQuery();                
		            while (rs.next()) {		            	
		            		Integer mdmcode=rs.getInt("MDM_Code");
		            		String materialcode=rs.getString("Material_Code");
		            		String materialcodedesc=rs.getString("Material_Code_Description");	            	
		            	 	String materialtypedesc=rs.getString("Material_Type_Description");
		            		Integer version=rs.getInt("version");
		            		String uom=rs.getString("Basic_UOM_Description");
		            		String plant=rs.getString("Plant_Code");
		            		String dcode=rs.getString("Dist_Channel_Code");
		            		String status=rs.getString("Status");
		            		String approvalprocess=rs.getString("Approval_Status");
		            		String ddesc=rs.getString("Dist_Channel_Description");

		            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
		            		listall.add(s);
		            } 
		            rs.close();
		            rs=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null; 
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		            throw ex;
		        }   
		         finally {
						ETLConnection.shutdown(rs, pst, con);
					}
		        return listall;
		}

	 
	public List<Sales> UserLists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException	    
	 {	
		
			Connection con=null;
			PreparedStatement pst=null;
			ResultSet rs=null;
		    
		        List<Sales> listall = new ArrayList<>();
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();
		        	
		        	 if(rolemattype.equals("None"))
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None')) and p.\"MDM_Code\"=?";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setInt(2,mcode);
			             
		        	 }
		        	 else
		        	 {
		        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.\"Dist_Channel_Code\",p.\"Dist_Channel_Description\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_Sales\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or  (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?)) and p.\"MDM_Code\"=? ";
			        	 pst =con.prepareStatement(sql); 
			             pst.setString(1,username);	
			             pst.setString(2,rolemattype);	
			             pst.setString(3,rolemattype);	
			             pst.setInt(4,mcode);
			             
		        	 }
		        	 
		        	 
		        	 	            
		             rs = pst.executeQuery();                
		            while (rs.next()) {		            	
		            		Integer mdmcode=rs.getInt("MDM_Code");
		            		String materialcode=rs.getString("Material_Code");
		            		String materialcodedesc=rs.getString("Material_Code_Description");	            	
		            	 	String materialtypedesc=rs.getString("Material_Type_Description");
		            		Integer version=rs.getInt("version");
		            		String uom=rs.getString("Basic_UOM_Description");
		            		String plant=rs.getString("Plant_Code");
		            		String dcode=rs.getString("Dist_Channel_Code");
		            		String status=rs.getString("Status");
		            		String approvalprocess=rs.getString("Approval_Status");
		            		String ddesc=rs.getString("Dist_Channel_Description");

		            		Sales s=new Sales(mdmcode, materialcode, materialcodedesc, materialtypedesc, version, uom,plant,dcode,status,approvalprocess,ddesc);
		            		listall.add(s);
		            } 
		            rs.close();
		            rs=null;
		            pst.close();
		            pst=null;
		            con.close();
		            con=null; 
		        } catch (SQLException ex) {
		            ex.printStackTrace();
		            throw ex;
		        }   
		         finally {
						ETLConnection.shutdown(rs, pst, con);
					}
		        return listall;
		}
	 public static Sales getSalesByTalendcode(Integer id,String plantcode,String dcode){ 
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
		 Sales s=new Sales();	          
	        try{  
	        	  
	             con=ETLConnection.getConnection(); 
	             ps=con.prepareStatement("select * from \"STG_SCR_Sales\" where \"MDM_Code\"=? and \"Plant_Code\"=? and \"Dist_Channel_Code\"=?");  
	             ps.setInt(1, id);
	             ps.setString(2, plantcode);
	             ps.setString(3,dcode);
	             rs=ps.executeQuery();  
	            if(rs.next()){  
	            	s.setMdmcode(rs.getInt("MDM_Code"));
	            	s.setMaterialcode(rs.getString("Material_Code"));
	            	s.setDescription(rs.getString("Material_Code_Description"));	            	
	            	s.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	s.setMaterialtypedesc(rs.getString("Material_Type_Description"));
	            	s.setPlantcode(rs.getString("Plant_Code"));
	            	s.setPlantdesc(rs.getString("Plant_Description"));	            	
		            s.setSlorgdesc(rs.getString("Sales_organisation_Description"));
		            s.setDtchdesc(rs.getString("Dist_Channel_Description"));
		            s.setDtchcode(rs.getString("Dist_Channel_Code"));
		            s.setMtlstatisticsgrpdesc(rs.getString("Matl_statistics_grp_Description"));
		            s.setMtlpricegrpdesc(rs.getString("Material_Price_Grp_Description"));
		            s.setAcassignmentgrpdesc(rs.getString("Acct_assignment_grp_Description"));
		            s.setAcassignmentgrpcode(rs.getString("Acct_assignment_grp_Code"));
		            s.setGencatgrpdesc(rs.getString("Gen_item_cat__grp_Description"));
		            s.setItmcatgrpdesc(rs.getString("Item_category_group_Description"));
		            s.setTrngrpdesc(rs.getString("Transportation_Group_Description"));
		            s.setLodgrpdesc(rs.getString("Loading_Group_Description"));
		            s.setDelplantdesc(rs.getString("Delivering_Plant_Description"));
		            s.setReasonforedit(rs.getString("Reason_For_Edit"));
		            s.setStatus(rs.getString("Status"));
		            s.setApprovalprocess(rs.getString("Approval_Status"));
		            s.setVersion(rs.getInt("version"));
		            //new fields
		            s.setsegmentcode(rs.getString("Segment"));
		            s.setsegmentdescription(rs.getString("Segment_Description"));
		            s.setapplicationcode(rs.getString("Application"));
		            s.setapplicationdescription(rs.getString("Application_Description"));
		            s.setaspectratiocode(rs.getString("Aspect Ratio"));
		            s.setaspectratiodescription(rs.getString("Aspect_Ratio_Description"));
		            s.setcccode(rs.getString("Polymer"));
		            s.setccdescription(rs.getString("Polymer_Description"));
		            s.setpolymercode(rs.getString("CC"));
		            s.setpolymerdescription(rs.getString("CC_Description"));
		            //new fields

		       
		            
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
	        return s;  
	    }  
	 
	 
	 public static int insertaudit(Sales e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Sales_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\",\"Dist_Channel_Code\",\"Dist_Channel_Description\")VALUES (?, ?, ?, ?,?,?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getCreatedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmcode());
		        ps.setString(5,e.getPlantcode());
		        ps.setString(6,e.getDtchcode());
		        ps.setString(7,e.getDtchdesc());

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
	 
	 public static int insertaudits(Sales e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Sales_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\",\"Dist_Channel_Code\",\"Dist_Channel_Description\")VALUES (?, ?, ?, ?,?,?,?);"); 
		        ps.setString(1,e.getStatus()); 	            
		        ps.setString(2,e.getModifiedby()); 
		        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
		        ps.setInt(4,e.getMdmcode());
		        ps.setString(5,e.getPlantcode());
		        ps.setString(6,e.getDtchcode());
		        ps.setString(7,e.getDtchdesc());
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



