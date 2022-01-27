package com.probada.mail.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.mail.dao.MailDAO;
import com.probada.mail.vo.AttachVO;
import com.probada.mail.vo.MailVO;

@Service
public class MailServiceImpl implements MailService {
	
	private MailDAO mailDAO;
	public void setMailDAO(MailDAO mailDAO) {
		this.mailDAO = mailDAO;
	}
	
	//받은메일 리스트 조회
	@Override
	public List<MailVO> getReceiveMailList(String userTo) throws SQLException {
		List<MailVO> receiveMailList = mailDAO.selectReceiveMailList(userTo);
		return receiveMailList;
	}
	
	//보낸메일 리스트 조회
	@Override
	public List<MailVO> getSendMailList(String userFrom) throws SQLException {
		List<MailVO> sendMailList = mailDAO.selectSendMailList(userFrom);
		return sendMailList;
	}
	
	//임시메일 리스트 조회
	@Override
	public List<MailVO> getTempMailList(String userFrom) throws SQLException {
		List<MailVO> tempMailList = mailDAO.selectTempMailList(userFrom);
		return tempMailList;
	}
	
	//휴지통 리스트 조회
	@Override
	public List<MailVO> getTrashMailList(String userId) throws SQLException {
		List<MailVO> trashMailList = mailDAO.selectTrashMailList(userId);
		return trashMailList;
	}
	
	//메일 상세 조회
	@Override
	public MailVO getMailByMailNo(String mailNo) throws SQLException {
		MailVO mailDetail = mailDAO.selectMailByMailNo(mailNo);
		addAttachList(mailDetail);
		return mailDetail;
	}
	
	//받은메일 상세 조회
	@Override
	public MailVO getReceiveMailByMailNo(String mailNo) throws SQLException {
		mailDAO.changeMailStatus(mailNo);
		MailVO mailDetail = mailDAO.selectMailByMailNo(mailNo);
		addAttachList(mailDetail);
		return mailDetail;
	}

	//첨부파일 리스트 조회
	private void addAttachList(MailVO mailDetail) throws SQLException {
		if(mailDetail == null) {
			return;
		}
		
		String mailNo = mailDetail.getMailNo();
		List<AttachVO> attachList = null;
		if(mailNo != null) {
			attachList = mailDAO.selectMailAttachList(mailNo);
		}
		mailDetail.setAttachList(attachList);
	}
	
	//받은메일 복구
	@Override
	public void returnReceiveMail(String mailNo) throws SQLException {
		mailDAO.returnReceiveMail(mailNo);
	}
	
	//보낸메일 복구
	@Override
	public void returnSendMail(String mailNo) throws SQLException {
		mailDAO.returnSendMail(mailNo);
	}
	
	//받은메일 삭제(휴지통으로)
	@Override
	public void deleteReceiveMailToTrash(String mailNo) throws SQLException {
		mailDAO.deleteReceiveMailToTrash(mailNo);
	}

	//보낸메일 삭제(휴지통으로)
	@Override
	public void deleteSendMailToTrash(String mailNo) throws SQLException {
		mailDAO.deleteSendMailToTrash(mailNo);
	}
	
	//임시메일 삭제(완전 삭제)
	@Override
	public void deleteTempMail(String mailNo) throws SQLException {
		mailDAO.deleteTempMail(mailNo);
	}
	
	//휴지통 삭제(받은 메일)
	@Override
	public void deleteTrashReceiveMail(String mailNo) throws SQLException {
		mailDAO.deleteTrashReceiveMail(mailNo);
	}
	
	//휴지통 삭제(보낸 메일)
	@Override
	public void deleteTrashSendMail(String mailNo) throws SQLException {
		mailDAO.deleteTrashSendMail(mailNo);
	}
	
	//메일 및 첨부파일 등록
	@Override
	public void registMailAttachFile(MailVO mailVO) throws SQLException {
		mailDAO.registMail(mailVO);
		if(mailVO.getAttachList() != null) {
			for(AttachVO attachVO : mailVO.getAttachList()) {
				attachVO.setMailNo(mailVO.getMailNo());
				attachVO.setAttacher(mailVO.getUserFrom());
				mailDAO.registAttachFile(attachVO);
			}
		}
	}
}
