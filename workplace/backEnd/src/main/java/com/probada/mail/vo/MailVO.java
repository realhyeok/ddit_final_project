package com.probada.mail.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MailVO {
	private String mailNo;
	private String title;
	private String userTo;
	private String userFrom;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String status;
	private String docContNo;
	
	public String getMailNo() {
		return mailNo;
	}
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getDocContNo() {
		return docContNo;
	}
	public void setDocContNo(String docContNo) {
		this.docContNo = docContNo;
	}
}
