<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

String tcode=request.getParameter("materialtype");


if(tcode!=null  && tcode.length()>=1 ) 
{
    int id=Integer.parseInt(tcode); 
    
    
    Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

    try
    {
        con=ETLConnection.getConnection();
            
          	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p LEFT JOIN \"STG_SCR_MRP\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=?  ";           
            pstmt=con.prepareStatement(sql); //sql select query      

        // pstmt=con.prepareStatement("select  \"Plant_Code\"  from \"STG_SCR_Plant_Storage\" where \"Approval_Status\" ='Approved' and \"MDM_Code\"=?"); //sql select query      
         pstmt.setInt(1,id);
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.        
        %>  
        <%         
        while(rs.next())
        {
        %>  
          <option value="<%=rs.getString("Plant_Code")%>"><%=rs.getString("Plant_Code")%></option>
            
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
