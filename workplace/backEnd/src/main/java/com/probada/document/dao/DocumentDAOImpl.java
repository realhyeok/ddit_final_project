package com.probada.document.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.document.vo.FileVO;



public class DocumentDAOImpl implements DocumentDAO{

	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<FileVO> selectDocList() throws SQLException {
		
			
		List<FileVO> DocList = session.selectList("Document-Mapper.selectDocList");
		

		return DocList;
	}

	@Override
	public void insertDocument(FileVO document) throws SQLException {
	
		
		session.insert("Document-Mapper.insertDocument", document);
		
	}

	@Override
	public void updateDocument(FileVO document) throws SQLException {
		session.update("Document-Mapper.updateDocument", document);
		
	}

	@Override
	public FileVO selectDocumentByPath(String docId) throws SQLException {

		
		return session.selectOne("Document-Mapper.selectDocumentByPath",docId);
	}

	@Override
	public void deleteDocument(String docId) throws SQLException {
		
	
		session.delete("Document-Mapper.deleteDocument", docId);

		
	}

	@Override
	public String selectDocumentSeqNext() throws SQLException {
		
		String seq_num=
				session.selectOne("Document-Mapper.selectDocumentSeqNext");
		
		
		return seq_num;
	}

	
	
	
	
	
	
	
	
}
