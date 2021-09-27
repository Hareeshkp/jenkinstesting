<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
String mcode=request.getParameter("materialtype");
String plant=request.getParameter("plant");








if(mcode!=null && mcode.length()>=1 && plant!=null && plant.length()>=1) 
{	
String matcode=mcode;
String plants=plant;

	
	Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    try
    {
    	 con=AuditConnection.getConnection();
        
         pstmt=con.prepareStatement("select distinct  \"Valuation_Category\",\"Description\"  from \"Valuation_Category_Master\" where \"Material_Type\" =? and \"Plant\" =? "); //sql select query     

         pstmt.setString(1,matcode);
         pstmt.setString(2,plants);         
         rs=pstmt.executeQuery();     
        
         while(rs.next())
         {
         	
          	 %>
               <option value="<%=rs.getString("Description")%>@<%=rs.getString("Valuation_Category")%>"><%=rs.getString("Description")%></option>              
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
