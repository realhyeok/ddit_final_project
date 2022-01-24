package com.probada.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.project.dao.ProjectTagDAO;
import com.probada.project.vo.ProjectTagVO;

@Service
public class ProjectTagServiceImpl implements ProjectTagService {

	private ProjectTagDAO projectTagDAO;
	public void setProjectTagDAO(ProjectTagDAO projectTagDAO) {
		this.projectTagDAO = projectTagDAO;
	}
	@Override
	public List<ProjectTagVO> getTagNameList(String projNo) throws SQLException {

		List<ProjectTagVO> projectTagList = projectTagDAO.selectTagNameList(projNo);

		return projectTagList;
	}


}
