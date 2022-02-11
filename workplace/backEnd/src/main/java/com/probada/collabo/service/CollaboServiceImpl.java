package com.probada.collabo.service;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.probada.collabo.command.CollaboCommand;
import com.probada.collabo.dao.CollaboDAO;
import com.probada.collabo.vo.CollaboVO;
import com.probada.collabo.web.CollaboController;
import com.probada.mail.vo.MailVO;

public class CollaboServiceImpl implements CollaboService {
	
	private final Logger LOGGER = LoggerFactory.getLogger(CollaboServiceImpl.class);
	
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
		
		LOGGER.debug(cprojNo);
		
		CollaboVO collaboVO = collaboDAO.selectCollaboByCprojNo(cprojNo);
		
		return collaboVO;
	}

	@Override
	public void modifyCollaboDetail(CollaboVO collaboVO) throws SQLException {
		
		LOGGER.debug("SERVICE modify" + collaboVO);
		
		collaboDAO.updateCollaboDetail(collaboVO);
	}

	@Override
	public void modifyCollaboNotice(CollaboVO collaboVO) throws SQLException {

		collaboDAO.updateCollaboNotice(collaboVO);
	}

	@Override
	public List<CollaboVO> getProjectTitleCollabo(String userId) throws SQLException {
		
		List<CollaboVO> projTitle = collaboDAO.selectProjectTitleCollabo(userId);
		return projTitle;
	}

	@Override
	public void sendInviteCollaboMail(CollaboCommand cmd) throws SQLException {
		int mailNo = collaboDAO.selectCollaboMailSequenceNextValue();
		
		cmd.setMailNo(mailNo);
		
		collaboDAO.registInviteCollaboMail(cmd);
	}

	@Override
	public int getCollaboCount(String userId) throws SQLException {
		int result = collaboDAO.collaboCount(userId);
		System.out.println("서비스 임플 result =>" + result);
		return result;
	}

	@Override
	public List<CollaboVO> getCollaboListByUserId(String userId) throws SQLException {
		
		List<CollaboVO> collaboList = collaboDAO.selectCollaboListByUserId(userId);
		
		return collaboList;
	}

	@Override
	public List<CollaboVO> getCollaboSubProj(String cprojNo) throws SQLException {
		
		List<CollaboVO> collaboList = collaboDAO.selectCollaboSubProj(cprojNo);
		
		return collaboList;
	}

}
