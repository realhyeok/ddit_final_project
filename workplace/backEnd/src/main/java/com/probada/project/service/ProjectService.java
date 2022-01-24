package com.probada.project.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.vo.ProjectVO;

public interface ProjectService {

	public List<ProjectVO> getProjectList() throws SQLException;

	public ProjectVO getProjectByProjNo(String projNo) throws SQLException;

}