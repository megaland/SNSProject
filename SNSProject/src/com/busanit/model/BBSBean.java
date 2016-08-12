package com.busanit.model;

public class BBSBean {
	private int num;
	private String id;
	private String nicname;
	private String content;
	private String time;
	private String picture1;
	private String picture2;
	private int clicknum;
	
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
	public String getContent() {
		return content == null ? "" : content.trim();
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time == null ? "" : time.trim();
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getPicture1() {
		return picture1 == null ? "" : picture1.trim();
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getPicture2() {
		return picture2 == null ? "" : picture2.trim();
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public int getClicknum() {
		return clicknum;
	}
	public void setClicknum(int clicknum) {
		this.clicknum = clicknum;
	}
	
	
	
}
