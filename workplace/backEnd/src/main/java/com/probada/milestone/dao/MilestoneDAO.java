package com.probada.milestone.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.milestone.vo.MilestoneVO;

public interface MilestoneDAO {

	public List<MilestoneVO> selectMilestoneListByProjNo(String projNo) throws SQLException;

}
