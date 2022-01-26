package com.probada.task.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.task.vo.TaskVO;

public interface TaskService {

	public Integer getTaskCountByProjectNo(String projNo) throws SQLException;

	public List<TaskVO> getTaskListByProjectNo(String projNo) throws SQLException;

	public TaskVO getTaskDetailByTaskNo(TaskVO taskVO) throws SQLException;
}