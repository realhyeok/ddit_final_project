package com.probada.alert.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probada.alert.vo.AlertVO;
import com.probada.util.UserUtil;

@Controller
public class AlertController {
	
	@Autowired
	private UserUtil userUtil;
	
	@ResponseBody
	@RequestMapping(value="/app/addToAlertList.do", method = RequestMethod.POST)
	public Map<String,String> addToAlertList(@RequestBody Map<String,String> alertData) {
		userUtil.insertAlert(alertData);
		return alertData;
	}
	
	@RequestMapping(value="/app/updateAlertList.do", method = RequestMethod.POST)
	public List<AlertVO> updateAlertList(String userId) {
		List<AlertVO> alertList = new ArrayList<AlertVO>();
		alertList = userUtil.getUserAlertList(userId);
		return alertList;
	}
}
