package com.probada.user.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.probada.user.vo.UserVO;

public interface UserService {

	// 로그인
	public UserVO login(UserVO user) throws SQLException;

	// 해당 멤버 조회
	public UserVO getUser(String userId) throws Exception;

	// 회원가입
	public void registUser(UserVO user) throws Exception;

	// 수정
	void modifyUser(UserVO user) throws Exception;

	// authstatus 1로 변경
	public void updateAuthstatus(String email) throws SQLException;

	// 아이디 체크
	public int idCheck(String email) throws SQLException;

	// 닉네임 체크
	public int nicknameCheck(String username) throws SQLException;

	// 회원 리스트에서 계정 확인
	public int isAccount(String email) throws SQLException;

	// 비번 체크
	public int pwdCheck(UserVO user) throws SQLException;

	// 유저 데이터 사용량 업데이트

	public String getPwdByUserId(String userId) throws SQLException;

	public void removeUser(String userId) throws SQLException;

	// 유저 데이터 사용량 업데이트
	public void setUserUploadUsage(UserVO userVO) throws SQLException;

	// 프로젝트 상세에서 사용되는 유저리스트
	public List<UserVO> getUserByProjNo(String projNo) throws SQLException;

	// USER_PROJECT 테이블에서 유저 아이디를 조회하여 PROJ_NO를 조회한다.
	public List<String> getUserProjNoList(String userId) throws SQLException;

	// userId를 파라미터로 받아서 해당 유저의 pwd를 리턴한다.
	public String pwdPicker(String userId) throws SQLException;

	// 디비에 authkey저장
	public int createAuthkey(Map<String, String> paramMap) throws SQLException;

	// 해당 유저 아이디를 참조하여 유저의 authkey를 조회한다.
	public String selectAuthkey(String userId) throws SQLException;

	// 유저의 비밀번호를 재설정한다.
	public void setUserPwd(UserVO userVO) throws SQLException;
}
