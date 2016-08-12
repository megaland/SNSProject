package com.busanit.model;

public class FriendBean {
	private int num;
	private String id;
	private String friendid;
	
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
	public String getFriendid() {
		return friendid == null ? "" : friendid.trim();
	}
	public void setFriendid(String friendid) {
		this.friendid = friendid;
	}
	
	
}
