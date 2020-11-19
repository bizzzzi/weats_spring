package com.dto;

public class MemberDTO {
	String user_id;
	String user_name;
	String user_email;
	String user_pw;
	String salt;
	int user_verify;
	int partner_verify;
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String user_id, String user_name, String user_email, String user_pw, String salt, int user_verify,
			int partner_verify) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.salt = salt;
		this.user_verify = user_verify;
		this.partner_verify = partner_verify;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public int getUser_verify() {
		return user_verify;
	}

	public void setUser_verify(int user_verify) {
		this.user_verify = user_verify;
	}

	public int getPartner_verify() {
		return partner_verify;
	}

	public void setPartner_verify(int partner_verify) {
		this.partner_verify = partner_verify;
	}
	
	
}
