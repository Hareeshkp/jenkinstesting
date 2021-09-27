package com.tvs.traceability;

public class Allvalues {
	Integer mdmcode;
	String sapcode = "";
	String name="";
	String createdby="";
	Object createdon;
	String reviewedby="";
	Object reviewedon;
	String approver="";
	String status="";
	Object approvedon;
	String sapstatus="";
	Integer version;
	String documenttype="";
	
	public Allvalues()
	{
		super();
	}
	public Integer getmdmcode()
	{
		return mdmcode;
	}
	public void setmdmcode(Integer mdmcode)
	{
		this.mdmcode = mdmcode;
	}
	public String getsapcode()
	{
		return sapcode;
	}
	public void setsapcode(String sapcode)
	{
		this.sapcode = sapcode;
	}
	public String getname()
	{
		return name;
	}
	public void setname(String name)
	{
		this.name = name;
	}
	public String getcreatedby()
	{
		return createdby;
	}
	public void setcreatedby(String createdby)
	{
		this.createdby = createdby;
	}
	public Object getcreatedon()
	{
		return createdon;
	}
	public void setcreatedon(Object createdon)
	{
		this.createdon = createdon;
	}
	
	public String getreviewedby()
	{
		return reviewedby;
	}
	public void setreviewedby(String reviewedby)
	{
		this.reviewedby = reviewedby;
	}
	public Object getreviewedon()
	{
		return reviewedon;
	}
	public void setreviewedon(Object reviewedon)
	{
		this.reviewedon = reviewedon;
	}
	public String getapprover()
	{
		return approver;
	}
	public void setapprover(String approver)
	{
		this.approver = approver;
	}
	
	public String getstatus()
	{
		return status;
	}
	
	public void setstatus(String status)
	{
		this.status = status;
	}	
	public Object getapprovedon()
	{
		return approvedon;
	}
	public void setapprovedon(Object approvedon)
	{
		this.approvedon = approvedon;
	}
	
	public String getsapstatus()
	{
		return sapstatus;
	}
	public void setsapstatus(String sapstatus)
	{
		this.sapstatus = sapstatus;
	}
	public Integer getversion()
	{
		return version;
	}
	public void setversion(Integer version)
	{
		this.version = version;
	}
	public String getdocumenttype()
	{
		return documenttype;
	}
	public void setdocumenttype(String documenttype)
	{
		this.documenttype = documenttype;
	}
	public Allvalues(Integer mdmcode,String sapcode,String name,String createdby,Object createdon,String reviewedby,Object reviewedon,String approver,String status,Object approvedon,String sapstatus,Integer version,String documenttype)
	{
		super();
		this.mdmcode = mdmcode;
		this.sapcode = sapcode;
		this.name = name;
		this.createdby = createdby;
		this.createdon = createdon;
		this.reviewedby = reviewedby;
		this.reviewedon = reviewedon;
		this.approver = approver;
		this.status = status;
		this.approvedon = approvedon;
		this.sapstatus = sapstatus;
		this.version = version;
		this.documenttype = documenttype;		
	}

	
	
	
}
