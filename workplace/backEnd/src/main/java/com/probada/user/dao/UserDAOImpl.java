package com.probada.user.dao;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.probada.user.vo.UserVO;

public class UserDAOImpl implements UserDAO{

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public UserVO selectUserById(String userId) throws SQLException {
		UserVO user = null;
		user = sqlSession.selectOne("User-Mapper.selectUserById",userId);
		return user;
	}

	@Override
	public void insertUser(UserVO user) throws SQLException {
		sqlSession.update("User-Mapper.insertUser",user);
	}

	@Override
	public void updateUser(UserVO user) throws SQLException {
		sqlSession.update("User-Mapper.updateUser",user);
	}

	@Override
	public UserVO login(UserVO user) throws SQLException {
		UserVO userVO = sqlSession.selectOne("User-Mapper.login", user);
		return userVO;
	}

	@Override
	public int createAuthkey(Map<String, String> paramMap) throws SQLException {
		int ret = 0;
		ret = sqlSession.update("User-Mapper.createAuthkey", paramMap);
		return ret;
	}

	@Override
	public void updateAuthstatus(String email) throws SQLException {
		sqlSession.update("User-Mapper.updateAuthstatus", email);
	}


	@Override
	public String idCheck(String email) throws SQLException {
		return sqlSession.selectOne("User-Mapper.idCheck", email);
	}


	@Override
	public String nicknameCheck(String username) throws SQLException {
		return sqlSession.selectOne("User-Mapper.nicknameCheck", username);
	}

	@Override
	public int isAccount(String email) throws SQLException {
		return sqlSession.selectOne("User-Mapper.isAccount", email);
	}

}
