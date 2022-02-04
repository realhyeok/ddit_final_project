package com.probada.issue.vo;

import java.util.List;

import com.probada.user.vo.UserVO;

public class IssueReplyVO {

	private String regdate;
	private String userId;
	private String updatedate;
	private String content;
	private String issueNo;
	private String issueResNo;
	private String projNo;
	
	
	private UserVO userVO;
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserId() {
		return userId;
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
	public void setIssueResNo(String issueResNo) {
		this.issueResNo = issueResNo;
	}
	public String getIssueResNo() {
		return issueResNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public String getProjNo() {
		return projNo;
	}

}
