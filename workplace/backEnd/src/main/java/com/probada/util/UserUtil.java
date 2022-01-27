package com.probada.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.util.Base64Utils;

import com.probada.payment.service.PaymentsBillService;
import com.probada.payment.vo.PaymentsBillVO;
import com.probada.user.service.UserService;
import com.probada.user.vo.UserVO;

/**
 * 해당 클래스는 User에서 사용할 수 있는 api를 제공한다.
 * @since 2022-01-26
 * @author 김진혁
 */
public class UserUtil {

	@Inject
	private BCryptPasswordEncoder pwdEncoder;
	@Autowired
	private PaymentsBillService paymentsBillService;
	@Autowired
	UserService userService;

	public UserUtil() {};

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

	/**
	 * currentDate가 userExpiryDate보다 기간이 지나면 리턴 false, 아니면 true
	 * @param userId
	 * @return boolean
	 */
	public boolean compareExpireDate(String userId) {
		boolean flag = true;

		try {
			Date currentDate = new Date();
			Date userExpiryDate = paymentsBillService.getEndDate(userId);
			flag = userExpiryDate.after(currentDate);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * FREE 플랜으로 가입시키는 function이다.
	 * @param String userId
	 * @return boolean
	 */
	public boolean init_free(String userId) {
		boolean flag = true;
		PaymentsBillVO paymentsBillVO = new PaymentsBillVO();
		UserVO userVO;

		try {
			userVO = userService.getUser(userId);
			paymentsBillVO.setUserId(userVO.getUserId());
			paymentsBillService.init_free(paymentsBillVO);
		} catch (Exception e) {
			flag = false;
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * 해당 PLAN_NO의 사용 가능한 최대 데이터 사이즈를 리턴한다.
	 * @param String planNo
	 * @return int
	 */
	public int getMaxUploadCapacity(String planNo) {
		int ret = 0;

		try {
			ret = paymentsBillService.getMaxUploadCapacity(planNo);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ret;
	}

	/**
	 * 해당 유저의 PLAN_NO를 리턴한다.
	 * @param String userId
	 * @return String
	 */
	public String getPlanNo(String userId) {
		String ret = "";

		try {
			ret = paymentsBillService.getPlanNo(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ret;
	}

	/**
	 * 해당 유저가 가입한 플랜의 사용 가능한 최대 데이터 사이즈를 리턴한다.
	 * @param userId
	 * @return int
	 */
	public int getUserMaxUploadCapacity(String userId) {
		int ret = 0;

		String planNo = getPlanNo(userId);
		ret = getMaxUploadCapacity(planNo);

		return ret;
	}

	/**
	 * userVO.setUserUploadUsage로 set된 upload데이터를 받아, 해당 유저 DB에 update해준다.
	 * @param UserVO userVO
	 */
	public void setUserUploadUsage(UserVO userVO) {

		try {
			userService.setUserUploadUsage(userVO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<String> getUserProjNoList(String userId) {
		List<String> tmpMap = new ArrayList<String>();
		
		try {
			tmpMap = userService.getUserProjNoList(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tmpMap;
	}

}
