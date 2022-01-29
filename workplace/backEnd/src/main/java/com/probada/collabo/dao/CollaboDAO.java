package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.vo.CollaboVO;
import com.probada.project.vo.ProjectVO;

public interface CollaboDAO {
	
	public List<CollaboVO> selectCollaboList() throws SQLException;
	
	public CollaboVO selectCollaboByCprojNo(String cprojNo) throws SQLException;
	
	
	public void updateCollaboDetail(CollaboVO collaboVO) throws SQLException;

	public void updateCollaboNotice(CollaboVO collaboVO) throws SQLException;
	
	
}
