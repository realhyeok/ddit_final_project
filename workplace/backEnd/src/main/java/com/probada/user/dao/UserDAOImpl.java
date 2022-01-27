package com.probada.user.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.probada.user.vo.UserVO;

public class UserDAOImpl implements UserDAO{
// 	현재 파타미터의 email하고 userId는 동일합니다.

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

	@Override
	public int pwdCheck(UserVO user) throws SQLException {
		
		return sqlSession.selectOne("User-Mapper.pwdCheck", user);
	}


	@Override
	public void setUserUploadUsage(UserVO userVO) throws SQLException {
		sqlSession.update("User-Mapper.setUserUploadUsage", userVO);
	}

	@Override
	public List<UserVO> selectUserByProjNo(String projNo) throws SQLException {

		List<UserVO> userListForProjDetail = sqlSession.selectList("User-Mapper.selectUserByProjNo", projNo);

		return userListForProjDetail;
	}

	@Override
	public List<String> getUserProjNoList(String userId) throws SQLException {
		return sqlSession.selectList("User-Mapper.getUserProjNoList", userId);
	}


}
