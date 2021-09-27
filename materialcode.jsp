<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>



<%

if(request.getParameter("materialtype")!=null) 
{
    int id=Integer.parseInt(request.getParameter("materialtype")); 


    
    PreparedStatement pstmt=null ; //create statement
    
    ResultSet rs=null;
    
    try
    {
        Connection con=ETLConnection.getConnection();//create connection
        
        
      
       
        
        pstmt=con.prepareStatement("select *  from \"STG_SCR_BASIC\" where \"Talend_Material_Code\" =?"); //sql select query
      
               
          pstmt.setInt(1,id);
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.
        
        %>        

        <%    
     
        while(rs.next())
        {        	
        %>        
           
          <option value="<%=rs.getString("Material_Code")%>">
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
}

%>
