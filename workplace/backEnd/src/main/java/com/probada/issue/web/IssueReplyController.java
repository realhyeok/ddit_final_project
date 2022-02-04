package com.probada.issue.web;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.issue.service.IssueReplyService;
import com.probada.issue.vo.IssueReplyVO;
import com.probada.issue.vo.IssueVO;
import com.probada.util.IssueUtil;

@Controller
@RequestMapping("/app/issueReply")
public class IssueReplyController {

	@Resource(name="issueReplyService")
	private IssueReplyService issueReplyService;
	@Resource(name="issueUtil")
	private IssueUtil issueUtil;
	
	
	@RequestMapping("/getIssueReplyByIssueNo")
	@ResponseBody
	public ResponseEntity<List<IssueReplyVO>> getIssueReplyByIssueNo(IssueVO issueVO) throws SQLException {
		ResponseEntity<List<IssueReplyVO>> entity = null;
	
		List<IssueReplyVO> issueReplyList = new ArrayList<IssueReplyVO>();
		
		try {
			
			issueReplyList = issueReplyService.getIssueReplyListByIssueNo(issueVO.getIssueNo());
			
			issueReplyList = issueUtil.getUserDetailByReplyList(issueReplyList);
			
			entity = new ResponseEntity<List<IssueReplyVO>>(issueReplyList,HttpStatus.OK);
	
		} catch(Exception e) {
			entity = new ResponseEntity<List<IssueReplyVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
	
		}
	
		return entity;
	}
	
	
	
	
	
}
