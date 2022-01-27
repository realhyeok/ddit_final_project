package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.collabo.vo.CollaboVO;

public class CollaboDAOImpl implements CollaboDAO {
	
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
		
		CollaboVO collaboVO = sqlSession.selectOne("Collabo-Mapper.selectCollaboByCprojNo", cprojNo);
		
		return collaboVO;
	}

}
