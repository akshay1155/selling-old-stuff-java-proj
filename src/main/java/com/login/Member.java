package com.login;

public class Member {
	
	private String uname,email,phone,pass;

	public Member() {
		super();
	}
	public Member(String uname, String email, String phone, String pass) {
		super();
		this.uname = uname;
		this.email = email;
		this.phone = phone;
		this.pass = pass;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}
