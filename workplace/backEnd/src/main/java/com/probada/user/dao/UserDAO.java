package com.probada.user.dao;

import java.sql.SQLException;
import java.util.Map;

import com.probada.user.vo.UserVO;

public interface UserDAO {

	// 로그인
	public UserVO login(UserVO user) throws SQLException;

	/* 해당 멤버 조회 */
	public UserVO selectUserById(String userId) throws SQLException;

	/* 유저 등록 */
	public void insertUser(UserVO user) throws SQLException;

	// 유저 업데이트 동적 커리문으로 각각 다 바꿀 수 있음
	public void updateUser(UserVO user) throws SQLException;

	// 이메일 인증 후 authstatus 1로 변경
	public void updateAuthstatus(String email) throws SQLException;

	// 디비에 authkey저장
	public int createAuthkey(Map<String, String> paramMap) throws SQLException;

	//	DB 아이디 체크
	public String idCheck(String email) throws SQLException;

	//	DB 닉네임 체크
	public String nicknameCheck(String username) throws SQLException;
	
	//	 리스트에서 해당 계정 체크
	public int isAccount(String email) throws SQLException;
	
	//	유저 데이터 사용량 업데이트
	public void setUserUploadUsage(UserVO userVO) throws SQLException;
}
