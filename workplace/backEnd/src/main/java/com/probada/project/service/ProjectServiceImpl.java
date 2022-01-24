package com.probada.project.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.project.dao.ProjectDAO;
import com.probada.project.vo.ProjectVO;

@Service
public class ProjectServiceImpl implements ProjectService {

	private ProjectDAO projectDAO;
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}

	@Override
	public List<ProjectVO> getProjectList() throws SQLException {

		List<ProjectVO> projectList = projectDAO.selectProjectList();

		return projectList;
	}

	@Override
	public ProjectVO getProjectByProjNo(String projNo) throws SQLException {

		ProjectVO projectVO = projectDAO.selectProjectByProjNo(projNo);

		return projectVO;
	}


}
