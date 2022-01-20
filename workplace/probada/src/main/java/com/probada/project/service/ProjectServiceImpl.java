package com.probada.project.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.dao.ProjectDAO;
import com.probada.project.vo.ProjectVO;

public class ProjectServiceImpl implements ProjectDAO {

	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}



	@Override
	public List<ProjectVO> selectProjectList() throws SQLException {

		List<ProjectVO> projectList = projectDAO.selectProjectList();
		return projectList;
	}

}
