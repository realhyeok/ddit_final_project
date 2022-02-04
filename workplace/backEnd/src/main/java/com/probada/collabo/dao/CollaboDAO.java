package com.probada.collabo.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.collabo.command.CollaboCommand;
import com.probada.collabo.vo.CollaboVO;
import com.probada.mail.vo.MailVO;
import com.probada.project.vo.ProjectVO;

public interface CollaboDAO {
	
	public List<CollaboVO> selectCollaboList() throws SQLException;
	
	public CollaboVO selectCollaboByCprojNo(String cprojNo) throws SQLException;
	
	public void updateCollaboDetail(CollaboVO collaboVO) throws SQLException;

	public void updateCollaboNotice(CollaboVO collaboVO) throws SQLException;
	
	//collabo-none 모달창에서 회원의 프로젝트 불러오기
	public List<String> selectProjectTitle(String userId) throws SQLException;
	
	//제안 메일 발송 
	public void registInviteCollaboMail(CollaboCommand cmd) throws SQLException;
	
	//메일 번호 시퀀스
	public int selectCollaboMailSequenceNextValue()throws SQLException;

}
