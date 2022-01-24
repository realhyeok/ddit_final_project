package com.probada.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.vo.ProjectVO;

public interface ProjectDAO {

	public List<ProjectVO> selectProjectList() throws SQLException;

	public ProjectVO selectProjectByProjNo(String projNo) throws SQLException;

}
