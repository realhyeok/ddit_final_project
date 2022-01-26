package com.probada.user.web;

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
import com.probada.util.UserUtil;


@Controller
public class UserController {

	private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);

	@Autowired
	UserService userService;
	@Autowired
	private UserUtil userUtil;
	
	public UserController() {
		LOGGER.debug("userController 생성됨!");
	}

	/**
	 * @return 로그인 화면 이동
	 */
	@RequestMapping(value = "home/login", method = RequestMethod.GET)
	public String getLogin() {
		return "/web-index/common/login";
	}
	
	/**
	 * 로그인 시도시,
	 * 1. DB에서 계정 존재 여부와 비밀번호 일치 검사를 한다.
	 * 2. 해당 계정의 이메일 인증 확인을 검사한다.
	 * 3. 해당 계정의 플랜 이용 만료일과 현재 날짜를 비교 검사한다.
	 * 로그인 접속에 문제가 없다면, UserVO와 데이터 사용량을 Map으로 리턴한다.
	 * @param req
	 * @return 로그인 결과를 Map타입으로 login_registration.js의 ajax에 리턴
	 * @throws SQLException
	 */
	@ResponseBody
	@RequestMapping(value = "home/login.do", method = RequestMethod.POST)
	public Map<String, String> postLogin(HttpServletRequest req) throws SQLException{
		
		HttpSession session = req.getSession();			// 세션 등록
		Map<String, String> retMap = new HashMap<>();	// ajax로 보내는 리턴 값
		UserVO user = new UserVO();
		
//		id와 password 저장
		String inputId = req.getParameter("input_email");
		String inputPwd = req.getParameter("input_pwd");
		user.setUserId(inputId);
		
		user = userService.login(user);	// 계정 리스트에서 입력한 계정 확인 후 user에 저장
		boolean flag_pwd = userUtil.comparePwd(inputPwd, user.getPwd());	// 복호화 후 비교
		int userMaxUploadCapacity = userUtil.getUserMaxUploadCapacity(user.getUserId());
		
// 		비밀번호가 틀리거나, 계정이 없는 경우
		if(!flag_pwd || user.getUserId().equals("")) {
			retMap.put("login_fail", "login_fail");
			return retMap;
		} 
// 		인증이 완료되면 무료 이용권 자동 시작
		else if (user.getAuthStatus() != 1) {
			retMap.put("authStatus", "fail");
			return retMap;
		}
//		사용기한이 만료되었을 경우
		else if(!userUtil.compareExpireDate(user.getUserId())){
			retMap.put("expired", "expired");
			return retMap;
		}
		else {
			retMap.put("success", "success");
		}
		
		
		session.setAttribute("userMaxUploadCapacity", userMaxUploadCapacity);
		session.setAttribute("userVO", user);
		return retMap;
	}
	
	/**
	 * 회원가입 페이지 이동
	 * @return 회원가입 페이지 url 리턴
	 * @throws Exception
	 */
	@RequestMapping(value = "home/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		return "/web-index/common/register";
	}

	/**
	 * 1. 아이디 중복 검사를 한다.
	 * 2. 닉네임 중복 검사를 한다.
	 * 3. 입력한 비밀번호를 암호화한다.
	 * 문제가 없다면, 해당 이메일로 인증폼을 보낸다.
	 * @param UserVO
	 * @return 회원가입 처리한 값(Map)을 login_registration.js의 ajax로 리턴
	 * @throws Exception
	 */
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
		String storeToDB = userUtil.encodePwd(user.getPwd());
		user.setPwd(storeToDB);
		
		// register 회원가입 dao
		userService.registUser(user);
		
		return jsonMap;
	}

	
	/**
	 * 1. updateAuthstatus()에서 회원 인증 상태를 0에서 1로 변경한다.
	 * 2. 인증일 기준으로 무료 플랜에 30일간 가입시킨다.
	 * 문제가 없다면 로그인 페이지로 이동한다.
	 * @param String userId
	 * @param model
	 * @return 로그인 페이지 리턴
	 * @throws Exception
	 */
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String userId, Model model) throws Exception {
		// authstatus 권한 상태 1로 변경
		userService.updateAuthstatus(userId);
		
		// jsp에서 쓰기위해 model에 담음
		model.addAttribute("welcome", userId);
		
		userUtil.init_free(userId);

		return "redirect:/home/login";
	}

	
	/**
	 * 로그아웃 버튼 클릭 시, 모든 세션을 삭제하고 로그인 페이지로 이동시킨다.
	 * @param req
	 * @return 로그인 페이지 리턴
	 */
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/home/login";
	}

}