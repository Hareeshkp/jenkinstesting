package com.tvstyres.vendor.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.tvs.dbconnection.AuditConnection;
import com.tvs.dbconnection.ETLConnection;
import com.tvstyres.customer.model.Customer;
import com.tvstyres.vendor.model.Vendor;
import com.tvs.userconsole.Reviewername;;

public class VendorDAO {

	public static int insert(Vendor e) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;
		
		

		try {

			con = ETLConnection.getConnection();
			ps = con.prepareStatement(
					"INSERT INTO public.\"STG_SCR_Vendor\"(\"MDM_Vendor_Code\", \"SAP_Vendor_Code\", \"Vendor_Group_Code\", \"Vendor_Group_Description\", \"Title_Code\", \"Title_Description\", \"First_Name\", \"Last_Name\", \"Name2\", \"Legal_Name\", \"Country_Code\", \"Country_Description\", \"State_Code\", \"State_Description\", \"House_No\", \"Street\", \"Street1\",\"Street2\", \"Pin_Code\", \"City\", \"Fax_Number\", \"Mobile_No\", \"Telephone_No\", \"EMail_Id\", \"GST_Fileing_Code\", \"GST_Fileing_Description\",\"Material_Type_Code\", \"Material_Type_Description\", \"Sales_Person\", \"Sales_Person_Tele_No\", \"Bank_Key\", \"Bank_Name\", \"Bank_Account_No\", \"Incoterm_Code\", \"Incoterm_Description\", \"Currency_Code\",  \"Currency_Description\", \"Payment_Methods\", \"VendorClass_Code\", \"VendorClass_Description\", \"GST_No\", \"PAN_No\", \"GL_Code\", \"Legal_Entity_Code\", \"Legal_Entity_Description\", \"ID_Type_Code\", \"ID_Type_Description\", \"Identification_Number\", \"Payment_Block_Code\", \"Payment_Block_Description\", \"Actual_QM_sys_Code\", \"Actual_QM_sys_Description\", \"Inco_Location1\", \"Status\", \"Created_By\", \"Created_Date\", \"Approval_Status\",\"Vendor_Group_Type\",\"Reviewer_Username\",\"Payment_Term_Code\",\"Payment_Term_Description\",\"Adhaar_No\")VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?,?, ?, ?,?,?, ?,?,?,?,?,?)");
			
			ps.setInt(1, e.getMdm_vendor_code());
			ps.setString(2, e.getSap_vendor_code());
			ps.setString(3, e.getVendor_group_code());
			ps.setString(4, e.getVendor_group_desc());
			ps.setString(5, e.getTitle_code());
			ps.setString(6, e.getTitle_desc());
			ps.setString(7, e.getFirstname());
			ps.setString(8, e.getLastname());
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
			ps.setString(25, e.getGst_fileing_code());
			ps.setString(26, e.getGst_fileing_desc());
			ps.setString(27, e.getMaterial_type_code());
			ps.setString(28, e.getMaterial_type_desc());
			ps.setString(29, e.getSales_person());
			ps.setString(30, e.getSales_person_tele_no());
			ps.setString(31, e.getBankkey());
			ps.setString(32, e.getBankname());
			ps.setString(33, e.getBankaccountno());
			ps.setString(34, e.getIncoterm_code());
			ps.setString(35, e.getIncoterm_desc());
			ps.setString(36, e.getCurrency_code());
			ps.setString(37, e.getCurrency_desc());
			ps.setString(38, e.getPayment_methods());
			ps.setString(39, e.getVendorclass_code());
			ps.setString(40, e.getVendorclass_desc());
			ps.setString(41, e.getGstno());
			ps.setString(42, e.getPanno());
			ps.setString(43, e.getGlcode());
			ps.setString(44, e.getLegal_entity_code());
			ps.setString(45, e.getLegal_entity_desc());
			ps.setString(46, e.getId_type_code());
			ps.setString(47, e.getId_type_desc());
			ps.setString(48, e.getIdentification_no());
			ps.setString(49, e.getPayment_block_code());
			ps.setString(50, e.getPayment_block_desc());
			ps.setString(51, e.getActual_qm_sys_code());
			ps.setString(52, e.getActual_qm_sys_desc());
			ps.setString(53, e.getInco_location1());
			ps.setString(54, e.getStatus());
			ps.setString(55, e.getCreated_by());
			ps.setObject(56, new Timestamp(System.currentTimeMillis()));
			ps.setString(57, e.getApproval_status());
			ps.setString(58, e.getVendor_group_type());
			ps.setString(59, e.getReviewerusername());
			ps.setString(60, e.getPaymenttermCode());
			ps.setString(61, e.getPaymenttermDesc());
			ps.setString(62, e.getAdhaarno());
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
	public static int Update(Vendor e){  
		
	
		
        int status=0; 
        Connection con=null;
		PreparedStatement ps=null;
	
        try{  		       

        	con=ETLConnection.getConnection();	  
        
			ps = con.prepareStatement(
					"Update public.\"STG_SCR_Vendor\" set  \"SAP_Vendor_Code\"=?, \"Vendor_Group_Code\"=?, \"Vendor_Group_Description\"=?,\"Vendor_Group_Type\"=?,\"Title_Code\"=?, \"Title_Description\"=?, \"First_Name\"=?, \"Last_Name\"=?, \"Name2\"=?, \"Legal_Name\"=?, \"Country_Code\"=?, \"Country_Description\"=?, \"State_Code\"=?, \"State_Description\"=?, \"House_No\"=?, \"Street\"=?, \"Street1\"=?,\"Street2\"=?, \"Pin_Code\"=?, \"City\"=?, \"Fax_Number\"=?, \"Mobile_No\"=?, \"Telephone_No\"=?, \"EMail_Id\"=?, \"GST_Fileing_Code\"=?, \"GST_Fileing_Description\"=?,\"Material_Type_Code\"=?, \"Material_Type_Description\"=?, \"Sales_Person\"=?, \"Sales_Person_Tele_No\"=?, \"Bank_Key\"=?, \"Bank_Name\"=?, \"Bank_Account_No\"=?, \"Incoterm_Code\"=?, \"Incoterm_Description\"=?, \"Currency_Code\"=?,  \"Currency_Description\"=?, \"Payment_Methods\"=?, \"VendorClass_Code\"=?, \"VendorClass_Description\"=?, \"GST_No\"=?, \"PAN_No\"=?, \"GL_Code\"=?, \"Legal_Entity_Code\"=?, \"Legal_Entity_Description\"=?, \"ID_Type_Code\"=?, \"ID_Type_Description\"=?, \"Identification_Number\"=?, \"Payment_Block_Code\"=?, \"Payment_Block_Description\"=?, \"Actual_QM_sys_Code\"=?, \"Actual_QM_sys_Description\"=?, \"Inco_Location1\"=?, \"Status\"=?, \"Modified_By\"=?, \"Modified_Date\"=?, \"Approval_Status\"=?,\"Reason_For_Edit\"=?,\"Block\"=?,\"Reason_For_Block\"=?,\"Reviewer_Username\"=?,\"Payment_Term_Code\"=?,\"Payment_Term_Description\"=?,\"Adhaar_No\"=? where \"MDM_Vendor_Code\"=? ");
        	
        	
        	
            ps.setString(1, e.getSap_vendor_code());
			ps.setString(2, e.getVendor_group_code());
			ps.setString(3, e.getVendor_group_desc());
			
			ps.setString(4, e.getVendor_group_type());
			
			ps.setString(5, e.getTitle_code());
			ps.setString(6, e.getTitle_desc());
			ps.setString(7, e.getFirstname());
			ps.setString(8, e.getLastname());
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
			ps.setString(25, e.getGst_fileing_code());
			ps.setString(26, e.getGst_fileing_desc());
			ps.setString(27, e.getMaterial_type_code());
			ps.setString(28, e.getMaterial_type_desc());
			ps.setString(29, e.getSales_person());
			ps.setString(30, e.getSales_person_tele_no());
			ps.setString(31, e.getBankkey());
			ps.setString(32, e.getBankname());
			ps.setString(33, e.getBankaccountno());
			ps.setString(34, e.getIncoterm_code());
			ps.setString(35, e.getIncoterm_desc());
			ps.setString(36, e.getCurrency_code());
			ps.setString(37, e.getCurrency_desc());
			ps.setString(38, e.getPayment_methods());
			ps.setString(39, e.getVendorclass_code());
			ps.setString(40, e.getVendorclass_desc());
			ps.setString(41, e.getGstno());
			ps.setString(42, e.getPanno());
			ps.setString(43, e.getGlcode());
			ps.setString(44, e.getLegal_entity_code());
			ps.setString(45, e.getLegal_entity_desc());
			ps.setString(46, e.getId_type_code());
			ps.setString(47, e.getId_type_desc());
			ps.setString(48, e.getIdentification_no());
			ps.setString(49, e.getPayment_block_code());
			ps.setString(50, e.getPayment_block_desc());
			ps.setString(51, e.getActual_qm_sys_code());
			ps.setString(52, e.getActual_qm_sys_desc());
			ps.setString(53, e.getInco_location1());
			ps.setString(54, e.getStatus());
			ps.setString(55, e.getModified_by());
			ps.setObject(56, new Timestamp(System.currentTimeMillis()));
			ps.setString(57, e.getApproval_status());
			ps.setString(58, e.getReason_for_edit());
			ps.setBoolean(59, e.getBlock());
			ps.setString(60, e.getReason_for_block());
			ps.setString(61, e.getReviewerusername());
		    ps.setString(62,e.getPaymenttermCode());
		    ps.setString(63,e.getPaymenttermDesc());
		    ps.setString(64,e.getAdhaarno());  
		    ps.setInt(65,e.getMdm_vendor_code());        
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
	
	public static Vendor getVendorDetailsBymdmVendorcode(Integer id) {

		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		Vendor cb = new Vendor();
		try {
			con = ETLConnection.getConnection();
			pst = con.prepareStatement("select * from \"STG_SCR_Vendor\" where \"MDM_Vendor_Code\"=?");
			pst.setInt(1, id);
			rs = pst.executeQuery();
			if (rs.next()) {
				cb.setMdm_vendor_code(rs.getInt("MDM_Vendor_Code"));
				cb.setSap_vendor_code(rs.getString("SAP_Vendor_Code"));
				cb.setVendor_group_code(rs.getString("Vendor_Group_Code"));
				cb.setVendor_group_desc(rs.getString("Vendor_Group_Description"));
				cb.setVendor_group_type(rs.getString("Vendor_Group_Type"));
				cb.setTitle_code(rs.getString("Title_Code"));
				cb.setTitle_desc(rs.getString("Title_Description"));
				cb.setFirstname(rs.getString("First_Name"));
				cb.setLastname(rs.getString("Last_Name"));
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
				cb.setGst_fileing_code(rs.getString("GST_Fileing_Code"));
				cb.setGst_fileing_desc(rs.getString("GST_Fileing_Description"));
				cb.setMaterial_type_code(rs.getString("Material_Type_Code"));
				cb.setMaterial_type_desc(rs.getString("Material_Type_Description"));
				cb.setSales_person(rs.getString("Sales_Person"));
				cb.setSales_person_tele_no(rs.getString("Sales_Person_Tele_No"));
				cb.setBankkey(rs.getString("Bank_Key"));
				cb.setBankname(rs.getString("Bank_Name"));
				cb.setBankaccountno(rs.getString("Bank_Account_No"));
				cb.setIncoterm_code(rs.getString("Incoterm_Code"));
				cb.setIncoterm_desc(rs.getString("Incoterm_Description"));
				cb.setCurrency_code(rs.getString("Currency_Code"));
				cb.setCurrency_desc(rs.getString("Currency_Description"));
				cb.setPayment_methods(rs.getString("Payment_Methods"));
				cb.setVendorclass_code(rs.getString("VendorClass_Code"));
				cb.setVendorclass_desc(rs.getString("VendorClass_Description"));
				cb.setGstno(rs.getString("GST_No"));
				cb.setPanno(rs.getString("PAN_No"));
				cb.setLegal_entity_code(rs.getString("Legal_Entity_Code"));
				cb.setLegal_entity_desc(rs.getString("Legal_Entity_Description"));
				cb.setGlcode(rs.getString("GL_Code"));
				cb.setIdentification_no(rs.getString("Identification_Number"));
				cb.setId_type_code(rs.getString("ID_Type_Code"));
				cb.setId_type_desc(rs.getString("ID_Type_Description"));
				cb.setActual_qm_sys_code(rs.getString("Actual_QM_sys_Code"));
				cb.setActual_qm_sys_desc(rs.getString("Actual_QM_sys_Description"));
				cb.setPayment_block_code(rs.getString("Payment_Block_Code"));
				cb.setPayment_block_desc(rs.getString("Payment_Block_Description"));
				cb.setInco_location1(rs.getString("Inco_Location1"));
				cb.setReason_for_edit(rs.getString("Reason_For_Edit"));
				cb.setReason_for_block(rs.getString("Reason_For_Block"));
				cb.setBlock(rs.getBoolean("Block"));
				cb.setVersion(rs.getInt("Version"));
				cb.setStatus(rs.getString("Status"));
				cb.setApproval_status(rs.getString("Approval_Status"));
				cb.setReviewerusername(rs.getString("Reviewer_Username"));
				cb.setPaymenttermCode(rs.getString("Payment_Term_Code"));
				cb.setPaymenttermDesc(rs.getString("Payment_Term_Description"));
				cb.setAdhaarno(rs.getString("Adhaar_No"));
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

	public List<Vendor> UserList(String username, String vgroup, String stat, String apvstat, Integer vers,String fname)
			throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Vendor> userlist = new ArrayList<>();

		try {

			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Vendor_Code\",\"First_Name\",\"Vendor_Group_Code\",\"Vendor_Group_Description\",\"SAP_Vendor_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Vendor\" where  (\"Created_By\"=?  or \"Status\"='Active') and \"Vendor_Group_Code\"=? and  (\"First_Name\" LIKE ? or 'Select' LIKE ?) and (\"Status\"= ? or 'Select'=?)and (\"Approval_Status\" = ? or 'Select'=? )and (\"Version\" = ? or -1=?) ";
			pst = con.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, vgroup);
			pst.setString(3, fname+"%");
			pst.setString(4, fname+"%");
			pst.setString(5, stat);
			pst.setString(6, stat);
			pst.setString(7, apvstat);
			pst.setString(8, apvstat);
			pst.setInt(9, vers);
			pst.setInt(10, vers);
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcode = rs.getInt("MDM_Vendor_Code");
				String vendorgroupdesc = rs.getString("Vendor_Group_Description");
				String vendorcode = rs.getString("SAP_Vendor_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");
				String firstname=rs.getString("First_Name");
				Vendor v = new Vendor(mdmcode, vendorcode, vendorgroupdesc, status, approvalstatus, version,firstname);
				userlist.add(v);
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

	public List<Vendor> UserLists(Boolean blk) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Vendor> userlist = new ArrayList<>();

		try {

			con = ETLConnection.getConnection();

			if (blk == true) {
				String sql = "select \"MDM_Vendor_Code\",\"First_Name\",\"Vendor_Group_Code\",\"Vendor_Group_Description\",\"Vendor_Group_Type\",\"SAP_Vendor_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Vendor\" where   \"Status\"='Active' and \"Block\"=?  ";
				pst = con.prepareStatement(sql);
				// pst.setString(1,username);
				pst.setBoolean(1, blk);

			} else {
				String sql = "select \"MDM_Vendor_Code\",\"First_Name\",\"Vendor_Group_Code\",\"Vendor_Group_Description\",\"Vendor_Group_Type\",\"SAP_Vendor_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Vendor\" where  \"Status\"='Active' and   (\"Block\"=? or \"Block\" isnull)  ";
				pst = con.prepareStatement(sql);
				// pst.setString(1,username);
				pst.setBoolean(1, blk);
			}
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcode = rs.getInt("MDM_Vendor_Code");
				String vendorgroupdesc = rs.getString("Vendor_Group_Description");
				String vendorcode = rs.getString("SAP_Vendor_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");
				String firstname=rs.getString("First_Name");
				Vendor v = new Vendor(mdmcode, vendorcode, vendorgroupdesc, status, approvalstatus, version,firstname);
				userlist.add(v);
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

	public List<Vendor> alllist(String mattypecode,String vengrpdesc) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Vendor> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Vendor_Code\",\"First_Name\",\"Vendor_Group_Description\",\"SAP_Vendor_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Vendor\" where \"Status\"='Inactive' and \"Approval_Status\" IN('Reviewed','Approved','Rejected') and (\"Rejected_By\" isnull or \"Rejected_By\" ='Approval')  and \"Material_Type_Code\" IN (" +mattypecode + ") and \"Vendor_Group_Description\" IN("+vengrpdesc+")" ;
																																																												// is
																																																											// null)or(\"Approval_Status\"='Approval'and																																																									// \"Status\"='Active')																																																									// ";
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcode = rs.getInt("MDM_Vendor_Code");
				String vendorname= rs.getString("First_Name");
				String vendorgroupdesc = rs.getString("Vendor_Group_Description");
				String vendorcode = rs.getString("SAP_Vendor_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");

				Vendor v = new Vendor(mdmcode, vendorcode, vendorgroupdesc, status, approvalstatus, version,vendorname);
				listall.add(v);
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
	
	
	public List<Vendor> alllists(Integer minven,Integer maxven,String sapvendorcode,String fname,String legalname, String createdby,String modifiedby,String reviewedby,String approvedby,String gstno,String panno, String coun,String stat, String vendorgroup,String legalentity,String mincreated,String maxcreated,String minmodified,String maxmodified,String minreviewed,String maxreviewed,String minapproved,String maxapproved ) throws SQLException, ClassNotFoundException

	{
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		List<Vendor> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			
			String sql = "select * from   \"STG_SCR_Vendor\" where \"MDM_Vendor_Code\" between ? and ? and  (\"SAP_Vendor_Code\" LIKE ? or 'Select'=?) and  (\"First_Name\" LIKE ? or 'Select'=?) and   (\"Legal_Name\" LIKE ? or 'Select'=?) and  (\"Created_By\" LIKE ? or 'Select'=?) and  (\"Modified_By\" LIKE ? or 'Select'=?)  and  (\"Reviewed_By\" LIKE ? or 'Select'=?) and  (\"Approved_By\" LIKE ? or 'Select'=?) and  (\"GST_No\" =? or 'Select'=?) and  (\"PAN_No\" =? or 'Select'=?) and  (\"Country_Description\" =? or 'Select'=?)  and  (\"State_Description\" =? or 'Select'=?) and  (\"Vendor_Group_Description\" =? or 'Select'=?) and  (\"Legal_Entity_Description\" =? or 'Select'=?) and (DATE(COALESCE(\"Created_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Created_Date\",'9999-01-01')) <= ?)and (DATE(COALESCE(\"Modified_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Modified_Date\",'9999-01-01')) <= ?) and (DATE(COALESCE(\"Reviewed_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Reviewed_Date\",'9999-01-01')) <= ?) and (DATE(COALESCE(\"Approved_Date\",'1900-01-01')) >= ?) and (DATE(COALESCE(\"Approved_Date\",'9999-01-01')) <= ?)  " ;
			
			

/*			String sql = "select * from   \"STG_SCR_Vendor\" where \"MDM_Vendor_Code\" between ? and ? and  (\"SAP_Vendor_Code\" =? or 'Select'=?) and  (\"First_Name\" =? or 'Select'=?) and   (\"Legal_Name\" =? or 'Select'=?) and  (\"Created_By\" =? or 'Select'=?) and  (\"Modified_By\" =? or 'Select'=?)  and  (\"Reviewed_By\" =? or 'Select'=?) and  (\"Approved_By\" =? or 'Select'=?) and  (\"GST_No\" =? or 'Select'=?) and  (\"PAN_No\" =? or 'Select'=?) and  (\"Country_Description\" =? or 'Select'=?)  and  (\"State_Description\" =? or 'Select'=?) and  (\"Vendor_Group_Description\" =? or 'Select'=?) and  (\"Legal_Entity_Description\" =? or 'Select'=?) " ;
*/			
			
			pst = con.prepareStatement(sql);
			
			pst.setInt(1,minven);
			pst.setInt(2,maxven);
			pst.setString(3, sapvendorcode+"%");
			pst.setString(4, sapvendorcode);
			pst.setString(5, fname+"%");
			pst.setString(6, fname);
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
			
			pst.setString(25, vendorgroup);
			pst.setString(26, vendorgroup);
			
			pst.setString(27, legalentity);
			pst.setString(28, legalentity);
			
			
			
		Date	d = java.sql.Date.valueOf (mincreated);


		Date	d1 = java.sql.Date.valueOf (maxcreated);
		
		
		
			pst.setDate(29, d);
			pst.setDate(30, d1);
			
			Date	d2 = java.sql.Date.valueOf (minmodified);


			Date	d3 = java.sql.Date.valueOf (maxmodified);
			
			pst.setDate(31, d2);
			pst.setDate(32, d3);
			
			Date	d4 = java.sql.Date.valueOf (minreviewed);

			Date	d5 = java.sql.Date.valueOf (maxreviewed);
			
			pst.setDate(33, d4);
			pst.setDate(34, d5);

			Date	d6 = java.sql.Date.valueOf (minapproved);
			Date	d7 = java.sql.Date.valueOf (maxapproved);
			
			
			pst.setDate(35, d6);
			pst.setDate(36, d7);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				Integer mdmcode = rs.getInt("MDM_Vendor_Code");
				String  sapcode = rs.getString("SAP_Vendor_Code");
				String vendorgroupdesc = rs.getString("Vendor_Group_Description");
				String title = rs.getString("Title_Description");
				String firstname= rs.getString("First_Name");
				String lastname= rs.getString("Last_Name");
				String name2= rs.getString("Name2");
				String LegalName= rs.getString("Legal_Name");
				String country= rs.getString("Country_Description");
				String state= rs.getString("State_Description");
				String houseno= rs.getString("House_No");
				String street= rs.getString("Street");
				String street1= rs.getString("Street1");
				String street2= rs.getString("Street2");
				String Pin_Code= rs.getString("Pin_Code");
				String City= rs.getString("City");
				String Fax_Number= rs.getString("Fax_Number");
				String Mobile_No= rs.getString("Mobile_No");
				String Telephone_No= rs.getString("Telephone_No");
				String EMail_Id= rs.getString("EMail_Id");
				String GST_Fileing= rs.getString("GST_Fileing_Description");
				String Material_Type= rs.getString("Material_Type_Description");
				String Sales_Person= rs.getString("Sales_Person");
				String Sales_Person_Tele_No= rs.getString("Sales_Person_Tele_No");
				String Bank_Key= rs.getString("Bank_Key");
				String Bank_Name= rs.getString("Bank_Name");
				String Bank_Account_No= rs.getString("Bank_Account_No");
				String Incoterm= rs.getString("Incoterm_Description");
				String Currency= rs.getString("Currency_Description");
				String Payment_Term= rs.getString("Payment_Term_Description");
				String Payment_Methods= rs.getString("Payment_Methods");
				String VendorClass_Description= rs.getString("VendorClass_Description");
				String GST_No= rs.getString("GST_No");
				String PAN_No= rs.getString("PAN_No");
				String Adhaar_No= rs.getString("Adhaar_No");
				String GL_Code= rs.getString("GL_Code");
				String Legal_Entity_Description= rs.getString("Legal_Entity_Description");
				String ID_Type_Description= rs.getString("ID_Type_Description");
				String Identification_Number= rs.getString("Identification_Number");
				String Payment_Block= rs.getString("Payment_Block_Description");
				String Actual_QM_sys= rs.getString("Actual_QM_sys_Description");
				String Inco_Location1= rs.getString("Inco_Location1");
				String status = rs.getString("Status");
				
				String Created_By= rs.getString("Created_By");
				String Created_Date= rs.getString("Created_Date");
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
				
				
			Vendor v =new Vendor(mdmcode, sapcode, vendorgroupdesc, title, firstname, lastname, name2, LegalName, country, state, houseno, street, street1, street2, Pin_Code, City, Fax_Number, Mobile_No, Telephone_No, EMail_Id, GST_Fileing, Material_Type, Sales_Person, Sales_Person_Tele_No, Bank_Key, Bank_Name, Bank_Account_No, Incoterm, Currency, Payment_Methods, VendorClass_Description, GST_No, PAN_No, GL_Code, Legal_Entity_Description, ID_Type_Description, Identification_Number, Payment_Block, Actual_QM_sys, Inco_Location1, status, Created_By, Modified_By, Reviewed_By, Approved_By, approvalstatus, Reason_For_Edit, Reason_For_Reject, Reason_For_Block, Block, version, Reviewer_Username, Payment_Term, Adhaar_No,Created_Date.substring(0,10),Modified_Date,Reviewed_Date,Approved_Date);
				
				listall.add(v);
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
	public List<String> getReviewerUsername1(String vengroupcode) throws SQLException, ClassNotFoundException
	{
		List<String> listrevusername = new ArrayList<>();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try
		{
			con = AuditConnection.getConnection();
			String sql ="SELECT DISTINCT  \"User\".\"Userid\"||'-'||\"User\".\"Userdisplayname\" as username FROM \"User\" INNER JOIN \"Rolelist\" ON \"Rolelist\".\"Rolename\" = \"User\".\"Role\" INNER JOIN \"Role_Vendor_MaterialType\" ON \"Role_Vendor_MaterialType\".\"Rolename\"= \"User\".\"Role\" INNER JOIN \"Role_Vendor_VendorGroup\" ON \"Role_Vendor_VendorGroup\".\"Rolename\" = \"User\".\"Role\" where \"Rolelist\".\"SCR_Vendor\" ='Reviewer' and \"Role_Vendor_VendorGroup\".\"Vendor_Group_Description\" IN('"+vengroupcode+"')" ;
			
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
	
	public List<Vendor> getReviewerUsername(String mattypecode,String vengrpdesc) throws SQLException, ClassNotFoundException

	{
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Vendor> listrevusername = new ArrayList<>();
		try {
			con = AuditConnection.getConnection();
			String sql ="SELECT DISTINCT  \"User\".\"Userid\"||'-'||\"User\".\"Userdisplayname\" as username FROM \"User\" INNER JOIN \"Rolelist\" ON \"Rolelist\".\"Rolename\" = \"User\".\"Role\" INNER JOIN \"Role_Vendor_MaterialType\" ON \"Role_Vendor_MaterialType\".\"Rolename\"= \"User\".\"Role\" INNER JOIN \"Role_Vendor_VendorGroup\" ON \"Role_Vendor_VendorGroup\".\"Rolename\" = \"User\".\"Role\" where \"Rolelist\".\"SCR_Vendor\" ='Reviewer' and \"Role_Vendor_MaterialType\".\"Material_Type_Code\" IN (" +mattypecode + ") and \"Role_Vendor_VendorGroup\".\"Vendor_Group_Description\" IN("+vengrpdesc+")" ;
																																																												// is
																																																											// null)or(\"Approval_Status\"='Approval'and																																																									// \"Status\"='Active')																																																									// ";
			pst = con.prepareStatement(sql);
			
			rs = pst.executeQuery();
			while (rs.next()) {
				
				String reviewername= rs.getString("username");
				Vendor v = new Vendor(reviewername);
				listrevusername.add(v);
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

	
	
	public List<Vendor> reviewlist(String mattypecode,String vengrpdesc,String userid_username) throws SQLException, ClassNotFoundException

	{
		
		
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		List<Vendor> listall = new ArrayList<>();
		try {
			con = ETLConnection.getConnection();
			String sql = "select \"MDM_Vendor_Code\",\"First_Name\",\"Vendor_Group_Description\",\"Vendor_Group_Type\",\"SAP_Vendor_Code\",\"Version\",\"Status\",\"Approval_Status\" from \"STG_SCR_Vendor\" where \"Status\"='Inactive' and \"Approval_Status\" IN('Pending','Reviewed','Rejected') and \"Material_Type_Code\" IN (" +mattypecode + ") and \"Vendor_Group_Description\" IN("+vengrpdesc+") and  \"Reviewer_Username\"=? " ;
																																																			// \"Status\"='Active')																																																								// ";
			pst = con.prepareStatement(sql);
			pst.setString(1,userid_username);
			//pst.setString(2,vengrpdesc);
			rs = pst.executeQuery();
			
			while (rs.next()) {
				Integer mdmcode = rs.getInt("MDM_Vendor_Code");
				
				
				String vendorname= rs.getString("First_Name");
				String vendorgroupdesc = rs.getString("Vendor_Group_Description");
				String vendorcode = rs.getString("SAP_Vendor_Code");
				Integer version = rs.getInt("Version");
				String status = rs.getString("Status");
				String approvalstatus = rs.getString("Approval_Status");

				Vendor v = new Vendor(mdmcode, vendorcode, vendorgroupdesc, status, approvalstatus, version,vendorname);
				listall.add(v);
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
