package com.probada.mail.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

public class MailVO {
	private String mailNo;
	private String title;
	private String userTo;
	private String userFrom;
	private String content;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	private String status;
	@JsonIgnoreProperties(ignoreUnknown = true)
	private String docContNo;
	private String dist;
	private String recvDel;
	private String sentDel;
	
	private List<AttachVO> attachList;

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
	
	public List<AttachVO> getAttachList() {
		return attachList;
	}
	public void setAttachList(List<AttachVO> attachList) {
		this.attachList = attachList;
	}
}
