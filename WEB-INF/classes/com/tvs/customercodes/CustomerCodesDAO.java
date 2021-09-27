package com.tvs.customercodes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.ETLConnection;

public class CustomerCodesDAO {

	
	public List<CustomerCodes> accdata() throws SQLException, ClassNotFoundException
	 {
	        List<CustomerCodes> listcustcodes = new ArrayList<>();
	        Connection con=null;
	        Connection conAud=null;
	        PreparedStatement pstmt=null ; //create statement        
	        ResultSet rs=null;
	        PreparedStatement pstmtA=null ; //create statement        
	        ResultSet rset=null;
	         try
	         {
	        	 con=ETLConnection.getConnection();
	        	String sql = "SELECT p.\"Customer_Code\" FROM \"STG_SCR_Customer_SalesData\" p LEFT JOIN \"STG_SCR_Customer_AccountingData\" s ON  s.\"Customer_Code\" = p.\"Customer_Code\" WHERE p.\"Approval_Status\"='Approved' and  s.\"Customer_Code\" IS NULL";           
      
	         //  pstmt=con.prepareStatement("SELECT \"Customer_Code\" FROM \"STG_SCR_Customer_SalesData\" where \"Approval_Status\"='Approved' order by \"Customer_Code\" asc");          
	     
	        	 
	            pstmt=con.prepareStatement(sql);          

	             rs=pstmt.executeQuery();     
	             conAud=ETLConnection.getConnection(); 

	             while(rs.next())
	             {
	              	Integer  customercode=rs.getInt("Customer_Code");  
	              	
	              	
	           
	                 pstmtA=conAud.prepareStatement("select *  from \"STG_SCR_Customer_BasicData\" where \"Approval_Status\"='Approved' and \"Customer_Code\" =?"); //sql select query     
	                 pstmtA.setInt(1,customercode);
	                 rset=pstmtA.executeQuery();
	                 while(rset.next()){
	                	 
	                	 Integer custcode = rset.getInt("Customer_Code"); 
		                 String custtype=rset.getString("Customer_Group_Type");

		                 CustomerCodes cc =new CustomerCodes(custcode, custtype);
		                 listcustcodes.add(cc);	 
	                	 
	                	 
	                	
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
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }
	         finally {
				
	        	 ETLConnection.shutdown(rs, pstmt, con);
	        	 ETLConnection.shutdown(rset, pstmtA, conAud);
	        	 
			}
	         return listcustcodes;

	
	 }
	
	
	
	public List<CustomerCodes> salesdata() throws SQLException, ClassNotFoundException
	 {
	        List<CustomerCodes> listcustcodes = new ArrayList<>();
	        Connection con=null;
	        Connection conAud=null;
	        PreparedStatement pstmt=null ; //create statement        
	        ResultSet rs=null;
	        PreparedStatement pstmtA=null ; //create statement        
	        ResultSet rset=null;
	         try
	         {
	        	 con=ETLConnection.getConnection();
	        	 String sql = "SELECT p.\"Customer_Code\" FROM \"STG_SCR_Customer_ContactData\" p LEFT JOIN \"STG_SCR_Customer_SalesData\" s ON  s.\"Customer_Code\" = p.\"Customer_Code\" WHERE p.\"Approval_Status\"='Approved' and  s.\"Customer_Code\" IS NULL";           

	            // pstmt=con.prepareStatement("SELECT \"Customer_Code\" FROM \"STG_SCR_Customer_ContactData\" where \"Approval_Status\"='Approved' order by \"Customer_Code\" asc");          
	             pstmt=con.prepareStatement(sql);          

	             rs=pstmt.executeQuery();     
	             conAud=ETLConnection.getConnection(); 

	             while(rs.next())
	             {
	              	Integer  customercode=rs.getInt("Customer_Code");  
	              	
	              	
	           
	                 pstmtA=conAud.prepareStatement("select *  from \"STG_SCR_Customer_BasicData\" where \"Approval_Status\"='Approved' and \"Customer_Code\" =?"); //sql select query     
	                 pstmtA.setInt(1,customercode);
	                 rset=pstmtA.executeQuery();
	                 while(rset.next()){
	                	 
	                	 Integer custcode = rset.getInt("Customer_Code"); 
		                 String custtype=rset.getString("Customer_Group_Type");

		                 CustomerCodes cc =new CustomerCodes(custcode, custtype);
		                 listcustcodes.add(cc);	 
	                	 
	                	 
	                	
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
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }
	         finally {
				
	        	 ETLConnection.shutdown(rs, pstmt, con);
	        	 ETLConnection.shutdown(rset, pstmtA, conAud);
	        	 
			}
	         return listcustcodes;

	
	 }
	
	public List<CustomerCodes> contactdata() throws SQLException, ClassNotFoundException
	 {
	        List<CustomerCodes> listcustcodes = new ArrayList<>();
	        Connection con=null;
	       	PreparedStatement ps=null;
	       	ResultSet result=null;
	         try
	         {
	        	con=ETLConnection.getConnection();
	        	 String sql = "SELECT p.\"Customer_Code\" FROM \"STG_SCR_Customer_BasicData\" p LEFT JOIN \"STG_SCR_Customer_ContactData\" s ON  s.\"Customer_Code\" = p.\"Customer_Code\" WHERE p.\"Approval_Status\"='Approved' and  s.\"Customer_Code\" IS NULL";           
	             ps =con.prepareStatement(sql);

	        	 result = ps.executeQuery();             
	             while (result.next()) {
	                 Integer custcode = result.getInt("Customer_Code"); 

	                		 CustomerCodes cc =new CustomerCodes(custcode);
	                 listcustcodes.add(cc);
	             } 
	             
	             result.close();
	 	        result=null;
	 	        ps.close();
	 	        ps=null;
	 	        con.close();
	 	        con=null;
	             
	        } 
	         catch (SQLException ex) {
	            ex.printStackTrace();
	            throw ex;
	        }
	         finally {
				
	        	 ETLConnection.shutdown(result, ps, con);
	        	 
			}
	         return listcustcodes;

	
	 }
	
	
	
	
	
}
