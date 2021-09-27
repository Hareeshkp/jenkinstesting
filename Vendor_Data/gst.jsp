<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.tvstyres.gstvalidator.api.ValidateGST"%>
<%@page import="com.tvstyres.gstvalidator.api.Token"%>
<%@page import="com.tvstyres.gstvalidator.api.GSTDetailsDAO"%>
<%@page import="com.tvstyres.gstvalidator.api.GSTDetails"%>
<%@page import="java.security.KeyManagementException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@ page language="java" contentType="application/json; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
if(request.getParameter("gstval")!=null && request.getParameter("gstval")!="") 	
{
	
/* String gstno=request.getParameter("gstval"); //get country_id from index.jsp page with function country_change() through ajax and store in id variable
String resultt=null;
try {
	 if(gstno!=null)
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
		 
		  JSONArray jsArray = new JSONArray(resultt);
			PrintWriter ouut = response.getWriter();
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			ouut.print(jsArray);
		 
		 
	 }
		} catch (KeyManagementException | NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 */
 
	List<String> listcode = new ArrayList<>();
	
	listcode.add("a");
	listcode.add("b");
	listcode.add("c");
	listcode.add("d");
	JSONArray jsArray = new JSONArray(listcode);
	response.setContentType("application/json");
	response.setCharacterEncoding("UTF-8");
	out.print(jsArray);

}

    %>
    
  

</body>
</html>