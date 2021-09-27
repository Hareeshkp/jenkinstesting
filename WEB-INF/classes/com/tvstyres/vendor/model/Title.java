package com.tvstyres.vendor.model;

public class Title {
	
	private String title;
	private String code;
	

	public Title(String title, String code) {
		super();
		this.title = title;
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Title() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
