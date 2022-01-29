package com.probada.issue.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.issue.vo.IssueReplyVO;

public class IssueReplyDAOImpl implements IssueReplyDAO {


	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<IssueReplyVO> selectIssueReplyListByIssueNo(String issueNo) throws SQLException {

		List<IssueReplyVO> replyVO = sqlSession.selectList("IssueReply-Mapper.selectIssueReplyListByIssueNo", issueNo);

		return replyVO;
	}

}
