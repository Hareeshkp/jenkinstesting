<%@page import="com.tvs.dbconnection.AuditConnection"%>
<%@page import="com.tvs.dbconnection.ETLConnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page contentType="text/html; charset=UTF-8"%>

<%

String tcode=request.getParameter("materialtype");
String mattype=request.getParameter("mtype");


if(tcode!=null && tcode.length()>=1 ) 
{
    int id=Integer.parseInt(tcode);     
    Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql=null;
    try
    {    	
        con=ETLConnection.getConnection();
    
        if(mattype.equals("ZCP1")|| mattype.equals("ZCAP")|| mattype.equals("ZIMT")||  mattype.equals("ZSCR"))
    	{
           sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800') and  p.\"MDM_Code\"=? UNION ALL SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=? ";           
           pstmt=con.prepareStatement(sql); //sql select query      

           pstmt.setInt(1,id);
           pstmt.setInt(2,id);
    	}
        else if(mattype.equals("ZFG")|| mattype.equals("ZROH")|| mattype.equals("ZSFG"))
    	{
            //sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=?  ";           
            sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800') and p.\"MDM_Code\"=? UNION ALL SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"MDM_Code\"=? ";           
            pstmt=con.prepareStatement(sql); //sql select query      

            pstmt.setInt(1,id);
            pstmt.setInt(2,id);

    	}
        else  if(mattype.equals("ZSPR"))
    	{
        	
            sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=?  ";           
            pstmt=con.prepareStatement(sql); //sql select query      

            pstmt.setInt(1,id);
    	}
        
        
        else  if( mattype.equals("ZPRT")||  mattype.equals("ZHAW"))
    	{
           sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800') and  p.\"MDM_Code\"=? UNION ALL SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=? ";           
           pstmt=con.prepareStatement(sql); //sql select query      

           pstmt.setInt(1,id);
           pstmt.setInt(2,id);
    	}
        
        
        
        else 
    	{
            sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and  p.\"MDM_Code\"=?  ";           
            pstmt=con.prepareStatement(sql); //sql select query      

            pstmt.setInt(1,id);
    	}
       

       //  pstmt=con.prepareStatement("select  \"Plant_Code\"  from \"STG_SCR_Costing\" where \"Approval_Status\" ='Approved' and \"MDM_Code\"=?"); //sql select query      
     
         rs=pstmt.executeQuery(); //execute query and set in resultset object rs.        
        %>  
        <%         
        while(rs.next())
        {
        %>  
          <option value="<%=rs.getString("Plant_Code")%>"><%=rs.getString("Plant_Code")%></option>
            
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
