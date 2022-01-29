package com.probada.issue.web;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.issue.service.IssueService;
import com.probada.issue.vo.IssueVO;
import com.probada.user.vo.UserVO;
import com.probada.util.IssueUtil;

@Controller
@RequestMapping("/app/issue")
public class IssueController {

	@Resource(name="issueService")
	private IssueService issueService;
	@Resource(name="issueUtil")
	IssueUtil issueUtil;

	private static final Logger LOGGER = LoggerFactory.getLogger(IssueController.class);

	@RequestMapping("/getIssueListByProjNo")
	@ResponseBody
	public ResponseEntity<List<IssueVO>> getIssueListByProjNo(@RequestParam(defaultValue="") String projNo) throws SQLException {
		ResponseEntity<List<IssueVO>> entity = null;

		LOGGER.debug("[요청받음] => /getIssueListByProjNo");

		List<IssueVO> issueList = new ArrayList<IssueVO>();

		try {
			issueList = issueService.getIssueListByProjNo(projNo);
			issueList = issueUtil.getMileListByIssueList(issueList);

			entity = new ResponseEntity<List<IssueVO>>(issueList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<IssueVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();

		}

		return entity;
	}

	@RequestMapping("/getIssueByIssueNo")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> getIssueByIssueNo(HttpServletRequest request, IssueVO issueVO) throws SQLException {
		ResponseEntity<HashMap<String, Object>> entity = null;

		LOGGER.debug("[요청받음] => /getIssueByIssueNo");


		UserVO userVO = new UserVO();
		HashMap<String, Object> hashMap = new HashMap<String, Object>();

		try {

			userVO = issueUtil.getSessionUserNickName(request);

			issueVO = issueService.getIssueByIssueNo(issueVO);
			issueVO = issueUtil.getMileListByIssueNo(issueVO);

			hashMap.put("userVO", userVO);
			hashMap.put("issueVO", issueVO);

			entity = new ResponseEntity<HashMap<String, Object>>(hashMap,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();

		}

		return entity;
	}




	@RequestMapping("/modifyIssueByIssueNo")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> modifyIssueByIssueNo(IssueVO issueVO) throws SQLException {
		ResponseEntity<HashMap<String, Object>> entity = null;

		LOGGER.debug("[요청받음] => /modifyIssueByIssueNo");

	try {

		issueService.modifyIssueByIssueNo(issueVO);

		entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.OK);

	} catch(Exception e) {
		entity = new ResponseEntity<HashMap<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		e.printStackTrace();

	}

	return entity;
}

}
