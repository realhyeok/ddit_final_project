package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.vo.CollaboVO;

public interface CollaboDAO {
	
	public List<CollaboVO> selectCollaboList() throws SQLException;
	
	public CollaboVO selectCollaboByCprojNo(String cprojNo) throws SQLException;
	
}
