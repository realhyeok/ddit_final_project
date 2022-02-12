package com.probada.totalSearch.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.project.vo.ProjectVO;
import com.probada.user.vo.UserVO;

public class SearchDAOImpl implements SearchDAO {

	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	
	@Override
	public List<UserVO> selectUserBySearch(String searchDate) {
		
		List<UserVO> user = sqlSession.selectList("Search-Mapper.selectUserBySearch",searchDate);
		return user;
	}
	
	
	@Override
	public List<ProjectVO> selectProjectBySearch(String searchDate) {
		
		List<ProjectVO> project = sqlSession.selectList("Search-Mapper.selectProjectBySearch",searchDate);
		return project;
	}


	@Override
	public List<String> selectPLBySearch(String searchDate) {
		List<String> pl = sqlSession.selectList("Search-Mapper.selectPLBySearch",searchDate);
		return pl;
	}


	
	
	
	
	
	

}
