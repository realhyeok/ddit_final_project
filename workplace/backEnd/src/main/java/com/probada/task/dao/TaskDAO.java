package com.probada.task.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.task.vo.TaskVO;

public interface TaskDAO {

	public Integer selectTaskCountByProjectNo(String projNo) throws SQLException;

	public List<TaskVO> selectTaskListByProjectNo(String projNo) throws SQLException;

	public TaskVO selectTaskDetailByTaskNo(TaskVO taskVO) throws SQLException;

}
