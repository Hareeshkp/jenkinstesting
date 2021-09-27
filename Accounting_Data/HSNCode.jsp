<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>

<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
String mcode=request.getParameter("materialtype");
if(mcode!=null && mcode.length()>=1) 
{	
    int id=Integer.parseInt(mcode); 
    Connection con=null;
    PreparedStatement pstmt=null ; 
    ResultSet rs=null;
    try
    {
     
         con=ETLConnection.getConnection();
        
        
        
        pstmt=con.prepareStatement("select \"HSN_Code\"  from \"STG_SCR_Basic\" where \"MDM_Code\" =?"); //sql select query     
        pstmt.setInt(1,id);
        rs=pstmt.executeQuery();     
       
        while(rs.next())
        {
        	String  group=rs.getString("HSN_Code");  
            	 %>
            	 <input type="text" name="HSNCode" readonly class="form-control input-sm input_text" id="HSNCode" value="<%=rs.getString("HSN_Code")%>" >                               
              <%
            
        }   
        
        rs.close();
        rs=null;
        pstmt.close();
        pstmt=null;

        
            con.close();
            con=null;//close connection
            
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
