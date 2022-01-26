package com.probada.mail.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.mail.vo.MailVO;

public interface MailService {
	
	//받은메일 리스트 조회
	public List<MailVO> getReceiveMailList(String userTo) throws SQLException;

	//보낸메일 리스트 조회
	public List<MailVO> getSendMailList(String userFrom) throws SQLException;
	
	//임시메일 리스트 조회
	public List<MailVO> getTempMailList(String userFrom) throws SQLException;
	
	//휴지통 리스트 조회
	public List<MailVO> getTrashMailList(String userId) throws SQLException;
	
	//메일 상세 조회
	public MailVO getMailByMailNo(String mailNo) throws SQLException;
	
	//받은에일 복구
	public void returnReceiveMail(String mailNo) throws SQLException;
	
	//보낸에일 복구
	public void returnSendMail(String mailNo) throws SQLException;
	
	//받은메일 삭제(휴지통으로)
	public void deleteReceiveMailToTrash(String mailNo) throws SQLException;
	
	//보낸메일 삭제(휴지통으로)	
	public void deleteSendMailToTrash(String mailNo) throws SQLException;
	
	//임시메일 삭제(완전 삭제)
	public void deleteTempMail(String mailNo) throws SQLException;
	
	//휴지통 삭제(받은 메일)
	public void deleteTrashReceiveMail(String mailNo) throws SQLException;
	
	//휴지통 삭제(보낸 메일)
	public void deleteTrashSendMail(String mailNo) throws SQLException;
}
