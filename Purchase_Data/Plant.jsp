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
        String sql = "select distinct p.talendcode,p.plant from \"STG_SCR_Basic\" q join \"STG_DTL_Plant_Mapping\" p on p.\"talendcode\" = q.\"MDM_Code\" left join \"STG_SCR_Plant_Storage_Purchase\" r on p.\"talendcode\" = r.\"MDM_Code\" and p.\"plant\" = r.\"Plant_Code\" where r.\"MDM_Code\" IS NULL and r.\"Plant_Code\" IS NULL and q.\"Approval_Status\" = 'Approved' and p.\"talendcode\" =? ";
        //String sql="SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p  JOIN \"STG_SCR_Plant_Mapping\" q ON  q.\"MDM_Code\" = p.talendcode LEFT JOIN \"STG_SCR_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved' and \"talendcode\" =? ";
        pstmt=con.prepareStatement(sql); //sql select query      

      //  pstmt=con.prepareStatement("select  distinct plant  from \"STG_DTL_Plant_Mapping\" where \"talendcode\" =?"); //sql select query      
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
