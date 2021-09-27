<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

String plant=request.getParameter("Plant");

if(plant!=null && plant.length()>=1) 
{
	String Desc=plant;
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
    try
    {
       con=AuditConnection.getConnection();
        
         pstmt=con.prepareStatement("select  \"NameDescription\"  from \"Plant_Code_Master\" where  \"PlantCode\"=?"); //sql select query      
         pstmt.setString(1,Desc);
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.        
        %>  
        <%         
        while(rs.next())
        {
        %>  
          <option value="<%=rs.getString("NameDescription")%>"><%=rs.getString("NameDescription")%></option>
            
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
    	AuditConnection.shutdown(rs, pstmt, con);
    	
    }
}

%>
