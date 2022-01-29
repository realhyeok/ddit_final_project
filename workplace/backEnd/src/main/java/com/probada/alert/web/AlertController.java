package com.probada.alert.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.alert.vo.AlertVO;
import com.probada.user.vo.UserVO;
import com.probada.util.UserUtil;

@Controller
public class AlertController {
	
	@Autowired
	private UserUtil userUtil;
	
	@ResponseBody
	@RequestMapping(value="/app/addToAlertList.do", method = RequestMethod.POST)
	public Map<String,String> addToAlertList(@RequestBody Map<String,String> alertData) {
		userUtil.insertAlert(alertData);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		alertData.put("nickname", alertData.get("serderNickName"));
		alertData.put("writeTime", sdf.format(new Date()));
		return alertData;
	}
	
	@ResponseBody
	@RequestMapping(value="/app/updateAlertList.do", method = RequestMethod.POST)
	public List<AlertVO> updateAlertList(HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("userVO");
		
		List<AlertVO> alertList = new ArrayList<AlertVO>();
		
		alertList = userUtil.getUserAlertList(userVO.getUserId());
		
		return alertList;
	}
}
