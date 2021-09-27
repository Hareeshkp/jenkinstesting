package com.tvs.userconsole;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.tvs.dbconnection.AuditConnection;


@WebServlet("/RoleUpdate")
public class RoleUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		 
		   HttpSession session = request.getSession(false);
	          PrintWriter out =response.getWriter();

		   if(session!=null)

		   {
			   
		    String Userid=(String)session.getAttribute("userid");
		    User uu =UserDAO.getUsernameRoleByUserId(Userid);
		  //username
		    String modifiedby=uu.getUsername();
		  //rolename  
			String role=request.getParameter("role");  
			 String[] chkSms=request.getParameterValues("mdmadmin");
		     Boolean ismdmadmin =false;
		     if(chkSms !=null && chkSms.length > 0){      
		    	 ismdmadmin=true;  
		     }
			
//material role
		String basicrole=request.getParameter("basicrole");  
        //String plantmappingrole=request.getParameter("plantmappingrole"); 
		
		String purchasingrole=request.getParameter("purchasingrole");  
		
        //String plantstoragerole=request.getParameter("plantstoragerole");  
		
        String mrprole=request.getParameter("mrprole");  
        String salesrole=request.getParameter("salesrole");  
        String costingrole=request.getParameter("costingaccounting"); 
        
        //String accountingrole=request.getParameter("accountingrole");  
//Customer role
	String customerrole=request.getParameter("custrole");  
  //Vendor role
  	String vendorrole=request.getParameter("vendorrole");  

		int st=0;
		Connection con=null;
		PreparedStatement ps=null;
		  try{  
	        	 con=AuditConnection.getConnection();
	        	
//	        	 ps=con.prepareStatement("update \"Rolelist\" set \"SCR_Basic\"=?,\"SCR_Plantmapping\"=?,\"SCR_Purchase\"=?,\"SCR_MRP\"=?,\"SCR_PlantAndStorage\"=?,\"SCR_Sales\"=?,\"SCR_Costing\"=?,\"SCR_Accounting\"=?,\"SCR_Customer\"=?,\"SCR_Vendor\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"IsMDMAdmin\"=? "+ 
//	        		        " where \"Rolename\"=?");  
	        	 ps=con.prepareStatement("update \"Rolelist\" set \"SCR_Basic\"=?,\"SCR_Plant_Storage_Purchase\"=?,\"SCR_MRP\"=?,\"SCR_Sales\"=?,\"SCR_Costing_Accounting\"=?,\"SCR_Customer\"=?,\"SCR_Vendor\"=?,\"Modified_By\"=?,\"Modified_Date\"=?,\"IsMDMAdmin\"=? "+" where \"Rolename\"=?");     
	            
	            ps.setString(1,basicrole); 
	            //ps.setString(2,plantmappingrole); 
	            ps.setString(2,purchasingrole); 
	            ps.setString(3,mrprole); 
	            //ps.setString(5,plantstoragerole); 
	            ps.setString(4,salesrole); 
	            ps.setString(5,costingrole); 
	            //ps.setString(8,accountingrole); 
	            
	            ps.setString(6,customerrole); 
	         
	            ps.setString(7,vendorrole); 
	           

	            
	            
	            
	            
	            
	            ps.setString(8,modifiedby); 
	            ps.setObject(9,new Timestamp(System.currentTimeMillis()));
	          
	            ps.setBoolean(10,ismdmadmin); 

	            
	        
	            ps.setString(11,role); 
	            System.out.println(basicrole+" "+purchasingrole+" "+mrprole+" "+salesrole);
	            System.out.println(costingrole+" "+customerrole+" "+vendorrole+" "+modifiedby);
	            System.out.println(new Timestamp(System.currentTimeMillis()));
	            System.out.println(ismdmadmin);




	            
	            
	           
	           

	          
	           
	            

	         st =  ps.executeUpdate();  
	     
	         ps.close();
	         ps=null;
	         con.close();
	         con=null;
	         
	         Vendor_Material_Type vmt =new Vendor_Material_Type();
	 	     int s=Vendor_Material_Type_DAO.delete_Vendor_Material_Type(role);

	             String pay="";
	    	   
	    	   String lang[]=request.getParameterValues("multi");
	    	   String   paymentmethods="";
	    	   if(lang!=null && lang.length>=1)
	    	   {
	    	   for(int y=0;y<lang.length;y++){
	    	    pay+=lang[y]+",";
	    	   
	    	    vmt.setRolename(role);
	    	    
	    	    String mat_code_desc=lang[y];
	    	    String split[]=mat_code_desc.split("-");
	    	    String mat_code=split[0];
	    	 //   String mat_desc=split[1];
	    	    vmt.setMattypecode(mat_code);
	    	    vmt.setMattypedesc(mat_code_desc);
	    	   
		 	     int ss=Vendor_Material_Type_DAO.insert_Vendor_Material_Type(vmt);


	    	   }
	    	  paymentmethods = pay.replaceAll(",$", "");
	    	   }
	    	   Vendor_VendorGroup vvg =new Vendor_VendorGroup();
                Vendor_VendorGroupDAO.delete_Vendor_Vendor_Group(role);
	    	   String pay1="";
	    	   String lang1[]=request.getParameterValues("multivendor");
	    	   String   paymentmethods1="";
	    	   if(lang1!=null && lang1.length>=1)
	    	   {
	    	   for(int y=0;y<lang1.length;y++){
	    	    pay1+=lang1[y]+",";
	     	    vvg.setRolename(role);
	     	    String ven_code_desc=lang1[y];
	   	        String split[]=ven_code_desc.split("-");
	   	    String ven_group_code=split[0];
	   	  //  String ven_group_desc=split[1];
	   	    String ven_group_type;
	   	    if(ven_group_code.equalsIgnoreCase("TV02") || ven_group_code.equalsIgnoreCase("TV02A") || ven_group_code.equalsIgnoreCase("TV03C") || ven_group_code.equalsIgnoreCase("TV03D") )
	   	    	ven_group_type="I";
	   	    else
	   	    	ven_group_type="D";
	   	    vvg.setVendorgroupcode(ven_group_code);
	    	vvg.setVendorgroupdesc(ven_code_desc);
	    	vvg.setVendorgrouptype(ven_group_type);
	    	    int s1=Vendor_VendorGroupDAO.insert_Vendor_Vendor_Group(vvg);
	    	   }
	    	  paymentmethods1 = pay1.replaceAll(",$", "");
	    	   }
	    	   
	    	   Customer_CustomerGroup ccg =new Customer_CustomerGroup();
	    	   Customer_CustomerGroupDAO.delete_Customer_Customer_Group(role);
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
	   	   
	    	   
	    	    int as=Customer_CustomerGroupDAO.insert_Customer_Customer_Group(ccg);
	    	   
	    	   }
	    	 
	    	   }
	    	   Material_Material_Type mmt= new Material_Material_Type(); 
//	    	   Material_Material_Type_DAO mmtd = new Material_Material_Type_DAO();
	    	   Material_Material_Type_DAO.delete_Material_Material_Type(role);
	    	   String lang3[] = request.getParameterValues("materialtype");
	    	   String material_type_code = null;
	    	   String material_type_desc = null;
	    	   if(lang3!=null & lang3.length>=1)
	    	   {
	    		   for(int z=0;z<lang3.length;z++)
	    		   {
	    			   mmt.setRolename(role);
	    			   String material_type_code_desc = lang3[z];
	    			   String split1[] = material_type_code_desc.split("-");
	    			   material_type_code = split1[0];
	    			   //material_type_desc = split1[1];
	    			   mmt.setmaterialtypecode(material_type_code);
	    			   mmt.setmaterialtypedesc(material_type_code_desc);
	    	    	   int mmm = Material_Material_Type_DAO.insert_Material_Material_Type(mmt);
	    		   }
	    	   }
	    	   	    	   
	      
	    	   	   
	            
if(st>0)
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Role updated');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("RoleCreation.jsp");  
rd.include(request, response);    	
}
else
{
	
	out.println("<script type=\"text/javascript\">");
	   out.println("alert('Unable to update');");
	   out.println("</script>");
RequestDispatcher rd=request.getRequestDispatcher("RoleCreation.jsp");  
rd.include(request, response);    	     
	
}

	        }catch(Exception ex){ex.printStackTrace();}  
	          
		  finally 
			
			{
				AuditConnection.shutdown(ps, con);
				
				
			}
		
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
