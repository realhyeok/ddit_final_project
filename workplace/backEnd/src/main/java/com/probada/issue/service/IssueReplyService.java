package com.probada.issue.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.issue.vo.IssueReplyVO;

public interface IssueReplyService {

	public List<IssueReplyVO> getIssueReplyListByIssueNo(String issueNo) throws SQLException;
}
