package com.tvs.mrp;

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
import com.tvs.dbconnection.ETLConnection;
import com.tvs.plantandstorage.PlantandStorage;
import com.tvs.scrbasic.SCRBasic;

public class MrpDAO {
	
	
	 public static int insert(Mrp e){  
	        int status=0;  
	        Connection con=null;
			PreparedStatement ps=null;
	        try{  
	        	con=ETLConnection.getConnection();
	            ps=con.prepareStatement("insert into  \"STG_SCR_MRP\" (\"MDM_Code\",\"Material_Code\",\"Material_Code_Description\",\"Plant_Code\",\"Plant_Description\",\"MRP_Group_Code\",\"MRP_Group_Description\",\"ABC_Indicator_Code\",\"ABC_Indicator_Description\",\"MRP_Type_Code\",\"MRP_Type_Description\",\"Reorder_Point\",\"MRP_Controller_Code\",\"MRP_Controller_Description\",\"Lot_Sizing__Procedure_Code\",\"Lot_Sizing__Procedure_Description\",\"Minimum_Lot_Size\",\"Maximum_stock_level\",\"Assembly_scrap\",\"Procurement_Type_Code\",\"Procurement_Type_Description\",\"Special_Procurement_Code\",\"Special_Procurement_Description\",\"Production_Storage_Location_Code\",\"Production_Storage_Location_Description\",\"Back_Flush_Code\",\"Back_Flush_Description\",\"In_house_production\",\"Co_Product\",\"SchedMargin_key\",\"Planned_Deliv__Time\",\"Safety_stock\",\"Min_safety_stock\",\"Strategy_group_Code\",\"Strategy_group_Description\",\"Bwd_consumption_Per\",\"Consumption_Mode_Code\",\"Consumption_Mode_Description\",\"Mixed_MRP_Code\",\"Mixed_MRP_Description\",\"Fwd_Consumption_Per\",\"Tot__repl__lead_time\",\"Availability_Check_Code\",\"Availability_Check_Description\",\"Individual_coll_Code\",\"Individual_coll_Description\",\"Component_Scrap\",\"REM_Profile_Code\",\"REM_Profile_Description\",\"Repetitive_Mfg\",\"Status\",\"Created_By\",\"Created_Date\",\"Material_Type_Code\",\"Material_Type_Description\",\"Approval_Status\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");  
	            ps.setInt(1,e.getMdmcode()); 	            
	            ps.setString(2,e.getMaterialcode()); 
	            ps.setString(3,e.getMaterialcodedesc()); 	            
	            ps.setString(4,e.getPlantcode());  
	            ps.setString(5,e.getPlantdesc());  
	            
	            if(e.getMrpgroupcode().isEmpty())
	            {
		            ps.setString(6,null);  

	            }
	            else
	            {
		            ps.setString(6,e.getMrpgroupcode());  

	            }
	            
	            
	            if(e.getMrpgroupcodedesc().isEmpty())
	            {
	                ps.setString(7,null);

	            }
	            else
	            {
	                ps.setString(7,e.getMrpgroupcodedesc());

	            }
	            
	            if(e.getAbcindicatorcode().isEmpty())
	            {
		            ps.setString(8,null);  

	            }
	            else
	            {
		            ps.setString(8,e.getAbcindicatorcode());  

	            }
	            
	            if(e.getAbcindicatorcodedesc().isEmpty())
	            {
		            ps.setString(9,null);  

	            }
	            else
	            {
		            ps.setString(9,e.getAbcindicatorcodedesc());  

	            }
	            
	            
	            if(e.getMrptypecode().isEmpty())
	            {
		            ps.setString(10,null); 

	            }
	            else
	            {
		            ps.setString(10,e.getMrptypecode()); 

	            }
	            
	            if(e.getMrptypedesc().isEmpty())
	            {
		            ps.setString(11,null); 

	            }
	            else
	            {
		            ps.setString(11,e.getMrptypedesc()); 

	            }
	            
	            if(e.getReorderpoint()!=null)
	            {
		            ps.setInt(12,e.getReorderpoint());
	            }
	            else
	            {
	            ps.setNull(12,Types.INTEGER);
	            }
	            
	            
	            if(e.getMrpcontrollercode().isEmpty())
	            {
		            ps.setString(13,null); 

	            }
	            else
	            {
		            ps.setString(13,e.getMrpcontrollercode()); 

	            }
	            
	            
	            if(e.getMrpcontrollercodedesc().isEmpty())
	            {
		            ps.setString(14,null); 

	            }
	            else
	            {
		            ps.setString(14,e.getMrpcontrollercodedesc()); 

	            }
	            
	            
	            if(e.getLotsizingcode().isEmpty())
	            {
		            ps.setString(15,null); 

	            }
	            else
	            {
		            ps.setString(15,e.getLotsizingcode()); 

	            }
	            
	            if(e.getLotsizingdesc().isEmpty())
	            {
		            ps.setString(16,null); 	            

	            }
	            else
	            {
		            ps.setString(16,e.getLotsizingdesc()); 	            

	            }
	            
	            if(e.getMinlotsize().isEmpty())
	            {
		            ps.setString(17,null); 

	            }
	            else
	            {
		            ps.setString(17,e.getMinlotsize()); 

	            }
	            
	            if(e.getMaximamstocklevel().isEmpty())
	            {
		            ps.setString(18,null); 

	            }
	            else
	            {
		            ps.setString(18,e.getMaximamstocklevel()); 

	            }
	            
	            
	            if(e.getAssemblyscrap()!=null)
	            {
		            ps.setInt(19,e.getAssemblyscrap()); 
	            }
	            else
	            {
	            ps.setNull(19,Types.INTEGER);
	            }
	            
	            
	            if(e.getProcurementtypecode().isEmpty())
	            {
		            ps.setString(20,null); 

	            }
	            else
	            {
		            ps.setString(20,e.getProcurementtypecode()); 

	            }
	            
	            if(e.getProcurementtypecodedesc().isEmpty())
	            {
		            ps.setString(21,null); 	            

	            }
	            else
	            {
		            ps.setString(21,e.getProcurementtypecodedesc()); 	            

	            }
	            
	            
	            if(e.getSpecialprocurementcode().isEmpty())
	            {
		            ps.setString(22,null); 

	            }
	            else
	            {
		            ps.setString(22,e.getSpecialprocurementcode()); 

	            }
	            
	            
	            if(e.getSpecialprocurementcodedesc().isEmpty())
	            {
		            ps.setString(23,null); 	            

	            }
	            else
	            {
		            ps.setString(23,e.getSpecialprocurementcodedesc()); 	            

	            }
	            
	            if(e.getProductionstoragelocationcode().isEmpty())
	            	
	            {
		            ps.setString(24,null); 

	            }
	            else
	            {
		            ps.setString(24,e.getProductionstoragelocationcode()); 

	            }
	            
	            if(e.getProductionstoragelocationdesc().isEmpty())
	            {
		            ps.setString(25,null); 

	            }
	            else
	            {
		            ps.setString(25,e.getProductionstoragelocationdesc()); 

	            }
	            
	            if(e.getBackflushcode().isEmpty())
	            {
		            ps.setString(26,null); 

	            }
	            else
	            {
		            ps.setString(26,e.getBackflushcode()); 

	            }
	            
	            if(e.getBackflushdesc().isEmpty())
	            {
		            ps.setString(27,null); 	            

	            }
	            else
	            {
		            ps.setString(27,e.getBackflushdesc()); 	            

	            }
	            
	            
	            if(e.getInhouseproduction().isEmpty())
	            {
		            ps.setString(28,null); 

	            }
	            else
	            {
		            ps.setString(28,e.getInhouseproduction()); 

	            }
	            
	            
	            ps.setBoolean(29,e.getCoproduct()); 
	            
	            if(e.getSchedmarginkey().isEmpty())
	            {
		            ps.setString(30,null); 

	            }
	            else
	            {
		            ps.setString(30,e.getSchedmarginkey()); 

	            }
	            
	            
	            if(e.getPlanneddeliverytime()!=null)
	            {
		            ps.setInt(31,e.getPlanneddeliverytime());	            
	            }
	            else
	            {
	            ps.setNull(31,Types.INTEGER);
	            }
	            
	            if(e.getSaftystock().isEmpty())
	            {
		            ps.setString(32,null); 

	            }
	            else
	            {
		            ps.setString(32,e.getSaftystock()); 

	            }
	            
	            if(e.getMinsaftystock().isEmpty())
	            {
		            ps.setString(33,null); 	            

	            }
	            else
	            {
		            ps.setString(33,e.getMinsaftystock()); 	            

	            }
	            
	            if(e.getStrategygroupcode().isEmpty())
	            {
		            ps.setString(34,null); 

	            }
	            else
	            {
		            ps.setString(34,e.getStrategygroupcode()); 

	            }
	            
	            if(e.getStrategygroupdesc().isEmpty())
	            {
		            ps.setString(35,null); 

	            }
	            else
	            {
		            ps.setString(35,e.getStrategygroupdesc()); 

	            }
	            
	            
	            if(e.getBwdconsumptionper()!=null)
	            {
		            ps.setInt(36,e.getBwdconsumptionper()); 	            
	            }
	            else
	            {
	            ps.setNull(36,Types.INTEGER);
	            }
	            
	            if(e.getConsumptionmodecode().isEmpty())
	            {
		            ps.setString(37,null); 

	            }
	            else
	            {
		            ps.setString(37,e.getConsumptionmodecode()); 

	            }
	            
	            if(e.getConsumptionmodedesc().isEmpty())
	            {
		            ps.setString(38,null); 	            

	            }
	            else
	            {
		            ps.setString(38,e.getConsumptionmodedesc()); 	            

	            }
	            
	            if(e.getMixedmrpcode().isEmpty())
	            {
		            ps.setString(39,null); 

	            }
	            else
	            {
		            ps.setString(39,e.getMixedmrpcode()); 

	            }
	            
	            
	            if(e.getMixedmrpdesc().isEmpty())
	            {
		            ps.setString(40,null);

	            }
	            else
	            {
		            ps.setString(40,e.getMixedmrpdesc());

	            }
	            
	            if(e.getForwardconsumptionper()!=null)
	            {
		            ps.setInt(41,e.getForwardconsumptionper()); 
	            }
	            else
	            {
	            ps.setNull(41,Types.INTEGER);
	            }
	            
	            if(e.getTotalrepleadtime()!=null)
	            {
		            ps.setInt(42,e.getTotalrepleadtime()); 	            
	            }
	            else
	            {
	            ps.setNull(42,Types.INTEGER);
	            }
	            
	            if(e.getAvailabilitycheckcode().isEmpty())
	            {
		            ps.setString(43,null); 

	            }
	            else
	            {
		            ps.setString(43,e.getAvailabilitycheckcode()); 

	            }
	            
	            if(e.getAvailabilitycheckdesc().isEmpty())
	            {
		            ps.setString(44,null);	            

	            }
	            else
	            {
		            ps.setString(44,e.getAvailabilitycheckdesc());	            

	            }
	            
	            if(e.getIndividualcallcode().isEmpty())
	            {
		            ps.setString(45,null); 

	            }
	            else
	            {
		            ps.setString(45,e.getIndividualcallcode()); 

	            }
	            
	            if(e.getIndividualcalldesc().isEmpty())
	            {
		            ps.setString(46,null); 

	            }
	            else
	            {
		            ps.setString(46,e.getIndividualcalldesc()); 

	            }
	            
	            if(e.getComponenetscrap()!=null)
	            {
		            ps.setInt(47,e.getComponenetscrap()); 	            
	            }
	            else
	            {
	            ps.setNull(47,Types.INTEGER);
	            }
	            
	            if(e.getRemprofilecode().isEmpty())
	            {
		            ps.setString(48,null); 

	            }
	            else
	            {
		            ps.setString(48,e.getRemprofilecode()); 

	            }
	            
	            if(e.getRemprofiledesc().isEmpty())
	            {
		            ps.setString(49,null);    

	            }
	            else
	            {
		            ps.setString(49,e.getRemprofiledesc());    

	            }
	            ps.setBoolean(50,e.getRepetativemfg());	            	            
	            ps.setString(51,e.getStatus());	            
	            ps.setString(52,e.getCreatedby());
	            ps.setObject(53,new Timestamp(System.currentTimeMillis()));
	            ps.setString(54,e.getMaterialtypecode());	            
	            ps.setString(55,e.getMaterialtypedesc());	 
	            ps.setString(56,e.getApprovalprocess());
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

	 public static int Update(Mrp e){  
	        int status=0;  
	        
	        Connection con=null;
			PreparedStatement ps=null;
	        try{  
	        	con=ETLConnection.getConnection();
	            ps=con.prepareStatement("Update  \"STG_SCR_MRP\" set \"Material_Code\"=?,\"Material_Code_Description\"=?,\"Plant_Code\"=?,\"Plant_Description\"=?,\"MRP_Group_Code\"=?,\"MRP_Group_Description\"=?,\"ABC_Indicator_Code\"=?,\"ABC_Indicator_Description\"=?,\"MRP_Type_Code\"=?,\"MRP_Type_Description\"=?,\"Reorder_Point\"=?,\"MRP_Controller_Code\"=?,\"MRP_Controller_Description\"=?,\"Lot_Sizing__Procedure_Code\"=?,\"Lot_Sizing__Procedure_Description\"=?,\"Minimum_Lot_Size\"=?,\"Maximum_stock_level\"=?,\"Assembly_scrap\"=?,\"Procurement_Type_Code\"=?,\"Procurement_Type_Description\"=?,\"Special_Procurement_Code\"=?,\"Special_Procurement_Description\"=?,\"Production_Storage_Location_Code\"=?,\"Production_Storage_Location_Description\"=?,\"Back_Flush_Code\"=?,\"Back_Flush_Description\"=?,\"In_house_production\"=?,\"Co_Product\"=?,\"SchedMargin_key\"=?,\"Planned_Deliv__Time\"=?,\"Safety_stock\"=?,\"Min_safety_stock\"=?,\"Strategy_group_Code\"=?,\"Strategy_group_Description\"=?,\"Bwd_consumption_Per\"=?,\"Consumption_Mode_Code\"=?,\"Consumption_Mode_Description\"=?,\"Mixed_MRP_Code\"=?,\"Mixed_MRP_Description\"=?,\"Fwd_Consumption_Per\"=?,\"Tot__repl__lead_time\"=?,\"Availability_Check_Code\"=?,\"Availability_Check_Description\"=?,\"Individual_coll_Code\"=?,\"Individual_coll_Description\"=?,\"Component_Scrap\"=?,\"REM_Profile_Code\"=?,\"REM_Profile_Description\"=?,\"Repetitive_Mfg\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Reason_For_Edit\"=?,\"Approval_Status\"=?,\"Reject_Reason\"=?  where \"MDM_Code\"=? and \"Plant_Code\"=?");  
	            ps.setString(1,e.getMaterialcode()); 
	            ps.setString(2,e.getMaterialcodedesc()); 	            
	            ps.setString(3,e.getPlantcode());  
	            ps.setString(4,e.getPlantdesc());  
	            
	            
	            if(e.getMrpgroupcode().isEmpty())
	            {
		            ps.setString(5,null);  

	            }
	            else
	            {
		            ps.setString(5,e.getMrpgroupcode());  

	            }
	            
	            
	            if(e.getMrpgroupcodedesc().isEmpty())
	            {
	                ps.setString(6,null);

	            }
	            else
	            {
	                ps.setString(6,e.getMrpgroupcodedesc());

	            }
	            
	            if(e.getAbcindicatorcode().isEmpty())
	            {
		            ps.setString(7,null);  

	            }
	            else
	            {
		            ps.setString(7,e.getAbcindicatorcode());  

	            }
	            
	            if(e.getAbcindicatorcodedesc().isEmpty())
	            {
		            ps.setString(8,null);  

	            }
	            else
	            {
		            ps.setString(8,e.getAbcindicatorcodedesc());  

	            }
	            
	            
	            if(e.getMrptypecode().isEmpty())
	            {
		            ps.setString(9,null); 

	            }
	            else
	            {
		            ps.setString(9,e.getMrptypecode()); 

	            }
	            
	            if(e.getMrptypedesc().isEmpty())
	            {
		            ps.setString(10,null); 

	            }
	            else
	            {
		            ps.setString(10,e.getMrptypedesc()); 

	            }
	            
	            
	            if(e.getReorderpoint()!=null)
	            {
		            ps.setInt(11,e.getReorderpoint());
	            }
	            else
	            {
	            	
	            ps.setNull(11,Types.INTEGER);
	            	
		         
	            }	  
	            
	            
	            
	            if(e.getMrpcontrollercode().isEmpty())
	            {
		            ps.setString(12,null); 

	            }
	            else
	            {
		            ps.setString(12,e.getMrpcontrollercode()); 

	            }
	            
	            
	            if(e.getMrpcontrollercodedesc().isEmpty())
	            {
		            ps.setString(13,null); 

	            }
	            else
	            {
		            ps.setString(13,e.getMrpcontrollercodedesc()); 

	            }
	            
	            
	            if(e.getLotsizingcode().isEmpty())
	            {
		            ps.setString(14,null); 

	            }
	            else
	            {
		            ps.setString(14,e.getLotsizingcode()); 

	            }
	            
	            if(e.getLotsizingdesc().isEmpty())
	            {
		            ps.setString(15,null); 	            

	            }
	            else
	            {
		            ps.setString(15,e.getLotsizingdesc()); 	            

	            }
	            
	            if(e.getMinlotsize().isEmpty())
	            {
		            ps.setString(16,null); 

	            }
	            else
	            {
		            ps.setString(16,e.getMinlotsize()); 

	            }
	            
	            if(e.getMaximamstocklevel().isEmpty())
	            {
		            ps.setString(17,null); 

	            }
	            else
	            {
		            ps.setString(17,e.getMaximamstocklevel()); 

	            }
	            
	            
	            if(e.getAssemblyscrap()!=null)
	            {
		            ps.setInt(18,e.getAssemblyscrap()); 
	            }
	            else
	            {
	            ps.setNull(18,Types.INTEGER);
	            }	     
	            
	            
	            if(e.getProcurementtypecode().isEmpty())
	            {
		            ps.setString(19,null); 

	            }
	            else
	            {
		            ps.setString(19,e.getProcurementtypecode()); 

	            }
	            
	            if(e.getProcurementtypecodedesc().isEmpty())
	            {
		            ps.setString(20,null); 	            

	            }
	            else
	            {
		            ps.setString(20,e.getProcurementtypecodedesc()); 	            

	            }
	            
	            
	            if(e.getSpecialprocurementcode().isEmpty())
	            {
		            ps.setString(21,null); 

	            }
	            else
	            {
		            ps.setString(21,e.getSpecialprocurementcode()); 

	            }
	            
	            
	            if(e.getSpecialprocurementcodedesc().isEmpty())
	            {
		            ps.setString(22,null); 	            

	            }
	            else
	            {
		            ps.setString(22,e.getSpecialprocurementcodedesc()); 	            

	            }
	            
	            if(e.getProductionstoragelocationcode().isEmpty())
	            	
	            {
		            ps.setString(23,null); 

	            }
	            else
	            {
		            ps.setString(23,e.getProductionstoragelocationcode()); 

	            }
	            
	            if(e.getProductionstoragelocationdesc().isEmpty())
	            {
		            ps.setString(24,null); 

	            }
	            else
	            {
		            ps.setString(24,e.getProductionstoragelocationdesc()); 

	            }
	            
	            if(e.getBackflushcode().isEmpty())
	            {
		            ps.setString(25,null); 

	            }
	            else
	            {
		            ps.setString(25,e.getBackflushcode()); 

	            }
	            
	            if(e.getBackflushdesc().isEmpty())
	            {
		            ps.setString(26,null); 	            

	            }
	            else
	            {
		            ps.setString(26,e.getBackflushdesc()); 	            

	            }
	            
	            
	            if(e.getInhouseproduction().isEmpty())
	            {
		            ps.setString(27,null); 

	            }
	            else
	            {
		            ps.setString(27,e.getInhouseproduction()); 

	            }
	            
	            
	            ps.setBoolean(28,e.getCoproduct()); 
	            
	            if(e.getSchedmarginkey().isEmpty())
	            {
		            ps.setString(29,null); 

	            }
	            else
	            {
		            ps.setString(29,e.getSchedmarginkey()); 

	            }
	            
	            
	            
	            if(e.getPlanneddeliverytime()!=null)
	            {
		            ps.setInt(30,e.getPlanneddeliverytime());	            
	            }
	            else
	            {
	            ps.setNull(30,Types.INTEGER);
	            }	     
	            
	            
	            
	            if(e.getSaftystock().isEmpty())
	            {
		            ps.setString(31,null); 

	            }
	            else
	            {
		            ps.setString(31,e.getSaftystock()); 

	            }
	            
	            if(e.getMinsaftystock().isEmpty())
	            {
		            ps.setString(32,null); 	            

	            }
	            else
	            {
		            ps.setString(32,e.getMinsaftystock()); 	            

	            }
	            
	            if(e.getStrategygroupcode().isEmpty())
	            {
		            ps.setString(33,null); 

	            }
	            else
	            {
		            ps.setString(33,e.getStrategygroupcode()); 

	            }
	            
	            if(e.getStrategygroupdesc().isEmpty())
	            {
		            ps.setString(34,null); 

	            }
	            else
	            {
		            ps.setString(34,e.getStrategygroupdesc()); 

	            }
	            
	            if(e.getBwdconsumptionper()!=null)
	            {
		            ps.setInt(35,e.getBwdconsumptionper()); 	            
	            }
	            else
	            {
	            ps.setNull(35,Types.INTEGER);
	            }	    
	            
	            
	            if(e.getConsumptionmodecode().isEmpty())
	            {
		            ps.setString(36,null); 

	            }
	            else
	            {
		            ps.setString(36,e.getConsumptionmodecode()); 

	            }
	            
	            if(e.getConsumptionmodedesc().isEmpty())
	            {
		            ps.setString(37,null); 	            

	            }
	            else
	            {
		            ps.setString(37,e.getConsumptionmodedesc()); 	            

	            }
	            
	            if(e.getMixedmrpcode().isEmpty())
	            {
		            ps.setString(38,null); 

	            }
	            else
	            {
		            ps.setString(38,e.getMixedmrpcode()); 

	            }
	            
	            
	            if(e.getMixedmrpdesc().isEmpty())
	            {
		            ps.setString(39,null);

	            }
	            else
	            {
		            ps.setString(39,e.getMixedmrpdesc());

	            }
	            
	            
	            if(e.getForwardconsumptionper()!=null)
	            {
		            ps.setInt(40,e.getForwardconsumptionper()); 
	            }
	            else
	            {
	            ps.setNull(40,Types.INTEGER);
	            }	          
	            
	            if(e.getTotalrepleadtime()!=null)
	            {
		            ps.setInt(41,e.getTotalrepleadtime()); 	            
	            }
	            else
	            {
	            ps.setNull(41,Types.INTEGER);
	            }	     
	            
	            
	            if(e.getAvailabilitycheckcode().isEmpty())
	            {
		            ps.setString(42,null); 

	            }
	            else
	            {
		            ps.setString(42,e.getAvailabilitycheckcode()); 

	            }
	            
	            if(e.getAvailabilitycheckdesc().isEmpty())
	            {
		            ps.setString(43,null);	            

	            }
	            else
	            {
		            ps.setString(43,e.getAvailabilitycheckdesc());	            

	            }
	            
	            if(e.getIndividualcallcode().isEmpty())
	            {
		            ps.setString(44,null); 

	            }
	            else
	            {
		            ps.setString(44,e.getIndividualcallcode()); 

	            }
	            
	            if(e.getIndividualcalldesc().isEmpty())
	            {
		            ps.setString(45,null); 

	            }
	            else
	            {
		            ps.setString(45,e.getIndividualcalldesc()); 

	            }
	            
	            
	            if(e.getComponenetscrap()!=null)
	            {
		            ps.setInt(46,e.getComponenetscrap()); 	            
	            }
	            else
	            {
	            ps.setNull(46,Types.INTEGER);
	            }	     
	            
	            
	            if(e.getRemprofilecode().isEmpty())
	            {
		            ps.setString(47,null); 

	            }
	            else
	            {
		            ps.setString(47,e.getRemprofilecode()); 

	            }
	            
	            if(e.getRemprofiledesc().isEmpty())
	            {
		            ps.setString(48,null);    

	            }
	            else
	            {
		            ps.setString(48,e.getRemprofiledesc());    

	            }
	            ps.setBoolean(49,e.getRepetativemfg());
	            ps.setString(50,e.getStatus());	            
	            ps.setString(51,e.getModifiedby());
	            ps.setObject(52,new Timestamp(System.currentTimeMillis()));
	            ps.setString(53,e.getMaterialtypecode());	            
	            ps.setString(54,e.getMaterialtypedesc());	          
	            
	            if(e.getReasonforedit().isEmpty())
	            {
		            ps.setString(55,null);

	            }
	            else
	            {
		            ps.setString(55,e.getReasonforedit());

	            }
	            
	            ps.setString(56, e.getApprovalprocess());
	            ps.setString(57,e.getReasonforrejection());
	            ps.setInt(58,e.getMdmcode());	          
	            ps.setString(59,e.getPlantcode());   
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
	 public static Mrp getMRPByTalendcode(Integer id,String plantcode){  			
			
		 	Mrp m =new Mrp();
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
	        try{  
	        	  
	             con=ETLConnection.getConnection(); 
	             ps=con.prepareStatement("select * from \"STG_SCR_MRP\" where \"MDM_Code\"=? and \"Plant_Code\"=?");  
	             ps.setInt(1, id);
	             ps.setString(2,plantcode);
	             rs=ps.executeQuery();  
	            if(rs.next()){  
	            	
	            	m.setMdmcode(rs.getInt("MDM_Code"));
	            	m.setMaterialtypecode(rs.getString("Material_Type_Code"));
	            	m.setMaterialtypedesc(rs.getString("Material_Type_Description"));
	            	
	            m.setMaterialcode(rs.getString("Material_Code"));
	            m.setMaterialcodedesc(rs.getString("Material_Code_Description"));
	            m.setPlantcode(rs.getString("Plant_Code"));
	            m.setPlantdesc(rs.getString("Plant_Description"));
	            m.setMrpgroupcode(rs.getString("MRP_Group_Code"));
	            
	            m.setMrpgroupcodedesc(rs.getString("MRP_Group_Description"));	            
	            m.setAbcindicatorcodedesc(rs.getString("ABC_Indicator_Description"));
	            m.setMrptypedesc(rs.getString("MRP_Type_Description"));
	            m.setReorderpoint(rs.getInt("Reorder_Point"));
	            m.setMrpcontrollercode(rs.getString("MRP_Controller_Code"));
	            
	            m.setMrpcontrollercodedesc(rs.getString("MRP_Controller_Description"));
	            m.setLotsizingdesc(rs.getString("Lot_Sizing__Procedure_Description"));
	            m.setMinlotsize(rs.getString("Minimum_Lot_Size"));
	            m.setMaximamstocklevel(rs.getString("Maximum_stock_level"));	            
	            m.setAssemblyscrap(rs.getInt("Assembly_scrap"));	            
	            m.setProcurementtypecodedesc(rs.getString("Procurement_Type_Description"));
	            m.setSpecialprocurementcodedesc(rs.getString("Special_Procurement_Description"));
	            m.setProductionstoragelocationcode(rs.getString("Production_Storage_Location_Code"));
	            m.setProductionstoragelocationdesc(rs.getString("Production_Storage_Location_Description"));
	            m.setBackflushdesc(rs.getString("Back_Flush_Description"));
	            m.setInhouseproduction(rs.getString("In_house_production"));
	            m.setCoproduct(rs.getBoolean("Co_Product"));
	            m.setPlanneddeliverytime(rs.getInt("Planned_Deliv__Time"));
	            m.setSchedmarginkey(rs.getString("SchedMargin_key"));
	            m.setSaftystock(rs.getString("Safety_stock"));
	            m.setMinsaftystock(rs.getString("Min_safety_stock"));
	            m.setStrategygroupdesc(rs.getString("Strategy_group_Description"));
	            m.setBwdconsumptionper(rs.getInt("Bwd_consumption_Per"));
	            m.setConsumptionmodedesc(rs.getString("Consumption_Mode_Description"));	            
	            m.setMixedmrpdesc(rs.getString("Mixed_MRP_Description"));
	            m.setForwardconsumptionper(rs.getInt("Fwd_Consumption_Per"));
	            m.setTotalrepleadtime(rs.getInt("Tot__repl__lead_time"));
	            m.setAvailabilitycheckdesc(rs.getString("Availability_Check_Description"));            
	            m.setIndividualcalldesc(rs.getString("Individual_coll_Description"));
	            m.setComponenetscrap(rs.getInt("Component_Scrap"));
	            m.setRemprofiledesc(rs.getString("REM_Profile_Description"));
	            m.setRepetativemfg(rs.getBoolean("Repetitive_Mfg"));
	            m.setReasonforedit(rs.getString("Reason_For_Edit"));	            
	            m.setStatus(rs.getString("Status"));
	            m.setApprovalprocess(rs.getString("Approval_Status"));
	            m.setVersion(rs.getInt("version"));
	            
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
	        return m;  
	    }  
	 public List<Mrp> alllist1() throws SQLException, ClassNotFoundException	    
	    {
		    List<Mrp> listall = new ArrayList<>();
	        Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	        	  
	        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  p.\"Status\"='Inactive'";
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
	            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
	                listall.add(m);
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
	        }   
	        finally {
				ETLConnection.shutdown(result, ps, con);
			}
	        return listall;
	    }
	 
	 public List<Mrp> alllist(String mattype) throws SQLException, ClassNotFoundException	    
	    {
		 
		 if(mattype.equals("None"))
		 {
			 List<Mrp> listall = new ArrayList<>();
		        Connection con=null;
				PreparedStatement ps=null;
				ResultSet result=null;
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();	        	  
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  p.\"Status\"='Inactive'";
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
		            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
		                listall.add(m);
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
		        }   
		        finally {
					ETLConnection.shutdown(result, ps, con);
				}
		        return listall;
			 
		 }
		 else
		 {
			 List<Mrp> listall = new ArrayList<>();
		        Connection con=null;
				PreparedStatement ps=null;
				ResultSet result=null;
		         try
		         {	        	 
		        	 con=ETLConnection.getConnection();	        	  
		        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\"  where  p.\"Status\"='Inactive' and p.\"Material_Type_Code\"=?";
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
		            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
		                listall.add(m);
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
		        }   
		        finally {
					ETLConnection.shutdown(result, ps, con);
				}
		        return listall;
			 
		 }
	        
	}
	  
	 //User based shoeing the records
	 public List<Mrp> userlist1(String username,String mattype,String plantv,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
	    {
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
		 	
			
	        List<Mrp> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();
	        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
        		 System.out.println("ooooooooooooooooooooooooooooooooooooooo");
	        	 System.out.println(sql);
	        	 ps=con.prepareStatement(sql); 	
	        	 ps.setString(1,username);	
	        	 ps.setString(2, mattype);
	        	 ps.setString(3,plantv);	
	        	 ps.setString(4, stat);
	        	 ps.setString(5,stat);	
	        	 ps.setString(6, apvstat);
	        	 ps.setString(7,apvstat);	
	        	 ps.setInt(8, vers);
	        	 ps.setInt(9, vers);
	        	 
	        	 /*if(rolemattype.equals("None"))
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	
		        	 ps.setString(2, mattype);
		        	 ps.setString(3,plantv);	
		        	 ps.setString(4, stat);
		        	 ps.setString(5,stat);	
		        	 ps.setString(6, apvstat);
		        	 ps.setString(7,apvstat);	
		        	 ps.setInt(8, vers);
		        	 ps.setInt(9, vers);
	        	 }
	        	 else
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
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
*/	        	            
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
	            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
	                listall.add(m);
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
	
	 
	 public List<Mrp> userlist(String username,String rolemattype,String mattype,String plantv,String stat,String apvstat,Integer vers) throws SQLException, ClassNotFoundException	    
	    {
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
		 	
			
	        List<Mrp> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	     
	        	 
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	
		        	 ps.setString(2, mattype);
		        	 ps.setString(3,plantv);	
		        	 ps.setString(4, stat);
		        	 ps.setString(5,stat);	
		        	 ps.setString(6, apvstat);
		        	 ps.setString(7,apvstat);	
		        	 ps.setInt(8, vers);
		        	 ps.setInt(9, vers);
	        	 }
	        	 else
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"Material_Type_Code\"=? and p.\"Plant_Code\"=? and (p.\"Status\"= ? or 'Select'=?)and (p.\"Approval_Status\" = ? or 'Select'=? )and (p.\"version\" = ? or -1=?)";
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
	            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
	                listall.add(m);
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
	 public List<Mrp> userlists1(String username,Integer mcode) throws SQLException, ClassNotFoundException	    
	    {
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
		 	
			
	        List<Mrp> listall = new ArrayList<>();
	         try
	         {
	        	 
	        	 con=ETLConnection.getConnection();	 
	        	 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"MDM_Code\"=? ";
        		 ps=con.prepareStatement(sql); 	
	        	 ps.setString(1,username);	
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
	            	String approvalprocess=result.getString("Approval_Status");
	            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
	                listall.add(m);
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
	 public List<Mrp> userlists(String username,String rolemattype,Integer mcode) throws SQLException, ClassNotFoundException	    
	    {
		 	Connection con=null;
			PreparedStatement ps=null;
			ResultSet result=null;
		 	
			
	        List<Mrp> listall = new ArrayList<>();
	         try
	         {	        	 
	        	 con=ETLConnection.getConnection();	     
	        	 
	        	 if(rolemattype.equals("None"))
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"<>'None') or (p.\"Status\"='Active' and p.\"Material_Type_Code\"<>'None'))and p.\"MDM_Code\"=? ";
	        		 ps=con.prepareStatement(sql); 	
		        	 ps.setString(1,username);	
		        	ps.setInt(2,mcode);
	        	 }
	        	 else
	        	 {
	        		 String sql="SELECT p.\"MDM_Code\",p.\"Material_Code\", p.\"Material_Code_Description\",p.\"Material_Type_Description\", s.\"Basic_UOM_Description\",p.\"Plant_Code\",p.version,p.\"Status\",p.\"Approval_Status\" FROM \"STG_SCR_Basic\" s INNER JOIN \"STG_SCR_MRP\" p ON  s.\"MDM_Code\" = p.\"MDM_Code\" where  ((p.\"Created_By\"=? and p.\"Material_Type_Code\"=?) or (p.\"Status\"='Active' and p.\"Material_Type_Code\"=?))and p.\"MDM_Code\"=? ";
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
	            	Mrp m =new Mrp(mdmcode, materialcode, materialcodedesc, materialtypedesc, uom, version,plant,status,approvalprocess);
	                listall.add(m);
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
	 public static int insertaudit(Mrp e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_MRP_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
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
	 public static int insertaudits(Mrp e){  
		    int status=0;  
		    Connection con=null;
		    PreparedStatement ps=null;
		    try
		    {  
		    	con=ETLConnection.getConnection();
		        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_MRP_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\",\"Plant_Code\")VALUES (?, ?, ?, ?,?);"); 
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
