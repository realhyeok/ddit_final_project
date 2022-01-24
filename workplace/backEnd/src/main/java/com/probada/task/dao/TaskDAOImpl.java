package com.probada.task.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.task.vo.TaskVO;

public class TaskDAOImpl implements TaskDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public Integer selectTaskCountByProjectNo(String projNo) throws SQLException {

		int result = sqlSession.selectOne("Task-Mapper.selectTaskCountByProjectNo", projNo);

		return result;
	}

	@Override
	public List<TaskVO> selectTaskListByProjectNo(String projNo) throws SQLException {

		List<TaskVO> taskVOList = sqlSession.selectList("Task-Mapper.selectTaskListByProjectNo", projNo);

		return taskVOList;
	}

}
