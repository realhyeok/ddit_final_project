package com.probada.user.dao;

import java.sql.SQLException;

import com.probada.user.vo.UserVO;

public interface UserDAO {

	/*해당 멤버 조회*/
	public UserVO selectUserById(String userId) throws SQLException;

	/*유저 등록*/
	public void insertUser(UserVO user) throws SQLException;

	//유저 업데이트 동적 커리문으로 각각 다 바꿀 수 있음
	public void updateUser(UserVO user) throws SQLException;









}
