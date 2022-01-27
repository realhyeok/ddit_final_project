package com.probada.mail.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.mail.vo.AttachVO;
import com.probada.mail.vo.MailVO;

public interface MailDAO {
	
	//받은메일 리스트 조회
	public List<MailVO> selectReceiveMailList(String userTo) throws SQLException;
	
	//보낸메일 리스트 조회
	public List<MailVO> selectSendMailList(String userFrom) throws SQLException;

	//임시메일 리스트 조회
	public List<MailVO> selectTempMailList(String userFrom) throws SQLException;
	
	//휴지통 리스트 조회
	public List<MailVO> selectTrashMailList(String userTo) throws SQLException;
	
	//메일 상세 조회
	public MailVO selectMailByMailNo(String mailNo) throws SQLException;
	
	//메일 첨부파일 조회
	public List<AttachVO> selectMailAttachList(String mailNo) throws SQLException;
	
	//메일 상태 변경(읽음, 안읽음)
	public void changeMailStatus(String mailNo) throws SQLException;
	
	//받은메일 복구
	public void returnReceiveMail(String mailNo) throws SQLException;
	
	//보낸메일 복구
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
	
	//메일 등록
	public void registMail(MailVO mailVO) throws SQLException;
	
	//메일 첨부파일 등록
	public void registAttachFile(AttachVO attachVO) throws SQLException;
}
