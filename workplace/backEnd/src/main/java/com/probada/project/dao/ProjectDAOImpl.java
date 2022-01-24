package com.probada.project.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.project.vo.ProjectVO;

public class ProjectDAOImpl implements ProjectDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<ProjectVO> selectProjectList() throws SQLException{

		List<ProjectVO> projectList = sqlSession.selectList("Project-Mapper.selectProjectList");

		return projectList;
	}

	@Override
	public ProjectVO selectProjectByProjNo(String projNo) throws SQLException {

		ProjectVO projectVO = sqlSession.selectOne("Project-Mapper.selectProjectByProjNo",projNo);

		return projectVO;
	}

}
