package com.tvs.Sales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.mrp.Consumptionmode;

public class AspectRatioDAO {
	public List<AspectRatio> getAspectRatio() throws SQLException, ClassNotFoundException
	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		List<AspectRatio> listofaspectratio = new ArrayList<>();
		try
		{
			con = AuditConnection.getConnection();
			String sql = "SELECT * from \"Aspect_Ratio_Master\" ";
			ps =  con.prepareStatement(sql);
			result  =  ps.executeQuery();
			while(result.next())
			{
				String code = result.getString("Aspect_Ratio");
				String desc =  result.getString("Description");
				AspectRatio s = new AspectRatio(code,desc);
				listofaspectratio.add(s);
			}
			result.close();
			result = null;
			ps.close();
			ps = null;
			con.close();
			con = null;
			
		}
		 catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	    }   
		finally{
			AuditConnection.shutdown(result,ps,con);
		}
		
		return listofaspectratio;
	}

}
