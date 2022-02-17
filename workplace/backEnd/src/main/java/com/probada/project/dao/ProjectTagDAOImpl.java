package com.probada.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.project.vo.ProjectTagVO;

public class ProjectTagDAOImpl implements ProjectTagDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProjectTagVO> selectTagNameList(String projNo) throws SQLException {

		List<ProjectTagVO> projectTagList = sqlSession.selectList("ProjectTag-Mapper.selectTagNameList", projNo);

		return projectTagList;
	}

	@Override
	public List<ProjectTagVO> selectProjectListByTagNo(String tagNo) {
		return sqlSession.selectList("ProjectTag-Mapper.selectProjectListByTagNo", tagNo);
	}


}
