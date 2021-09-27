package com.tvs.costing;




public class SpecialProcurement {
	String spcode;
	String spdescription;
	
	public String getspcode()
	{
		return spcode;
	}
	
	public void setspcode(String spcode)
	{
		this.spcode = spcode;
	}
	
	public String getspdescription()
	{
		return spdescription;
	}
	public void setspdescription(String spdescription)
	{
		this.spdescription = spdescription;
	}
	public SpecialProcurement()
	{
		super();
	}
	public SpecialProcurement(String spcode,String spdescription)
	{
		super();
		this.spcode = spcode;
		this.spdescription = spdescription;
	}
	
	

}
