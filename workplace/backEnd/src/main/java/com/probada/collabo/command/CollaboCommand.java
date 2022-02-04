package com.probada.collabo.command;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class CollaboCommand {
	
	private String userId;
	private String projNo;
	private String title;
	
	//콜라보 제안 메일 
	private int mailNo = 0;
	private String userTo;
	private String userFrom;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String status;
	@JsonIgnoreProperties(ignoreUnknown = true)
	private String dist;
	private String recvDel;
	private String sentDel;
	
	
	public int getMailNo() {
		return mailNo;
	}
	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}
	public String getUserTo() {
		return userTo;
	}
	public void setUserTo(String userTo) {
		this.userTo = userTo;
	}
	public String getUserFrom() {
		return userFrom;
	}
	public void setUserFrom(String userFrom) {
		this.userFrom = userFrom;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getRecvDel() {
		return recvDel;
	}
	public void setRecvDel(String recvDel) {
		this.recvDel = recvDel;
	}
	public String getSentDel() {
		return sentDel;
	}
	public void setSentDel(String sentDel) {
		this.sentDel = sentDel;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProjNo() {
		return projNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	
	
	
}
