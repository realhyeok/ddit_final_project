package com.probada.issue.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;

public interface IssueDAO {

	public List<IssueVO> selectIssueListByProjNo(String projNo) throws SQLException;

	public List<MileIssueVO> selectMileIssueListByIssueNo(String issueNo) throws SQLException;

}
