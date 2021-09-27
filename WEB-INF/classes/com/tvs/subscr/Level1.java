package com.tvs.subscr;

public class Level1 {
	String Logic;
	String description;
	
	public String getLogic() {
		return Logic;
	}
	public void setLogic(String logic) {
		Logic = logic;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Level1() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Level1(String logic, String description) {
		super();
		Logic = logic;
		this.description = description;
	}
	

}
