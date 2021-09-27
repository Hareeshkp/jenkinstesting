import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.tvs.dbconnection.ETLConnection;

public class CustomerCode extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Integer> talendcode = new ArrayList<>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;
		try {
			con = ETLConnection.getConnection();

			String sql = "SELECT * FROM \"STG_SCR_Customer\" ";
			ps = con.prepareStatement(sql);
			result = ps.executeQuery();

			while (result.next()) {
				Integer tcode = result.getInt("MDM_Customer_Code");

				talendcode.add(tcode);
			}

			result.close();
			result = null;
			ps.close();
			ps = null;
			con.close();
			con = null;

			JSONArray talendArray = new JSONArray(talendcode);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(talendArray);

		}

		catch (SQLException e)

		{
			e.printStackTrace();
		}

		finally {

			ETLConnection.shutdown(result, ps, con);
		}

	}

}
