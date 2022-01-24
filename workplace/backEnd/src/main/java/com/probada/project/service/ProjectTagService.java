package com.probada.project.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.project.vo.ProjectTagVO;

public interface ProjectTagService {

	public List<ProjectTagVO> getTagNameList(String projNo) throws SQLException;



}
