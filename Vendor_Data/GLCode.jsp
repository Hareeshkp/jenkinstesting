<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
if(request.getParameter("vgcode")!=null && request.getParameter("vgcode")!="" ) 
{	
    String id=request.getParameter("vgcode"); 
   
    Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    try
    {
    	 con=AuditConnection.getConnection();
         pstmt=con.prepareStatement("select \"G_L_Code\"  from \"Vendor_Group_Master\" where \"Vendor_Group\" =?"); //sql select query     
         pstmt.setString(1,id);
         rs=pstmt.executeQuery();     
         while(rs.next())
         {
            	 %>
                 <option value="<%=rs.getString("G_L_Code")%>" "><%=rs.getString("G_L_Code")%></option>              
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
