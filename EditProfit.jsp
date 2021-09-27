<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

if(request.getParameter("materialtype")!=null) 
{
    String id=request.getParameter("materialtype"); 
    PreparedStatement pstmt=null ; //create statement
    Connection con=null;
    
    ResultSet rs=null;
    try
    {
        con=AuditConnection.getConnection();
            
       
        pstmt=con.prepareStatement("select  *  from \"Profit_Center_Master\" where \"Plant\" =?"); //sql select query     
               
          pstmt.setString(1,id);
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.
        
        %>  
       
        <%    
      
        while(rs.next())
        {
        %>   
          <option value="<%=rs.getString("Profit_center_short_text_for_matchcode")%>"><%=rs.getString("Profit_center_short_text_for_matchcode")%></option>
            
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
