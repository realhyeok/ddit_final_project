package com.probada.milestone.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.milestone.vo.MilestoneVO;

public interface MilestoneService {

	public List<MilestoneVO> getMilestoneListByProjNo(String projNo) throws SQLException;

}
