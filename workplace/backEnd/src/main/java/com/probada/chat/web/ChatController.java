package com.probada.chat.web;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.probada.chat.service.ChatService;
import com.probada.chat.vo.ChatVO;
import com.probada.project.service.ProjectService;
import com.probada.project.vo.ProjectVO;
import com.probada.project.web.ProjectController;
import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;

@Controller
@RequestMapping("/chat")
public class ChatController {

	
	private static final Logger LOGGER = LoggerFactory.getLogger(ChatController.class);
	
	@Autowired
	ChatService chatService;
	

	
	
	@RequestMapping("/test")
	   public String chat() {
	    	
	    	String url = "/web-app/chat/chatTest";
	    	
	        return url;
	    }
	
	


	
	@RequestMapping("/")
	public ModelAndView chatTest(ModelAndView mnv,HttpSession session) throws Exception {
	 	
	 	String url = "/web-app/chat/chat";
	 	UserVO userVO= (UserVO)session.getAttribute("userVO");
	 	
	 	List<ChatVO> chat = new ArrayList<>();
	 	
	 	String userId = userVO.getUserId();
	 	
	 	chat = chatService.getRoomList(userId);
	 	
		mnv.addObject("chat", chat);
		mnv.setViewName(url);
	 	
	     return mnv;
	 }
	


	
	@RequestMapping("/getProjectTitle")
	@ResponseBody
	public ResponseEntity<List<String>> getProjectTitle(HttpSession session) throws Exception {
		ResponseEntity<List<String>> entity = null;

		LOGGER.debug("[요청받음] => /getProjectTitle");
		UserVO userVO= (UserVO)session.getAttribute("userVO");
	 	
		
		//하드 코딩
		String userId = userVO.getUserId();
		
		List<String> projectList= null;

		try {

			projectList = chatService.getMyProjTitleList(userId);
			LOGGER.debug("프로젝트 리스트  {}",projectList);

			entity = new ResponseEntity<List<String>>(projectList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	@RequestMapping("/getProjectUser")
	@ResponseBody
	public ResponseEntity<List<String>> getProjectUser(String selectProj,HttpSession session) throws Exception {
		ResponseEntity<List<String>> entity = null;

		
		UserVO userVO= (UserVO)session.getAttribute("userVO");
		
		LOGGER.debug("[요청받음] => /getProjectUser");
	
		//하드코딩 나는 제외
		String userId = userVO.getUserId();
		
		List<String> userList = new ArrayList<String>();
		
		
		
		
	
		try {

			userList = chatService.getMyProjUserList(selectProj);
			userList.remove(userList.indexOf(userId));
			LOGGER.debug("제거 되는 지 확인   {}",userList);

			entity = new ResponseEntity<List<String>>(userList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	
	@RequestMapping("/createRoom")
	public String createRoom(String title, String Ptitle, String[] userId, RedirectAttributes rttr,HttpSession session) throws Exception {
		
		
		
		UserVO userVO= (UserVO)session.getAttribute("userVO");
		String realRoom = chatService.seqRealChat();
		String url = "redirect:/chat/";
		
		LOGGER.debug("[요청받음] => /createRoom");
		String seq=null;
		//하드코딩
		String myId=userVO.getUserId();
		//프로젝트가 중복될 경우 배제한 코드
		String projNo = chatService.getProjNoByTitle(Ptitle);
		
		seq = chatService.seqChat();
		
		ChatVO chatVO1 = new ChatVO();
		
		seq = chatService.seqChat();
		chatVO1.setProj_no(projNo);
		chatVO1.setChatroom_no(seq);
		chatVO1.setTitle(title);
		chatVO1.setUser_id(myId);
		chatVO1.setRealRoom(realRoom);
		chatService.createChatRoom(chatVO1);
		
		LOGGER.debug("chatvo1 {}",chatVO1);
		
		
		for(String user : userId) {
			ChatVO chatVO = new ChatVO();
			seq = chatService.seqChat();
			chatVO.setProj_no(projNo);
			chatVO.setChatroom_no(seq);
			chatVO.setTitle(title);
			chatVO.setUser_id(user);
			chatVO.setRealRoom(realRoom);
			chatService.createChatRoom(chatVO);
			LOGGER.debug(" for문 안에 {}"+chatVO);
		}

		rttr.addFlashAttribute("create", "success");
		
		
		return url;
	}
	
	
	
	@RequestMapping("/getRoomUser")
	@ResponseBody
	public ResponseEntity<List<String>> getRoomUser(String pTitle,HttpSession session) throws Exception {
		
		ResponseEntity<List<String>> entity = null;
		
		UserVO userVO= (UserVO)session.getAttribute("userVO");
		
		
		LOGGER.debug("[요청받음] => /getRoomUser");
	
		//하드코딩 나는 제외
		
		String userId = userVO.getUserId();
		List<String> userList = new ArrayList<String>();
		
		
		
		
	
		try {

			userList = chatService.getRoomUserList(pTitle);
		
			LOGGER.debug("getRoomUser  {}",userList);

			entity = new ResponseEntity<List<String>>(userList,HttpStatus.OK);

		} catch(Exception e) {
			entity = new ResponseEntity<List<String>>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
	
	
	
	
	
	
	
	
	
}
		
	
	
	
	
	
	
	
	
