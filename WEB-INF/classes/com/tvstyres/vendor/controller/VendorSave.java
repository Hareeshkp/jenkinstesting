package com.tvstyres.vendor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;
import com.tvstyres.gstvalidator.api.GSTDetails;
import com.tvstyres.gstvalidator.api.GSTDetailsDAO;
import com.tvstyres.gstvalidator.api.Token;
import com.tvstyres.gstvalidator.api.ValidateGST;
import com.tvstyres.vendor.dao.CheckMDMVendorCodeDAO;
import com.tvstyres.vendor.dao.VendorDAO;
import com.tvstyres.vendor.model.Vendor;

@WebServlet("/Vendorsave")
public class VendorSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		int result = 0;
		String createdby = null;
		HttpSession session = request.getSession(false);
		
		if(session!=null)
		{
		String Userid = (String) session.getAttribute("userid");
		User uu = UserDAO.getUsernameRoleByUserId(Userid); // username
		createdby = uu.getUsername();// createdby
		}
		
		if (createdby!=null ) {
			
        	
			Integer mdmvendorcode = Integer.parseInt(request.getParameter("mdmvendorcode"));
			String sapvendorcode = request.getParameter("sapvendorcode");
			String vendorgroupcode = request.getParameter("vendorgroupid");
			String vendorgroupdesc = request.getParameter("vendorgroup");
			String vendorgrouptype = request.getParameter("vendortypeid");
			String titlecode = request.getParameter("titleid");
			String titledesc = request.getParameter("title");
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String name2 = request.getParameter("name2");
			String legalname = request.getParameter("legalname");
			String countrycode = request.getParameter("countryid");
			String countrydesc = request.getParameter("country");
			String statecode = request.getParameter("stateid");
			String statedesc = request.getParameter("state");
			String houseno = request.getParameter("houseno");
			String street = request.getParameter("street");
			String street1 = request.getParameter("street1");
			String street2 = request.getParameter("street2");
			String pincode = request.getParameter("pincode");
			String city = request.getParameter("city");
			String faxnumber = request.getParameter("faxnumber");
			String telephoneno = request.getParameter("telephoneno");
			String mobileno = request.getParameter("mobile");
			String emailid = request.getParameter("mailid");
			String gstfileingcode = request.getParameter("gstfileingid");
			String gstfileingdesc = request.getParameter("gstfileing");
			String materialtypecode = request.getParameter("materiallid");
			String materialtypedesc = request.getParameter("mattype");
			String salesperson = request.getParameter("salesperson");
			String salestelno = request.getParameter("saltelephoneno");
			String bankkey = request.getParameter("bankkey");
			String bankname = request.getParameter("bankname");
			String bankaccno = request.getParameter("bankaccno");
			String incotermcode = request.getParameter("incotermid");
			String incotermdesc = request.getParameter("incoterm");
			String panno = request.getParameter("panno");
			String gstno = request.getParameter("gstno");
			String glcode = request.getParameter("glcode");
			String currencycode = request.getParameter("currencyid");
			String currencydesc = request.getParameter("currency");
			String vendorclasscode = request.getParameter("vendorclassid");
			String vendorclassdesc = request.getParameter("vendorclass");
			String pay = "";			
			String lang[] = request.getParameterValues("paymentmethods");
			String activity_code_desc=request.getParameter("activitycode");
			//newly added fields
			String paymentterm_code=request.getParameter("paymenttermid");
			String paymentterm_desc=request.getParameter("paymentterm");
			String adhaarno = request.getParameter("adhaarno");
			String paymentmethods = "";
			if (lang != null && lang.length >= 1) {
				for (int y = 0; y < lang.length; y++) {
					pay += lang[y] + ",";
				}
				paymentmethods = pay.replaceAll(",$", "");
			}
			String legalentitycode = request.getParameter("legalentityid");
			String legalentitydesc = request.getParameter("legalentity");
			String identificationno = request.getParameter("idnum");
			String idtypecode = request.getParameter("idtypeid");
			String idtypedesc = request.getParameter("idtype");
			String actualqmsysdesc1[] = request.getParameterValues("people");
			String code="";
			String description = "";
			
			if(actualqmsysdesc1!=null && actualqmsysdesc1.length>=1)
			{
				for (int y = 0; y < actualqmsysdesc1.length; y++) {
					String[] splittedDetails = actualqmsysdesc1[y].split("-");
					code+=splittedDetails[0]+",";
					description+=actualqmsysdesc1[y]+",";					
				}
			}
			
			
			String paymentblockcode = request.getParameter("paymentblockid");
			String paymentblockdesc = request.getParameter("paymentblock");
			String incolocation1 = request.getParameter("incolocation1");
			String revusername = request.getParameter("revusername");
			String btnStatus = request.getParameter("save");
			
			System.out.println("Vendor:save value is:"+btnStatus);
			if (btnStatus.isEmpty()) {
				btnStatus = request.getParameter("submit");
				System.out.println("Vendor:submit value is:"+btnStatus);
			}
			String status = null;
			if (btnStatus.equals("Save")) {
				status = "Draft";
			} else {

				status = "Inactive";
			}
			Vendor v=new Vendor();
			v.setMdm_vendor_code(mdmvendorcode);
			v.setSap_vendor_code(sapvendorcode);
			v.setVendor_group_code(vendorgroupcode);
			v.setVendor_group_desc(vendorgroupdesc);
			v.setVendor_group_type(vendorgrouptype);
			v.setTitle_code(titlecode);
			v.setTitle_desc(titledesc);
			v.setFirstname(firstname);
			v.setLastname(lastname);
			v.setName2(name2);
			v.setLegalname(legalname);
			v.setCountry_code(countrycode);
			v.setCountry_desc(countrydesc);
			v.setState_code(statecode);
			v.setState_desc(statedesc);
			v.setHouseno(houseno);
			v.setStreet(street);
			v.setStreet1(street1);
			v.setStreet2(street2);
			v.setPincode(pincode);
			v.setCity(city);
			v.setFax_number(faxnumber);
			v.setTelephone_no(telephoneno);
			v.setMobile_no(mobileno);
			v.setEmailid(emailid);
			v.setGst_fileing_code(gstfileingcode);
			v.setGst_fileing_desc(gstfileingdesc);
			v.setMaterial_type_code(materialtypecode);
			v.setMaterial_type_desc(materialtypedesc);
			v.setSales_person(salesperson);
			v.setSales_person_tele_no(salestelno);
			v.setBankkey(bankkey);
			v.setBankname(bankname);
			v.setBankaccountno(bankaccno);
			v.setIncoterm_code(incotermcode);
			v.setIncoterm_desc(incotermdesc);
			v.setCurrency_code(currencycode);
			v.setCurrency_desc(currencydesc);
			v.setPayment_methods(paymentmethods);
			v.setVendorclass_code(vendorclasscode);
			v.setVendorclass_desc(vendorclassdesc);
			v.setGstno(gstno);
			v.setPanno(panno);
			v.setLegal_entity_code(legalentitycode);
			v.setLegal_entity_desc(legalentitydesc);
			v.setGlcode(glcode);
			v.setIdentification_no(identificationno);
			v.setId_type_code(idtypecode);
			v.setId_type_desc(idtypedesc);
			v.setActual_qm_sys_code(code);
			v.setActual_qm_sys_desc(description);
			v.setPayment_block_code(paymentblockcode);
			v.setPayment_block_desc(paymentblockdesc);
			v.setInco_location1(incolocation1);
			v.setApproval_status("Pending");
			v.setStatus(status);
			v.setCreated_by(createdby);
			v.setReviewerusername(revusername);
			v.setPaymenttermCode(paymentterm_code);
			v.setPaymenttermDesc(paymentterm_desc);
			v.setAdhaarno(adhaarno);
		
			
		
			
				
				if (CheckMDMVendorCodeDAO.check(mdmvendorcode)) {

					Integer xyz = CheckMDMVendorCodeDAO.find();
					mdmvendorcode = xyz + 1;
					v.setMdm_vendor_code(mdmvendorcode);
					result = VendorDAO.insert(v);
					
					if (status.equals("Inactive")) {
						status = "Submit";
						v.setStatus(status);
						//int sss = VendorBasicDAO.insertaudit(v);
					}

					if (result > 0 && btnStatus.equals("Save")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record saved sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Vendor.jsp");
						rd.include(request, response);
					}

					else if (result > 0 && btnStatus.equals("Submit")) {	
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Record submitted sucessfully');");
							out.println("</script>");
							RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
					
					}
					else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Unable to Save');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Vendor.jsp");
						rd.include(request, response);
					}

				} // mdmd code validation if close
				
				

				else {

					result = VendorDAO.insert(v);
					if (status.equals("Inactive")) {
						status = "Submit";
						v.setStatus(status);
						//int sss = VendorBasicDAO.insertaudit(v);
					}
					if (result > 0 && btnStatus.equals("Save")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record saved sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Vendor.jsp");
						rd.include(request, response);
					}
					else if (result > 0 && btnStatus.equals("Submit")) 
					{
							out.println("<script type=\"text/javascript\">");
							out.println("alert('Record submitted sucessfully');");
							out.println("</script>");
							RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
							rd.include(request, response);							
						
					}
					else 
					{
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Unable to Save');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Vendor.jsp");
						rd.include(request, response);
					}

				}

			
			
			
			
		} // session if

		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Session timeout!');");
			out.println("window.parent.location.href= \"Login.jsp\"");
			out.println("</script>");
			// RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
			// rd.include(request, response);
		}
		
		
		
		

	}// dopost
}// class
