package com.probada.issue.vo;

import java.util.List;

public class IssueVO {

	private String status;
	private String docContNo;
	private String startdate;
	private String regdate;
	private String important;
	private String userId;
	private String title;
	private String updatedate;
	private String content;
	private String issueNo;
	private String projNo;
	private String enddate;

	private Object mileNo;

	public Object getMileNo() {
		return mileNo;
	}
	public void setMileNo(Object mileNo) {
		this.mileNo = mileNo;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setDocContNo(String docContNo) {
		this.docContNo = docContNo;
	}
	public String getDocContNo() {
		return docContNo;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setImportant(String important) {
		this.important = important;
	}
	public String getImportant() {
		return important;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}
	public String getIssueNo() {
		return issueNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getProjNo() {
		return projNo;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getEnddate() {
		return enddate;
	}

}
