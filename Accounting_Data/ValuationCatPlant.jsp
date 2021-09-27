<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
String valuationcategory=request.getParameter("valcat");

if(valuationcategory!=null && valuationcategory.length()>=1) 
{	
String valuationcategory1=valuationcategory;

	Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    try
    {
    	 con=AuditConnection.getConnection();        
         pstmt=con.prepareStatement("select * from \"Valuation_Category_Plant_Master\" where \"Valuation_Catecory_Description\" = ?"); //sql select query     
         pstmt.setString(1,valuationcategory1);
         rs=pstmt.executeQuery();     
        
         while(rs.next())
         {
         	
          	 %>
          	   <option value="<%=rs.getString("Plant_Location")%>" selected="selected"><%=rs.getString("Plant_Location")%></option>		             
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
