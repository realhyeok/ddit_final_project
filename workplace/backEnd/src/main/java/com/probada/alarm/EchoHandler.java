package com.probada.alarm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.probada.user.vo.UserVO;
import com.google.gson.Gson;


public class EchoHandler extends TextWebSocketHandler {
	//로그인 한 전체
	private static final Logger LOGGER = LoggerFactory.getLogger(EchoHandler.class);
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	
	//클라가 서버에 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);

		
		//하드코딩
		Map<String, String> data = new HashMap<>();
		data.put("dataType", "login");
		data.put("data", "석기현님이 로그인 했습니다.<br/>현재 총 2명 접속중.");
		
		String jsonData = new Gson().toJson(data);
		for(WebSocketSession user :sessions) {
			user.sendMessage(new TextMessage(jsonData));
		}
		
		
	/*	String senderId = getId(session);
		userSessionsMap.put(senderId , session);*/
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		String msg = message.getPayload();
		
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage( getId(session) +" : " +  message.getPayload()));
		}
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 id 가져오기
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UserVO loginUser = (UserVO)httpSession.get("userVO");
		
		
		LOGGER.debug("loginUser =>{}",loginUser);
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getUserId();
		}
	}
}