package com.probada.task.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Service;

import com.probada.task.dao.TaskDAO;
import com.probada.task.vo.TaskVO;

@Service
public class TaskServiceImpl implements TaskService {

	private TaskDAO taskDAO;
	public void setTaskDAO(TaskDAO taskDAO) {
		this.taskDAO = taskDAO;
	}


	@Override
	public Integer getTaskCountByProjectNo(String projNo) throws SQLException {

		int result = taskDAO.selectTaskCountByProjectNo(projNo);

		return result;
	}


	@Override
	public List<TaskVO> getTaskListByProjectNo(String projNo) throws SQLException {

		List<TaskVO> taskVOList = taskDAO.selectTaskListByProjectNo(projNo);

		return taskVOList;
	}

}
