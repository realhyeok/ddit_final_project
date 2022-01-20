package com.probada.user.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import com.probada.user.vo.UserVO;

public class UserDAOImpl implements UserDAO{

	private SqlSession session;



	@Override
	public UserVO selectUserById(String userId) throws SQLException {

		UserVO user = null;

		user = session.selectOne("User-Mapper.selectUserById",userId);

		return user;


	}

	@Override
	public void insertUser(UserVO user) throws SQLException {

		session.update("User-Mapper.insertUser",user);
	}

	@Override
	public void updateUser(UserVO user) throws SQLException {

		session.update("User-Mapper.updateUser",user);
	}



}
