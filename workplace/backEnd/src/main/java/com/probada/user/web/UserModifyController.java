package com.probada.user.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;

import org.apache.commons.io.IOUtils;


@RestController
@RequestMapping("/user")
public class UserModifyController {

	
	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;
	
	
	@RequestMapping(value="/getPicture", produces="text/plain;charset=utf-8")
	public ResponseEntity<byte[]> getPicture(String picture) throws IOException{
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = "c:/member/picture";
		try {
			in = new FileInputStream(new File(imgPath, picture));
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in),HttpStatus.CREATED);
		} finally {
			in.close();
		}
		return entity;
	}
	
	
	
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public ResponseEntity<String> modify(UserVO user, HttpSession session) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		//하드코딩
		user.setUserId("seok@ddit.com");
		LOGGER.debug("user=>{}",user);
		
		
		
	/*	A201	전체공개
		A202	비공개*/
		int let;
		let = userService.nicknameCheck(user.getNickname());
		LOGGER.debug("let=>{}",let);
		if(let==0) {
			entity = new ResponseEntity<String>("닉네임없음",HttpStatus.OK);
		}else {
			userService.modifyUser(user);
			entity =  new ResponseEntity<String>("",HttpStatus.OK);
		}
		
		//세션 적용 수정한 회원 세션 적용
		/*UserVO loginUser = (UserVO) session.getAttribute("userVO");
		if(loginUser != null && loginUser.getUserId().equals(loginUser.getUserId())) {
			session.setAttribute("loginUser", loginUser);
			
		}*/
		
		
		return entity;
	}
	
	
		

	
	@RequestMapping(value="/passwordCheck", method= RequestMethod.POST)
	public ResponseEntity<String> passwordCheck(String passwords) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		
		UserVO user = new UserVO();
		
		user.setUserId("seok@ddit.com");
		user.setPwd(passwords);
		
		int chk = userService.pwdCheck(user);
		
		
		LOGGER.debug("chk=>{}",chk);
		
		if(chk==0) {
			entity = new ResponseEntity<String>("비밀번호 불일치 없음",HttpStatus.BAD_GATEWAY);
		}else {
			
			entity =  new ResponseEntity<String>("",HttpStatus.OK);
		}
		

		
		
		return entity;
	}
	
	
	
	
	@RequestMapping(value="/modifyPwd", method= RequestMethod.POST)
	public ResponseEntity<String> modifyPwd(String password) throws Exception{
		
		ResponseEntity<String> entity = null;
		
		UserVO user = new UserVO();
		
		user.setUserId("seok@ddit.com");
		user.setPwd(password);
		
		userService.modifyUser(user);
		
		LOGGER.debug("user=>{}",user);

		entity =  new ResponseEntity<String>("",HttpStatus.OK);
	
		return entity;
	}
	
	
	
	
	
	
	
	
	
}
