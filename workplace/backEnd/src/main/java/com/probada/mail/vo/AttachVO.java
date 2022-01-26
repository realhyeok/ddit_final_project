package com.probada.mail.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AttachVO {
	
	private String docNo;
	private String docContNo;
	private String projNo;
	private String userId;
	private String uploadPath;
	private String fileName;
	private String fileType;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date regDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date updateDate;
	private String desc;
	private String status;
	private String dist;
	private String isDirectory;
	private String hasDirectory;
	private int docSize;
	
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getDocContNo() {
		return docContNo;
	}
	public void setDocContNo(String docContNo) {
		this.docContNo = docContNo;
	}
	public String getProjNo() {
		return projNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
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
	public String getIsDirectory() {
		return isDirectory;
	}
	public void setIsDirectory(String isDirectory) {
		this.isDirectory = isDirectory;
	}
	public String getHasDirectory() {
		return hasDirectory;
	}
	public void setHasDirectory(String hasDirectory) {
		this.hasDirectory = hasDirectory;
	}
	public int getDocSize() {
		return docSize;
	}
	public void setDocSize(int docSize) {
		this.docSize = docSize;
	}
}
