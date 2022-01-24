package com.probada.milestone.vo;

public class MilestoneVO {

	private String status;
	private String userId;
	private String mileNo;
	private String title;
	private String content;
	private String projNo;
	private String regdate;

	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getStatus() {
		return status;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
	}
	public void setMileNo(String mileNo) {
		this.mileNo = mileNo;
	}
	public String getMileNo() {
		return mileNo;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle() {
		return title;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getProjNo() {
		return projNo;
	}

}
