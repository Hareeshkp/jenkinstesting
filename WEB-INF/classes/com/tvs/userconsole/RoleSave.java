package com.tvs.userconsole;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.dbconnection.AuditConnection;

@WebServlet("/RoleSave")
public class RoleSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
        PrintWriter out =response.getWriter();
		   HttpSession session = request.getSession(false);
		   
		   
		   if(session!=null)
		   {
		    String Userid=(String)session.getAttribute("userid");
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);
		  //username
		    String createdby=uu.getUsername();
		  //rolename  
			String role=request.getParameter("role");  
			//mdmadmin
			  String[] chkSms=request.getParameterValues("mdmadmin");
			     Boolean ismdmadmin =false;
			     if(chkSms !=null && chkSms.length > 0){      
			    	 ismdmadmin=true;  
			     }
			
//material role
		String basicrole=request.getParameter("basic&plantmappingrole");  
//        String plantmappingrole=request.getParameter("plantmappingrole"); 
		String purchasingrole=request.getParameter("purchase&plantstoragerole");  
//        String plantstoragerole=request.getParameter("plantstoragerole");  
        String mrprole=request.getParameter("mrprole");  
        String salesrole=request.getParameter("salesrole");  
        String costingrole=request.getParameter("costing&accountingrole");  
//        String accountingrole=request.getParameter("accountingrole");  
        
        
		
//Customer role
	String customerrole=request.getParameter("custrole");  
 

  //Vendor role
  	String vendorrole=request.getParameter("vendorrole");  
   



    if(CheckDuplicateRoleDAO.check(role))
    {
    	
    	out.println("<script type=\"text/javascript\">");
 	    out.println("alert('Role already exit');");
 	    out.println("</script>");
         RequestDispatcher rd=request.getRequestDispatcher("RoleCreation.jsp");  
         rd.include(request, response);
    }
    
    else
    {
    	
          Vendor_Material_Type vmt =new Vendor_Material_Type();
    	   
    	   String lang[]=request.getParameterValues("multi");
    	   if(lang!=null && lang.length>=1)
    	   {
    	   for(int y=0;y<lang.length;y++){
    	    vmt.setRolename(role);
    	    String mat_code_desc=lang[y];
    	    String split[]=mat_code_desc.split("-");
    	    String mat_code=split[0];
    	   // String mat_desc=split[1];
    	    vmt.setMattypecode(mat_code);
    	    vmt.setMattypedesc(mat_code_desc);
    	    int s=Vendor_Material_Type_DAO.insert_Vendor_Material_Type(vmt);
    	   
    	   }
    	   }

    	   Vendor_VendorGroup vvg =new Vendor_VendorGroup();
    	   String lang1[]=request.getParameterValues("multivendor");
    	   if(lang1!=null && lang1.length>=1)
    	   {
    	   for(int y=0;y<lang1.length;y++){
     	    vvg.setRolename(role);
     	    String ven_code_desc=lang1[y];
   	        String split[]=ven_code_desc.split("-");
   	        String ven_group_code=split[0];
   	        String ven_group_desc=split[1];
   	   
   	    String ven_group_type;
   	    if(ven_group_code.equalsIgnoreCase("TV02") || ven_group_code.equalsIgnoreCase("TV02A") || ven_group_code.equalsIgnoreCase("TV03C") || ven_group_code.equalsIgnoreCase("TV03D") )
   	    	ven_group_type="I";
   	    else
   	    	ven_group_type="D";
   	    vvg.setVendorgroupcode(ven_group_code);
    	vvg.setVendorgroupdesc(ven_code_desc);
    	vvg.setVendorgrouptype(ven_group_type);
    	   
    	    int s=Vendor_VendorGroupDAO.insert_Vendor_Vendor_Group(vvg);
    	   
    	   }
    	   }
    	   
    	   
    	   
    	   
    	   Customer_CustomerGroup ccg =new Customer_CustomerGroup();
    	   String lang2[]=request.getParameterValues("customergroup");
    	   String cust_group_type=null;
    	   String cust_group_code=null;
    	   String cust_group_desc=null;
    	   if(lang2!=null && lang2.length>=1)
    	   {
    	   for(int y=0;y<lang2.length;y++){
    	    ccg.setRolename(role);
     	    String cust_code_desc=lang2[y];
     	    String split[]=cust_code_desc.split("-");
   	        cust_group_code=split[0];
   	        cust_group_desc=split[1];
   	        if(cust_group_code.equalsIgnoreCase("TC03") || cust_group_code.equalsIgnoreCase("TC04") )
   	        	cust_group_type="I";
   	        else
   	        	cust_group_type="D";
   	        ccg.setCustomergroupcode(cust_group_code);
	   	   ccg.setCustomergroupdesc(cust_code_desc);
	   	   ccg.setCustomergrouptype(cust_group_type);
	   	   
    	   
    	    int s=Customer_CustomerGroupDAO.insert_Customer_Customer_Group(ccg);
    	   
    	   }
    	 
    	   }
    	   
    	   
    	   Material_Material_Type mmt =new Material_Material_Type();
//    	   String lang[]=request.getParameterValues("multiselectmaterial");
    	   String matlist[] = request.getParameterValues("multiselectmaterial");
    	   if(matlist!=null && matlist.length>=1)
    	   {
    	   for(int y=0;y<matlist.length;y++){
    		   mmt.setRolename(role);
    	    String mat_code_desc=matlist[y];
    	    String split[]=mat_code_desc.split("-");
    	    String mat_code=split[0];
//    	    String mat_desc=split[1];
    	    mmt.setmaterialtypecode(mat_code);
    	    mmt.setmaterialtypedesc(mat_code_desc);
    	    int s = Material_Material_Type_DAO.insert_Material_Material_Type(mmt);
    	    
//    	    int s=Vendor_Material_Type_DAO.insert_Vendor_Material_Type(mmt);
    	   
    	   }
    	   }
    	  
    	   
    	   
    	   
    	   
		int st=0;
		Connection con=null;
		PreparedStatement ps=null;
		  try{  
	        	 con=AuditConnection.getConnection();	        	
	        	  ps=con.prepareStatement("insert into\"Rolelist\" (\"Rolename\",\"SCR_Basic\",\"SCR_Plant_Storage_Purchase\",\"SCR_MRP\",\"SCR_Sales\",\"SCR_Costing_Accounting\",\"SCR_Customer\",\"SCR_Vendor\",\"Created_By\",\"Created_Date\",\"IsMDMAdmin\" )values(?,?,?,?,?,?,?,?,?,?,?)");   
	        	 	

	        		          

	 
	            ps.setString(1,role); 
	            
	            ps.setString(2,basicrole); 
//	            ps.setString(3,plantmappingrole); 
	            ps.setString(3,purchasingrole); 
	            ps.setString(4,mrprole); 
//	            ps.setString(6,plantstoragerole); 
	            ps.setString(5,salesrole); 
	            ps.setString(6,costingrole); 
//	            ps.setString(9,accountingrole); 
	            
	            ps.setString(7,customerrole); 
	          
	            
	            ps.setString(8,vendorrole); 
	           

	            
	            
	            
	            
	            
	            ps.setString(9,createdby); 
	            ps.setObject(10,new Timestamp(System.currentTimeMillis()));
	          
              ps.setBoolean(11,ismdmadmin);

              

	         st =  ps.executeUpdate();  
	        
	         ps.close();
	         ps=null;
	         con.close();
	         con=null;
	            
if(st>0)
{
	 out.println("<script type=\"text/javascript\">");
	   out.println("alert('Role created');");
	   out.println("</script>");
 RequestDispatcher rd=request.getRequestDispatcher("RoleCreation.jsp");  
 rd.include(request, response);
    
	
}
else
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Unable to create');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("RoleCreation.jsp");  
rd.include(request, response);     
	
}

	        }catch(Exception ex){ex.printStackTrace();}  
	          
		
		  finally 
			
			{
				
			
				AuditConnection.shutdown(ps, con);
			}//finally close
    }//else close
		
    
		   }//if close
		   
		   else
	          {
	         	   out.println("<script type=\"text/javascript\">");
					   out.println("alert('Session timeout!');");
					   out.println("window.parent.location.href= \"Login.jsp\"");
					   out.println("</script>");	    
					  // RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");  
					 //  rd.include(request, response);  
	          }
			  
		   
		   
    
	}

}
