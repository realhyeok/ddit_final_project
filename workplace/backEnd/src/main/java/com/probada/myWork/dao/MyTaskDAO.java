package com.probada.myWork.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.task.vo.TaskVO;

public interface MyTaskDAO {
	
	//업무 리스트 출력
	public List<TaskVO> selectTaskListByUserId(String userId) throws SQLException;
	
	//업무 리스트 정렬 출력
	public List<TaskVO> selectProjectNameForSort(String userId) throws SQLException;
	
	//업무 삭제
	public void deleteMyTaskByTaskNo(String taskNo) throws SQLException;
	
	//업무 상태 변경
	public void updateMyTaskStatus(TaskVO taskVO) throws SQLException;
}
