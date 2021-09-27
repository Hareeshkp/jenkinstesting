
import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.tvs.dbconnection.ETLConnection;
import com.tvstyres.gstvalidator.api.GSTDetails;
import com.tvstyres.gstvalidator.api.GSTDetailsDAO;
import com.tvstyres.gstvalidator.api.Token;
import com.tvstyres.gstvalidator.api.ValidateGST;

@WebServlet("/gst")
public class Gst extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String gstno=request.getParameter("gstnumber");
		 //get country_id from index.jsp page with function country_change() through ajax and store in id variable
		String resultt=null;
		try {
			if(gstno!=null && gstno.length()==15)
			{
			 GSTDetails g=GSTDetailsDAO.getGSTDetails();
			 String tokenURL=g.getTokenurl();
			 String Username=g.getUsername();
			 String Password=g.getPassword();
			 String GSTURL=g.getGsturl();
			 String ClientCode=g.getClientcode();
			 String GSTIN=g.getGst();
				 String token=	Token.generateToken(tokenURL,Username,Password);

				 
				 resultt=ValidateGST.GstValidate(GSTURL,token,ClientCode,GSTIN,gstno);

				 
				 List<String> listcode = new ArrayList<>();
				    listcode.add(resultt);
				   JSONArray jsArray = new JSONArray(listcode);
					PrintWriter out = response.getWriter();
					response.setContentType("application/json");
					response.setCharacterEncoding("UTF-8");
					out.print(jsArray);

				}
		}
			 
			 catch (KeyManagementException | NoSuchAlgorithmException  e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

	}
}
