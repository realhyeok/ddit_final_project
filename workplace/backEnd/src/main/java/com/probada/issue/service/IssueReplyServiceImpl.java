package com.probada.issue.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.issue.dao.IssueReplyDAO;
import com.probada.issue.vo.IssueReplyVO;

public class IssueReplyServiceImpl implements IssueReplyService {

	private IssueReplyDAO issueReplyDAO;
	public void setIssueReplyDAO(IssueReplyDAO issueReplyDAO) {
		this.issueReplyDAO = issueReplyDAO;
	}

	@Override
	public List<IssueReplyVO> getIssueReplyListByIssueNo(String issueNo) throws SQLException {

		List<IssueReplyVO> issueReplyList = issueReplyDAO.selectIssueReplyListByIssueNo(issueNo);

		return issueReplyList;
	}

}
