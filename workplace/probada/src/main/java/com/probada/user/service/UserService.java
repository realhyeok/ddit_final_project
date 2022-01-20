package com.probada.user.service;

import com.probada.user.vo.UserVO;

public interface UserService {




	public UserVO getUser(String userId) throws Exception;

	public void registUser(UserVO user) throws Exception;

	void modifyUser(UserVO user) throws Exception;








}
