package com.probada.user.service;

import com.probada.user.dao.UserDAO;
import com.probada.user.vo.UserVO;

public class UserServiceImpl implements UserService{


	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}



	@Override
	public UserVO getUser(String userId) throws Exception {

		UserVO user = userDAO.selectUserById(userId);
		return user;
	}

	@Override
	public void registUser(UserVO user) throws Exception {
		userDAO.insertUser(user);
	}

	@Override
	public void modifyUser(UserVO user) throws Exception {
		userDAO.updateUser(user);
	}






}
