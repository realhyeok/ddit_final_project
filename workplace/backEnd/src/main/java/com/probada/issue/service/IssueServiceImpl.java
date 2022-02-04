package com.probada.issue.service;

import java.sql.SQLException;
import java.util.List;

import com.probada.issue.dao.IssueDAO;
import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;

public class IssueServiceImpl implements IssueService {

	private IssueDAO issueDAO;
	public void setIssueDAO(IssueDAO issueDAO) {
		this.issueDAO = issueDAO;
	}


	@Override
	public List<IssueVO> getIssueListByProjNo(String projNo) throws SQLException {

		List<IssueVO> issueList= issueDAO.selectIssueListByProjNo(projNo);

		return issueList;
	}

	@Override
	public List<MileIssueVO> selectMileIssueListByIssueNo(String issueNo) throws SQLException {

		List<MileIssueVO> mileIssueList = issueDAO.selectMileIssueListByIssueNo(issueNo);

		return mileIssueList;
	}

	@Override
	public void modifyIssueByIssueNo(IssueVO issueVO) throws SQLException {

		issueDAO.updateIssueByIssueNo(issueVO);

	}

	@Override
	public IssueVO getIssueByIssueNo(IssueVO issueVO) throws SQLException {

		IssueVO resultIssueVO = issueDAO.selectIssueByIssueNo(issueVO);

		return resultIssueVO;
	}


	@Override
	public String registIssue(IssueVO issueVO) throws SQLException {
		
		int seq = issueDAO.selectIssueSeqNext();
		String issueNo = Integer.toString(seq);
		issueVO.setIssueNo(issueNo);
		issueDAO.insertIssue(issueVO);
		
		return issueNo;
	}

}
