package com.probada.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.probada.issue.service.IssueService;
import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;
import com.probada.user.vo.UserVO;

public class IssueUtil {

	@Resource(name="issueService")
	IssueService issueService;

	/**
	 * 이슈 리스트 각자에 소속된 마일리스트 조회
	 * @param issueList
	 * @return
	 * @throws SQLException
	 */
	public List<IssueVO> getMileListByIssueList(List<IssueVO> issueList) throws SQLException{

		List<MileIssueVO> mileIssueList = new ArrayList<MileIssueVO>();
		List<String> mileNoList = new ArrayList<String>();

		try {

			for (IssueVO issueVO : issueList) {
				mileIssueList = issueService.selectMileIssueListByIssueNo(issueVO.getIssueNo());

				for (MileIssueVO mileIssueVO : mileIssueList) {
					if(mileIssueVO.getIssueNo().equals(issueVO.getIssueNo())) {
						mileNoList.add(mileIssueVO.getMileNo());
					}
				}
				issueVO.setMileNo(mileNoList);
				mileNoList = new ArrayList<String>();
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return issueList;
	}

	/**
	 * 이슈 번호로 마일리스트 조회
	 * @param issueVO
	 * @return
	 * @throws SQLException
	 */
	public IssueVO getMileListByIssueNo(IssueVO issueVO) throws SQLException{

		List<MileIssueVO> mileIssueList = new ArrayList<MileIssueVO>();
		List<String> mileNoList = new ArrayList<String>();

		try {

				mileIssueList = issueService.selectMileIssueListByIssueNo(issueVO.getIssueNo());

				if(mileIssueList != null) {
					for (MileIssueVO mileIssueVO : mileIssueList) {
						if(mileIssueVO.getIssueNo().equals(issueVO.getIssueNo())) {
							mileNoList.add(mileIssueVO.getMileNo());
						}
					}
					issueVO.setMileNo(mileNoList);
				}

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return issueVO;
	}


}
