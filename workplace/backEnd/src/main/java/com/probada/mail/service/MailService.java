package com.probada.mail.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.mail.vo.MailVO;

public interface MailService {
	
	//받은,임시저장, 휴지통 메일 리스트 조회
	public List<MailVO> getMailList(String userTo, String box) throws SQLException;

	//보낸 메일 리스트 조회
	public List<MailVO> getSendMailList(String userFrom) throws SQLException;
	
	//메일 상세 조회
	
	
	//메일 삭제
	
}
