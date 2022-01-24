package com.probada.milestone.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.milestone.vo.MilestoneVO;

public class MilestoneDAOImpl implements MilestoneDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<MilestoneVO> selectMilestoneListByProjNo(String projNo) throws SQLException {

		List<MilestoneVO> milestoneList =
				sqlSession.selectList("Milestone-Mapper.selectMilestoneListByProjNo", projNo);

		return milestoneList;
	}

}
