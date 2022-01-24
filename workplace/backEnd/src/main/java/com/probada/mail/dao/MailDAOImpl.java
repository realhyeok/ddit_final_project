package com.probada.mail.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.probada.mail.vo.MailVO;

@Repository
public class MailDAOImpl implements MailDAO {
	
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//받은,임시저장, 휴지통 메일 리스트 조회
	@Override
	public List<MailVO> selectMailList(String userTo, String box) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("userTo", userTo);
		dataMap.put("box", box);
		
		List<MailVO> mailList = sqlSession.selectList("Mail-Mapper.selectMailList", dataMap);
		return mailList;
	}
	
	//보낸 메일 리스트 조회
	@Override
	public List<MailVO> selectSendMailList(String userFrom) throws SQLException {
		List<MailVO> sendMailList = sqlSession.selectList("Mail-Mapper.selectSendMailList", userFrom);
		return sendMailList;
	}
}
