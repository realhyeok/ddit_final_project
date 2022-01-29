package com.probada.chat.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.chat.vo.ChatVO;
import com.probada.project.vo.ProjectVO;

public class ChatDAOImpl implements ChatDAO {


	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	@Override
	public List<String> selectMyProjTitleList(String userId) throws SQLException {
		return  sqlSession.selectList("Chat-Mapper.selectMyProjTitleList",userId);
	}

	@Override
	public List<String> selectMyProjUserList(String projTitle) throws SQLException {
		return  sqlSession.selectList("Chat-Mapper.selectMyProjUserList",projTitle);
	}


	@Override
	public void createChatRoom(ChatVO chatVO) throws SQLException {
		
		sqlSession.insert("Chat-Mapper.createChatRoom",chatVO);
		
	}


	@Override
	public String selectChatSeqNext() throws SQLException {
		
		String seq_num=
				sqlSession.selectOne("Chat-Mapper.selectChatSeqNext");

		return seq_num;
	}


	@Override
	public String selectProjNoByTitle(String title) throws SQLException {
		
		
		return sqlSession.selectOne("Chat-Mapper.selectProjNoByTitle",title);
		
	}


	
	
	@Override
	public List<ChatVO> selectRoomById(String userId) throws SQLException {
		
		
		
		return sqlSession.selectList("Chat-Mapper.selectRoomById",userId);
	}

	@Override
	public List<String> selectUserByRoomId(String roomTitle) throws SQLException {
		
		return sqlSession.selectList("Chat-Mapper.selectUserByRoomId",roomTitle);
		
		
		
	}


	@Override
	public String selectRealChatSeqNext() throws SQLException {
		String seq_num=
				sqlSession.selectOne("Chat-Mapper.selectRealChatSeqNext");
		return seq_num;
	}


	@Override
	public List<String> selectUserInRoom(String roomId) throws SQLException {
		return sqlSession.selectList("Chat-Mapper.selectUserInRoom",roomId);
		
	}

	

	
	
	
}