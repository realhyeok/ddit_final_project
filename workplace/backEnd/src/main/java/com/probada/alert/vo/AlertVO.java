package com.probada.alert.vo;

import java.util.Date;

public class AlertVO {
	
	private String userId;
	private String nickName;
	private Date writeTime;
	private String content;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickname() {
		return nickName;
	}
	public void setNickname(String nickName) {
		this.nickName = nickName;
	}
	public Date getWriteTime() {
		return writeTime;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
