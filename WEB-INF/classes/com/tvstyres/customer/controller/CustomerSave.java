package com.tvstyres.customer.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tvs.userconsole.User;
import com.tvs.userconsole.UserDAO;
import com.tvstyres.customer.dao.CheckMDMCodeDAO;
import com.tvstyres.customer.dao.CustomerDAO;
import com.tvstyres.customer.model.Customer;



@WebServlet("/Customersave")
public class CustomerSave extends HttpServlet {
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
		if (createdby != null  ) {

			Integer mdmcustomercode = Integer.parseInt(request.getParameter("mdmcustomercode"));
			
			
			String sapcustomercode = request.getParameter("sapcustomercode");
			String customergroupcode = request.getParameter("customergroupid");
			String customergroupdesc = request.getParameter("customergroup");
			String customergrouptype = request.getParameter("customertypeid");
			String titlecode = request.getParameter("titleid");
			String titledesc = request.getParameter("title");
			String name = request.getParameter("name");
			String name2 = request.getParameter("name2");
			String legalname = request.getParameter("legalname");
			String countrycode = request.getParameter("countryid");
			String countrydesc = request.getParameter("country");
			String statecode = request.getParameter("stateid");
			String statedesc = request.getParameter("state");
			String houseno = request.getParameter("houseno");
			String street = request.getParameter("Street");
			String street1 = request.getParameter("street1");
			String street2 = request.getParameter("street2");
			String pincode = request.getParameter("pincode");
			String city = request.getParameter("city");
			String faxnumber = request.getParameter("faxnumber");
			String telephoneno = request.getParameter("telno");
			String mobileno = request.getParameter("mobileno");
			String emailid = request.getParameter("mailid");
		     String distchannel_code=request.getParameter("distchannelid");
			 String distchannel_desc=request.getParameter("distchannel");
			 String division_code=request.getParameter("divisionid");
			 String division_desc=request.getParameter("division");
			 String salesdist_code=request.getParameter("salesdistrictid");
			 String salesdict_desc=request.getParameter("salesdistrict");
			 String accountassigngrp_code=request.getParameter("accassignmentid");
			 String accountassigngrp_desc=request.getParameter("accassignment");
			 String custpriceproc_code=request.getParameter("custpriceid");
			 String custpriceproc_desc=request.getParameter("custprice");
			 String custstatsgrp_code=request.getParameter("customerstatsid");
			 String custstatsgrp_desc=request.getParameter("customerstats");
			 String incoterm_code=request.getParameter("incotermid");
			 String incoterm_desc=request.getParameter("incoterm");
			 String inco_location1=request.getParameter("incolocation1");
			 String delivery_priority_code=request.getParameter("deliverypriorityid");
			 String delivery_priority_desc=request.getParameter("deliverypriority");
			 String shipping_cond_code=request.getParameter("shippingid");
			 String shipping_cond_desc=request.getParameter("shipping");
			 String pricegrp_code=request.getParameter("pricegroupid");
			 String pricegrp_desc=request.getParameter("pricegroup");
			 String pricelist_code=request.getParameter("priceid");
			 String pricelist_desc=request.getParameter("price");
			 String salesoffice_code=request.getParameter("salesofficeid");
			 String salesoffice_desc=request.getParameter("salesoffice");
			 String salesgroup_code=request.getParameter("salesgroupid");
			 String salesgroup_desc=request.getParameter("salesgroup");
			 String currency_code=request.getParameter("currencyid");
			 String currency_desc=request.getParameter("currency");
			 String custemer_clasific_code=request.getParameter("custclassid");
			 String custemer_clasific_desc=request.getParameter("custclass");
			 String activity_code_code=request.getParameter("activitycodeid");
			 String activity_code_desc=request.getParameter("activitycode");
			 String paymentterm_code=request.getParameter("paymenttermid");
			 String paymentterm_desc=request.getParameter("paymentterm");
			 String gstno=request.getParameter("gstno");
			 String panno=request.getParameter("panno");
			 String glcode=request.getParameter("glcode");
			 String customer_group1_code=request.getParameter("customergroup1id");
			 String customer_group1_desc=request.getParameter("customergroup1");
			 String customer_group2_code=request.getParameter("customergroup2id");
			 String customer_group2_desc=request.getParameter("customergroup2");
			 String customer_group3_code=request.getParameter("customergroup3id");
			 String customer_group3_desc=request.getParameter("customergroup3");
			 String customer_group4_code=request.getParameter("customergroup4id");
			 String customer_group4_desc=request.getParameter("customergroup4");
			 String customer_group5_code=request.getParameter("customergroup5id");
			 String customer_group5_desc=request.getParameter("customergroup5");
			 String customer_group6_code=request.getParameter("customergroup6id");
			 String customer_group6_desc=request.getParameter("customergroup6");
			 
			 
			 String condition_group1_code=request.getParameter("conditiongroup1id");
			 String condition_group1_desc=request.getParameter("conditiongroup1");
			 String condition_group2_code=request.getParameter("conditiongroup2id");
			 String condition_group2_desc=request.getParameter("conditiongroup2");
			 String condition_group3_code=request.getParameter("conditiongroup3id");
			 String condition_group3_desc=request.getParameter("conditiongroup3");
			 String condition_group4_code=request.getParameter("conditiongroup4id");
			 String condition_group4_desc=request.getParameter("conditiongroup4");
			 String condition_group5_code=request.getParameter("conditiongroup5id");
			 String condition_group5_desc=request.getParameter("conditiongroup5");
			 
			 String continent_code=request.getParameter("continentid");
			 String continent_desc=request.getParameter("continent");
			 String attribute2_code=request.getParameter("attribute2id");
			 String attribute2_desc=request.getParameter("attribute2");
			 String attribute3_code=request.getParameter("attribute3id");
			 String attribute3_desc=request.getParameter("attribute3");
			 String attribute4_code=request.getParameter("attribute4id");
			 String attribute4_desc=request.getParameter("attribute4");
			 String attribute5_code=request.getParameter("attribute5id");
			 String attribute5_desc=request.getParameter("attribute5");
			 String attribute6_code=request.getParameter("attribute6id");
			 String attribute6_desc=request.getParameter("attribute6");
			 String attribute7_code=request.getParameter("attribute7id");
			 String attribute7_desc=request.getParameter("attribute7");
			 String attribute8_code=request.getParameter("attribute8id");
			 String attribute8_desc=request.getParameter("attribute8");
			 String attribute9_code=request.getParameter("attribute9id");
			 String attribute9_desc=request.getParameter("attribute9");
			 String attribute10_code=request.getParameter("attribute10id");
			 String attribute10_desc=request.getParameter("attribute10");
			String revusername = request.getParameter("revusername");
			String btnStatus = request.getParameter("Save");
			System.out.println("Customer: save value is:-"+btnStatus);
			
			if (btnStatus.isEmpty()) {
				btnStatus = request.getParameter("Submit");
				System.out.println("Customer:-submit value is:-"+btnStatus);
			}
			String status = null;
			if (btnStatus.equals("Save")) {
				status = "Draft";
			} else {

				status = "Inactive";
			}

			Customer c=new Customer();
			
			c.setMdm_customer_code(mdmcustomercode);
			c.setSap_customer_code(sapcustomercode);
			c.setCustomer_group_code(customergroupcode);
			c.setCustomer_group_desc(customergroupdesc);
			c.setCustomer_group_type(customergrouptype);
			c.setTitle_code(titlecode);
			c.setTitle_desc(titledesc);
			c.setName(name);
			c.setName2(name2);
			c.setLegalname(legalname);
			c.setCountry_code(countrycode);
			c.setCountry_desc(countrydesc);
			c.setState_code(statecode);
			c.setState_desc(statedesc);
	        c.setHouseno(houseno);
	        c.setStreet(street);
	        c.setStreet1(street1);
	        c.setStreet2(street2);
	        c.setPincode(pincode);
	        c.setCity(city);
	        c.setFax_number(faxnumber);
	        c.setMobile_no(mobileno);
	        c.setTelephone_no(telephoneno);
	        c.setEmailid(emailid);
	        c.setDistchannel_code(distchannel_code);
	        c.setDistchannel_desc(distchannel_desc);
	        c.setDivision_code(division_code);
	        c.setDivision_desc(division_desc);
	        c.setSalesdist_code(salesdist_code);
	        c.setSalesdict_desc(salesdict_desc);
	        c.setAccountassigngrp_code(accountassigngrp_code);
	        c.setAccountassigngrp_desc(accountassigngrp_desc);
	        c.setCustpriceproc_code(custpriceproc_code);
	        c.setCustpriceproc_desc(custpriceproc_desc);
	        c.setCuststatsgrp_code(custstatsgrp_code);
	        c.setCuststatsgrp_desc(custstatsgrp_desc);
	        c.setIncoterm_code(incoterm_code);
	        c.setIncoterm_desc(incoterm_desc);
	        c.setInco_location1(inco_location1);
	        c.setDelivery_priority_code(delivery_priority_code);
	        c.setDelivery_priority_desc(delivery_priority_desc);
	        c.setShipping_cond_code(shipping_cond_code);
	        c.setShipping_cond_desc(shipping_cond_desc);
	        c.setPricegrp_code(pricegrp_code);
	        c.setPricegrp_desc(pricegrp_desc);
	        c.setPricelist_code(pricelist_code);
	        c.setPricelist_desc(pricelist_desc);
	        c.setSalesoffice_code(salesoffice_code);
	        c.setSalesoffice_desc(salesoffice_desc);
	        c.setSalesgroup_code(salesgroup_code);
	        c.setSalesgroup_desc(salesgroup_desc);
	        c.setCurrency_code(currency_code);
	        c.setCurrency_desc(currency_desc);
	        c.setCustemer_clasific_code(custemer_clasific_code);
	        c.setCustemer_clasific_desc(custemer_clasific_desc);
	        c.setActivity_code_code(activity_code_code);
	        c.setActivity_code_desc(activity_code_desc);
	        c.setPanno(panno);
	        c.setGstno(gstno);
	        c.setGlcode(glcode);
	     
	        c.setPayment_term_code(paymentterm_code);
	        c.setPayment_term_desc(paymentterm_desc);
	        
	        c.setCustomer_group1_code(customer_group1_code);
	        c.setCustomer_group1_desc(customer_group1_desc);
	        c.setCustomer_group2_code(customer_group2_code);
	        c.setCustomer_group2_desc(customer_group2_desc);
	        c.setCustomer_group3_code(customer_group3_code);
	        c.setCustomer_group3_desc(customer_group3_desc);
	        c.setCustomer_group4_code(customer_group4_code);
	        c.setCustomer_group4_desc(customer_group4_desc);
	        c.setCustomer_group5_code(customer_group5_code);
	        c.setCustomer_group5_desc(customer_group5_desc);
	        c.setCustomer_group6_code(customer_group6_code);
	        c.setCustomer_group6_desc(customer_group6_desc);	        
	        
	        c.setCondition_group1_code(condition_group1_code);
	        c.setCondition_group1_desc(condition_group1_desc);
	        c.setCondition_group2_code(condition_group2_code);
	        c.setCondition_group2_desc(condition_group2_desc);
	        c.setCondition_group3_code(condition_group3_code);
	        c.setCondition_group3_desc(condition_group3_desc);
	        c.setCondition_group4_code(condition_group4_code);
	        c.setCondition_group4_desc(condition_group4_desc);
	        c.setCondition_group5_code(condition_group5_code);
	        c.setCondition_group5_desc(condition_group5_desc);
	        
	        
	        c.setContinent_code(continent_code);
	        c.setContinent_desc(continent_desc);
	        c.setAttribute2_code(attribute2_code);
	        c.setAttribute2_desc(attribute2_desc);
	        c.setAttribute3_code(attribute3_code);
	        c.setAttribute3_desc(attribute3_desc);
	        c.setAttribute4_code(attribute4_code);
	        c.setAttribute4_desc(attribute4_desc);
	        c.setAttribute5_code(attribute5_code);
	        c.setAttribute5_desc(attribute5_desc);
	        c.setAttribute6_code(attribute6_code);
	        c.setAttribute6_desc(attribute6_desc);
	        c.setAttribute7_code(attribute7_code);
	        c.setAttribute7_desc(attribute7_desc);
	        c.setAttribute8_code(attribute8_code);
	        c.setAttribute8_desc(attribute8_desc);
	        c.setAttribute9_code(attribute9_code);
	        c.setAttribute9_desc(attribute9_desc);
	        c.setAttribute10_code(attribute10_code);
	        c.setAttribute10_desc(attribute10_desc);
			c.setApproval_status("Pending");
			c.setStatus(status);
			c.setCreated_by(createdby);
			c.setReviewerusername(revusername);
		
				if (CheckMDMCodeDAO.check(mdmcustomercode)) {

					Integer xyz = CheckMDMCodeDAO.find();
					mdmcustomercode = xyz + 1;
					c.setMdm_customer_code(mdmcustomercode);
					result = CustomerDAO.insert(c);
					if (status.equals("Inactive")) {
						status = "Submit";
						c.setStatus(status);
						//int sss = VendorBasicDAO.insertaudit(v);
					}

					if (result > 0 && btnStatus.equals("Save")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record saved sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
						rd.include(request, response);
					}

					else if (result > 0 && btnStatus.equals("Submit")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record submitted sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.include(request, response);
					}

					else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Unable to Save');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
						rd.include(request, response);
					}

				} // if close

				else {

					result = CustomerDAO.insert(c);
					
					if (status.equals("Inactive")) {
						status = "Submit";
						c.setStatus(status);
						//int sss = VendorBasicDAO.insertaudit(v);
					}

					if (result > 0 && btnStatus.equals("Save")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record saved sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
						rd.include(request, response);
					}

					else if (result > 0 && btnStatus.equals("Submit")) {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Record submitted sucessfully');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						rd.include(request, response);
					}

					else {
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Unable to Save');");
						out.println("</script>");
						RequestDispatcher rd = request.getRequestDispatcher("Customer.jsp");
						rd.include(request, response);
					}

				}

			}

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
