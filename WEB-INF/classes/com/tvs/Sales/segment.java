package com.tvs.Sales;

public class segment {
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
	public segment(String code, String desc)
	{
		super();
		this.code =  code;
		this.desc =  desc;
		
		
	}
}
