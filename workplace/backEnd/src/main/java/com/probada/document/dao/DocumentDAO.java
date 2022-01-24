package com.probada.document.dao;

import java.sql.SQLException;
import java.util.List;

import com.probada.document.vo.FileVO;



public interface DocumentDAO {

	
	//전체 file을 조회 
	List<FileVO> selectDocList() throws SQLException;
	
	//파일 하나 조회
	FileVO selectDocumentByPath(String docId) throws SQLException;
	

	//file insert 
	public void insertDocument(FileVO document) throws SQLException;
	
	
	
	//file update
	public void updateDocument(FileVO document) throws SQLException;
	
	
	//file 삭제
	public void deleteDocument(String docId) throws SQLException;
	
	
	
	
	//시퀀스
	String selectDocumentSeqNext() throws SQLException;
	
	
	
	
	
	
	
}
