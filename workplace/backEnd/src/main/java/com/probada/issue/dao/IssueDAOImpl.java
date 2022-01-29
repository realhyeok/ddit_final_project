package com.probada.issue.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;

public class IssueDAOImpl implements IssueDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<IssueVO> selectIssueListByProjNo(String projNo) throws SQLException {

		List<IssueVO> issueList = sqlSession.selectList("Issue-Mapper.selectIssueListByProjNo", projNo);

		return issueList;
	}

	@Override
	public List<MileIssueVO> selectMileIssueListByIssueNo(String issueNo) throws SQLException {

		List<MileIssueVO> mileIssueList = sqlSession.selectList("Issue-Mapper.selectMileIssueListByIssueNo",issueNo);

		return mileIssueList;
	}

	@Override
	public void updateIssueByIssueNo(IssueVO issueVO) throws SQLException {

		sqlSession.update("Issue-Mapper.updateIssueByIssueNo",issueVO);

	}

	@Override
	public IssueVO selectIssueByIssueNo(IssueVO issueVO) throws SQLException {

		IssueVO issueVo = sqlSession.selectOne("Issue-Mapper.selectIssueByIssueNo", issueVO);

		return issueVo;
	}

}
