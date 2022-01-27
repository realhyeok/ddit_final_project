package com.probada.mail.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AttachVO {
	private String attachNo;
	private String mailNo;
	private String filePath;
	private String fileName;
	private String fileType;
	private long fileSize;
	private String attacher;
	@JsonFormat(pattern="yyyy-MM-dd")
	private String regDate;
	
	public String getAttachNo() {
		return attachNo;
	}
	public void setAttachNo(String attachNo) {
		this.attachNo = attachNo;
	}
	public String getMailNo() {
		return mailNo;
	}
	public void setMailNo(String mailNo) {
		this.mailNo = mailNo;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getAttacher() {
		return attacher;
	}
	public void setAttacher(String attacher) {
		this.attacher = attacher;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
