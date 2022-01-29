package com.probada.chat.vo;

import java.util.Date;

public class ChatMessageVO {

	private String chatroom_msg_no;
	private String chatroom_no;
	private String user_id;
	private String content;
	private Date regdate;
	private String doc_cont_no;
	
	
	
	
	public String getChatroom_msg_no() {
		return chatroom_msg_no;
	}
	public void setChatroom_msg_no(String chatroom_msg_no) {
		this.chatroom_msg_no = chatroom_msg_no;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDoc_cont_no() {
		return doc_cont_no;
	}
	public void setDoc_cont_no(String doc_cont_no) {
		this.doc_cont_no = doc_cont_no;
	}
	
	
	
	
	
	
	
	
	
	
}
