<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>
<%
String mt=request.getParameter("materialtype");
if(mt!=null && mt.length()>=1) 
{
    int id=Integer.parseInt(mt);
    Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
    try
    {
        con=ETLConnection.getConnection();
        pstmt=con.prepareStatement("select *  from \"STG_SCR_Basic\" where \"MDM_Code\" =?"); //sql select query
      	pstmt.setInt(1,id);
        rs=pstmt.executeQuery(); //execute query and set in resultset object rs.        
        %>      
        <%  
        while(rs.next())
        {
        %>  
           <option value='<%=rs.getString("Material_Description").replace("\"", "\"")%>'  >
                <%=rs.getString("Material_Description")%>
            </option>            
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
        
    }
    finally {
		ETLConnection.shutdown(rs, pstmt, con);
	}
}

%>
