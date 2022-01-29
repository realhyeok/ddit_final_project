package com.probada.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.probada.chat.service.ChatService;
import com.probada.chat.vo.ChatUserVO;
import com.probada.user.vo.UserVO;
import com.google.gson.Gson;


public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatService chatService;

	private static final Logger LOGGER = LoggerFactory.getLogger(EchoHandler.class);
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1대?
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	//방 넘버를 저장하는 이걸로 세션을 구별함
	Map<String,List<WebSocketSession>> chatUserSession = new HashMap<>();
	
	List<WebSocketSession> userList = new ArrayList<>();
	//List<Map<String, List<WebSocketSession>>> chat = new ArrayList<>();
	/*
	 * Map<"1",List<WebSocketSession>
	 * Map<"2",List<WebSocketSession>
	 * 
	 */
	private String chatNo;
	//내가 초대한 사람 리스트
	
	//클라가 서버에 연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		 Map<String,Object> map = session.getAttributes();
		 UserVO loginUser = (UserVO)map.get("userVO");

		 LOGGER.debug("loginUser =>{}",loginUser);
		
		sessions.add(session);
		
		Map<String, String> data = new HashMap<>();
		data.put("dataType", "login");
		//세션이 없으면 에려
		data.put("data", loginUser.getNickname()+"님이 접속했습니다.<br/>현재 총"+sessions.size()+"명 접속중.");
		
		String jsonData = new Gson().toJson(data);
		for(WebSocketSession user :sessions) {
			user.sendMessage(new TextMessage(jsonData));
		}
		
		LOGGER.debug("dataMap =>{}",data);
	/*	String senderId = getId(session);
		userSessionsMap.put(senderId , session);*/
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		
		//받은 room 아이디
		String roomId = "realChat4";
		//만약 아이디가 룸 넘버를 속하고 있다면? 리스트에 저장한다. 위로 뺴야함
		
		//
		//Map<String,List<WebSocketSession>> chatUserSession = new HashMap<>();
		
		
		
		List<String> userInRoom = new ArrayList<>();
		
		Map<String,Object> map = session.getAttributes();
		UserVO loginUser = (UserVO)map.get("userVO");
		
		//로직 시작
		//내가 속한 룸 넘버를 뽑는다.
		userInRoom = chatService.getUserInRoom(roomId);
		
		LOGGER.debug("userInRoom =>{}",userInRoom);
		
		for (String inUser : userInRoom) {
			if(inUser.equals(loginUser.getUserId())) {
				userList.add(session);
			}
		}
		
		chatUserSession.put(roomId, userList);
		LOGGER.debug("userList =>{}",userList);
		
		for (WebSocketSession sess : userList) {
			LOGGER.debug("getId(session) =>{}",getId(session));
			sess.sendMessage(new TextMessage( getId(session) +" : " +  message.getPayload()));
			LOGGER.debug("TextMessage =>{}",new TextMessage( getId(session) +" : " +  message.getPayload()));
			//여기서 db에 메시지 저장
			
		}
		
		//룸 넘버를 받고 룸넘ㄴ에 있는 회워들을 조회한다.
		
		//회원들을 맵에 넣는다. <Map<String, List<WebSocketSession>>
		// "룸넘버","세션"
		//방 넘버를 저장하는 이걸로 세션을 구별함
		//Map<String,List<WebSocketSession>> chatUserSession = new HashMap<>();
		
		
		
		
		/*	
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage( getId(session) +" : " +  message.getPayload()));
			
		}*/
		
		

		
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
			return loginUser.getNickname();
		}
	}
}








/*chatNo="3";
//방 이름하고, 닉네임이 넘어워야하는데?
for (WebSocketSession s : sessions) {
	 Map<String, List<WebSocketSession>> temp = null;
	 List<WebSocketSession> ListTemp = null;
	 
	 Map<String,Object> map = session.getAttributes();
	 UserVO loginUser = (UserVO)map.get("userVO");
	//sql문 실행 룸 넘버
	//getChatNo(loginUser.getUserId());
	 String roomNo = "3";
	 
	 if(chatNo.equals(roomNo)) {
		 
		 ListTemp.add(s);
		 temp.put(roomNo, ListTemp);
		 
	 }
	 chat.add(temp);
}
	
for (WebSocketSession s : sessions) {
	
	 Map<String, List<WebSocketSession>> temp = null;
	 List<WebSocketSession> ListTemp = null;
	 Map<String,Object> map = session.getAttributes();
	 UserVO loginUser = (UserVO)map.get("userVO");
	
	//sql문 실행 룸 넘버
	//getChatNo(loginUser.getUserId());
	 
	 String roomNo = "3";
	 
	 if(chatNo.equals(roomNo)) {
		 ListTemp.add(s);
		 temp.put(roomNo, ListTemp);
	 }
	 chat.add(temp);
	}
//if(chat.get(index))
String msg = message.getPayload();

for (WebSocketSession sess : sessions) {
	sess.sendMessage(new TextMessage( getId(session) +" : " +  message.getPayload()));
}
*/


