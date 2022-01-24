package com.probada.document.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.document.dao.DocumentDAO;
import com.probada.document.vo.FileVO;


public class DocumentServiceImpl implements DocumentService{

	
	private DocumentDAO documentDAO;
	
	public void setDocumentDAO(DocumentDAO documentDAO) {
		this.documentDAO = documentDAO;
	}
	
	
	@Override
	public List<FileVO> getDocList() throws SQLException {
		
		List<FileVO> docList = null;
		docList = documentDAO.selectDocList();
		
		
		return docList;
	}


	@Override
	public void registDocument(FileVO document) throws SQLException {
		
		
		documentDAO.insertDocument(document);
		
	}


	@Override
	public void modifyDocument(FileVO document) throws SQLException {
		
		documentDAO.updateDocument(document);
		
	}


	@Override
	public FileVO getDocOne(String docId) throws SQLException {
		
		FileVO file = new FileVO();
		
		file = documentDAO.selectDocumentByPath(docId);
		
		return file;
	}


	@Override
	public void removeDocument(String docId) throws SQLException {
		
		
		
		documentDAO.deleteDocument(docId);
		
		
	}


	@Override
	public String seqDoc() throws SQLException {
	
		String seq = documentDAO.selectDocumentSeqNext();
		
		
		return seq;
	}


	
	
	
}
