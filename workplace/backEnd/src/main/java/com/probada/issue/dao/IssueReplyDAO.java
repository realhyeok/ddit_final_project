package com.probada.issue.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.issue.vo.IssueReplyVO;

public interface IssueReplyDAO {

	public List<IssueReplyVO> selectIssueReplyListByIssueNo(String issueNo) throws SQLException;
}
