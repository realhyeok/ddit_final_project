package com.probada.issue.web;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.issue.service.IssueService;
import com.probada.issue.vo.IssueVO;
import com.probada.issue.vo.MileIssueVO;
import com.probada.milestone.service.MilestoneService;
import com.probada.milestone.vo.MilestoneVO;
import com.probada.project.vo.ProjectTagVO;
import com.probada.project.vo.ProjectVO;

@Controller
@RequestMapping("/app/issue")
public class IssueController {

	@Resource(name="issueService")
	private IssueService issueService;

	@RequestMapping("/getIssueListByProjNo")
	@ResponseBody
	public ResponseEntity<List<IssueVO>> getIssueListByProjNo(@RequestParam(defaultValue="") String projNo) throws SQLException {
		ResponseEntity<List<IssueVO>> entity = null;

		List<IssueVO> issueList = new ArrayList<IssueVO>();
		List<MileIssueVO> mileIssueList = new ArrayList<MileIssueVO>();
		List<String> mileNoList = new ArrayList<String>();

		try {
			issueList = issueService.getIssueListByProjNo(projNo);

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

			entity = new ResponseEntity<List<IssueVO>>(issueList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<IssueVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();

		}

		return entity;
	}
}
