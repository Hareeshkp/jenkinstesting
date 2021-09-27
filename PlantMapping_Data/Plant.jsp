<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

String tcode=request.getParameter("materialtype");


if(tcode!=null && tcode.length()>=1) 
{
    int id=Integer.parseInt(tcode); 
    
    
    Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;


    try
    {
        con=ETLConnection.getConnection();
            
       
         pstmt=con.prepareStatement("select  plant  from \"STG_SCR_Plant_Mapping\" where \"talendcode\" =?"); //sql select query      
         pstmt.setInt(1,id);
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.        
        %>  
        <%         
        while(rs.next())
        {
        %>  
          <option value="<%=rs.getString("plant")%>"><%=rs.getString("plant")%></option>
            
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
    finally
    {
    	ETLConnection.shutdown(rs, pstmt, con);
    	
    }
}

%>
