<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>

<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
String mcode=request.getParameter("materialtype");
Connection con=null;
Connection conAud=null;
PreparedStatement pstmt=null ; //create statement        
ResultSet rs=null;
PreparedStatement pstmtA=null ; //create statement        
ResultSet rset=null;
if(mcode!=null && mcode.length()>=1) 
{	
    int id=Integer.parseInt(mcode); 
    try
    {
    	 
         con=ETLConnection.getConnection();
         conAud=AuditConnection.getConnection(); 
        
        pstmt=con.prepareStatement("select \"Material_Group_Code\"  from \"STG_SCR_Basic\" where \"MDM_Code\" =?"); //sql select query     
        pstmt.setInt(1,id);
        rs=pstmt.executeQuery();     
       
        while(rs.next())
        {
        	String  group=rs.getString("Material_Group_Code");     
        	
        	
            pstmtA=conAud.prepareStatement("select \"Description\", \"Material_Orgin_Group\"  from \"Material_OrginGroup\" where \"Materials_group\" =?"); //sql select query     
            pstmtA.setString(1,group);
            rset=pstmtA.executeQuery();
            while(rset.next()){
            	 %>
                 <option value="<%=rset.getString("Description")%>-<%=rset.getString("Material_Orgin_Group")%>"><%=rset.getString("Description")%></option>              
              <%
            }
        }  
       
        
        
   
        
        rset.close();
        rset=null;
        pstmtA.close();
        pstmtA=null;
        conAud.close();
        conAud=null;
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
    	AuditConnection.shutdown(rset,pstmtA,conAud);

    }
}

%>
