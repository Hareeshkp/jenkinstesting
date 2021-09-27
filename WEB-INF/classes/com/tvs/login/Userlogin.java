package com.tvs.login;

import java.sql.Timestamp;

public class Userlogin {
	
	String userid;
	String username;
	String password;
	String email;
	Timestamp passmodifieddate;
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getPassmodifieddate() {
		return passmodifieddate;
	}
	public void setPassmodifieddate(Timestamp passmodifieddate) {
		this.passmodifieddate = passmodifieddate;
	}
	
	
	
	

}
