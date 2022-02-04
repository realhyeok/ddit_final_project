package com.probada.issue.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;

public interface IssueService {

	public List<IssueVO> getIssueListByProjNo(String projNo) throws SQLException;

	public List<MileIssueVO> selectMileIssueListByIssueNo(String issueNo) throws SQLException;

	public IssueVO getIssueByIssueNo(IssueVO issueVO) throws SQLException;

	public void modifyIssueByIssueNo(IssueVO issueVO) throws SQLException;
	
	public String registIssue(IssueVO issueVO) throws SQLException;
}
