package com.tvs.scrbasic;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.ETLConnection;

public class SRCBasicDAO {
	
//Manager based showing the data..........	
public List<SCRBasic> alllist(String mattype) throws SQLException, ClassNotFoundException
{
	Connection con=null;
    PreparedStatement pst=null;
    ResultSet rs=null;
    String stus="Inactive";
    List<SCRBasic> listall = new ArrayList<>();
    try
    {
        	 
    	con=ETLConnection.getConnection();
     
     	String sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where \"Status\"=?";// and \"Approval_Status\" is null";    	
        pst =con.prepareStatement(sql);        	
        pst.setString(1,stus); 
        //pst.setString(2,mattype);
        // pst.setString(2,stus1);
        rs = pst.executeQuery();             
        while (rs.next()) {              
            Integer talendcode=rs.getInt("MDM_Code");
        	String materialtypedesc=rs.getString("Material_Type_Description");
            String materialcode=rs.getString("Material_Code");
        	String description=rs.getString("Material_Description");
            String basicuom=rs.getString("Basic_UOM_Description");
        	Integer version=rs.getInt("version");
        	String status=rs.getString("Status");
        	String approvalstatus=rs.getString("Approval_Status");
        	SCRBasic sb =new SCRBasic(talendcode, materialtypedesc, materialcode, description, basicuom, version,status,approvalstatus);
        	listall.add(sb);
            }          
            rs.close();
            rs=null;
            pst.close();
            pst=null;
            con.close();
            con=null;
            
        } 
         catch (SQLException ex) {
            ex.printStackTrace();
            throw ex;
        }      
         
         finally{
        	 ETLConnection.shutdown(rs, pst, con);    	 
             }//finally close
         return listall;

    }
     


public List<SCRBasic> desclist(String id) throws SQLException, ClassNotFoundException

{
     
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
    List<SCRBasic> listdesc = new ArrayList<>();

	try{  
		
		 con=ETLConnection.getConnection();    
	     String query="SELECT \"Material_Code\", \"Material_Description\"  FROM \"STG_SCR_Basic\"  where \"Material_Code\" like ? order by  \"Material_Code\" desc";
	     ps=con.prepareStatement(query);  
		 ps.setString(1,id+"%");  
		 rs=ps.executeQuery(); 
		

		while(rs.next()){  
			
			 String materialcode=rs.getString("Material_Code");
         	String description=rs.getString("Material_Description");
         	
         	SCRBasic sbo =new SCRBasic(materialcode, description);
         	listdesc.add(sbo);
			
			}  

			rs.close();
	        rs=null;
	        ps.close();
	        ps=null;
	        con.close();
	        con=null;
	}catch(Exception e){e.printStackTrace();}  
	finally{
		ETLConnection.shutdown(rs, ps, con);
	}
	return listdesc;
	}  
	
	




 //only for User view  created current user records
public List<SCRBasic> UserList(String username,String mattype,Integer mcode) throws SQLException, ClassNotFoundException, InterruptedException

{
	
      Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
   List<SCRBasic> userlist = new ArrayList<>();
    try
    {    
    	String sql =null;
   	 	con=ETLConnection.getConnection();
   	 	con.setAutoCommit(false);
   	 String statu="Active";
   	 String none="None";
  
   	 
   	 	if(mattype.equals("None"))
   	 	{
   	 		
   	 	 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"<> ?)  or (\"Status\"=? and \"Material_Type_Code\"<>?)) and \"MDM_Code\"=?  ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
   	  pst = con.prepareStatement(sql);
   	  pst.setString(1,username);
   	  pst.setString(2,none);
   	  pst.setString(3,statu);
   	  pst.setString(4,none);
   	  pst.setInt(5,mcode);
   	  
   	
   
   	 	}
   	 	else
   	 	{
   	 	 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"=?)  or (\"Status\"='Active' and \"Material_Type_Code\"=? )) and \"MDM_Code\"=? ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
         pst =con.prepareStatement(sql); 
         pst.setString(1,username);
         pst.setString(2,mattype);
     
         pst.setString(3,mattype);
      
         pst.setInt(4,mcode);
   	 	}
   
        rs = pst.executeQuery(); 
     
        while (rs.next()) {
           Integer talendcode=rs.getInt("MDM_Code");
       	   String materialtypedesc=rs.getString("Material_Type_Description");
           String materialcode=rs.getString("Material_Code");
       	   String description=rs.getString("Material_Description");
           String basicuom=rs.getString("Basic_UOM_Description");
       	   Integer version=rs.getInt("version");
           String status=rs.getString("Status");
       	   String approvalstatus=rs.getString("Approval_Status");
       	   SCRBasic sb =new SCRBasic(talendcode, materialtypedesc, materialcode, description, basicuom, version,status,approvalstatus);       	
       	  userlist.add(sb);
       	  
       }
        con.commit();
        rs.close();
        rs=null;
     
        pst.close();
        pst=null;
        con.close();
        con=null;
   } 
   catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   } 
    finally{    	
   	ETLConnection.shutdown(rs, pst, con);        
        }//finally close
    return userlist;

}
public List<SCRBasic> UserList3(String username,Boolean blk,String mattyp) throws SQLException, ClassNotFoundException, InterruptedException

{
	
      Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
   List<SCRBasic> userlist = new ArrayList<>();
    try
    {    
    	String sql =null;
   	 	con=ETLConnection.getConnection();
   	 	con.setAutoCommit(false);
	   	 String statu="Active";
	   	 String none="None";	
 		if(blk==true)
 		{
 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  \"Created_By\"=? and \"Block\"=? ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
         pst =con.prepareStatement(sql); 
         pst.setString(1,username);
//         pst.setString(2,mattype);
//         pst.setString(3,mattype);
         pst.setBoolean(2,blk);
 		}
 		else
 		{
 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where \"Created_By\"=? and (\"Block\"=? or \"Block\" isnull) ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
         pst =con.prepareStatement(sql); 
         pst.setString(1,username);
//         pst.setString(2,mattype);
//         pst.setString(3,mattype);
         pst.setBoolean(2,blk);
 			
 		}
   	 		
        rs = pst.executeQuery(); 
        while (rs.next()) {
           Integer talendcode=rs.getInt("MDM_Code");
       	   String materialtypedesc=rs.getString("Material_Type_Description");
           String materialcode=rs.getString("Material_Code");
       	   String description=rs.getString("Material_Description");
           String basicuom=rs.getString("Basic_UOM_Description");
       	   Integer version=rs.getInt("version");
           String status=rs.getString("Status");
       	   String approvalstatus=rs.getString("Approval_Status");
       	   SCRBasic sb =new SCRBasic(talendcode, materialtypedesc, materialcode, description, basicuom, version,status,approvalstatus);       	
       	  userlist.add(sb);
       	  
       }
        con.commit();
        rs.close();
        rs=null;
     
        pst.close();
        pst=null;
        con.close();
        con=null;
   } 
   catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   } 
    finally{    	
   	ETLConnection.shutdown(rs, pst, con);        
        }//finally close
    return userlist;

}

public List<SCRBasic> UserList2(String username,String mattype,Boolean blk,String mattyp) throws SQLException, ClassNotFoundException, InterruptedException

{
	
      Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
   List<SCRBasic> userlist = new ArrayList<>();
    try
    {    
    	String sql =null;
   	 	con=ETLConnection.getConnection();
   	 	con.setAutoCommit(false);
   	 String statu="Active";
   	 String none="None";
  
   	 
   	 	if(mattype.equals("None"))
   	 	{
   	 		
   	 		if(blk==true)
   	 		{
   	 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"<> ?)  or (\"Status\"=? and \"Material_Type_Code\"<>?)) and \"Block\"=? and \"Material_Type_Code\"=?  ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
   	   	  pst = con.prepareStatement(sql);
   	   	  pst.setString(1,username);
   	   	  pst.setString(2,none);
   	   	  pst.setString(3,statu);
   	   	  pst.setString(4,none);
   	   	  pst.setBoolean(5,blk);
   	   	  pst.setString(6,mattyp);
   	   	  System.out.println(sql);
   	   	  System.out.println(username);
   	   	  System.out.println(statu);
   	   	  System.out.println(blk);
   	   	  System.out.println(mattyp);
   	 		}
   	 		else
   	 		{
   	 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"<> ?)  or (\"Status\"=? and \"Material_Type_Code\"<>?)) and (\"Block\"=? or \"Block\" isnull) and \"Material_Type_Code\"=?  ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
   	   	  pst = con.prepareStatement(sql);
   	   	  pst.setString(1,username);
   	   	  pst.setString(2,none);
   	   	  pst.setString(3,statu);
   	   	  pst.setString(4,none);
   	   	  pst.setBoolean(5,blk);
   	   	  pst.setString(6,mattyp);
   	   	  System.out.println(sql);
	   	  System.out.println(username);
	   	  System.out.println(statu);
	   	  System.out.println(blk);
	   	  System.out.println(mattyp);
   	 			
   	 		}
   	 		
   	 	

   	
   
   	 	}
   	 	else
   	 	{
   	 		
   	 		if(blk==true)
   	 		{
   	 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"=?)  or (\"Status\"='Active' and \"Material_Type_Code\"=? )) and \"Block\"=? ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
   	         pst =con.prepareStatement(sql); 
   	         pst.setString(1,username);
   	         pst.setString(2,mattype);
   	         pst.setString(3,mattype);
   	         pst.setBoolean(4,blk);
   	 		}
   	 		else
   	 		{
   	 		 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" where  ((\"Created_By\"=? and \"Material_Type_Code\"=?)  or (\"Status\"='Active' and \"Material_Type_Code\"=? )) and (\"Block\"=? or \"Block\" isnull) ";//(\"Approval_Status\" is null)or(\"Approval_Status\"='Approval'and \"Status\"='Active') ";   
   	         pst =con.prepareStatement(sql); 
   	         pst.setString(1,username);
   	         pst.setString(2,mattype);
   	         pst.setString(3,mattype);
   	         pst.setBoolean(4,blk);
   	 			
   	 		}
   	 		
   	 	
   	 	}
   
        rs = pst.executeQuery(); 
     
        while (rs.next()) {
           Integer talendcode=rs.getInt("MDM_Code");
       	   String materialtypedesc=rs.getString("Material_Type_Description");
           String materialcode=rs.getString("Material_Code");
       	   String description=rs.getString("Material_Description");
           String basicuom=rs.getString("Basic_UOM_Description");
       	   Integer version=rs.getInt("version");
           String status=rs.getString("Status");
       	   String approvalstatus=rs.getString("Approval_Status");
       	   SCRBasic sb =new SCRBasic(talendcode, materialtypedesc, materialcode, description, basicuom, version,status,approvalstatus);       	
       	  userlist.add(sb);
       	  
       }
        con.commit();
        rs.close();
        rs=null;
     
        pst.close();
        pst=null;
        con.close();
        con=null;
   } 
   catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   } 
    finally{    	
   	ETLConnection.shutdown(rs, pst, con);        
        }//finally close
    return userlist;

}
	

public List<SCRBasic> UserLists(String username,String mattype,String materialtype,String Status,String astatus,Integer vers) throws SQLException, ClassNotFoundException, InterruptedException

{
	
      Connection con=null;
      PreparedStatement pst=null;
      ResultSet rs=null;
   List<SCRBasic> userlist = new ArrayList<>();
    try
    {    
    	String sql =null;
   	 	con=ETLConnection.getConnection();
   	 	con.setAutoCommit(false);
   	
   	 String none="None";
 
  
   	 
   	 	if(mattype.equals("None"))
   	 	{
   	 		
   	 	 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" "
   	+" where (( \"Created_By\"=? and \"Material_Type_Code\"<> ?)  or (\"Status\"='Active' and \"Material_Type_Code\"<> ?))  and \"Material_Type_Code\"=? and (\"Status\"= ? or 'Select'=?)and (\"Approval_Status\" = ? or 'Select'=? )and (\"version\" = ? or -1=?)";
   	 	
   	 	pst = con.prepareStatement(sql);
   	  pst.setString(1,username);
   	  pst.setString(2,none);
   	 pst.setString(3,none);
   	 
   	pst.setString(4,materialtype);
   	  pst.setString(5,Status);
   	 pst.setString(6,Status);
   	  pst.setString(7,astatus);
   	 pst.setString(8,astatus);
   	 
    pst.setInt(9,vers);
    pst.setInt(10,vers);
   	 	}
   	 	else
   	 	{
   	 	 sql = "select \"MDM_Code\",\"Material_Type_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Description\",\"version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Basic\" "
   	 		   	+" where (( \"Created_By\"=? and \"Material_Type_Code\"= ?)  or (\"Status\"='Active' and \"Material_Type_Code\" =?))  and \"Material_Type_Code\"=? and (\"Status\"= ? or 'Select'=?)and (\"Approval_Status\" = ? or 'Select'=? )and (\"version\" = ? or -1=?)";
   	 		   	 	
   	 		   	 	pst = con.prepareStatement(sql);
   	 		   	  pst.setString(1,username);
   	 		   	  pst.setString(2,mattype);
   	 		   	 pst.setString(3,mattype);
   	 		   	pst.setString(4,materialtype);
   	 		   	  pst.setString(5,Status);
   	 		   	 pst.setString(6,Status);
   	 		   	  pst.setString(7,astatus);
   	 		   	 pst.setString(8,astatus);
   	 		   	 
   	 		    pst.setInt(9,vers);
   	 		    pst.setInt(10,vers);
         
         
   	 	}
   	
        rs = pst.executeQuery(); 
     
        while (rs.next()) {
           Integer talendcode=rs.getInt("MDM_Code");
       	   String materialtypedesc=rs.getString("Material_Type_Description");
           String materialcode=rs.getString("Material_Code");
       	   String description=rs.getString("Material_Description");
           String basicuom=rs.getString("Basic_UOM_Description");
       	   Integer version=rs.getInt("version");
           String status=rs.getString("Status");
       	   String approvalstatus=rs.getString("Approval_Status");
       	   SCRBasic sb =new SCRBasic(talendcode, materialtypedesc, materialcode, description, basicuom, version,status,approvalstatus);       	
       	  userlist.add(sb);
       	  
       }
        con.commit();
        rs.close();
        rs=null;
     
        pst.close();
        pst=null;
        con.close();
        con=null;
   } 
   catch (SQLException ex) {
       ex.printStackTrace();
       throw ex;
   } 
    finally{    	
   	ETLConnection.shutdown(rs, pst, con);        
        }//finally close
    return userlist;

}


public static SCRBasic getSCRBasicByTalendcode(Integer id){  
	
		   Connection con=null;
	       PreparedStatement pst=null;
	       ResultSet rs=null;
	       SCRBasic sb=new  SCRBasic();          
        try{  
            con=ETLConnection.getConnection(); 
            pst=con.prepareStatement("select * from \"STG_SCR_Basic\" where \"MDM_Code\"=?");  
            pst.setInt(1,id);  
            rs=pst.executeQuery();  
            if(rs.next()){  
            	sb.setTalendcode(rs.getInt("MDM_Code"));
            	sb.setMaterialtype(rs.getString("Material_Type_Code"));
            	sb.setMaterialtypedesc(rs.getString("Material_Type_Description"));
            	sb.setMaterialgroup(rs.getString("Material_Group_Code"));
            	sb.setMaterialgroupdesc(rs.getString("Material_Group_Description"));
            	sb.setMaterialcode(rs.getString("Material_Code"));
            	sb.setDescription(rs.getString("Material_Description"));
            	sb.setBasicuom(rs.getString("Basic_UOM_Code"));
                sb.setBasicuomdesc(rs.getString("Basic_UOM_Description"));
                sb.setAltuom(rs.getString("Alternative_UOM_Code"));
                sb.setAltuomdesc(rs.getString("Alternative_UOM_Description")); 
                sb.setNumerator(rs.getFloat("Numerator"));                
                sb.setDenominator(rs.getFloat("Denominator")); 
                sb.setGross(rs.getFloat("Gross_Weight"));
                //newly added fields
                sb.setVolume(rs.getString("Volume"));
                //sb.setVolumeUnit(rs.getString("Volume Unit"));
                sb.setvolumeunitcode(rs.getString("Volume Unit"));
                sb.setvolumeunitdesc(rs.getString("Volume_Unit_Desc"));
                
                sb.setNet(rs.getFloat("Net_Weight"));
                sb.setHsncode(rs.getString("HSN_Code"));                
                sb.setUnitweight(rs.getString("Unit_Weight_Code"));
                sb.setUnitweightdesc(rs.getString("Unit_Weight_Description"));
                sb.setReason(rs.getString("Reason"));
                sb.setReasonforedit(rs.getString("Reason_For_Edit"));
                sb.setBlock(rs.getBoolean("Block")); 
                sb.setStatus(rs.getString("Status"));  
                sb.setApprovalstatus(rs.getString("Approval_Status"));
                sb.setVersion(rs.getInt("version"));
                
            } 
            rs.close();
            rs=null;
            pst.close();
            pst=null;
            con.close();
            con=null;
        }catch(Exception ex){ex.printStackTrace();}            
        
        finally{
       	 ETLConnection.shutdown(rs, pst, con);            
            }//finally close
        
        return sb;  
    }  
	
public static int update(SCRBasic e){  
	        int status=0;  
	           Connection con=null;
		       PreparedStatement ps=null;	        
	        try{  
	        	con=ETLConnection.getConnection();
	            // ps=con.prepareStatement("Update \"STG_SCR_Basic\" set \"Gross_Weight\"=?,\"Net_Weight\"=?,\"Unit_Weight_Code\"=?,\"Unit_Weight_Description\"=?,\"Block\"=?,\"Reason\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Reason_For_Edit\"=?,\"Approval_Status\"=? where \"MDM_Code\"=?");
	           	
	            ps=con.prepareStatement("Update \"STG_SCR_Basic\" set \"MDM_Code\"=?,\"Material_Type_Code\"=?,\"Material_Type_Description\"=?,\"Material_Group_Code\"=?,\"Material_Group_Description\"=?,\"Material_Code\"=?,\"Material_Description\"=?,\"Basic_UOM_Code\"=?,\"Basic_UOM_Description\"=?,\"Alternative_UOM_Code\"=?,\"Alternative_UOM_Description\"=?,\"Numerator\"=?,\"Denominator\"=?,\"Net_Weight\"=?,\"Gross_Weight\"=?,\"HSN_Code\"=?,\"Unit_Weight_Code\"=?,\"Unit_Weight_Description\"=?,\"Block\"=?,\"Reason\"=?,\"Status\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"Reason_For_Edit\"=?,\"Approval_Status\"=?,\"Volume\"=?,\"Volume Unit\"=?,\"Volume_Unit_Desc\"=? where \"MDM_Code\"=?");
	            ps.setInt(1,e.getTalendcode()); 
	            ps.setString(2,e.getMaterialtype()); 
	            ps.setString(3,e.getMaterialtypedesc()); 	            
	            ps.setString(4,e.getMaterialgroup());  
	            ps.setString(5,e.getMaterialgroupdesc()); 
	            ps.setString(6,e.getMaterialcode());  
                ps.setString(7,e.getDescription());  
	            ps.setString(8,e.getBasicuom());  
	            ps.setString(9,e.getBasicuomdesc());  
	            ps.setString(10,e.getAltuom()); 
	            ps.setString(11,e.getAltuomdesc());
	      

	   
	          
	            
	            if(e.getNumerator()!=null)
	            {
		            ps.setFloat(12,e.getNumerator());  
	            }
	            else
	            {
	            ps.setNull(12,Types.FLOAT);
	            }
	            
	            
	            if(e.getDenominator()!=null)
	            {
		            ps.setFloat(13,e.getDenominator());	            
	            }
	            else
	            {
	            ps.setNull(13,Types.FLOAT);
	            }
	            
	            if(e.getNet()!=null)
	            {
		            ps.setFloat(14,e.getNet());  
	            }
	            else
	            {
	            ps.setNull(14,Types.FLOAT);
	            }
	            
	            
	            if(e.getGross()!=null)
	            {
	               ps.setFloat(15,e.getGross()); 
	            }
	            else
	            {
	            ps.setNull(15,Types.FLOAT);
	            }
	            if(e.getHsncode().isEmpty())
	            {
		            ps.setString(16,null);

	            }
	            
	            else
	            {
		            ps.setString(16,e.getHsncode());

	            }
	            
	            if(e.getUnitweight().isEmpty())
	            {
		            ps.setString(17,null);

	            }
	            else
	            {
		            ps.setString(17,e.getUnitweight());

	            }
	            
	            if(e.getUnitweightdesc().isEmpty())
	            {
		            ps.setString(18,null);	 

	            	
	            }
	            else
	            {
		            ps.setString(18,e.getUnitweightdesc());	 

	            }
	           
	            ps.setBoolean(19,e.getBlock()); 
	            
	            /*if(e.getReason().isEmpty())
	            {
		            ps.setString(20,null); 

	            }
	            else
	            {
		           
	            }*/
            	ps.setString(20,e.getReason()); 

	            ps.setString(21,e.getStatus());	           
	            
	           
	            ps.setString(22,e.getModifiedby());
                ps.setObject(23,new Timestamp(System.currentTimeMillis()));	      
             
                if(e.getReasonforedit().isEmpty())
	            {
		            ps.setString(24,null); 

	            }
	            else
	            {
	                ps.setString(24, e.getReasonforedit());
	            }
                
                
                ps.setString(25,"Pending");
                if(e.getVolume().isEmpty())
	            {
		            ps.setString(26,null);
	            }
                else
                {
                	ps.setString(26,e.getVolume());
                }
	            if(e.getvolumeunitcode().isEmpty())
	            {
	            	ps.setString(27,null);
	            }
	            else
	            {
	            	ps.setString(27,e.getvolumeunitcode());
	            }
	            if(e.getvolumeunitdesc().isEmpty())
	            {
	            	ps.setString(28,null);
	            }
	            else
	            {
	            	ps.setString(28,e.getvolumeunitdesc());
	            }
	            ps.setInt(29,e.getTalendcode()); 
	            status=ps.executeUpdate();	           
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        }catch(Exception ex){ex.printStackTrace();}  
	        finally{
	          	 ETLConnection.shutdown(ps, con);
	               }//finally close
	        return status;  
	    }  
 //Save Scr Basic View
public static int insert(SCRBasic e){  
	        int status=0;  
	        Connection con=null;
		    PreparedStatement ps=null;
	        try
	        {  
	        	con=ETLConnection.getConnection();
	            ps=con.prepareStatement("insert into  \"STG_SCR_Basic\" (\"MDM_Code\",\"Material_Type_Code\",\"Material_Type_Description\",\"Material_Group_Code\",\"Material_Group_Description\",\"Material_Code\",\"Material_Description\",\"Basic_UOM_Code\",\"Basic_UOM_Description\",\"Alternative_UOM_Code\",\"Alternative_UOM_Description\",\"Numerator\",\"Denominator\",\"Net_Weight\",\"Gross_Weight\",\"HSN_Code\",\"Unit_Weight_Code\",\"Unit_Weight_Description\",\"Status\",\"Created_By\",\"Created_Date\",\"Approval_Status\",\"Volume\",\"Volume Unit\",\"Volume_Unit_Desc\") values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"); 
	            ps.setInt(1,e.getTalendcode()); 	            
	            ps.setString(2,e.getMaterialtype()); 
	            ps.setString(3,e.getMaterialtypedesc()); 	            
	            ps.setString(4,e.getMaterialgroup());  
	            ps.setString(5,e.getMaterialgroupdesc()); 
	            ps.setString(6,e.getMaterialcode());  
                ps.setString(7,e.getDescription());  
	            ps.setString(8,e.getBasicuom());  
	            ps.setString(9,e.getBasicuomdesc());  
	            ps.setString(10,e.getAltuom()); 
	            ps.setString(11,e.getAltuomdesc());
	            
	            if(e.getNumerator()!=null)
	            {
		            ps.setFloat(12,e.getNumerator());  
	            }
	            else
	            {
	            ps.setNull(12,Types.FLOAT);
	            }
	            
	            
	            if(e.getDenominator()!=null)
	            {
		            ps.setFloat(13,e.getDenominator());	            
	            }
	            else
	            {
	            ps.setNull(13,Types.FLOAT);
	            }
	            
	            if(e.getNet()!=null)
	            {
		            ps.setFloat(14,e.getNet());  
	            }
	            else
	            {
	            ps.setNull(14,Types.FLOAT);
	            }
	            
	            
	            if(e.getGross()!=null)
	            {
	               ps.setFloat(15,e.getGross()); 
	            }
	            else
	            {
	            ps.setNull(15,Types.FLOAT);
	            }
	            
	            if(e.getHsncode().isEmpty())
	            {
		            ps.setString(16,null);

	            }
	            
	            else
	            {
		            ps.setString(16,e.getHsncode());

	            }
	            
	            if(e.getUnitweight().isEmpty())
	            {
		            ps.setString(17,null);

	            }
	            else
	            {
		            ps.setString(17,e.getUnitweight());

	            }
	            
	            if(e.getUnitweightdesc().isEmpty())
	            {
		            ps.setString(18,null);	 

	            	
	            }
	            else
	            {
		            ps.setString(18,e.getUnitweightdesc());	 

	            }           
	            ps.setString(19,e.getStatus());	            
	            ps.setString(20,e.getCreatedby());
                ps.setObject(21,new Timestamp(System.currentTimeMillis()));	
	            ps.setString(22,"Pending");
	            ps.setString(23, e.getVolume());
	            //ps.setString(24, e.getVolumeUnit());
	            ps.setString(24,e.getvolumeunitcode());
	            ps.setString(25,e.getvolumeunitdesc());
	            status=ps.executeUpdate();  
	            
	            ps.close();
	            ps=null;
	            con.close();
	            con=null;
	        }
	        catch(Exception ex){ex.printStackTrace();}  
	        finally{	          	 
	          	ETLConnection.shutdown(ps, con);	               
	               }//finally close
	        return status;  
	    }  




public static int insertaudit(SCRBasic e){  
    int status=0;  
    Connection con=null;
    PreparedStatement ps=null;
    try
    {  
    	con=ETLConnection.getConnection();
        ps=con.prepareStatement("INSERT INTO \"Audit\".\"STG_SCR_Basic_Audit\"(\"Action\", \"Action_By\", \"Action_Time\", \"MDM_Code\")VALUES (?, ?, ?, ?);"); 
        ps.setString(1,e.getStatus()); 	            
        ps.setString(2,e.getCreatedby()); 
        ps.setObject(3,new Timestamp(System.currentTimeMillis()));     
        ps.setInt(4,e.getTalendcode());
        
        status=ps.executeUpdate();  
        ps.close();
        ps=null;
        con.close();
        con=null;
    }
    catch(Exception ex){ex.printStackTrace();}  
    finally{	          	 
      	ETLConnection.shutdown(ps, con);	               
           }//finally close
    return status;  
}  
public List<Report> reportList(Integer minmdm,Integer maxmdm,String minplant,String maxplant,String materialtype,String materialgroup,String purchgroup,String valuationclass,String createdby1,String mincreated,String maxcreated,String modifiedby1,String minmodified,String maxmodified,String approvedby1,String minapproved,String maxapproved) throws SQLException, ClassNotFoundException

{
     
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
    List<Report> listdesc = new ArrayList<>();

	try{  
		
		 con=ETLConnection.getConnection();    
		 
		 
		 String query="SELECT b.\"MDM_Code\" as MDM_Code, b.\"Material_Type_Description\" as Material_Type_Description,p.plant as plant,p.storages as storages,\n" +  

  "b.\"Material_Group_Description\" as Material_Group_Description,b.\"Material_Code\" as Material_Code,b.\"Material_Description\" as Material_Description,b.\"Basic_UOM_Description\" as Basic_UOM_Description,b.\"Alternative_UOM_Description\" as Alternative_UOM_Description,b.\"Numerator\" as Numerator,\n" +  
  "b.\"Denominator\" as Denominator,b.\"Net_Weight\" as Net_Weight, b.\"Gross_Weight\" as Gross_Weight,b.\"HSN_Code\" as HSN_Code,b.\"Unit_Weight_Description\" as Unit_Weight_Description, b.\"Volume\" as Volume,\n" +  
 " b.\"Volume Unit\" as VolumeUnit,b.\"Block\" as Block,b.\"Reason\" as Reason,b.\"Status\" as Status,b.\"Created_By\" as Created_By,b.\"Created_Date\" as Created_Date,b.\"Modified_By\" as Modified_By,b.\"Modified_Date\" as Modified_Date,\n" +  
  "b.\"Approved_By\" as Approved_By,b.\"Approved_Date\" as Approved_Date,b.version as version,b.\"Reason_For_Edit\" as Reason_For_Edit,b.\"Approval_Status\" as Approval_Status, b.\"Reject_Reason\" as Reject_Reason,\n" +  
  
 "ph.\"Purchasing_Group_Description\" as Purchasing_Group_Description,ph.\"GR_Processing_Time\" as GR_Processing_Time,ph.\"Purchasing_Value_Key\" as Purchasing_Value_Key,ph.\"Order_Unit_Description\" as Order_Unit_Description,ph.\"PO_Text\" as PO_Text,\n" +  
 "ph.\"Model_Description\" as Model_Description,ph.\"Min_Rem_Shelf_Life\" as Min_Rem_Shelf_Life,ph.\"Total_shelf_life\" as Total_shelf_life,ph.\"Profit_Centre_Description\" as Profit_Centre_Description,ph.\"Storage_Bin\" as Storage_Bin,\n" +  
 "ph.\"Unit_of_issue_Description\" as Unit_of_issue_Description,ph.\"Serial_Number_Profile_Description\" as Serial_Number_Profile_Description,\n" +  
 
  "a.\"Overhead_Group_Description\" as Overhead_Group_Description,a.\"Costing_Lot_Size\" as Costing_Lot_Size,a.\"Material_Is_Costed_with_Qty_Str\" as Material_Is_Costed_with_Qty_Str,\n" +  
  "a.\"Material_Related_Origin\" as Material_Related_Origin,a.\"Variance_Description\" as Variance_Description,a.\"Origin_Group_Description\" as  Origin_Group_Description,\n" +  
  "a.\"Valuation_Class_Description\",a.\"Valuation_Cat_Description\",a.\"Price_Control_Description\",a.\"Price_Determination_Code\",\n" +  
  "a.\"HSN_Code\" as HSN_Code,a.\"Valuation_Category_Values\" as Valuation_Category_Values,a.\"Do_Not_Cost\" as Do_Not_Cost,\"Special_Procurement_Cost_Description\" as Special_Procurement_Cost_Description,\n" +  
  
  
  "m.\"MRP_Group_Description\" as MRP_Group_Description,m.\"ABC_Indicator_Description\" as ABC_Indicator_Description,m.\"MRP_Type_Description\" as MRP_Type_Description,m.\"Reorder_Point\" as Reorder_Point,\n" +  
  "m.\"MRP_Controller_Description\" as MRP_Controller_Description,m.\"Lot_Sizing__Procedure_Description\" as Lot_Sizing__Procedure_Description,m.\"Minimum_Lot_Size\" as Minimum_Lot_Size,\n" +  
  "m.\"Maximum_stock_level\" as Maximum_stock_level,m.\"Assembly_scrap\" as Assembly_scrap,m.\"Procurement_Type_Description\" as Procurement_Type_Description,m.\"Special_Procurement_Description\" as Special_Procurement_Description,\n" +  
  "m.\"Production_Storage_Location_Description\" as Production_Storage_Location_Description,m.\"Back_Flush_Description\" as Back_Flush_Description,\n" +  
  "m.\"In_house_production\" as In_house_production,m.\"SchedMargin_key\" as SchedMargin_key,m.\"Planned_Deliv__Time\" as Planned_Deliv__Time,\n" +  
  "m.\"Safety_stock\" as Safety_stock,m.\"Min_safety_stock\" as Min_safety_stock,m.\"Strategy_group_Description\" as Strategy_group_Description,m.\"Bwd_consumption_Per\" as Bwd_consumption_Per,m.\"Consumption_Mode_Description\" as Consumption_Mode_Description,\n" +  
  "m.\"Mixed_MRP_Description\",m.\"Fwd_Consumption_Per\",m.\"Tot__repl__lead_time\",m.\"Availability_Check_Description\",\n" +  
  "m.\"Individual_coll_Description\" as Individual_coll_Description,m.\"Component_Scrap\" as Component_Scrap,m.\"REM_Profile_Description\" as REM_Profile_Description,m.\"Repetitive_Mfg\" as Repetitive_Mfg,m.\"Co_Product\" as Co_Product,\n" +  

  "s.\"Sales_organisation_Description\" as Sales_organisation_Description,s.\"Dist_Channel_Description\" as Dist_Channel_Description,s.\"Matl_statistics_grp_Description\" as Matl_statistics_grp_Description,\n" +  
  "s.\"Material_Price_Grp_Description\" as Material_Price_Grp_Description,s.\"Acct_assignment_grp_Description\" as Acct_assignment_grp_Description,s.\"Gen_item_cat__grp_Description\" as Gen_item_cat__grp_Description,\n" +  
  "s.\"Item_category_group_Description\" as Item_category_group_Description,s.\"Transportation_Group_Description\" as Transportation_Group_Description,s.\"Loading_Group_Description\" as Loading_Group_Description,\n" +  
  "s.\"Delivering_Plant_Description\" as Delivering_Plant_Description,s.\"Segment_Description\" as Segment_Description,s.\"Aspect_Ratio_Description\" as Aspect_Ratio_Description,\n" +  
  "s.\"Application_Description\" as Application_Description,s.\"Polymer_Description\" as Polymer_Description,s.\"CC_Description\" as CC_Description FROM \n" +
 
"public.\"STG_SCR_Basic\" b  inner join public.\"STG_DTL_Plant_Mapping\" p on b.\"MDM_Code\"=p.talendcode left join \n" +  
"public.\"STG_SCR_Plant_Storage_Purchase\" ph on b.\"MDM_Code\"=ph.\"MDM_Code\" and p.plant=ph.\"Plant_Code\" left join \n" +  
"public.\"STG_SCR_Costing_Accounting\" a on b.\"MDM_Code\"=a.\"MDM_Code\"  and p.plant=a.\"Plant_Code\" left join \n" +  
"public.\"STG_SCR_MRP\" m on b.\"MDM_Code\"=m.\"MDM_Code\"  and p.plant=m.\"Plant_Code\" left join \n" +  
"public.\"STG_SCR_Sales\" s on b.\"MDM_Code\"=s.\"MDM_Code\" and p.plant=s.\"Plant_Code\" \n" +  

"where b.\"MDM_Code\" between ? and ? and p.plant between ? and ? \n" +  
"and  (b.\"Material_Type_Description\" =? or 'Select'=?) \n" +  
"and  (b.\"Material_Group_Description\" =? or 'Select'=?) \n" +  
"and  (ph.\"Purchasing_Group_Description\" =? or 'Select'=?) \n" +  
"and  (a.\"Valuation_Class_Description\" =? or 'Select'=?) \n" +  
"and  (b.\"Created_By\" =? or 'Select'=?) \n" +  
"and  (b.\"Modified_By\" =? or 'Select'=?) \n" +  
"and  (b.\"Approved_By\" =? or 'Select'=?) \n" + 

"and (DATE(COALESCE(b.\"Created_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(b.\"Created_Date\",'9999-01-01')) <= ?) \n" +  
"and (DATE(COALESCE(b.\"Modified_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(b.\"Modified_Date\",'9999-01-01')) <= ?) \n" +  
"and (DATE(COALESCE(b.\"Approved_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(b.\"Approved_Date\",'9999-01-01')) <= ?) ";
		 
		
		 
		 
		 
	    // String query="SELECT s.\"MDM_Code\" as MDM_Code, s.\"Material_Type_Description\" as Material_Description,s.\"Material_Group_Description\" as Material_Group,s.\"Material_Code\" as Material_Code,s.\"Material_Description\" as Description,s.\"Basic_UOM_Description\" as UOM,s.\"Alternative_UOM_Description\" as ALT_UOM,s.\"Numerator\" as Numerator ,s.\"Denominator\" as Denominator,s.\"Net_Weight\" as Net_Weight, s.\"Gross_Weight\" as Gross_Weight,s.\"HSN_Code\" as HSN_Code,s.\"Unit_Weight_Description\" as Unit_Weight, s.\"Volume\" as Volume,s.\"Volume Unit\" as VolumeUnit,s.\"Block\" as Block,s.\"Reason\" as Reason,s.\"Status\" as Status,s.\"Created_By\" as Created_By,s.\"Created_Date\" as Created_Date,s.\"Modified_By\" as Modified_By,s.\"Modified_Date\" as Modified_Date, s.\"Approved_By\" as Approved_By,s.\"Approved_Date\"as Approved_Date,s.version as version,s.\"Reason_For_Edit\" as Reason_For_Edit,s.\"Approval_Status\" as Approval_Status, s.\"Reject_Reason\" as Reject_Reason,p.plant as plant ,p.storages as storage,pg.\"Purchasing_Group_Description\" as purchasinggroup ,a.\"Valuation_Class_Description\" as valuationclass  FROM public.\"STG_SCR_Basic\" s  inner join public.\"STG_DTL_Plant_Mapping\" p on s.\"MDM_Code\"=p.talendcode  left join public.\"STG_SCR_Plant_Storage_Purchase\" pg on s.\"MDM_Code\"=pg.\"MDM_Code\" left join public.\"STG_SCR_Costing_Accounting\" a on a.\"MDM_Code\"=pg.\"MDM_Code\" ";
	     ps=con.prepareStatement(query);  
		ps.setInt(1, minmdm);
		ps.setInt(2, maxmdm);
		ps.setString(3,minplant);
		ps.setString(4,maxplant);
		ps.setString(5,materialtype);
		ps.setString(6,materialtype);
		ps.setString(7,materialgroup);
		ps.setString(8,materialgroup);
		ps.setString(9,purchgroup);
		ps.setString(10,purchgroup);
		ps.setString(11,valuationclass);
		ps.setString(12,valuationclass);
		
		ps.setString(13,createdby1);
		ps.setString(14,createdby1);
		
		ps.setString(15,modifiedby1);
		ps.setString(16,modifiedby1);
		
		ps.setString(17,approvedby1);
		ps.setString(18,approvedby1);
		
		Date	d1 = java.sql.Date.valueOf (mincreated);
		Date	d2 = java.sql.Date.valueOf (maxcreated);
		ps.setDate(19, d1);
		ps.setDate(20, d2);
		
		

		
		
		Date	d3 = java.sql.Date.valueOf (minmodified);
		Date	d4 = java.sql.Date.valueOf (maxmodified);
		ps.setDate(21, d3);
		ps.setDate(22, d4);
		
		
		
		Date	d5 = java.sql.Date.valueOf (minapproved);
		Date	d6 = java.sql.Date.valueOf (maxapproved);
		ps.setDate(23, d5);
		ps.setDate(24, d6);
		 rs=ps.executeQuery(); 

		while(rs.next()){  
			
			 Integer talendcode=rs.getInt("MDM_Code");
			 String materialtypedesc=rs.getString("Material_Type_Description");
			 String materialgroupdesc=rs.getString("Material_Group_Description");
			 String materialcode=rs.getString("Material_Code");
			 String description=rs.getString("Material_Description");
			 String basicuomdesc=rs.getString("Basic_UOM_Description");
			 String altuomdesc=rs.getString("Alternative_UOM_Description");
			 Float numerator=rs.getFloat("Numerator");
			 Float denominator=rs.getFloat("Denominator");
			 Float net=rs.getFloat("Net_Weight");
			 Float gross=rs.getFloat("Gross_Weight");
			 String hsncode=rs.getString("HSN_Code");
			 String unitweightdesc=rs.getString("Unit_Weight_Description");
			 String volume=rs.getString("Volume");
			 String volumeunit=rs.getString("VolumeUnit");
			 Boolean block=rs.getBoolean("Block");
			 String reasonforblock=rs.getString("Reason");
			 String status=rs.getString("Status");
			 String createdby=rs.getString("Created_By");
			 String createddate=rs.getString("Created_Date");
			 if(createddate !=null && !createddate.isEmpty())
				{
				 createddate=createddate.substring(0,10);
				}
			 String modifiedby=rs.getString("Modified_By");
			 String modifieddate=rs.getString("Modified_Date");
			 
			 if(modifieddate !=null && !modifieddate.isEmpty())
				{
				 modifieddate=modifieddate.substring(0,10);
				}
			 String approvedby=rs.getString("Approved_By");
			 String approveddate=rs.getString("Approved_Date");
			 if(approveddate !=null && !approveddate.isEmpty())
				{
				 approveddate=approveddate.substring(0,10);
				}
			 Integer version=rs.getInt("version");
			 String reasonforedit=rs.getString("Reason_For_Edit");
			 String approvalstatus=rs.getString("Approval_Status");
			 String reasonforrejection=rs.getString("Reject_Reason");
			 String plant=rs.getString("plant");
			 String storage=rs.getString("storages");
			 
			 
			 
			         String purchasinggroup=rs.getString("Purchasing_Group_Description");
					 Integer grprocessingtime=rs.getInt("GR_Processing_Time");
					 String purchasekeyvalue=rs.getString("Purchasing_Value_Key");
					 String orderunitdesc=rs.getString("Order_Unit_Description");
					 String potext=rs.getString("PO_Text");
					 String modeldesc=rs.getString("Model_Description");
					 Integer minshelf=rs.getInt("Min_Rem_Shelf_Life");
					 Integer totalshelf=rs.getInt("Total_shelf_life");
					 String profitcenterdesc=rs.getString("Profit_Centre_Description");
					 String storagebin=rs.getString("Storage_Bin");
					 String unitofissuedesc=rs.getString("Unit_of_issue_Description");
					 String serialnoprofiledesc=rs.getString("Serial_Number_Profile_Description");
					 
					
					        String mrpgroupcodedesc=rs.getString("MRP_Group_Description");
							 String  abcindicatorcodedesc=rs.getString("ABC_Indicator_Description");
							 String mrptypedesc=rs.getString("MRP_Type_Description");
							 Integer reorderpoint=rs.getInt("Reorder_Point");
							 String mrpcontrollercodedesc=rs.getString("MRP_Controller_Description");
							 String lotsizingdesc=rs.getString("Lot_Sizing__Procedure_Description");
							 String minlotsize=rs.getString("Minimum_Lot_Size");
							 String maximamstocklevel=rs.getString("Maximum_stock_level");
							 Integer assemblyscrap=rs.getInt("Assembly_scrap");
							 String procurementtypecodedesc=rs.getString("Procurement_Type_Description");
							 String specialprocurementcodedesc=rs.getString("Special_Procurement_Description");
							 String productionstoragelocationdesc=rs.getString("Production_Storage_Location_Description");
							  String backflushdesc=rs.getString("Back_Flush_Description");
							  String inhouseproduction=rs.getString("In_house_production");
							  Boolean coproduct=rs.getBoolean("Co_Product");
							  Boolean repetativemfg=rs.getBoolean("Repetitive_Mfg");
							 String schedmarginkey=rs.getString("SchedMargin_key");
							 Integer planneddeliverytime=rs.getInt("Planned_Deliv__Time");
							  String saftystock=rs.getString("Safety_stock");
							  String minsaftystock=rs.getString("Min_safety_stock");
							 String strategygroupdesc=rs.getString("Strategy_group_Description");
							 Integer bwdconsumptionper=rs.getInt("Bwd_consumption_Per");
							  String consumptionmodedesc=rs.getString("Consumption_Mode_Description");
							 String mixedmrpdesc=rs.getString("Mixed_MRP_Description");
							 Integer forwardconsumptionper=rs.getInt("Fwd_Consumption_Per");
							 Integer totalrepleadtime=    rs.getInt("Tot__repl__lead_time");
							 String availabilitycheckdesc=rs.getString("Availability_Check_Description");
							 String individualcalldesc=rs.getString("Individual_coll_Description");
							 Integer componenetscrap=rs.getInt("Component_Scrap");
							 String remprofiledesc= rs.getString("REM_Profile_Description");
					 
					
							         String slorgdesc=  rs.getString("Sales_organisation_Description");  
									 String dtchdesc=   rs.getString("Dist_Channel_Description");	  
									 String mtlstatisticsgrpdesc=rs.getString("Matl_statistics_grp_Description");
									 String mtlpricegrpdesc=rs.getString("Material_Price_Grp_Description");
									 String acassignmentgrpdesc=rs.getString("Acct_assignment_grp_Description");
									 String gencatgrpdesc=rs.getString("Gen_item_cat__grp_Description");
									 String itmcatgrpdesc=rs.getString("Item_category_group_Description");
									 String trngrpdesc=rs.getString("Transportation_Group_Description");
									 String lodgrpdesc=rs.getString("Loading_Group_Description");
									 String delplantdesc=rs.getString("Delivering_Plant_Description");
									 String segmentdescription=rs.getString("Segment_Description");
									 String applicationdescription=rs.getString("Application_Description");
									 String ccdescription=rs.getString("CC_Description");
									 String aspectratiodescription=rs.getString("Aspect_Ratio_Description");
									 String polymerdescription=rs.getString("Polymer_Description");	
			 
									        String overheaddesc=    rs.getString("Overhead_Group_Description");	
											 String costlotsize=rs.getString("Costing_Lot_Size");	
											  Boolean materiaCosted=   rs.getBoolean("Material_Is_Costed_with_Qty_Str"); 
											  Boolean materelated=rs.getBoolean("Material_Related_Origin");
											 String variancepdesc=	rs.getString("Variance_Description");	
											 String origingroupdesc=rs.getString("Origin_Group_Description");	
											 Boolean donotcost=rs.getBoolean("Do_Not_Cost");	
											 String specialprocurementcostdesc=rs.getString("Special_Procurement_Cost_Description");	
											 String valuationclassdesc=rs.getString("Valuation_Class_Description");	
											 String hsnw=rs.getString("HSN_Code");	
											 String pricecontroldesc=rs.getString("Price_Control_Description");	
											 String pricedetermination=rs.getString("Price_Determination_Code");	
											 String valuationcatdesc=rs.getString("Valuation_Category_Values");	
			 
			 
		
			Report r =new Report(talendcode, materialtypedesc, materialgroupdesc, materialcode, description, basicuomdesc, altuomdesc, numerator, denominator, gross, net, version, hsncode, unitweightdesc, block, reasonforblock, status, createdby, createddate, modifiedby, modifieddate, reasonforrejection, approvalstatus, reasonforedit, approvedby, approveddate, volume, volumeunit, plant, storage, purchasinggroup, grprocessingtime, purchasekeyvalue, orderunitdesc, potext, modeldesc, minshelf, totalshelf, profitcenterdesc, storagebin, unitofissuedesc, serialnoprofiledesc, mrpgroupcodedesc, abcindicatorcodedesc, mrptypedesc, reorderpoint, mrpcontrollercodedesc, lotsizingdesc, minlotsize, maximamstocklevel, assemblyscrap, procurementtypecodedesc, specialprocurementcodedesc, productionstoragelocationdesc, backflushdesc, inhouseproduction, coproduct, repetativemfg, schedmarginkey, planneddeliverytime, saftystock, minsaftystock, strategygroupdesc, bwdconsumptionper, consumptionmodedesc, mixedmrpdesc, forwardconsumptionper, totalrepleadtime, availabilitycheckdesc, individualcalldesc, componenetscrap, remprofiledesc, slorgdesc, dtchdesc, mtlstatisticsgrpdesc, mtlpricegrpdesc, acassignmentgrpdesc, gencatgrpdesc, itmcatgrpdesc, trngrpdesc, lodgrpdesc, delplantdesc, segmentdescription, applicationdescription, ccdescription, aspectratiodescription, polymerdescription, overheaddesc, costlotsize, materiaCosted, materelated, variancepdesc, origingroupdesc, donotcost, specialprocurementcostdesc, valuationclassdesc, hsnw, pricecontroldesc, pricedetermination, valuationcatdesc); 
			listdesc.add(r);

			}  

			rs.close();
	        rs=null;
	        ps.close();
	        ps=null;
	        con.close();
	        con=null;
	}catch(Exception e){e.printStackTrace();}  
	finally{
		ETLConnection.shutdown(rs, ps, con);
	}
	return listdesc;
	}  


}
