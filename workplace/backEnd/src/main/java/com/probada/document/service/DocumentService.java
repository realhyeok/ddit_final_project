package com.probada.document.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.document.vo.FileVO;
import com.probada.document.vo.ProjectUserVO;



public interface DocumentService {

	public List<FileVO> getDocList() throws SQLException;

	public void registDocument(FileVO document) throws SQLException;

	public void modifyDocument(FileVO document) throws SQLException;

	public FileVO getDocOne(String docId) throws SQLException;


	public void removeDocument(String docId) throws SQLException;

	public String seqDoc() throws SQLException;


	public List<FileVO> getMyDocument(String userId) throws SQLException;



	public List<FileVO> getProjectDocument(ProjectUserVO user) throws SQLException;

	public List<FileVO> getDocumentListByProjNo(ProjectUserVO user) throws SQLException;

	public List<FileVO> getDocumentListForProjDetail(String projNo) throws SQLException;

}
