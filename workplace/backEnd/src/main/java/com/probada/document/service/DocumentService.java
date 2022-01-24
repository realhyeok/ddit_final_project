package com.probada.document.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.document.vo.FileVO;



public interface DocumentService {

	public List<FileVO> getDocList() throws SQLException;
	
	public void registDocument(FileVO document) throws SQLException;
	
	public void modifyDocument(FileVO document) throws SQLException;
	
	public FileVO getDocOne(String docId) throws SQLException;
	
	
	public void removeDocument(String docId) throws SQLException;
	
	public String seqDoc() throws SQLException;
	
}
