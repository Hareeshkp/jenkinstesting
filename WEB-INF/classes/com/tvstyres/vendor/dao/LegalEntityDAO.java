package com.tvstyres.vendor.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.tvs.dbconnection.AuditConnection;
import com.tvstyres.vendor.model.LegalEntity;

public class LegalEntityDAO {
	
	public List<LegalEntity> getLegalEntitylist() throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		List<LegalEntity> LegalEntitylist = new ArrayList<>();
		try {
			con = AuditConnection.getConnection();
			String sql = "SELECT * FROM \"LegalEntity\" ";
			ps = con.prepareStatement(sql);
			result = ps.executeQuery();
			while (result.next()) {
				String code = result.getString("Legal_Entity");
				String desc = result.getString("Description");
				LegalEntity le=new LegalEntity(code, desc);
				LegalEntitylist.add(le);
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
		return LegalEntitylist;

	}

}
