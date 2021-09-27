package com.tvstyres.vendor.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.GSTFileing;
public class GSTFileingDAO {
	public List<GSTFileing> getGSTFileinglist() throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		List<GSTFileing> GSTFileinglist = new ArrayList<>();
		try {
			con = AuditConnection.getConnection();
			String sql = "SELECT * FROM \"GSTFileing\" ";
			ps = con.prepareStatement(sql);
			result = ps.executeQuery();
			while (result.next()) {
				String gstfileing = result.getString("GST_Fileing");
				String desc=result.getString("Description");
				GSTFileing gf = new GSTFileing(gstfileing,desc);
				GSTFileinglist.add(gf);
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
		return GSTFileinglist;

	}

}
