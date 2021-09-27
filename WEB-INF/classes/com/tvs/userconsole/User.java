package com.tvs.userconsole;

public class User {
	String rolename;
	String username;
	String userid;
	String status;
	String email;
	String password;
	String approvalemail;
	
	

	

	public String getApprovalemail() {
		return approvalemail;
	}

	public void setApprovalemail(String approvalemail) {
		this.approvalemail = approvalemail;
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

	public User(String rolename, String username, String userid, String status,String email) {
		super();
		this.rolename = rolename;
		this.username = username;
		this.userid = userid;
		this.status = status;
		this.email=email;
	
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User(String rolename) {
		super();
		this.rolename = rolename;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getRolename() {
		return rolename;
	}

	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	
	
	
	

}
