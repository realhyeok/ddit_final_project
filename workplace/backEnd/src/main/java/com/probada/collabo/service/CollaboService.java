package com.probada.collabo.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.command.CollaboCommand;
import com.probada.collabo.vo.CollaboVO;
import com.probada.mail.vo.MailVO;

public interface CollaboService {
	
	public List<CollaboVO> getCollaboList() throws SQLException;
	
	public CollaboVO getCollaboByCprojNo(String cprojNo) throws SQLException;
	
	
	public void modifyCollaboDetail(CollaboVO collaboVO) throws SQLException;

	public void modifyCollaboNotice(CollaboVO collaboVO) throws SQLException;
	
	//collabo-none 모달창에서 회원의 프로젝트 불러오기
	public List<String> getProjectTitle(String userId) throws SQLException;
	
	//콜라보 제안 메일 발송
	public void sendInviteCollaboMail(CollaboCommand cmd) throws SQLException;
}
