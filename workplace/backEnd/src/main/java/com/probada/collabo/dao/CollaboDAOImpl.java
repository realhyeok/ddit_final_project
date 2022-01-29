package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.probada.collabo.vo.CollaboVO;
import com.probada.collabo.web.CollaboController;

public class CollaboDAOImpl implements CollaboDAO {
	
	private final Logger LOGGER = LoggerFactory.getLogger(CollaboDAOImpl.class);
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<CollaboVO> selectCollaboList() throws SQLException {
		
		List<CollaboVO> collaboList = sqlSession.selectList("Collabo-Mapper.selectCollaboList");
		
		return collaboList;
	}

	@Override
	public CollaboVO selectCollaboByCprojNo(String cprojNo) throws SQLException {
		
		LOGGER.debug(cprojNo);
		
		CollaboVO collaboVO = sqlSession.selectOne("Collabo-Mapper.selectCollaboByCprojNo", cprojNo);
		
		return collaboVO;
	}

	@Override
	public void updateCollaboDetail(CollaboVO collaboVO) throws SQLException {

		sqlSession.update("Collabo-Mapper.updateCollaboDetail", collaboVO);
	}

	@Override
	public void updateCollaboNotice(CollaboVO collaboVO) throws SQLException {

		sqlSession.update("Collabo-Mapper.updateCollaboNotice", collaboVO);
	}

}
