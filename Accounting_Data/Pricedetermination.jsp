<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>

<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

String pc=request.getParameter("materialtype");

if(pc!=null) 
{	
   
   
	String code=pc;
	 Connection conAud=null;

	    PreparedStatement pstmt=null ; 
	    ResultSet rs=null;
	
    try
    {
    	
    conAud=AuditConnection.getConnection(); 
   
    
    pstmt=conAud.prepareStatement("select \"Price_Control\" ,\"Price_Determination\"   from \"Price_Determination\" where \"Price_Control\" =?"); //sql select query     
    pstmt.setString(1,code);
    rs=pstmt.executeQuery();    
   
    while(rs.next())
    {

    	 %>
         <option value="<%=rs.getString("Price_Determination")%>"><%=rs.getString("Price_Determination")%></option>              
     	 <%
    }
    
    
    rs.close();
    rs=null;
    pstmt.close();
    pstmt=null;

    
        conAud.close();
        conAud=null;//close connection
        
    }
    catch(Exception e)
    {
        out.println(e);
    }
    
    finally
    
    {
    	AuditConnection.shutdown(rs, pstmt, conAud);
    	
    }
}

%>
