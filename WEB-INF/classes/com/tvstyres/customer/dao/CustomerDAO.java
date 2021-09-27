package com.tvstyres.customer.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;
import com.tvstyres.customer.model.Customer;
import com.tvstyres.vendor.model.Vendor;

public class CustomerDAO {

	public static int insert(Customer e) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = ETLConnection.getConnection();
			ps = con.prepareStatement(
					"INSERT INTO public.\"STG_SCR_Customer\"(\n" + 
							"            \"MDM_Customer_Code\", \"SAP_Customer_Code\", \"Customer_Group_Code\", \n" + 
							"            \"Customer_Group_Description\", \"Customer_Group_Type\", \"Title_Code\", \n" + 
							"            \"Title_Description\", \"Name\", \"Name2\", \"Legal_Name\", \"Country_Code\", \n" + 
							"            \"Country_Description\", \"State_Code\", \"State_Description\", \"House_No\", \n" + 
							"            \"Street\", \"Street1\", \"Street2\", \"Pin_Code\", \"City\", \"Fax_Number\", \n" + 
							"            \"Mobile_No\", \"Telephone_No\", \"EMail_Id\", \"Distribution_Channel_Code\", \n" + 
							"            \"Distribution_Channel_Description\", \"Division_Code\", \"Division_Description\", \n" + 
							"            \"Sales_District_Code\", \"Sales_District_Description\", \"Account_AssignmentGp_Code\", \n" + 
							"            \"Account_AssignmentGp_Description\", \"Cust_Pric_Procedure_Code\", \n" + 
							"            \"Cust_Pric_Procedure_Description\", \"Customer_Stats_Group_Code\", \n" + 
							"            \"Customer_Stats_Group_Description\", \"Incoterm_Code\", \"Incoterm_Description\", \n" + 
							"            \"Inco_Location1\", \"Delivery_Priority_Code\", \"Delivery_Priority_Description\", \n" + 
							"            \"Shipping_Condition_Code\", \"Shipping_Condition_Description\", \n" + 
							"            \"Price_Group_Code\", \"Price_Group_Description\", \"Pric_List_Code\", \n" + 
							"            \"Pric_List_Description\", \"Sales_Office_Code\", \"Sales_Office_Description\", \n" + 
							"            \"Sales_Group_Code\", \"Sales_Group_Description\", \"Currency_Code\", \n" + 
							"            \"Currency_Description\", \"GST_No\", \"PAN_No\", \"GL_Code\", \"Customer_Classific_Code\", \n" + 
							"            \"Customer_Classific_Description\", \"Activity_Code_Code\", \"Activity_Code_Description\", \n" + 
							"            \"Payment_Term_Code\", \"Payment_Term_Description\", \"Customer_Group1_Code\", \n" + 
							"            \"Customer_Group1_Description\", \"Customer_Group2_Code\", \"Customer_Group2_Description\", \n" + 
							"            \"Customer_Group3_Code\", \"Customer_Group3_Description\", \"Customer_Group4_Code\", \n" + 
							"            \"Customer_Group4_Description\", \"Customer_Group5_Code\", \"Customer_Group5_Description\", \n" + 
							"            \"Customer_Group6_Code\", \"Customer_Group6_Description\", \"Continent_Code\", \n" + 
							"            \"Continent_Description\", \"Attribute2_Code\", \"Attribute2_Description\", \n" + 
							"            \"Attribute3_Code\", \"Attribute3_Description\", \"Attribute4_Code\", \n" + 
							"            \"Attribute4_Description\", \"Attribute5_Code\", \"Attribute5_Description\", \n" + 
							"            \"Attribute6_Code\", \"Attribute6_Description\", \"Attribute7_Code\", \n" + 
							"            \"Attribute7_Description\", \"Attribute8_Code\", \"Attribute8_Description\", \n" + 
							"            \"Attribute9_Code\", \"Attribute9_Description\", \"Attribute10_Code\", \n" + 
							"            \"Attribute10_Description\", \"Condition_Group1\", \"Condition_Group1_Description\", \n" + 
							"            \"Condition_Group2\", \"Condition_Group2_Description\", \"Condition_Group3\", \n" + 
							"            \"Condition_Group3_Description\", \"Condition_Group4\", \"Condition_Group4_Description\", \n" + 
							"            \"Condition_Group5\", \"Condition_Group5_Description\", \"Status\", \n" + 
							"            \"Created_By\", \"Created_Date\", \n" + 
							"            \"Approval_Status\", \"Reviewer_Username\")\n" + 
							"    VALUES (?, ?, ?,?, ?, ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?, ?, ?,?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, \n" + 
							"            ?, ?, ?,?, ?, ?,?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, \n" + 
							"            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)\n" + 
							""
							);
			
			
			
			ps.setInt(1, e.getMdm_customer_code());
			ps.setString(2, e.getSap_customer_code());
			ps.setString(3, e.getCustomer_group_code());
			ps.setString(4, e.getCustomer_group_desc());
			ps.setString(5, e.getCustomer_group_type());
			ps.setString(6, e.getTitle_code());
			ps.setString(7, e.getTitle_desc());
			ps.setString(8, e.getName());
			ps.setString(9, e.getName2());
			ps.setString(10, e.getLegalname());
			ps.setString(11, e.getCountry_code());
			ps.setString(12, e.getCountry_desc());
			ps.setString(13, e.getState_code());
			ps.setString(14, e.getState_desc());
			ps.setString(15, e.getHouseno());
			ps.setString(16, e.getStreet());
			ps.setString(17, e.getStreet1());
			ps.setString(18, e.getStreet2());
			ps.setString(19, e.getPincode());
			ps.setString(20, e.getCity());
			ps.setString(21, e.getFax_number());
			ps.setString(22, e.getMobile_no());
			ps.setString(23, e.getTelephone_no());
			ps.setString(24, e.getEmailid());
			ps.setString(25, e.getDistchannel_code());
			ps.setString(26, e.getDistchannel_desc());
			ps.setString(27, e.getDivision_code());
			ps.setString(28, e.getDivision_desc());
			ps.setString(29, e.getSalesdist_code());
			ps.setString(30, e.getSalesdict_desc());
			ps.setString(31, e.getAccountassigngrp_code());
			ps.setString(32, e.getAccountassigngrp_desc());
			ps.setString(33, e.getCustpriceproc_code());
			ps.setString(34, e.getCustpriceproc_desc());
			ps.setString(35, e.getCuststatsgrp_code());
			ps.setString(36, e.getCuststatsgrp_desc());
			ps.setString(37, e.getIncoterm_code());
			ps.setString(38, e.getIncoterm_desc());
			ps.setString(39, e.getInco_location1());
			ps.setString(40, e.getDelivery_priority_code());
			ps.setString(41, e.getDelivery_priority_desc());
			ps.setString(42, e.getShipping_cond_code());
			ps.setString(43, e.getShipping_cond_desc());
			ps.setString(44, e.getPricegrp_code());
			ps.setString(45, e.getPricegrp_desc());
			ps.setString(46, e.getPricelist_code());
			ps.setString(47, e.getPricelist_desc());
			ps.setString(48, e.getSalesoffice_code());
			ps.setString(49, e.getSalesoffice_desc());
			ps.setString(50, e.getSalesgroup_code());
			ps.setString(51, e.getSalesgroup_desc());
			ps.setString(52, e.getCurrency_code());
			ps.setString(53, e.getCurrency_desc());
			ps.setString(54, e.getGstno());
			ps.setString(55, e.getPanno());
			ps.setString(56, e.getGlcode());
			ps.setString(57, e.getCustemer_clasific_code());
			ps.setString(58, e.getCustemer_clasific_desc());
			ps.setString(59, e.getActivity_code_code());
			ps.setString(60, e.getActivity_code_desc());
			ps.setString(61, e.getPayment_term_code());
			ps.setString(62, e.getPayment_term_desc());
			ps.setString(63, e.getCustomer_group1_code());
			ps.setString(64, e.getCustomer_group1_desc());
			ps.setString(65, e.getCustomer_group2_code());
			ps.setString(66, e.getCustomer_group2_desc());
			ps.setString(67, e.getCustomer_group3_code());
			ps.setString(68, e.getCustomer_group3_desc());
			ps.setString(69, e.getCustomer_group4_code());
			ps.setString(70, e.getCustomer_group4_desc());
			ps.setString(71, e.getCustomer_group5_code());
			ps.setString(72, e.getCustomer_group5_desc());
			ps.setString(73, e.getCustomer_group6_code());
			ps.setString(74, e.getCustomer_group6_desc());
			ps.setString(75, e.getContinent_code());
			ps.setString(76, e.getContinent_desc());
			ps.setString(77, e.getAttribute2_code());
			ps.setString(78, e.getAttribute2_desc());
			ps.setString(79, e.getAttribute3_code());
			ps.setString(80, e.getAttribute3_desc());
			ps.setString(81, e.getAttribute4_code());
			ps.setString(82, e.getAttribute4_desc());
			ps.setString(83, e.getAttribute5_code());
			ps.setString(84, e.getAttribute5_desc());
			ps.setString(85, e.getAttribute6_code());
			ps.setString(86, e.getAttribute6_desc());
			ps.setString(87, e.getAttribute7_code());
			ps.setString(88, e.getAttribute7_desc());
			ps.setString(89, e.getAttribute8_code());
			ps.setString(90, e.getAttribute8_desc());
			ps.setString(91, e.getAttribute9_code());
			ps.setString(92, e.getAttribute9_desc());
			ps.setString(93, e.getAttribute10_code());
			ps.setString(94, e.getAttribute10_desc());
			ps.setString(95, e.getCondition_group1_code());
			ps.setString(96, e.getCondition_group1_desc());
			ps.setString(97, e.getCondition_group2_code());
			ps.setString(98, e.getCondition_group2_desc());
			ps.setString(99, e.getCondition_group3_code());
			ps.setString(100, e.getCondition_group3_desc());
			ps.setString(101, e.getCondition_group4_code());
			ps.setString(102, e.getCondition_group4_desc());
			ps.setString(103, e.getCondition_group5_code());
			ps.setString(104, e.getCondition_group5_desc());
			ps.setString(105, e.getStatus());
			ps.setString(106, e.getCreated_by());
			ps.setObject(107, new Timestamp(System.currentTimeMillis()));
			ps.setString(108, e.getApproval_status());
			ps.setString(109, e.getReviewerusername());
			status = ps.executeUpdate();
			ps.close();
			ps = null;
			con.close();
			con = null;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ETLConnection.shutdown(ps, con);
		}
		return status;
	}
	public static int Update(Customer e){  
        int status=0; 
        Connection con=null;
		PreparedStatement ps=null;
        try{  		       
        	con=ETLConnection.getConnection();	  
			ps = con.prepareStatement("UPDATE public.\"STG_SCR_Customer\"\n" + 
					"   SET  \"SAP_Customer_Code\"=?, \"Customer_Group_Code\"=?, \n" + 
					"       \"Customer_Group_Description\"=?, \"Customer_Group_Type\"=?, \"Title_Code\"=?, \n" + 
					"       \"Title_Description\"=?, \"Name\"=?, \"Name2\"=?, \"Legal_Name\"=?, \"Country_Code\"=?, \n" + 
					"       \"Country_Description\"=?, \"State_Code\"=?, \"State_Description\"=?, \n" + 
					"       \"House_No\"=?, \"Street\"=?, \"Street1\"=?, \"Street2\"=?, \"Pin_Code\"=?, \n" + 
					"       \"City\"=?, \"Fax_Number\"=?, \"Mobile_No\"=?, \"Telephone_No\"=?, \"EMail_Id\"=?, \n" + 
					"       \"Distribution_Channel_Code\"=?, \"Distribution_Channel_Description\"=?, \n" + 
					"       \"Division_Code\"=?, \"Division_Description\"=?, \"Sales_District_Code\"=?, \n" + 
					"       \"Sales_District_Description\"=?, \"Account_AssignmentGp_Code\"=?, \n" + 
					"       \"Account_AssignmentGp_Description\"=?, \"Cust_Pric_Procedure_Code\"=?, \n" + 
					"       \"Cust_Pric_Procedure_Description\"=?, \"Customer_Stats_Group_Code\"=?, \n" + 
					"       \"Customer_Stats_Group_Description\"=?, \"Incoterm_Code\"=?, \"Incoterm_Description\"=?, \n" + 
					"       \"Inco_Location1\"=?, \"Delivery_Priority_Code\"=?, \"Delivery_Priority_Description\"=?, \n" + 
					"       \"Shipping_Condition_Code\"=?, \"Shipping_Condition_Description\"=?, \n" + 
					"       \"Price_Group_Code\"=?, \"Price_Group_Description\"=?, \"Pric_List_Code\"=?, \n" + 
					"       \"Pric_List_Description\"=?, \"Sales_Office_Code\"=?, \"Sales_Office_Description\"=?, \n" + 
					"       \"Sales_Group_Code\"=?, \"Sales_Group_Description\"=?, \"Currency_Code\"=?, \n" + 
					"       \"Currency_Description\"=?, \"GST_No\"=?, \"PAN_No\"=?, \"GL_Code\"=?, \n" + 
					"       \"Customer_Classific_Code\"=?, \"Customer_Classific_Description\"=?, \n" + 
					"       \"Activity_Code_Code\"=?, \"Activity_Code_Description\"=?, \"Payment_Term_Code\"=?, \n" + 
					"       \"Payment_Term_Description\"=?, \"Customer_Group1_Code\"=?, \"Customer_Group1_Description\"=?, \n" + 
					"       \"Customer_Group2_Code\"=?, \"Customer_Group2_Description\"=?, \"Customer_Group3_Code\"=?, \n" + 
					"       \"Customer_Group3_Description\"=?, \"Customer_Group4_Code\"=?, \"Customer_Group4_Description\"=?, \n" + 
					"       \"Customer_Group5_Code\"=?, \"Customer_Group5_Description\"=?, \"Customer_Group6_Code\"=?, \n" + 
					"       \"Customer_Group6_Description\"=?, \"Continent_Code\"=?, \"Continent_Description\"=?, \n" + 
					"       \"Attribute2_Code\"=?, \"Attribute2_Description\"=?, \"Attribute3_Code\"=?, \n" + 
					"       \"Attribute3_Description\"=?, \"Attribute4_Code\"=?, \"Attribute4_Description\"=?, \n" + 
					"       \"Attribute5_Code\"=?, \"Attribute5_Description\"=?, \"Attribute6_Code\"=?, \n" + 
					"       \"Attribute6_Description\"=?, \"Attribute7_Code\"=?, \"Attribute7_Description\"=?, \n" + 
					"       \"Attribute8_Code\"=?, \"Attribute8_Description\"=?, \"Attribute9_Code\"=?, \n" + 
					"       \"Attribute9_Description\"=?, \"Attribute10_Code\"=?, \"Attribute10_Description\"=?, \n" + 
					"       \"Condition_Group1\"=?, \"Condition_Group1_Description\"=?, \"Condition_Group2\"=?, \n" + 
					"       \"Condition_Group2_Description\"=?, \"Condition_Group3\"=?, \"Condition_Group3_Description\"=?, \n" + 
					"       \"Condition_Group4\"=?, \"Condition_Group4_Description\"=?, \"Condition_Group5\"=?, \n" + 
					"       \"Condition_Group5_Description\"=?, \"Status\"=?, \"Modified_By\"=?, \"Modified_Date\"=?,  \n" + 
					"        \"Approval_Status\"=?, \"Reason_For_Edit\"=?,  \n" + 
					"       \"Block\"=?, \"Reason_For_Block\"=?,\"Reviewer_Username\"=?\n" + 
					" WHERE \"MDM_Customer_Code\"=?\n" + 
					""
					);
			ps.setString(1, e.getSap_customer_code());
			ps.setString(2, e.getCustomer_group_code());
			ps.setString(3, e.getCustomer_group_desc());
			ps.setString(4, e.getCustomer_group_type());
			ps.setString(5, e.getTitle_code());
			ps.setString(6, e.getTitle_desc());
			ps.setString(7, e.getName());
			ps.setString(8, e.getName2());
			ps.setString(9, e.getLegalname());
			ps.setString(10, e.getCountry_code());
			ps.setString(11, e.getCountry_desc());
			ps.setString(12, e.getState_code());
			ps.setString(13, e.getState_desc());
			ps.setString(14, e.getHouseno());
			ps.setString(15, e.getStreet());
			ps.setString(16, e.getStreet1());
			ps.setString(17, e.getStreet2());
			ps.setString(18, e.getPincode());
			ps.setString(19, e.getCity());
			ps.setString(20, e.getFax_number());
			ps.setString(21, e.getMobile_no());
			ps.setString(22, e.getTelephone_no());
			ps.setString(23, e.getEmailid());
			ps.setString(24, e.getDistchannel_code());
			ps.setString(25, e.getDistchannel_desc());
			ps.setString(26, e.getDivision_code());
			ps.setString(27, e.getDivision_desc());
			ps.setString(28, e.getSalesdist_code());
			ps.setString(29, e.getSalesdict_desc());
			ps.setString(30, e.getAccountassigngrp_code());
			ps.setString(31, e.getAccountassigngrp_desc());
			ps.setString(32, e.getCustpriceproc_code());
			ps.setString(33, e.getCustpriceproc_desc());
			ps.setString(34, e.getCuststatsgrp_code());
			ps.setString(35, e.getCuststatsgrp_desc());
			ps.setString(36, e.getIncoterm_code());
			ps.setString(37, e.getIncoterm_desc());
			ps.setString(38, e.getInco_location1());
			ps.setString(39, e.getDelivery_priority_code());
			ps.setString(40, e.getDelivery_priority_desc());
			ps.setString(41, e.getShipping_cond_code());
			ps.setString(42, e.getShipping_cond_desc());
			ps.setString(43, e.getPricegrp_code());
			ps.setString(44, e.getPricegrp_desc());
			ps.setString(45, e.getPricelist_code());
			ps.setString(46, e.getPricelist_desc());
			ps.setString(47, e.getSalesoffice_code());
			ps.setString(48, e.getSalesoffice_desc());
			ps.setString(49, e.getSalesgroup_code());
			ps.setString(50, e.getSalesgroup_desc());
			ps.setString(51, e.getCurrency_code());
			ps.setString(52, e.getCurrency_desc());
			ps.setString(53, e.getGstno());
			ps.setString(54, e.getPanno());
			ps.setString(55, e.getGlcode());
			ps.setString(56, e.getCustemer_clasific_code());
			ps.setString(57, e.getCustemer_clasific_desc());
			ps.setString(58, e.getActivity_code_code());
			ps.setString(59, e.getActivity_code_desc());
			ps.setString(60, e.getPayment_term_code());
			ps.setString(61, e.getPayment_term_desc());
			ps.setString(62, e.getCustomer_group1_code());
			ps.setString(63, e.getCustomer_group1_desc());
			ps.setString(64, e.getCustomer_group2_code());
			ps.setString(65, e.getCustomer_group2_desc());
			ps.setString(66, e.getCustomer_group3_code());
			ps.setString(67, e.getCustomer_group3_desc());
			ps.setString(68, e.getCustomer_group4_code());
			ps.setString(69, e.getCustomer_group4_desc());
			ps.setString(70, e.getCustomer_group5_code());
			ps.setString(71, e.getCustomer_group5_desc());
			ps.setString(72, e.getCustomer_group6_code());
			ps.setString(73, e.getCustomer_group6_desc());
			ps.setString(74, e.getContinent_code());
			ps.setString(75, e.getContinent_desc());
			ps.setString(76, e.getAttribute2_code());
			ps.setString(77, e.getAttribute2_desc());
			ps.setString(78, e.getAttribute3_code());
			ps.setString(79, e.getAttribute3_desc());
			ps.setString(80, e.getAttribute4_code());
			ps.setString(81, e.getAttribute4_desc());
			ps.setString(82, e.getAttribute5_code());
			ps.setString(83, e.getAttribute5_desc());
			ps.setString(84, e.getAttribute6_code());
			ps.setString(85, e.getAttribute6_desc());
			ps.setString(86, e.getAttribute7_code());
			ps.setString(87, e.getAttribute7_desc());
			ps.setString(88, e.getAttribute8_code());
			ps.setString(89, e.getAttribute8_desc());
			ps.setString(90, e.getAttribute9_code());
			ps.setString(91, e.getAttribute9_desc());
			ps.setString(92, e.getAttribute10_code());
			ps.setString(93, e.getAttribute10_desc());
			ps.setString(94, e.getCondition_group1_code());
			ps.setString(95, e.getCondition_group1_desc());
			ps.setString(96, e.getCondition_group2_code());
			ps.setString(97, e.getCondition_group2_desc());
			ps.setString(98, e.getCondition_group3_code());
			ps.setString(99, e.getCondition_group3_desc());
			ps.setString(100, e.getCondition_group4_code());
			ps.setString(101, e.getCondition_group4_desc());
			ps.setString(102, e.getCondition_group5_code());
			ps.setString(103, e.getCondition_group5_desc());
			ps.setString(104, e.getStatus());
			ps.setString(105, e.getModified_by());
			ps.setObject(106, new Timestamp(System.currentTimeMillis()));
			ps.setString(107, e.getApproval_status());
			ps.setString(108, e.getReason_for_edit());
			ps.setBoolean(109, e.getBlock());
			ps.setString(110, e.getReason_for_block());
			ps.setString(111, e.getReviewerusername());
			ps.setInt(112, e.getMdm_customer_code());
           
            status=ps.executeUpdate(); 	              
            ps.close();
            ps=null;
            con.close();
            con=null;
            
        }  
        catch(Exception ex){ex.printStackTrace();}  	          
        finally {
 			ETLConnection.shutdown(ps, con);
 		}
        return status;  
    }  
	
	public static Customer getCustomerDetailsBymdmCustomercode(Integer id) {

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		Customer cb =new Customer();
		try {
			con = ETLConnection.getConnection();
			pst = con.prepareStatement("select * from \"STG_SCR_Customer\" where \"MDM_Customer_Code\"=?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				cb.setMdm_customer_code(rs.getInt("MDM_Customer_Code"));
				cb.setSap_customer_code(rs.getString("SAP_Customer_Code"));
				cb.setCustomer_group_type(rs.getString("Customer_Group_Type"));
				cb.setCustomer_group_desc(rs.getString("Customer_Group_Description"));
				cb.setCustomer_group_code(rs.getString("Customer_Group_Code"));
				cb.setTitle_code(rs.getString("Title_Code"));
				cb.setTitle_desc(rs.getString("Title_Description"));
				cb.setName(rs.getString("Name"));
				cb.setName2(rs.getString("Name2"));
				cb.setLegalname(rs.getString("Legal_Name"));
				cb.setCountry_code(rs.getString("Country_Code"));
				cb.setCountry_desc(rs.getString("Country_Description"));
				cb.setState_code(rs.getString("State_Code"));
				cb.setState_desc(rs.getString("State_Description"));
				cb.setHouseno(rs.getString("House_No"));
				cb.setStreet(rs.getString("Street"));
				cb.setStreet1(rs.getString("Street1"));
				cb.setStreet2(rs.getString("Street2"));
				cb.setPincode(rs.getString("Pin_Code"));
				cb.setCity(rs.getString("City"));
				cb.setFax_number(rs.getString("Fax_Number"));
				cb.setTelephone_no(rs.getString("Telephone_No"));
				cb.setMobile_no(rs.getString("Mobile_No"));
				cb.setEmailid(rs.getString("EMail_Id"));
				cb.setDistchannel_code(rs.getString("Distribution_Channel_Code"));
				cb.setDistchannel_desc(rs.getString("Distribution_Channel_Description"));
				cb.setDivision_code(rs.getString("Division_Code"));
				cb.setDivision_desc(rs.getString("Division_Description"));
				cb.setSalesdist_code(rs.getString("Sales_District_Code"));
				cb.setSalesdict_desc(rs.getString("Sales_District_Description"));
				cb.setAccountassigngrp_code(rs.getString("Account_AssignmentGp_Code"));
				cb.setAccountassigngrp_desc(rs.getString("Account_AssignmentGp_Description"));
				cb.setCustpriceproc_code(rs.getString("Cust_Pric_Procedure_Code"));
				cb.setCustpriceproc_desc(rs.getString("Cust_Pric_Procedure_Description"));
				cb.setCuststatsgrp_code(rs.getString("Customer_Stats_Group_Code"));
				cb.setCuststatsgrp_desc(rs.getString("Customer_Stats_Group_Description"));
				cb.setIncoterm_code(rs.getString("Incoterm_Code"));
				cb.setIncoterm_desc(rs.getString("Incoterm_Description"));
				cb.setInco_location1(rs.getString("Inco_Location1"));
				cb.setDelivery_priority_code(rs.getString("Delivery_Priority_Code"));
				cb.setDelivery_priority_desc(rs.getString("Delivery_Priority_Description"));
				cb.setShipping_cond_code(rs.getString("Shipping_Condition_Code"));
				cb.setShipping_cond_desc(rs.getString("Shipping_Condition_Description"));
				cb.setPricegrp_code(rs.getString("Price_Group_Code"));
				cb.setPricegrp_desc(rs.getString("Price_Group_Description"));
				cb.setPricelist_code(rs.getString("Pric_List_Code"));
				cb.setPricelist_desc(rs.getString("Pric_List_Description"));
				cb.setSalesoffice_code(rs.getString("Sales_Office_Code"));
				cb.setSalesoffice_desc(rs.getString("Sales_Office_Description"));
				cb.setSalesgroup_code(rs.getString("Sales_Group_Code"));
				cb.setSalesgroup_desc(rs.getString("Sales_Group_Description"));
				cb.setGstno(rs.getString("GST_No"));
				cb.setPanno(rs.getString("PAN_No"));
				cb.setGlcode(rs.getString("GL_Code"));
				cb.setCustemer_clasific_code(rs.getString("Customer_Classific_Code"));
				cb.setCustemer_clasific_desc(rs.getString("Customer_Classific_Description"));
				cb.setCurrency_code(rs.getString("Currency_Code"));
				cb.setCurrency_desc(rs.getString("Currency_Description"));
				cb.setActivity_code_code(rs.getString("Activity_Code_Code"));
				cb.setActivity_code_desc(rs.getString("Activity_Code_Description"));
				cb.setPayment_term_code(rs.getString("Payment_Term_Code"));
				cb.setPayment_term_desc(rs.getString("Payment_Term_Description"));
				cb.setCustomer_group1_code(rs.getString("Customer_Group1_Code"));
				cb.setCustomer_group1_desc(rs.getString("Customer_Group1_Description"));
				cb.setCustomer_group2_code(rs.getString("Customer_Group2_Code"));
				cb.setCustomer_group2_desc(rs.getString("Customer_Group2_Description"));
				cb.setCustomer_group3_code(rs.getString("Customer_Group3_Code"));
				cb.setCustomer_group3_desc(rs.getString("Customer_Group3_Description"));
				cb.setCustomer_group4_code(rs.getString("Customer_Group4_Code"));
				cb.setCustomer_group4_desc(rs.getString("Customer_Group4_Description"));
				cb.setCustomer_group5_code(rs.getString("Customer_Group5_Code"));
				cb.setCustomer_group5_desc(rs.getString("Customer_Group5_Description"));
				cb.setCustomer_group6_code(rs.getString("Customer_Group6_Code"));
				cb.setCustomer_group6_desc(rs.getString("Customer_Group6_Description"));
				cb.setContinent_code(rs.getString("Continent_Code"));
				cb.setContinent_desc(rs.getString("Continent_Description"));
				cb.setAttribute2_code(rs.getString("Attribute2_Code"));
				cb.setAttribute2_desc(rs.getString("Attribute2_Description"));
				cb.setAttribute3_code(rs.getString("Attribute3_Code"));
				cb.setAttribute3_desc(rs.getString("Attribute3_Description"));
				cb.setAttribute4_code(rs.getString("Attribute4_Code"));
				cb.setAttribute4_desc(rs.getString("Attribute4_Description"));
				cb.setAttribute5_code(rs.getString("Attribute5_Code"));
				cb.setAttribute5_desc(rs.getString("Attribute5_Description"));
				cb.setAttribute6_code(rs.getString("Attribute6_Code"));
				cb.setAttribute6_desc(rs.getString("Attribute6_Description"));
				cb.setAttribute7_code(rs.getString("Attribute7_Code"));
				cb.setAttribute7_desc(rs.getString("Attribute7_Description"));
				cb.setAttribute8_code(rs.getString("Attribute8_Code"));
				cb.setAttribute8_desc(rs.getString("Attribute8_Description"));
				cb.setAttribute9_code(rs.getString("Attribute9_Code"));
				cb.setAttribute9_desc(rs.getString("Attribute9_Description"));
				cb.setAttribute10_code(rs.getString("Attribute10_Code"));
				cb.setAttribute10_desc(rs.getString("Attribute10_Description"));
			   cb.setCondition_group1_code(rs.getString("Condition_Group1"));
			   cb.setCondition_group1_desc(rs.getString("Condition_Group1_Description"));
			   cb.setCondition_group2_code(rs.getString("Condition_Group2"));
			   cb.setCondition_group2_desc(rs.getString("Condition_Group2_Description"));
			   cb.setCondition_group3_code(rs.getString("Condition_Group3"));
			   cb.setCondition_group3_desc(rs.getString("Condition_Group3_Description"));
			   cb.setCondition_group4_code(rs.getString("Condition_Group4"));
			   cb.setCondition_group4_desc(rs.getString("Condition_Group4_Description"));
			   cb.setCondition_group5_code(rs.getString("Condition_Group5"));
			   cb.setCondition_group5_desc(rs.getString("Condition_Group5_Description"));
				cb.setReason_for_edit(rs.getString("Reason_For_Edit"));
				cb.setReason_for_block(rs.getString("Reason_For_Block"));
				cb.setBlock(rs.getBoolean("Block"));
				cb.setVersion(rs.getInt("Version"));
				cb.setStatus(rs.getString("Status"));
				cb.setApproval_status(rs.getString("Approval_Status"));
				cb.setReviewerusername(rs.getString("Reviewer_Username"));
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close

		return cb;
	}
	public List<String> getReviewerUsernameCustomer(String customergroupcode) throws SQLException, ClassNotFoundException
	{
		List<String> listrevusername = new ArrayList<>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try
		{
			con = AuditConnection.getConnection();
			String sql ="SELECT DISTINCT  \"User\".\"Userid\"||'-'||\"User\".\"Userdisplayname\" as username FROM \"User\" INNER JOIN \"Rolelist\" ON \"Rolelist\".\"Rolename\" = \"User\".\"Role\" INNER JOIN \"Role_Customer_CustomerGroup\" ON \"Role_Customer_CustomerGroup\".\"Rolename\" = \"User\".\"Role\" where \"Rolelist\".\"SCR_Customer\" ='Reviewer' and \"Role_Customer_CustomerGroup\".\"Customer_Group_Description\" IN('"+customergroupcode+"')" ;
			
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				
				String reviewername= rs.getString("username");
				listrevusername.add(reviewername);
				
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
			
		}
		catch (SQLException ex) {
		ex.printStackTrace();
		throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return listrevusername;

	}

	public List<Customer> getReviewerUsername(String customergroupcode) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Customer> listrevusername = new ArrayList<>();
		try {
			con = AuditConnection.getConnection();
			String sql ="SELECT DISTINCT  \"User\".\"Userid\"||'-'||\"User\".\"Userdisplayname\" as username FROM \"User\" INNER JOIN \"Rolelist\" ON \"Rolelist\".\"Rolename\" = \"User\".\"Role\" INNER JOIN \"Role_Customer_CustomerGroup\" ON \"Role_Customer_CustomerGroup\".\"Rolename\"= \"User\".\"Role\" where \"Rolelist\".\"SCR_Customer\" ='Reviewer' and \"Role_Customer_CustomerGroup\".\"Customer_Group_Code\" IN (" +customergroupcode + ") " ;
																																																												// is																																																								// null)or(\"Approval_Status\"='Approval'and																																																									// \"Status\"='Active')																																																									// ";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				String reviewername= rs.getString("username");
				Customer c=new Customer(reviewername);
				listrevusername.add(c);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return listrevusername;

	}

	public List<Customer> UserList(String username, String cgroup, String stat, String apvstat, Integer vers,String custname)
			throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Customer> userlist = new ArrayList<>();

		try {
			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Customer_Code\",\"Name\",\"Customer_Group_Code\",\"Customer_Group_Description\",\"SAP_Customer_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Customer\" where  (\"Created_By\"=? or \"Modified_By\"=? or \"Status\"='Active') and \"Customer_Group_Code\"=? and (\"Name\"=? or 'Select'=?) and (\"Status\"= ? or 'Select'=?)and (\"Approval_Status\" = ? or 'Select'=? )and (\"Version\" = ? or -1=?) ";
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, username);
			pst.setString(3, cgroup);
			pst.setString(4, custname);
			pst.setString(5, custname);
			pst.setString(6, stat);
			pst.setString(7, stat);
			pst.setString(8, apvstat);
			pst.setString(9, apvstat);
			pst.setInt(10, vers);
			pst.setInt(11, vers);
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcustomercode = rs.getInt("MDM_Customer_Code");
				String customergroupdesc = rs.getString("Customer_Group_Description");
				String sapcustomercode = rs.getString("SAP_Customer_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");
				String name=rs.getString("Name");

Customer c=new Customer(mdmcustomercode, sapcustomercode, customergroupdesc, name, status,approvalstatus, version);

				userlist.add(c);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		} finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return userlist;

	}

	public List<Customer> UserLists(String username,Boolean blk) throws SQLException, ClassNotFoundException

	{
	      Connection con=null;
	      PreparedStatement pst=null;
	      ResultSet rs=null;
	      
	   List<Customer> userlist = new ArrayList<>();
	   
	    try
	    {    
	    	
	   	 	con=ETLConnection.getConnection();
	   	 	
	   	 if(blk==true)
	   	 	{
	   		String sql = "select \"MDM_Customer_Code\",\"Customer_Group_Code\",\"Name\",\"Customer_Group_Description\",\"Customer_Group_Type\",\"SAP_Customer_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Customer\" where   \"Status\"='Active' and \"Block\"=? ";
		   	 pst =con.prepareStatement(sql); 
		        //pst.setString(1,username);
		       
		        pst.setBoolean(1, blk);
	   	 	}
	   	 else
	   	 {
	   		String sql = "select \"MDM_Customer_Code\",\"Customer_Group_Code\",\"Name\",\"Customer_Group_Description\",\"Customer_Group_Type\",\"SAP_Customer_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Customer\" where   \"Status\"='Active' and (\"Block\"=? or \"Block\" isnull)";
		   	 pst =con.prepareStatement(sql); 
		        //pst.setString(1,username);
		       
		        pst.setBoolean(1, blk);
	   		 
	   	 }
	   	 
	        rs = pst.executeQuery(); 
	        while (rs.next()) {
	           Integer mdmcustomercode=rs.getInt("MDM_Customer_Code");
	       	  
	           String name=rs.getString("Name");
	       	   String customergroupdesc=rs.getString("Customer_Group_Description");
	           String sapcustomercode=rs.getString("SAP_Customer_Code");
	       	   Integer version=rs.getInt("Version");
	           String status=rs.getString("Status");
	       	   String approvalstatus=rs.getString("Approval_Status");
	       	   
	       	   
	       	   Customer c=new Customer(mdmcustomercode, sapcustomercode, customergroupdesc, name,status, approvalstatus, version);
	       	   
	       	   
	       	  userlist.add(c);
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
	    return userlist;

	}
	public List<Customer> alllist(String custgrpcode) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Customer> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Customer_Code\",\"Name\",\"Customer_Group_Description\",\"SAP_Customer_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Customer\" where \"Status\"='Inactive' and \"Approval_Status\" IN('Reviewed','Approved','Rejected') and (\"Rejected_By\" isnull or \"Rejected_By\" ='Approval')  and \"Customer_Group_Code\" IN (" +custgrpcode + ") " ;
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcustomercode = rs.getInt("MDM_Customer_Code");
				String customername= rs.getString("Name");
				String customergroupdesc = rs.getString("Customer_Group_Description");
				String sapcustomercode = rs.getString("SAP_Customer_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");
				Customer c=new Customer(mdmcustomercode, sapcustomercode, customergroupdesc, customername, status, approvalstatus, version);
				listall.add(c);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return listall;

	}
	
	public List<Customer> alllist(Integer mincust,Integer maxcust,String sapcustomercode,String name,String legalname, String createdby,String modifiedby,String reviewedby,String approvedby,String gstno,String panno, String coun,String stat, String customergroup,String mincreated,String maxcreated,String minmodified,String maxmodified,String minreviewed,String maxreviewed,String minapproved,String maxapproved,String distchannel,String division,String customerclassific,String salesdist,String minsalesoffice,String maxsalesoffice,String minsalesgroup,String maxsalesgroup )  throws SQLException, ClassNotFoundException
	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Customer> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			String sql = "select * from   \"STG_SCR_Customer\" where \"MDM_Customer_Code\" between ? and ? and  (\"SAP_Customer_Code\" LIKE ? or 'Select'=?) and  (\"Name\" LIKE ? or 'Select'=?) and   (\"Legal_Name\" LIKE ? or 'Select'=?) and  (\"Created_By\" LIKE ? or 'Select'=?) and  (\"Modified_By\" LIKE ? or 'Select'=?)  and  (\"Reviewed_By\" LIKE ? or 'Select'=?) and  (\"Approved_By\" LIKE ? or 'Select'=?) and  (\"GST_No\" =? or 'Select'=?) and  (\"PAN_No\" =? or 'Select'=?) and  (\"Country_Description\" =? or 'Select'=?)  and  (\"State_Description\" =? or 'Select'=?) and  (\"Customer_Group_Description\" =? or 'Select'=?)  and (DATE(COALESCE(\"Created_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Created_Date\",'9999-01-01')) <= ?)and (DATE(COALESCE(\"Modified_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Modified_Date\",'9999-01-01')) <= ?) and (DATE(COALESCE(\"Reviewed_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Reviewed_Date\",'9999-01-01')) <= ?) and (DATE(COALESCE(\"Approved_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Approved_Date\",'9999-01-01')) <= ?) and  (\"Distribution_Channel_Description\" =? or 'Select'=?) and  (\"Division_Description\" =? or 'Select'=?) and  (\"Customer_Classific_Description\" =? or 'Select'=?) and  (\"Sales_District_Description\" =? or 'Select'=?) and  COALESCE((case when \"Sales_Office_Code\" = '' then '1' else \"Sales_Office_Code\" end),'1') >= ? and	COALESCE(\"Sales_Office_Code\",'9999') <= ? and	COALESCE((case when \"Sales_Group_Code\" = '' then '1' else \"Sales_Group_Code\" end),'1') >= ?  and	COALESCE(\"Sales_Group_Code\",'9999') <= ? " ;	
			
			pst = con.prepareStatement(sql);
			pst.setInt(1,mincust);
			pst.setInt(2,maxcust);
			pst.setString(3, sapcustomercode+"%");
			pst.setString(4, sapcustomercode);
			pst.setString(5, name+"%");
			pst.setString(6, name);
			pst.setString(7, legalname+"%");
			pst.setString(8, legalname);
			
			pst.setString(9, createdby+"%");
			pst.setString(10, createdby);
			
			pst.setString(11, modifiedby+"%");
			pst.setString(12, modifiedby);
			
			pst.setString(13, reviewedby+"%");
			pst.setString(14, reviewedby);
			
			pst.setString(15, approvedby+"%");
			pst.setString(16, approvedby);
			

			pst.setString(17, gstno);
			pst.setString(18, gstno);
			
			pst.setString(19, panno);
			pst.setString(20, panno);

			pst.setString(21, coun);
			pst.setString(22, coun);
			
			pst.setString(23, stat);
			pst.setString(24, stat);
			
			pst.setString(25, customergroup);
			pst.setString(26, customergroup);
			
			
			
			
			
		Date	d = java.sql.Date.valueOf (mincreated);


		Date	d1 = java.sql.Date.valueOf (maxcreated);
		
		
		
			pst.setDate(27, d);
			pst.setDate(28, d1);
			
			Date	d2 = java.sql.Date.valueOf (minmodified);


			Date	d3 = java.sql.Date.valueOf (maxmodified);
			
			pst.setDate(29, d2);
			pst.setDate(30, d3);
			
			Date	d4 = java.sql.Date.valueOf (minreviewed);

			Date	d5 = java.sql.Date.valueOf (maxreviewed);
			
			pst.setDate(31, d4);
			pst.setDate(32, d5);

			Date	d6 = java.sql.Date.valueOf (minapproved);
			Date	d7 = java.sql.Date.valueOf (maxapproved);
			
			
			pst.setDate(33, d6);
			pst.setDate(34, d7);
			
			
			pst.setString(35, distchannel);
			pst.setString(36, distchannel);
			
			pst.setString(37, division);
			pst.setString(38, division);
			
			pst.setString(39, customerclassific);
			pst.setString(40, customerclassific);
			
			pst.setString(41, salesdist);
			pst.setString(42, salesdist);
			
			pst.setString(43, minsalesoffice);
			pst.setString(44, maxsalesoffice);
			pst.setString(45, minsalesgroup);
			pst.setString(46, maxsalesgroup);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcustomercode = rs.getInt("MDM_Customer_Code");
				String sapCustomercode = rs.getString("SAP_Customer_Code");
				String customerGroup = rs.getString("Customer_Group_Description");
				String title= rs.getString("Title_Description");
				String Name= rs.getString("Name");
				String name2= rs.getString("Name2");
				String Legalname= rs.getString("Legal_Name");
				String country= rs.getString("Country_Description");
				String state= rs.getString("State_Description");
				String House_No= rs.getString("House_No");
				String street= rs.getString("Street");
				String street1= rs.getString("Street1");
				String street2= rs.getString("Street2");
				String Pin_Code= rs.getString("Pin_Code");
				String City= rs.getString("City");
				String Fax_Number= rs.getString("Fax_Number");
				String Mobile_No= rs.getString("Mobile_No");
				String Telephone_No= rs.getString("Telephone_No");
				String EMail_Id= rs.getString("EMail_Id");
				String Distribution_Channel= rs.getString("Distribution_Channel_Description");
				String Division= rs.getString("Division_Description");
				String Sales_District= rs.getString("Sales_District_Description");
				String Account_AssignmentGp= rs.getString("Account_AssignmentGp_Description");
				String Cust_Pric_Procedure= rs.getString("Cust_Pric_Procedure_Description");
				String Customer_Stats_Group= rs.getString("Customer_Stats_Group_Description");
				String Incoterm= rs.getString("Incoterm_Description");
				String Inco_Location1= rs.getString("Inco_Location1");
				String Delivery_Priority= rs.getString("Delivery_Priority_Description");
				String Shipping_Condition= rs.getString("Shipping_Condition_Description");
				String Price_Group= rs.getString("Price_Group_Description");
				String Pric_List= rs.getString("Pric_List_Description");
				String Sales_Office= rs.getString("Sales_Office_Description");
				String Sales_Group= rs.getString("Sales_Group_Description");
				String Currency= rs.getString("Currency_Description");
				String GST_No= rs.getString("GST_No");
				String PAN_No= rs.getString("PAN_No");
				String GL_Code= rs.getString("GL_Code");
				String Customer_Classific= rs.getString("Customer_Classific_Description");
				String Activity_Code= rs.getString("Activity_Code_Description");
				String Payment_Term= rs.getString("Payment_Term_Description");
				String Customer_Group1= rs.getString("Customer_Group1_Description");
				String Customer_Group2= rs.getString("Customer_Group2_Description");
				String Customer_Group3= rs.getString("Customer_Group3_Description");
				String Customer_Group4= rs.getString("Customer_Group4_Description");
				String Customer_Group5= rs.getString("Customer_Group5_Description");
				String Customer_Group6= rs.getString("Customer_Group6_Description");
				String Continent= rs.getString("Continent_Description");
				String Attribute2= rs.getString("Attribute2_Description");
				String Attribute3= rs.getString("Attribute3_Description");
				String Attribute4= rs.getString("Attribute4_Description");
				String Attribute5= rs.getString("Attribute5_Description");
				String Attribute6= rs.getString("Attribute6_Description");
				String Attribute7= rs.getString("Attribute7_Description");
				String Attribute8= rs.getString("Attribute8_Description");
				String Attribute9= rs.getString("Attribute9_Description");
				String Attribute10= rs.getString("Attribute10_Description");
				String Condition_Group1= rs.getString("Condition_Group1_Description");
				String Condition_Group2= rs.getString("Condition_Group2_Description");
				String Condition_Group3= rs.getString("Condition_Group3_Description");
				String Condition_Group4= rs.getString("Condition_Group4_Description");
				String Condition_Group5= rs.getString("Condition_Group5_Description");
				String status = rs.getString("Status");
				String Created_By= rs.getString("Created_By");
				String Created_Date= rs.getString("Created_Date");
				
				if(Created_Date !=null && !Created_Date.isEmpty())
				{
					Created_Date=Created_Date.substring(0,10);
				}
				String Modified_By= rs.getString("Modified_By");
				String Modified_Date= rs.getString("Modified_Date");
				
				if(Modified_Date !=null && !Modified_Date.isEmpty())
				{
					 Modified_Date=Modified_Date.substring(0,10);
				}
				
				
				String Reviewed_By= rs.getString("Reviewed_By");
				String Reviewed_Date= rs.getString("Reviewed_Date");
				
				if(Reviewed_Date !=null && !Reviewed_Date.isEmpty())
				{
					Reviewed_Date=Reviewed_Date.substring(0,10);
				}
				String Approved_By= rs.getString("Approved_By");
				String Approved_Date = rs.getString("Approved_Date");
				
				if(Approved_Date !=null && !Approved_Date.isEmpty())
				{
					Approved_Date=Approved_Date.substring(0,10);
				}
				String approvalstatus = rs.getString("Approval_Status");
				String Rejected_By= rs.getString("Rejected_By");
				String Reason_For_Edit= rs.getString("Reason_For_Edit");
				String Reason_For_Reject = rs.getString("Reason_For_Reject");
				Boolean Block = rs.getBoolean("Block");
				String Reason_For_Block = rs.getString("Reason_For_Block");
				Integer version = rs.getInt("Version");
				String Reviewer_Username = rs.getString("Reviewer_Username");
				Customer c=new Customer(mdmcustomercode, sapCustomercode, customerGroup, title, Name, name2, Legalname, country, state, House_No, street, street1, street2, Pin_Code, City, Fax_Number, Mobile_No, Telephone_No, EMail_Id, Distribution_Channel, Division, Sales_District, Account_AssignmentGp, Cust_Pric_Procedure, Customer_Stats_Group, Incoterm, Inco_Location1, Delivery_Priority, Shipping_Condition, Price_Group, Pric_List, Sales_Office, Sales_Group, Currency,Customer_Classific,Activity_Code, Payment_Term, GST_No, PAN_No, GL_Code, Customer_Group1, Customer_Group2, Customer_Group3, Customer_Group4, Customer_Group5, Customer_Group6, Condition_Group1, Condition_Group2, Condition_Group3, Condition_Group4, Condition_Group5, Continent, Attribute2, Attribute3, Attribute4, Attribute5, Attribute6, Attribute7, Attribute8, Attribute9, Attribute10, status, Created_By, Modified_By, Reviewed_By, Approved_By, approvalstatus, Reason_For_Edit, Reason_For_Reject, Reason_For_Block, Block, version, Reviewer_Username,Created_Date,Modified_Date,Reviewed_Date,Approved_Date);
				listall.add(c);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;

		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return listall;

	}

	public List<Customer> reviewlist(String custgrpcode,String userid_username) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Customer> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Customer_Code\",\"Name\",\"Customer_Group_Description\",\"SAP_Customer_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Customer\" where \"Status\"='Inactive' and \"Approval_Status\" IN('Pending','Reviewed','Rejected') and \"Customer_Group_Code\" IN (" +custgrpcode + ") and \"Reviewer_Username\"=? " ;
			pst = con.prepareStatement(sql);
			pst.setString(1, userid_username);
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcustomercode = rs.getInt("MDM_Customer_Code");
				String customername= rs.getString("Name");
				String customergroupdesc = rs.getString("Customer_Group_Description");
				String sapcustomercode = rs.getString("SAP_Customer_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");
				Customer c=new Customer(mdmcustomercode, sapcustomercode, customergroupdesc, customername, status, approvalstatus, version);
				listall.add(c);
			}
			rs.close();
			rs = null;
			pst.close();
			pst = null;
			con.close();
			con = null;
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw ex;
		}

		finally {
			ETLConnection.shutdown(rs, pst, con);
		} // finally close
		return listall;

	}
}
