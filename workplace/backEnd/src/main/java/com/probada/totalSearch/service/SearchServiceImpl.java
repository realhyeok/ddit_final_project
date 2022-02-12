package com.probada.totalSearch.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.project.dao.ProjectDAO;
import com.probada.project.vo.ProjectVO;
import com.probada.totalSearch.dao.SearchDAO;
import com.probada.user.vo.UserVO;

@Service
public class SearchServiceImpl implements SearchService {

	private SearchDAO searchDAO;
	public void setSearchDAO(SearchDAO searchDAO) {
		this.searchDAO = searchDAO;
	}
	
	
	
	@Override
	public List<UserVO> getResultSearchUser(String searchResult) throws SQLException {
		
		 List<UserVO> user = new ArrayList<UserVO>();
		 user = searchDAO.selectUserBySearch(searchResult);
		
		return user;
	}
	@Override
	public List<ProjectVO> getResultSearchProject(String searchResult) throws SQLException {
		
		
		
		 List<ProjectVO> project = new ArrayList<ProjectVO>();
		 project = searchDAO.selectProjectBySearch(searchResult);
		
		 return project;
		 
	}



	@Override
	public List<String> getResultSearchPL(String searchResult) throws SQLException {
		

		 List<String> PL = new ArrayList<String>();
		 PL = searchDAO.selectPLBySearch(searchResult);
		
		 return PL;
	}

	

	
	
	
	
	



}
