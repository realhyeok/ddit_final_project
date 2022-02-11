package com.probada.document.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.probada.document.vo.FileVO;
import com.probada.document.vo.ProjectUserVO;
import com.probada.task.vo.TaskVO;



public class DocumentDAOImpl implements DocumentDAO{



	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<FileVO> selectDocList() throws SQLException {


		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDocList");


		return DocList;
	}

	@Override
	public void insertDocument(FileVO document) throws SQLException {


		sqlSession.insert("Document-Mapper.insertDocument", document);

	}

	@Override
	public void updateDocument(FileVO document) throws SQLException {
		sqlSession.update("Document-Mapper.updateDocument", document);

	}

	@Override
	public FileVO selectDocumentByPath(String docId) throws SQLException {


		return sqlSession.selectOne("Document-Mapper.selectDocumentByPath",docId);
	}

	@Override
	public void deleteDocument(String docId) throws SQLException {


		sqlSession.delete("Document-Mapper.deleteDocument", docId);


	}

	@Override
	public String selectDocumentSeqNext() throws SQLException {

		String seq_num=
				sqlSession.selectOne("Document-Mapper.selectDocumentSeqNext");


		return seq_num;
	}

	@Override
	public List<FileVO> selectDocumentByUserId(String userId) throws SQLException {


		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDocumentByUserId",userId);
	
		return DocList;
	}

	@Override
	public List<FileVO> selectDefaultDirectoryMyProject(String userId) throws SQLException {

		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDefaultDirectoryMyProject",userId);
	
		return DocList;


	}

	@Override
	public List<FileVO> selectDirectoryMyProject(String userId) throws SQLException {


		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDirectoryMyProject",userId);
	
		return DocList;


	}



	@Override
	public List<FileVO> selectDocumentByDefaultProj(String projectNum) throws SQLException {



		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDocumentByDefaultProj",projectNum);

		return DocList;


	}

	@Override
	public List<FileVO> selectDocumentByMyProj(ProjectUserVO user) throws SQLException {



		List<FileVO> DocList = sqlSession.selectList("Document-Mapper.selectDocumentByMyProj",user);

		return DocList;
	}

	@Override
	public List<FileVO> selectDocumentListByProjNo(ProjectUserVO user) throws SQLException {

		List<FileVO> docList = sqlSession.selectList("Document-Mapper.selectDocumentListByProjNo", user);

		return docList;
	}

	@Override
	public List<FileVO> selectDocumentListForProjDetail(String projNo) throws SQLException {

		List<FileVO> docList= sqlSession.selectList("Document-Mapper.selectDocumentListForProjDetail",projNo);

		return docList;
	}

	@Override
	public String selectProjByTitle(String title) throws SQLException {
		return  sqlSession.selectOne("Document-Mapper.selectProjByTitle",title);
	}

	@Override
	public List<FileVO> selectDocumentListBytaskTitleANDprojNo(TaskVO taskVO) throws SQLException {

		List<FileVO> fileList = sqlSession.selectList("Document-Mapper.selectDocumentListBytaskTitleANDprojNo",taskVO);

		return fileList;
	}









}
