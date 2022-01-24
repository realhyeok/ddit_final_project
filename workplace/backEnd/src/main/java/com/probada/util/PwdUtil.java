package com.probada.util;

import javax.inject.Inject;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.Base64Utils;

import com.probada.user.vo.UserVO;

public class PwdUtil {
	
	@Inject
	private BCryptPasswordEncoder pwdEncoder;

	public PwdUtil() {};
	
	/**
	 * 입력한 패스워드와 암호화된 user.getPwd()가 일치하면 true값을 반환, 틀리면 false.
	 * @param inputPwd
	 * @param user
	 * @return boolean
	 */
	public boolean decodePwd(String inputPwd, UserVO user) {
		
		boolean flag = true;
		
		byte[] toDecodePwd = Base64Utils.decodeFromString(user.getPwd());
		
		flag = pwdEncoder.matches(inputPwd, new String(toDecodePwd));
		return flag;
	}
	
	/**
	 * 입력한 패스워드를 암호화한다.
	 * @param inputPwd
	 * @return String
	 */
	public String encodePwd(String inputPwd) {
		String retPwd = "";
		
		String SHA1_pwd = pwdEncoder.encode(inputPwd);
		retPwd = Base64Utils.encodeToString(SHA1_pwd.getBytes());
				
		return retPwd;
	}
	
	/** 
	 * 암호화되어 있는 to를 복호화 시킨 후, 같은 String타입의 from과 문자열이 같은지 비교한다.
	 * @param from
	 * @param to
	 * @return boolean
	 */
	public boolean comparePwd (String from, String to) {
		
		byte[] en = Base64Utils.decodeFromString(to);
		boolean ret = pwdEncoder.matches(from, new String(en));
		
		return ret;
	}
}
