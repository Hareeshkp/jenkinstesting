<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="com.tvs.dbconnection.AuditConnection"%>

<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%
if(request.getParameter("materialtype")!=null) 
{	
    int id=Integer.parseInt(request.getParameter("materialtype")); 
    int Plant=Integer.parseInt(request.getParameter("plant"));   
    Connection con=null;
    Connection conAud=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    PreparedStatement pstmtA=null ; //create statement        
    ResultSet rset=null;
    
    
    PreparedStatement pstmtM=null ; //create statement        
    ResultSet rsetM=null;
    try
    {
    	 con=ETLConnection.getConnection();
        
         
         pstmt=con.prepareStatement("select \"Material_Type_Code\"  from \"STG_SCR_Basic\" where \"MDM_Code\" =?"); //sql select query     
         pstmt.setInt(1,id);
         rs=pstmt.executeQuery();   
         
         conAud=AuditConnection.getConnection(); 

         while(rs.next())
         {
         	String  group=rs.getString("Material_Type_Code");   
          
             pstmtA=conAud.prepareStatement("select \"Price_Control\"  from \"MaterialType_Plant_PriceControle\" where \"Material_Type\" =? and \"Plant\" =?"); //sql select query     
             pstmtA.setString(1,group);
             pstmtA.setInt(2,Plant);
             rset=pstmtA.executeQuery();
             while(rset.next()){
            	 
                 String  plantc=rset.getString("Price_Control");                
                 pstmtM=conAud.prepareStatement("select \"Price_control\",\"Price_control_Description\"  from \"Price_Control_Master\" where \"Price_control\" =?"); //sql select query     
                 pstmtM.setString(1,plantc);                 
                 rsetM=pstmtM.executeQuery();
                 while(rsetM.next()){
                	 %>
                     <option value="<%=rsetM.getString("Price_control_Description")%>-<%=rsetM.getString("Price_control")%>"><%=rsetM.getString("Price_control_Description")%></option>              
                 	 <%
                 }
             }
         }  
         
        /* if(rsetM!=null)
         {
        	
         }
         
         if(pstmt!=null)
         {
        	 
         }

         if(rset!=null)
       	{
       		  
       	}
       	
       	if(pstmtA!=null)
       	{
       		
       		
       	}*/
        rsetM.close();
        rsetM=null;
        
        pstmtM.close();
        pstmtM=null; 
        
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
    
    
    finally{
    	
    	
    	ETLConnection.shutdown(rs, pstmt, con);
    	AuditConnection.shutdown(rset, pstmtA, conAud);
    	
    	
    	  if(rsetM!=null)
        {
       	rsetM.close();
        }
        
        if(pstmtM!=null)
        {
       	 pstmtM.close();
        }

    }
}

%>
