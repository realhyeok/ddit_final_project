package com.probada.mail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.probada.mail.vo.AttachVO;
import com.probada.mail.vo.MailVO;

@Repository
public class MailDAOImpl implements MailDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//받은메일 리스트 조회
	@Override
	public List<MailVO> selectReceiveMailList(String userTo) throws SQLException {
		List<MailVO> receiveMailList = sqlSession.selectList("Mail-Mapper.selectReceiveMailList", userTo);
		return receiveMailList;
	}
	
	//보낸메일 리스트 조회
	@Override
	public List<MailVO> selectSendMailList(String userFrom) throws SQLException {
		List<MailVO> sendMailList = sqlSession.selectList("Mail-Mapper.selectSendMailList", userFrom);
		return sendMailList;
	}
	
	//임시메일 리스트 조회
	@Override
	public List<MailVO> selectTempMailList(String userFrom) throws SQLException {
		List<MailVO> tempMailList = sqlSession.selectList("Mail-Mapper.selectTempMailList", userFrom);
		return tempMailList;
	}
	
	//휴지통 리스트 조회
	@Override
	public List<MailVO> selectTrashMailList(String userId) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("userTo", userId);
		dataMap.put("userFrom", userId);
		
		List<MailVO> trashMailList = sqlSession.selectList("Mail-Mapper.selectTrashMailList", dataMap);
		return trashMailList;
	}
	
	//메일 상세 조회
	@Override
	public MailVO selectMailByMailNo(String mailNo) throws SQLException {
		MailVO mailDetail = sqlSession.selectOne("Mail-Mapper.selectMailDetail", mailNo);
		return mailDetail;
	}
	
	//메일 첨부파일 조회
	@Override
	public List<AttachVO> selectMailAttachList(String docContNo) throws SQLException {
		List<AttachVO> attachList = sqlSession.selectList("Mail-Mapper.selectMailAttachList", docContNo);
		return attachList;
	}
	
	//메일 상태 변경(읽음, 안읽음)
	@Override
	public void changeMailStatus(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.changeMailStatus", mailNo);
	}
	
	//받은에일 복구
	@Override
	public void returnReceiveMail(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.returnReceiveMail", mailNo);
	}

	//보낸메일 복구
	@Override
	public void returnSendMail(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.returnSendMail", mailNo);
	}
	
	//받은메일 삭제(휴지통으로)
	@Override
	public void deleteReceiveMailToTrash(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteReceiveMailToTrash", mailNo);
	}
	//보낸메일 삭제(휴지통으로)
	@Override
	public void deleteSendMailToTrash(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteSendMailToTrash", mailNo);
	}
	
	//임시메일 삭제(완전 삭제)
	@Override
	public void deleteTempMail(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteTempMail", mailNo);
	}
	
	//휴지통 삭제(받은 메일)
	@Override
	public void deleteTrashReceiveMail(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteTrashReceiveMail", mailNo);
	}
	
	//휴지통 삭제(보낸 메일)
	@Override
	public void deleteTrashSendMail(String mailNo) throws SQLException {
		sqlSession.update("Mail-Mapper.deleteTrashSendMail", mailNo);
	}
}
