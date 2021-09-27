<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
if(request.getParameter("custgrpcode")!=null && request.getParameter("custgrpcode")!="") 
{	
    String id=request.getParameter("custgrpcode"); 
    Connection con=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    int count=0;
    
    try
    {
         con=AuditConnection.getConnection(); 
        
         
         	
         	if(id.contains("TC01") || id.contains("TC02") || id.contains("TC03") ||id.contains("TC04")|| id.contains("TC07") || id.contains("TC11") )
         	{
         		pstmt=con.prepareStatement("select *  from \"Customer_Group_Distribution_Mapping\" where \"Customer_Group\" =?"); //sql select query     
         		pstmt.setString(1,id);
                rs=pstmt.executeQuery();	
         		
         		
         	}
         	
         	else
         	{
         		pstmt=con.prepareStatement("select *  from \"Customer_Group_Distribution_Mapping\" "); //sql select query     
                 rs=pstmt.executeQuery();
         		
         	}
            
             while(rs.next()){
            	 
            	 %>
                 <option value="<%=rs.getString("Description1")%>"  data-id="<%=rs.getString("Distri_Channel")%>"><%=rs.getString("Description1")%></option>              
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
