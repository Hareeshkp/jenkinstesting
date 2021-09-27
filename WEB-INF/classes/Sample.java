
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

public class Sample extends HttpServlet

{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection con = null;
		PreparedStatement ps = null;
		ResultSet result = null;

		List<String> listcode = new ArrayList<>();
		try {

			con = ETLConnection.getConnection();

			String sql = "SELECT * FROM \"STG_SCR_Basic\" ";

			ps = con.prepareStatement(sql);
			result = ps.executeQuery();

			while (result.next()) {
				String code = result.getString("Material_Code");

				listcode.add(code);
			}
			result.close();
			result = null;
			ps.close();
			ps = null;
			con.close();
			con = null;

			JSONArray jsArray = new JSONArray(listcode);
			PrintWriter out = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			out.print(jsArray);

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
