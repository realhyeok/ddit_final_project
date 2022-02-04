package com.probada.task.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.probada.user.vo.UserVO;

public class TaskVO {

	private String projNo;
	private String taskNo;
	private String status;
	private String docContNo;
	private String startdate;
	private String enddate;
	private String regdate;
	private String important;
	private String userId;
	private String title;
	private String updatedate;
	private String content;

	// 출력용
	private String projTitle = "";
	private List<UserVO> userList = new ArrayList<UserVO>();
	private String nickname = "";



	@Override
	public String toString() {
		return "TaskVO [projNo=" + projNo + ", taskNo=" + taskNo + ", status=" + status + ", docContNo=" + docContNo
				+ ", startdate=" + startdate + ", enddate=" + enddate + ", regdate=" + regdate + ", important="
				+ important + ", userId=" + userId + ", title=" + title + ", updatedate=" + updatedate + ", content="
				+ content + ", projTitle=" + projTitle + ", userList=" + userList + ", nickname=" + nickname + "]";
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public List<UserVO> getUserList() {
		return userList;
	}
	public void setUserList(List<UserVO> userList) {
		this.userList = userList;
	}
	public String getProjTitle() {
		return projTitle;
	}
	public void setProjTitle(String projTitle) {
		this.projTitle = projTitle;
	}
	public String getProjNo() {
		return projNo;
	}
	public void setProjNo(String projNo) {
		this.projNo = projNo;
	}
	public void setTaskNo(String taskNo) {
		this.taskNo = taskNo;
	}
	public String getTaskNo() {
		return taskNo;
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
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent() {
		return content;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

}
