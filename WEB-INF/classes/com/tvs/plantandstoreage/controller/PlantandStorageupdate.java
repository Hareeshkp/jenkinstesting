package com.tvs.plantandstoreage.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tvs.plantandstorage.PlantandStorage;
import com.tvs.plantandstorage.PlantandStorageDAO;

@WebServlet("/Plantandstorageupdate")
public class PlantandStorageupdate extends HttpServlet

{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession(false);
		if(session!=null)
		{
			
		String modifiedby = (String) session.getAttribute("username");// createdby

		String tcode = request.getParameter("MDMCode");
		Integer ttcode = Integer.parseInt(tcode);// mdmcode

		String materialcode = request.getParameter("matcode"); // MaterialCode

		String materialcodedesc = request.getParameter("MDesc");

		String materialtype = request.getParameter("mattype");

		String materialtypes[] = materialtype.split("-");

		String materialtypecode = materialtypes[0]; // MaterialtypeCode
		String materialtypedesc = materialtypes[1]; // Material type Description

		String plant = request.getParameter("plant"); // plantcode
		String plantdesc = request.getParameter("plantdesc");

		String mins = request.getParameter("minshelf"); // minshelf

		Integer minshelf = null;

		if (mins.isEmpty()) {
			minshelf = null;

		} else {
			minshelf = Integer.parseInt(request.getParameter("minshelf")); // minshelf

		}

		String totals = request.getParameter("totalshelf"); // totalshelf

		Integer totalshelf = null;

		if (totals.isEmpty()) {
			totalshelf = null;
		}

		else {
			totalshelf = Integer.parseInt(request.getParameter("totalshelf")); // totalshelf

		}
		String storagebin = request.getParameter("storagebin"); // storagebin

		String profitcentercode = request.getParameter("ProfitCenteid"); // profitcentercode
		String profitcenterdesc = request.getParameter("ProfitCentedec"); // profitcenterdesc
		String serialnoprofile = request.getParameter("SerialNoid"); // serialnoprofile
		String serialnoprofiledesc = request.getParameter("SerialNo");

		String unitofissue = request.getParameter("UintID");

		String unitofissuedesc = request.getParameter("UnitDesc"); // unitofissuedesc

		String profitdesc = request.getParameter("ProfitCentedec");

		String reasonforedit = request.getParameter("reasonforedit");
		String btnStatus = request.getParameter("Save");
		if (btnStatus == null) {
			btnStatus = request.getParameter("Submit");
		}
		String stus = null;
		if (btnStatus.equals("Save")) {
			stus = "Draft";
		} else {
			stus = "Inactive";
		}

		PlantandStorage p = new PlantandStorage();
		p.setModifiedby(modifiedby);
		p.setMdmCode(ttcode);
		p.setMaterialcode(materialcode);
		p.setMaterialcodedesc(materialcodedesc);
		p.setMaterialtypecode(materialtypecode);
		p.setMaterialtypedesc(materialtypedesc);
		p.setRegionforedit(reasonforedit);
		p.setPlantcode(plant);
		p.setPlantdesc(plantdesc);
		p.setProfitcentredesc(profitdesc);
		p.setMinshelf(minshelf);
		p.setTotalshelf(totalshelf);
		p.setStoragebin(storagebin);
		p.setProfitcentrecode(profitcentercode);
		p.setProfitcentredesc(profitcenterdesc);
		p.setSerial_Number_Profile_code(serialnoprofile);
		p.setSerial_Number_Profile_Description(serialnoprofiledesc);
		p.setUnitofissue(unitofissue);
		p.setUnitofissuedesc(unitofissuedesc);
		p.setApprovalprocess("Pending");
		p.setReasonforrejection(null);
		p.setStatus(stus);

		int status = PlantandStorageDAO.Update(p);
		if (stus.equals("Inactive")) {
			stus = "Submit";
			p.setStatus(stus);
			int sss = PlantandStorageDAO.insertaudits(p);

		}
		if (status > 0 && btnStatus.equals("Save")) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Record saved sucessfully');");
			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("PlantandStorage.jsp");
			rd.include(request, response);
		}

		else if (status > 0 && btnStatus.equals("Submit")) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Record submitted sucessfully');");
			out.println("</script>");
			RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
			rd.include(request, response);

		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Unable to save');");
			out.println("</script>");

			RequestDispatcher rd = request.getRequestDispatcher("PlantandStorage.jsp");
			rd.include(request, response);
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