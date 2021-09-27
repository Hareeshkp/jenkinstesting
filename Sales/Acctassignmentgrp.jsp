<%@page import="com.tvs.dbconnection.ETLConnection"%>
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
    Connection conAud=null;
    PreparedStatement pstmt=null ; //create statement        
    ResultSet rs=null;
    PreparedStatement pstmtA=null ; //create statement        
    ResultSet rset=null;
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
        	
        	
        	    if(group.equals("301") || group.equals("302") || group.equals("201") || group.equals("202") || group.equals("212") || group.equals("211") || group.equals("203") || group.equals("209") || group.equals("210") || group.equals("208") || group.equals("014") || group.equals("015") || group.equals("016") || group.equals("017") || group.equals("018") || group.equals("019") || group.equals("104") || group.equals("105") || group.equals("106")|| group.equals("107")|| group.equals("108")|| group.equals("109")|| group.equals("110")|| group.equals("111")|| group.equals("112")|| group.equals("113")|| group.equals("114")|| group.equals("115")|| group.equals("116")|| group.equals("117")|| group.equals("316")|| group.equals("315")|| group.equals("310")  || group.equals("306")|| group.equals("001")|| group.equals("002")|| group.equals("003")|| group.equals("004")|| group.equals("005")|| group.equals("006")|| group.equals("007")|| group.equals("008")|| group.equals("009")|| group.equals("010")|| group.equals("011")|| group.equals("012")|| group.equals("013")|| group.equals("303")|| group.equals("304") )
        	    {
                    pstmtA=conAud.prepareStatement("select \"Acct_assignment_grp\", \"Acct_assignment_grp_Description\"  from \"Acct_Assignment_Grp_Master\" where \"Material_Group\" =?"); //sql select query     
                    pstmtA.setString(1,group);
        	    }
        	    else
        	    {
        	    	 pstmtA=conAud.prepareStatement("select \"Acct_assignment_grp\", \"Acct_assignment_grp_Description\"  from \"Acct_Assignment_Grp_Master\" where \"Material_Group\" ='NA'"); //sql select query     
                    
        	    }
               
                rset=pstmtA.executeQuery();
        
            while(rset.next()){
            	 %>
                 <option value="<%=rset.getString("Acct_assignment_grp_Description")%>" data-id="<%=rset.getString("Acct_assignment_grp")%>"></option>              
              <%
            }
        }  
        if(rset!=null)
      	{
      		 rset.close();
               rset=null;
      	}
      	
      	if(pstmtA!=null)
      	{
      		pstmtA.close();
              pstmtA=null;
      		
      	}
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
}

%>
