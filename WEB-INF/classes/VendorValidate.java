
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

@WebServlet("/Vendorvalidate")
public class VendorValidate extends HttpServlet
{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String name=request.getParameter("firstname");
		 String street=request.getParameter("street");
		 String pincode=request.getParameter("pincode");
		 String city=request.getParameter("city");
		 String gstno=request.getParameter("gstno");
		 String panno=request.getParameter("panno");

		 System.out.println("name is "+name);
		       boolean status=false;  
			   Connection con=null;
		       PreparedStatement ps=null;
		       ResultSet rs=null;
			try
			{  
		         con=ETLConnection.getConnection();
			     ps=con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"First_Name\"=? and \"Street\"=? and \"Pin_Code\"=? and \"City\"=? and \"GST_No\"=? and \"PAN_No\"=? ");  
			     ps.setString(1,name);
			     ps.setString(2,street);
			     ps.setString(3,pincode);
			     ps.setString(4,city);
			     ps.setString(5,gstno);
			     ps.setString(6,panno);
			     rs=ps.executeQuery();  
			     status=rs.next();  
			     System.out.println("Status is:- "+status);
			     rs.close();
	    	     rs=null;
	    	     ps.close();
	    	     ps=null;
	    	     con.close();
	    	     con=null;
			}
			catch(Exception e)
			{
				
			}
			 finally{
				 ETLConnection.shutdown(rs, ps, con);
	            }
			
		
		
		 
		 
		 
	}
}
