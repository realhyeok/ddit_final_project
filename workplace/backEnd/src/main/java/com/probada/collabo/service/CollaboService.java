package com.probada.collabo.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.vo.CollaboVO;

public interface CollaboService {
	
	public List<CollaboVO> getCollaboList() throws SQLException;
	
	public CollaboVO getCollaboByCprojNo(String cprojNo) throws SQLException;
}
