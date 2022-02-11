package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.probada.collabo.command.CollaboCommand;
import com.probada.collabo.vo.CollaboVO;
import com.probada.collabo.web.CollaboController;
import com.probada.mail.vo.MailVO;

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
		LOGGER.debug("DAO modify" + collaboVO);
		
		sqlSession.update("Collabo-Mapper.updateCollaboDetail", collaboVO);
	}

	@Override
	public void updateCollaboNotice(CollaboVO collaboVO) throws SQLException {

		sqlSession.update("Collabo-Mapper.updateCollaboNotice", collaboVO);
	}

	@Override
	public List<CollaboVO> selectProjectTitleCollabo(String userId) throws SQLException {
		
		List<CollaboVO> projTitle = sqlSession.selectList("Collabo-Mapper.selectProjectTitleCollabo", userId);
		
		return projTitle;
	}

	@Override
	public void registInviteCollaboMail(CollaboCommand cmd) throws SQLException {
		
		sqlSession.update("Collabo-Mapper.registInviteCollaboMail", cmd);
	}

	@Override
	public int selectCollaboMailSequenceNextValue() throws SQLException {
		
		int mailNo = sqlSession.selectOne("Collabo-Mapper.selectCollaboMailSequenceNextValue");
		return mailNo;
	}

	@Override
	public int collaboCount(String userId) throws SQLException {
		int result =Integer.parseInt(sqlSession.selectOne("Collabo-Mapper.collaboCount", userId));
		System.out.println("다오 임플 result =>" + result );
		return result;
	}

	@Override
	public List<CollaboVO> selectCollaboListByUserId(String userId) throws SQLException {
		
		List<CollaboVO> collaboList = sqlSession.selectList("Collabo-Mapper.selectCollaboListByUserId", userId);
		return collaboList;
	}

	@Override
	public List<CollaboVO> selectCollaboSubProj(String cprojNo) throws SQLException {
		
		List<CollaboVO> collaboList = sqlSession.selectList("Collabo-Mapper.selectCollaboSubProj",cprojNo);
		
		return collaboList;
	}
	

}
