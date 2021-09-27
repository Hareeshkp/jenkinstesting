package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.IDType;

public class IDTypeDAO {
	public List<IDType> getIDTypelist() throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		List<IDType> IDTypelist = new ArrayList<>();
		try {
			con = AuditConnection.getConnection();
			String sql = "SELECT * FROM \"IDType\" ";
			ps = con.prepareStatement(sql);
			result = ps.executeQuery();
			while (result.next()) {
				String code = result.getString("ID_Type");
				String desc = result.getString("Description");
				IDType id = new IDType(code, desc);
				IDTypelist.add(id);
			}
			result.close();
			result = null;
			ps.close();
			ps = null;
			con.close();
			con = null;

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		finally {

			AuditConnection.shutdown(result, ps, con);

		} // finally close
		return IDTypelist;

	}

}
