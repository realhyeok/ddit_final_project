package com.probada.collabo.web;

import java.sql.SQLException;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.collabo.command.CollaboCommand;
import com.probada.collabo.service.CollaboService;
import com.probada.collabo.vo.CollaboVO;
import com.probada.mail.vo.MailVO;
import com.probada.user.vo.UserVO;

@Controller
@RequestMapping("/app/collabo")
public class CollaboController {

	@Resource(name="collaboService")
	CollaboService collaboService;
	
	private final Logger LOGGER = LoggerFactory.getLogger(CollaboController.class);
	
	@RequestMapping("/main")
	public String index() {
		String url ="/web-app/collabo/collabo";
		return url;
	}
	
	@RequestMapping("/getCollaboList")
	@ResponseBody
	public ResponseEntity<List<CollaboVO>> getCollaboList() throws SQLException{
		ResponseEntity<List<CollaboVO>> entity = null;
		
		LOGGER.debug("[요청받음] : /getCollaboList ");
		
		List<CollaboVO> collaboList = new ArrayList<CollaboVO>();
		
		
		try {
			collaboList = collaboService.getCollaboList();
			entity = new ResponseEntity<List<CollaboVO>>(collaboList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<CollaboVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping("/getCollaboByCprojNo")
	@ResponseBody
	public ResponseEntity<CollaboVO> getCollaboByCprojNo(@RequestParam(defaultValue="") String cprojNo)throws Exception{
		
		ResponseEntity<CollaboVO> entity = null;
		
		LOGGER.debug("[요청받음] : /getCollaboByCprojNo ");
		
		CollaboVO collaboVO = new CollaboVO();
		
		try {
			collaboVO = collaboService.getCollaboByCprojNo(cprojNo);
			entity = new ResponseEntity<CollaboVO>(collaboVO, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<CollaboVO>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value="/modifyCollaboDetail",method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> modifyCollaboDetail(CollaboVO collaboVO) throws Exception{
		
		ResponseEntity<HashMap<String, Object>> entity = null;
		
		try {
			collaboService.modifyCollaboDetail(collaboVO);
			entity = new ResponseEntity<HashMap<String,Object>>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<HashMap<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
		
	}
	
	@PostMapping("/modifyCollaboNotice")
	@ResponseBody
	public ResponseEntity<HashMap<String, Object>> modifyCollaboNotice(CollaboVO collaboVO)throws Exception{
		
		ResponseEntity<HashMap<String, Object>> entity = null;
		
		try {
			collaboService.modifyCollaboNotice(collaboVO);
			entity = new ResponseEntity<HashMap<String,Object>>(HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<HashMap<String,Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping("/getProjectTitle")
	public ResponseEntity<List<String>> getProjectTitle(HttpSession session)throws Exception{
		ResponseEntity<List<String>> entity = null;
		
		LOGGER.debug("[요청받음] => /getProjectTitle");
		
		UserVO userVO = (UserVO) session.getAttribute("userVO");
		
		String userId = userVO.getUserId();
		
		List<String> projTitle = null;
		
		try {
			projTitle = collaboService.getProjectTitle(userId);
			LOGGER.debug("[프로젝트 제목] => ", projTitle);
			entity = new ResponseEntity<List<String>>(projTitle,HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR); 
			e.printStackTrace();
		}
		return entity;
	}
	
	@RequestMapping(value = "/sendInviteCollaboMail", method = RequestMethod.POST, produces="text/plain;charset=utf-8")
	public String sendInviteCollaboMail(CollaboCommand cmd)throws Exception{
		String url = "/app/index";
		
		LOGGER.debug("[요청받음] => /sendInviteCollaboMail");
		
		System.out.println("콘텐트 : " + cmd.getContent());
		
		collaboService.sendInviteCollaboMail(cmd);
		
		
		return url;
		
	}
	
}













