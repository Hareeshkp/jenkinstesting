<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%
if(request.getParameter("statecode")!=null && request.getParameter("statecode")!="" ) 
{	
    String id=request.getParameter("statecode"); 
    Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    try
    {
    	 con=AuditConnection.getConnection();
         pstmt=con.prepareStatement("select \"TIN_NUMBER\"  from \"Gst_Region_Code_Master\" where \"Region\" =?"); //sql select query     
         pstmt.setString(1,id);
         rs=pstmt.executeQuery();     
             if(rs.next()){
            	 %>
                 <option value="<%=rs.getString("TIN_NUMBER")%> "><%=rs.getString("TIN_NUMBER")%></option>              
             	 <%
             }
         rs.close();
         rs=null;
         pstmt.close();
         pstmt=null;
         con.close();
         con=null;
         
    }
    catch(Exception e)
    {
        out.println(e);
    }
}

%>
