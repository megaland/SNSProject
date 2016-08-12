package com.busanit.model;

public class RegisterBean {
	private int num;
	private String id;
	private String nicname;
	private String password;
	private String email;
	private String registerdate;
	private String tel;
	private String introduce;
	private String picture;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id == null ? "" : id.trim();
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNicname() {
		return nicname == null ? "" : nicname.trim();
	}
	public void setNicname(String nicname) {
		this.nicname = nicname;
	}
	public String getPassword() {
		return password == null ? "" : password.trim();
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email == null ? "" : email.trim();
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegisterdate() {
		return registerdate == null ? "" : registerdate.trim();
	}
	public void setRegisterdate(String registerdate) {
		this.registerdate = registerdate;
	}
	public String getTel() {
		return tel == null ? "" : tel.trim();
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIntroduce() {
		return introduce == null ? "" : introduce.trim();
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getPicture() {
		return picture == null ? "" : picture.trim();
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
