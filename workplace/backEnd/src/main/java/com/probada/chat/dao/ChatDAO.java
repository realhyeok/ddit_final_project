package com.probada.chat.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.chat.vo.ChatVO;
import com.probada.project.vo.ProjectVO;

public interface ChatDAO {

	public List<String> selectMyProjTitleList(String userId) throws SQLException;
	
	public List<String> selectMyProjUserList(String projTitle) throws SQLException;
	
	public void createChatRoom(ChatVO chatVO) throws SQLException;
	
	String selectChatSeqNext() throws SQLException;

	
	public String selectProjNoByTitle(String title) throws SQLException;
	
	public List<ChatVO> selectRoomById(String userId) throws SQLException;
	
	public List<String>selectUserByRoomId(String roomTitle) throws SQLException;
	
	String selectRealChatSeqNext() throws SQLException;
	
	public List<String> selectUserInRoom(String roomId) throws SQLException;
	
}
