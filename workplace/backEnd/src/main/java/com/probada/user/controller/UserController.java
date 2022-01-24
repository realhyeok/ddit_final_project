package com.probada.user.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;
import com.probada.util.PwdUtil;



@Controller
public class UserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;
	@Autowired
	private PwdUtil pwdUtil;

	public UserController() {
		LOGGER.debug("userController 생성됨!");
	}

//	로그인 화면
	@RequestMapping(value = "home/login", method = RequestMethod.GET)
	public String getLogin() {
		return "/web-index/common/login";
	}
	
	@ResponseBody
	@RequestMapping(value = "home/login.do", method = RequestMethod.POST)
	public Map<String, String> postLogin(HttpServletRequest req) {
		
		Map<String, String> retMap = new HashMap<>();
		UserVO user = new UserVO();
		HttpSession session = req.getSession();
		
//		id와 password 저장
		String userId = req.getParameter("input_email");
		String userPwd = req.getParameter("input_pwd");
		user.setUserId(userId);
		try {
			user = userService.login(user);
			boolean flag_pwd = pwdUtil.comparePwd(userPwd, user.getPwd());
			
			if(!flag_pwd || user.getUserId().equals("")) { // 비밀번호가 틀리거나, 계정이 없는 경우
				retMap.put("login_fail", "login_fail");
				return retMap;
			} else if(user.getAuthStatus() == 0) {
				System.out.println(" user.getAuthStatus() => " + user.getAuthStatus());
				retMap.put("authStatus", "fail");
				return retMap;
			} else {
				retMap.put("success", "success");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("userVO", user);
		return retMap;
	}
	
	// 회원가입 폼 GET
	@RequestMapping(value = "home/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		return "/web-index/common/register";
	}

	@ResponseBody
	@RequestMapping(value = "home/register.do", method = RequestMethod.POST)
	public Map<String, String> postRegister(UserVO user) throws Exception {

		// 이메일 중복여부 확인 (사용가능하면 1)
		int idCheck = userService.idCheck(user.getUserId());
		// 닉네임 중복여부 확인 (사용가능하면 1)
		int nicknameCheck = userService.nicknameCheck(user.getNickname());
		// Map으로 ajax에 데이터 다시 보내기
		Map<String, String> jsonMap = new HashMap<>();

		// 닉네임 또는 이메일 중복일 때
		if (idCheck == 0) { jsonMap.put("idCheck", "false"); return jsonMap; }
		if (nicknameCheck == 0) { jsonMap.put("nicknameCheck", "false"); return jsonMap; }
		
		// 암호 복호화
		String storeToDB = pwdUtil.encodePwd(user.getPwd());
		user.setPwd(storeToDB);
		
		// register 회원가입 dao
		userService.registUser(user);
		
		return jsonMap;
	}

	// 이메일 인증 확인하면 나오는 경로
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String email, Model model) throws Exception {
		// authstatus 권한 상태 1로 변경
		userService.updateAuthstatus(email);

		// jsp에서 쓰기위해 model에 담음
		model.addAttribute("welcome", email);

		return "/web-index/common/login";
	}

//	정말 끝낫을때
	@RequestMapping(value = "home/register_success", method = RequestMethod.GET)
	public String register_success() {
		return "register_success";
	}
	
	@RequestMapping("/documentSeok")
	public String main() {
		String url = "/web-app/my-page/documentTest";
		return url;
	}

}