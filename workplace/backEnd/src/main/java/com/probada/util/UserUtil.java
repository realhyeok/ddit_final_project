package com.probada.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.Sha2Crypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.probada.alert.service.AlertService;
import com.probada.alert.vo.AlertVO;
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
	private final Logger LOGGER = LoggerFactory.getLogger(UserUtil.class);

	@Autowired
	private PaymentsBillService paymentsBillService;
	@Autowired
	UserService userService;
	@Autowired
	AlertService alertService;

	public UserUtil() {};

	/**
	 * 파라미터로 받은 비밀번호를 암호화하여 String으로 반환한다.
	 * @param String inputPwd
	 * @return String
	 */
	public String encodePwd(String inputPwd, String userId) {
		String encriptedPassword = "";
		
		if(inputPwd == "") {
			LOGGER.debug("에러상태 : encodePwd()에서 빈 문자열로 인하여 빠른 리턴");
			return "";
		} else {
			encriptedPassword = Sha2Crypt.sha256Crypt(inputPwd.getBytes(), "$5$"+userId);
		}
//		String SHA1_pwd = pwdEncoder.encode(inputPwd);
//		retPwd = Base64Utils.encodeToString(SHA1_pwd.getBytes());
		return encriptedPassword;
	}

	/**
	 * 유저 아이디로 비밀번호를 조회하여, 그것과 inputPwd를 비교하여 일치하면 true를,
	 * 불일치하면 false를 반환한다.
	 * @param String inputPwd
	 * @param String userId
	 * @return boolean
	 */
	public boolean comparePwd (String inputPwd, String userId) {
		boolean flag = false;
		
		if(inputPwd == "" || userId == "") {
			LOGGER.debug("에러상태 : comparePwd()에서 파라미터 빈 문자열로 인하여 빠른 리턴");
			return flag;
		}
		
		try {
			String userDBPwd = userService.pwdPicker(userId);
			String encriptedPwd = Sha2Crypt.sha256Crypt(inputPwd.getBytes(), "$5$"+userId);
			if(userDBPwd.equals(encriptedPwd)) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
//		byte[] en = Base64Utils.decodeFromString(compareTo);
//		boolean ret = pwdEncoder.matches(inputPwd, new String(en));

		return flag;
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
			
//			유저가 가입된 payment가 있다면 init_free로 가지 않고 빠른 리턴한다.
			if((paymentsBillService.countUserPaymentsBill(userVO.getUserId())) != 0) {
				return false;
			}
			
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

	/**
	 * USER_PROJECT에서 유저의 PROJ_NO를 리턴한다.
	 * @param String userId
	 * @return List<String>
	 */
	public List<String> getUserProjNoList(String userId) {
		List<String> tmpMap = new ArrayList<String>();
		
		try {
			tmpMap = userService.getUserProjNoList(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tmpMap;
	}
	
	/**
	 * 유저 이메일주소를 받아 알림을 등록하는 메서드
	 * @param String userId
	 */
	public void insertAlert(Map<String, String> alertData) {
		try {
			alertService.insertAlert(alertData);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 파라미터로 받은 유저 이메일 주소에 해당하는 AlertVO 리스트를 리턴한다.
	 * @param String userId
	 * @return List<AlertVO>
	 */
	public List<AlertVO> getUserAlertList(String userId){
		List<AlertVO> alertList = new ArrayList<>();
		
		try {
			alertList = alertService.getUserAlertList(userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return alertList;
	}

}
