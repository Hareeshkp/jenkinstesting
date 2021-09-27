<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
if(request.getParameter("custgrpcode")!=null && request.getParameter("custgrpcode")!="") 
{	
    String  id=request.getParameter("custgrpcode"); 
    Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    
    try
    {
       
             con=AuditConnection.getConnection(); 
        	 pstmt=con.prepareStatement("select distinct \"Text\",\"Sales_District\"  from \"Sales_District_Master\" where \"Customer_Group\" =?"); //sql select query     
        	 pstmt.setString(1,id);
             rs=pstmt.executeQuery();
             while(rs.next()){
            	 
            	 %>
                 <option value="<%=rs.getString("Text")%>"  data-id="<%=rs.getString("Sales_District")%>"><%=rs.getString("Text")%></option>              
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
