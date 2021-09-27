package com.tvs.costing;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;

public class Valuationcatlist {
	public List<Plantlocationcode> getvaluationcatplantcodes(String Val_Cat_Desc) throws SQLException, ClassNotFoundException
	{
		List<Plantlocationcode> plantcodes = new ArrayList<>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try
		{
			con = AuditConnection.getConnection();
			String sql ="Select \"Plant_Location\" from \"Valuation_Category_Plant_Master\" where \"Valuation_Catecory_Description\" = ? ";
			pst = con.prepareStatement(sql);
			pst.setString(1,Val_Cat_Desc);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				String plant_location= rs.getString("Plant_Location");
				Plantlocationcode plc = new Plantlocationcode(plant_location);
				plantcodes.add(plc);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
			
		}
		catch (SQLException ex) {
		ex.printStackTrace();
		throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return plantcodes;
		
	}
	public List<SelectedPlantLocationcode> getvaluationcatplantcodesoncategory(Integer MDM_Code,String plantcode) throws SQLException, ClassNotFoundException
	{
		List<SelectedPlantLocationcode> plantcodes = new ArrayList<>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try
		{
			String plant_location = "";
			con = ETLConnection.getConnection();
			String sql ="Select \"Valuation_Category_Values\" from \"STG_SCR_Costing_Accounting\" where \"MDM_Code\" = ? and  \"Plant_Code\" = ? ";
			pst = con.prepareStatement(sql);
			pst.setInt(1,MDM_Code);
			pst.setString(2,plantcode);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				plant_location= rs.getString("Valuation_Category_Values");
			}
			String lang[] = plant_location.split(",");
			if(lang!=null && lang.length>=1)
			{
				for(int i=0;i<lang.length;i++)
				{
					System.out.println("eeeeeeeeeeeeeeeeeeeeeeeeeee");
					System.out.println(lang[i]);
					SelectedPlantLocationcode plc = new SelectedPlantLocationcode(lang[i]);
					plantcodes.add(plc);					
				}
			}
			
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
			
		}
		catch (SQLException ex) {
		ex.printStackTrace();
		throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return plantcodes;
	}

	

}
