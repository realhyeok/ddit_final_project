package com.probada.totalSearch.dao;

import java.util.List;

import com.probada.project.vo.ProjectVO;
import com.probada.user.vo.UserVO;

public interface SearchDAO {

	
	
	public List<UserVO> selectUserBySearch(String searchDate);
	
	public List<ProjectVO> selectProjectBySearch(String searchDate);
		
		
	public List<String> selectPLBySearch(String searchDate);

	
	
	

}
