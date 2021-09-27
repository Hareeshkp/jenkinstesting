package com.tvs.Sales;

public class CC {
	String code;
	String desc;
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getDesc()
	{
		return desc;
	}
	public void setDesc(String desc)
	{
		this.desc = desc;
	}
	public CC(String code, String desc)
	{
		super();
		this.code =  code;
		this.desc =  desc;		
	}

}
