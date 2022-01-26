package com.probada.user.service;

import java.sql.SQLException;

import com.probada.user.vo.UserVO;

public interface UserService {

	// 로그인
	public UserVO login(UserVO user) throws SQLException;

	// 해당 멤버 조회 
	public UserVO getUser(String userId) throws Exception;
	
	//	회원가입
	public void registUser(UserVO user) throws Exception;
	
	//	수정
	void modifyUser(UserVO user) throws Exception;

	// authstatus 1로 변경
	public void updateAuthstatus(String email) throws SQLException;
	
	// 아이디 체크
	public int idCheck(String email) throws SQLException;
	
	// 닉네임 체크
	public int nicknameCheck(String username) throws SQLException;
	
	//	회원 리스트에서 계정 확인
	public int isAccount(String email) throws SQLException;
	
	//	유저 데이터 사용량 업데이트
	public void setUserUploadUsage(UserVO userVO) throws SQLException;
}
