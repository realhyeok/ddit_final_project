package com.probada.collabo.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.dao.CollaboDAO;
import com.probada.collabo.vo.CollaboVO;

public class CollaboServiceImpl implements CollaboService {
	
	private CollaboDAO collaboDAO;
	public void setCollaboDAO(CollaboDAO collaboDAO) {
		this.collaboDAO = collaboDAO;
	}
	
	@Override
	public List<CollaboVO> getCollaboList() throws SQLException {
		
		List<CollaboVO> collaboList = collaboDAO.selectCollaboList();
		
		return collaboList;
	}

	@Override
	public CollaboVO getCollaboByCprojNo(String cprojNo) throws SQLException {
		
		CollaboVO collaboVO = collaboDAO.selectCollaboByCprojNo(cprojNo);
		
		return collaboVO;
	}

}
