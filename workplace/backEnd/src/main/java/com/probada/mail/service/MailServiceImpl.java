package com.probada.mail.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.mail.vo.MailVO;

@Service
public class MailServiceImpl implements MailService {
	
	//받은,임시저장, 휴지통 메일 리스트 조회
	@Override
	public List<MailVO> getMailList(String userTo, String box) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
	
	//보낸 메일 리스트 조회
	@Override
	public List<MailVO> getSendMailList(String userFrom) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
