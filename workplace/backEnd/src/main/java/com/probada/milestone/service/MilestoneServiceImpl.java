package com.probada.milestone.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.milestone.dao.MilestoneDAO;
import com.probada.milestone.vo.MilestoneVO;

public class MilestoneServiceImpl implements MilestoneService {

	private MilestoneDAO milestoneDAO;
	public void setMilestoneDAO(MilestoneDAO milestoneDAO) {
		this.milestoneDAO = milestoneDAO;
	}


	@Override
	public List<MilestoneVO> getMilestoneListByProjNo(String projNo) throws SQLException {

		List<MilestoneVO> milestoneList = milestoneDAO.selectMilestoneListByProjNo(projNo);

		return milestoneList;
	}

}
