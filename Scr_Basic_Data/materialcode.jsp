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
           
          <option  value="<%=rs.getString("Material_Code")%>"  >
                <%=rs.getString("Material_Code")%>
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
        out.println(e);
    }
    finally {
		ETLConnection.shutdown(rs, pstmt, con);
	}
}

%>
