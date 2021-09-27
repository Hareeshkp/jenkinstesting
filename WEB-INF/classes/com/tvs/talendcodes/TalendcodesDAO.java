package com.tvs.talendcodes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.tvs.dbconnection.ETLConnection;

public class TalendcodesDAO {


//PlantMapping Get the Approval MDM Code list
public List<Talendcodes> plantmapplist() throws SQLException, ClassNotFoundException
 {
        List<Talendcodes> listtalendcodes = new ArrayList<>();
        Connection con=null;
       	PreparedStatement ps=null;
       	ResultSet result=null;
         try
         {
        	 
        	con=ETLConnection.getConnection();
        	String sql = "SELECT p.\"MDM_Code\" FROM \"STG_SCR_Basic\" p LEFT JOIN \"STG_SCR_Plant_Mapping\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL  ";           
	 
             ps =con.prepareStatement(sql);

        	 result = ps.executeQuery();             
             while (result.next()) {
                 Integer talendcode = result.getInt("MDM_Code");                 
                 Talendcodes tc =new Talendcodes(talendcode );
                 listtalendcodes.add(tc);
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
     
         return listtalendcodes;

}

//

public List<Talendcodes> plantmapplist(String mattype) throws SQLException, ClassNotFoundException
{
        List<Talendcodes> listtalendcodes = new ArrayList<>();
        Connection con=null;
      	PreparedStatement ps=null;
      	ResultSet result=null;
        try
        {
       	 
       	 //	        	    	

       	con=ETLConnection.getConnection();
       	String sql = "SELECT p.\"MDM_Code\" FROM \"STG_SCR_Basic\" p LEFT JOIN \"STG_SCR_Plant_Mapping\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and p.\"Material_Type_Code\"=? ";           
	 
       //	String sql = "SELECT \"MDM_Code\" FROM \"STG_SCR_Basic\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
            ps =con.prepareStatement(sql);
ps.setString(1,mattype);
       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("MDM_Code");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
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
        return listtalendcodes;

}
//Purchasing Form
public Set<Talendcodes> purchaselist() throws SQLException, ClassNotFoundException
{
       Set<Talendcodes> listtalendcodes = new HashSet<>();

   	Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
        try
        {
      con=ETLConnection.getConnection();
  // String sql = "SELECT \"MDM_Code\" FROM \"STG_SCR_Plant_Mapping\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           

      String sql="SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p  JOIN \"STG_SCR_Plant_Mapping\" q ON  q.\"MDM_Code\" = p.talendcode           LEFT JOIN \"STG_SCR_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved' ";
      ps =con.prepareStatement(sql);

       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("talendcode");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
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
        return listtalendcodes;

}

//
//purchasing and plant storage form
public Set<Talendcodes> purchaseandplantstoragelist() throws SQLException, ClassNotFoundException
{
       Set<Talendcodes> listtalendcodes = new HashSet<>();

   	Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
        try
        {
      con=ETLConnection.getConnection();
     // String sql = "SELECT \"MDM_Code\" FROM \"STG_SCR_Plant_Mapping\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     // String sql="SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p  JOIN \"STG_SCR_Plant_Mapping\" q ON  q.\"MDM_Code\" = p.talendcode           LEFT JOIN \"STG_SCR_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved' ";
//      String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Purchase\" p LEFT JOIN \"STG_SCR_Plant_Storage\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?";            
//      String sql = "SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p JOIN \"STG_SCR_Basic\" q ON  q.\"MDM_Code\" = p.talendcode LEFT JOIN \"STG_SCR_Plant_Storage_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved'";
      	String sql = "SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p JOIN \"STG_SCR_Basic\" q ON  q.\"MDM_Code\" = p.talendcode LEFT JOIN \"STG_SCR_Plant_Storage_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved'";
      ps =con.prepareStatement(sql);

       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("talendcode");                 
                Talendcodes tc =new Talendcodes(talendcode);
                listtalendcodes.add(tc);
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
        return listtalendcodes;
}

public Set<Talendcodes> purchaseandplantstoragelist(String mattype) throws SQLException, ClassNotFoundException
{
       Set<Talendcodes> listtalendcodes = new HashSet<>();

   	Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
        try
        {
      con=ETLConnection.getConnection();
  // String sql = "SELECT \"MDM_Code\" FROM \"STG_SCR_Plant_Mapping\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           

      String sql="SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p  JOIN \"STG_SCR_Basic\" q ON  q.\"MDM_Code\" = p.talendcode LEFT JOIN \"STG_SCR_Plant_Storage_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved' and q.\"Material_Type_Code\"=? ";
      ps =con.prepareStatement(sql);
      ps.setString(1, mattype);

       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("talendcode");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
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
        return listtalendcodes;

}

//

public Set<Talendcodes> purchaselist(String mattype) throws SQLException, ClassNotFoundException
{
       Set<Talendcodes> listtalendcodes = new HashSet<>();

   	Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
        try
        {
      con=ETLConnection.getConnection();
  // String sql = "SELECT \"MDM_Code\" FROM \"STG_SCR_Plant_Mapping\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           

      String sql="SELECT distinct p.talendcode,p.plant FROM \"STG_DTL_Plant_Mapping\" p  JOIN \"STG_SCR_Plant_Mapping\" q ON  q.\"MDM_Code\" = p.talendcode           LEFT JOIN \"STG_SCR_Purchase\" s ON  s.\"MDM_Code\" = p.talendcode and s.\"Plant_Code\" = p.plant  WHERE  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and q.\"Approval_Status\"='Approved' and q.\"Material_Type_Code\"=? ";
      ps =con.prepareStatement(sql);
      ps.setString(1, mattype);

       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("talendcode");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
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
        return listtalendcodes;

}
//Plant and storage 
public Set<Talendcodes> plantstoreagelist() throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();

         Connection con=null;
      	PreparedStatement ps=null;
      	ResultSet result=null;
       
        try
        {
       	  con=ETLConnection.getConnection();
     	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Purchase\" p LEFT JOIN \"STG_SCR_Plant_Storage\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  ";           

         ps =con.prepareStatement(sql);
       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("MDM_Code");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
               
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
        return listtalendcodes;

}
//

public Set<Talendcodes> plantstoreagelist(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();

        Connection con=null;
      	PreparedStatement ps=null;
      	ResultSet result=null;
       
        try
        {
       	  con=ETLConnection.getConnection();
     	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Purchase\" p LEFT JOIN \"STG_SCR_Plant_Storage\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

  	// String sql = "SELECT  distinct  \"MDM_Code\" FROM \"STG_SCR_Purchase\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
         ps =con.prepareStatement(sql);
         ps.setString(1,mattype);
       	 result = ps.executeQuery();             
            while (result.next()) {
                Integer talendcode = result.getInt("MDM_Code");                 
                Talendcodes tc =new Talendcodes(talendcode );
                listtalendcodes.add(tc);
               
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
        return listtalendcodes;

}
//MRP 
public Set<Talendcodes> mrplist() throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
     Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
      try
      {
     	  con=ETLConnection.getConnection();
     	     	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage\" p LEFT JOIN \"STG_SCR_MRP\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\" IN ('ZFG', 'ZPRT', 'ZROH','ZSFG', 'ZSPR', 'ZHAW') ";           

         ps =con.prepareStatement(sql);

       result = ps.executeQuery();             
          while (result.next()) {
              Integer talendcode = result.getInt("MDM_Code");                 
              Talendcodes tc =new Talendcodes(talendcode );
              listtalendcodes.add(tc);
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
      return listtalendcodes;

}

public Set<Talendcodes> mrplist(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
     Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
   	String sql=null;
      try
      {
     	con=ETLConnection.getConnection();
     	if(mattype.equals("ZCP1")||mattype.equals("ZCAP")|| mattype.equals("ZIMT")|| mattype.equals("ZSCR"))
 		{
  	     	 //sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage\" p LEFT JOIN \"STG_SCR_Sales\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  and p.\"Plant_Code\" NOT IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800')  ";           
 	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p left JOIN \"STG_SCR_Sales\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  and p.\"Plant_Code\" NOT IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800')  ";           

 		}
     	 else 	if(mattype.equals("ZCON")|| mattype.equals("ZFUE")|| mattype.equals("ZPAC")|| mattype.equals("ZPOW")|| mattype.equals("ZNBW")|| mattype.equals("ZRTP")|| mattype.equals("ZSTA")|| mattype.equals("ZWEL"))
    	{
//  	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage\" p LEFT JOIN \"STG_SCR_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           
     		 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p left JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

    	}
     	 else
     	 {
//  	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage\" p LEFT JOIN \"STG_SCR_MRP\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           
     		 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p left JOIN \"STG_SCR_MRP\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           
     	 }

     	// String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Plant_Storage\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
         ps =con.prepareStatement(sql);
         ps.setString(1,mattype);

      result = ps.executeQuery();             
          while (result.next()) {
              Integer talendcode = result.getInt("MDM_Code");                 
              Talendcodes tc =new Talendcodes(talendcode );
              listtalendcodes.add(tc);
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
      return listtalendcodes;

}

//
public Set<Talendcodes> mrplist2(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
     Connection con=null;
   	PreparedStatement ps=null;
   	ResultSet result=null;
   	String sql=null;
      try
      {
     	  con=ETLConnection.getConnection();
     	 if(mattype.equals("ZCP1")||mattype.equals("ZCAP")|| mattype.equals("ZIMT")|| mattype.equals("ZSCR"))
 		{
     		  
  	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage_Purchase\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800')  and p.\"Material_Type_Code\"=?  UNION ALL  SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL   and p.\"Material_Type_Code\"=?   ";           
  	     	ps =con.prepareStatement(sql);
  	         ps.setString(1,mattype);
  	         ps.setString(2,mattype);
 		}
      else 	if(mattype.equals("ZCON")|| mattype.equals("ZFUE")|| mattype.equals("ZPAC")|| mattype.equals("ZPOW")|| mattype.equals("ZNBW")|| mattype.equals("ZRTP")|| mattype.equals("ZSTA")|| mattype.equals("ZWEL"))
    	{
  	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Plant_Storage\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           
  	     	ps =con.prepareStatement(sql);
 	         ps.setString(1,mattype);
    	}
     	 else
     	 {
     		 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800')  and p.\"Material_Type_Code\"=?  UNION ALL  SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL   and p.\"Material_Type_Code\"=?   ";           
   	     	ps =con.prepareStatement(sql);
   	         ps.setString(1,mattype);
   	         ps.setString(2,mattype);
     	 }

     	// String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Plant_Storage\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
        

      result = ps.executeQuery();             
          while (result.next()) {
              Integer talendcode = result.getInt("MDM_Code");       
            
              Talendcodes tc =new Talendcodes(talendcode );
              listtalendcodes.add(tc);
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
      return listtalendcodes;

}
//Sales 
public Set<Talendcodes> saleslist() throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
  	PreparedStatement ps=null;
  	ResultSet result=null;
    try
    {
    con=ETLConnection.getConnection();
      	     	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Sales\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  ";           

   	 //String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_MRP\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     ps =con.prepareStatement(sql);

   	 result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
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
    return listtalendcodes;

}

public Set<Talendcodes> saleslist(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
  	PreparedStatement ps=null;
  	ResultSet result=null;
	String sql=null;
    try
    {
    	
    con=ETLConnection.getConnection();
    if(mattype.equals("ZSPR"))
	{
	     	 sql = "SELECT distinct p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

	}
	else
	{
		sql = "SELECT distinct p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Sales\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=? and p.\"Plant_Code\" NOT IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800') ";           
	}
    /*System.out.println("//////////////////////////////////////////////");
    System.out.println(sql);*/

   	 //String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_MRP\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     ps =con.prepareStatement(sql);
ps.setString(1,mattype);
   	 result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
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
    return listtalendcodes;

}

public Set<Talendcodes> saleslist2(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
  	PreparedStatement ps=null;
  	ResultSet result=null;
	String sql=null;
    try
    {
    	
    con=ETLConnection.getConnection();
    if(mattype.equals("ZSPR"))
	{
	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

	}
	else
	{
	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Sales\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

	}

   	 //String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_MRP\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     ps =con.prepareStatement(sql);
ps.setString(1,mattype);
   	 result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
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
    return listtalendcodes;

}
//Costing
public Set<Talendcodes> costlist() throws SQLException, ClassNotFoundException
{
   Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
 	PreparedStatement ps=null;
 	ResultSet result=null;
    try
    {
   	  con=ETLConnection.getConnection();
   	      	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  ";           

   //	String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Sales\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
    ps =con.prepareStatement(sql);

    result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
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
    return listtalendcodes;

}

//

public Set<Talendcodes> costlist(String mattype) throws SQLException, ClassNotFoundException
{
   Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
 	PreparedStatement ps=null;
 	ResultSet result=null;
 	String    sql=null;
    try
    {
   	  con=ETLConnection.getConnection();
   	if(mattype.equals("ZCP1")|| mattype.equals("ZCAP")|| mattype.equals("ZIMT")|| mattype.equals("ZPRT")|| mattype.equals("ZSCR")|| mattype.equals("ZHAW"))
	{
   	     sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           
   	  ps =con.prepareStatement(sql);
      ps.setString(1,mattype);
	}
   	
   	
   	else
   	{
   		sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_MRP\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Plant_Code\" IN ('1000','1010','1020','1030','1040','1050','1060','1070','1080','1090','1100','1800','1802','1803','2010','3010','3020','3030','3800') and p.\"Material_Type_Code\"=? UNION ALL SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Sales\" p LEFT JOIN \"STG_SCR_Costing_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=? ";           
   	  	ps =con.prepareStatement(sql);
   	    ps.setString(1,mattype);
   	    ps.setString(2,mattype);
   	}

   	
   //	String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Sales\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
   

    result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code"); 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
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
    return listtalendcodes;

}
//Accounting
public Set<Talendcodes> accountlist() throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
    try
    {
   	  con=ETLConnection.getConnection();
	     	String sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Costing\" p LEFT JOIN \"STG_SCR_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL  ";           

   	// String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Costing\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     ps =con.prepareStatement(sql);

    result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
        }  
   } 
    catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   }
    finally {
		
     	 ETLConnection.shutdown(result, ps, con);
     	 
  	}
    return listtalendcodes;

}

public Set<Talendcodes> accountlist(String mattype) throws SQLException, ClassNotFoundException
{
	Set<Talendcodes> listtalendcodes = new HashSet<>();
   Connection con=null;
	PreparedStatement ps=null;
	ResultSet result=null;
	String sql=null;
    try
    {
   	  con=ETLConnection.getConnection();
   	  
   	  
	     	 sql = "SELECT distinct  p.\"MDM_Code\",p.\"Plant_Code\" FROM \"STG_SCR_Costing\" p LEFT JOIN \"STG_SCR_Accounting\" s ON  s.\"MDM_Code\" = p.\"MDM_Code\" and s.\"Plant_Code\" = p.\"Plant_Code\"  WHERE p.\"Approval_Status\"='Approved' and  s.\"MDM_Code\" IS NULL and s.\"Plant_Code\" IS NULL and p.\"Material_Type_Code\"=?  ";           

   	
   	// String sql = "SELECT distinct  \"MDM_Code\" FROM \"STG_SCR_Costing\" where \"Approval_Status\"='Approved' order by \"MDM_Code\" asc";           
     ps =con.prepareStatement(sql);
ps.setString(1,mattype);
    result = ps.executeQuery();             
        while (result.next()) {
            Integer talendcode = result.getInt("MDM_Code");                 
            Talendcodes tc =new Talendcodes(talendcode );
            listtalendcodes.add(tc);
        }  
   } 
    catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   }
    finally {
		
     	 ETLConnection.shutdown(result, ps, con);
     	 
  	}
    return listtalendcodes;

}


}
//