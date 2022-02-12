package com.probada.totalSearch.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.vo.ProjectVO;
import com.probada.user.vo.UserVO;

public interface SearchService {

	
	public List<UserVO> getResultSearchUser(String searchResult) throws SQLException;
	public List<ProjectVO> getResultSearchProject(String searchResult) throws SQLException;
	public List<String> getResultSearchPL(String searchResult) throws SQLException;
	
	
	
}