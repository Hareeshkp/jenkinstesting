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
    Connection conAud=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    PreparedStatement pstmtA=null ; //create statement        
    ResultSet rset=null;
    try
    {
    	//System.out.println(id);
        //Connection con=AuditConnection.getConnection();  
        con=ETLConnection.getConnection();
        conAud=AuditConnection.getConnection(); 
       
        
        pstmt=con.prepareStatement("select \"Material_Type_Code\"  from \"STG_SCR_Basic\" where \"MDM_Code\" =?"); //sql select query     
        pstmt.setInt(1,id);
        rs=pstmt.executeQuery();     
       
        while(rs.next())
        {
        	String  group=rs.getString("Material_Type_Code");     
        	
        	
            pstmtA=conAud.prepareStatement("select \"ValuationClass\", \"Description\"  from \"Valuation_Class\" where \"Acctcatreference\" =?"); //sql select query     
            pstmtA.setString(1,group);
            rset=pstmtA.executeQuery();
            while(rset.next()){
            	 %>
                 <option value="<%=rset.getString("Description")%>" data-id="<%=rset.getInt("ValuationClass")%>"></option>              
              <%
            }
        }  
       
    /*    
        if(rset!=null)
      	{
      		 
      	}
      	
      	if(pstmtA!=null)
      	{
      		
      	}*/
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
    	AuditConnection.shutdown(rset, pstmtA, conAud);
    	
    	
    }
}

%>
