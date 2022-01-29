package com.probada.chat.vo;

import java.util.Date;

public class ChatVO {

	
	private String chatroom_no;
	private String user_id;
	private String proj_no;
	private String title;
	private Date regdate;
	private String realRoom;
	
	
	
	
	public String getRealRoom() {
		return realRoom;
	}
	public void setRealRoom(String realRoom) {
		this.realRoom = realRoom;
	}
	public String getChatroom_no() {
		return chatroom_no;
	}
	public void setChatroom_no(String chatroom_no) {
		this.chatroom_no = chatroom_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getProj_no() {
		return proj_no;
	}
	public void setProj_no(String proj_no) {
		this.proj_no = proj_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "ChatVO [chatroom_no=" + chatroom_no + ", user_id=" + user_id + ", proj_no=" + proj_no + ", title="
				+ title + ", regdate=" + regdate + "]";
	}
	
	
	
	
	
	
	
	
	
	
}
