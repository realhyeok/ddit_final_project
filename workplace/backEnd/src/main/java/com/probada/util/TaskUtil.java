package com.probada.util;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import com.probada.task.service.TaskService;
import com.probada.user.vo.UserVO;

public class TaskUtil {


	@Resource(name="taskService")
	private TaskService taskService;

	public List<UserVO> getTaskCountUtil(List<UserVO> userList) throws SQLException {

		try {

			for (UserVO userVO : userList) {
				int taskCount = taskService.getTaskCountInProjByUserId(userVO);
				userVO.setTaskCount(taskCount);
			}

		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}

		return userList;
	}

}
