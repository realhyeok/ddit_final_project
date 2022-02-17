package com.probada.project.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.vo.ProjectTagVO;

public interface ProjectTagDAO {

	public List<ProjectTagVO> selectTagNameList(String projNo) throws SQLException;

	public List<ProjectTagVO> selectProjectListByTagNo(String tagNo);

}
