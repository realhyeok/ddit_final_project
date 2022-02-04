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
import com.probada.chat.vo.ChatMessageVO;
import com.probada.chat.vo.ChatUserVO;
import com.probada.chat.vo.ChatVO;
import com.probada.user.vo.UserVO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;


public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	ChatService chatService;

	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	
	private static final Logger LOGGER = LoggerFactory.getLogger(EchoHandler.class);
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();

	private Map<String, ArrayList<WebSocketSession>> RoomList = new HashMap<String, ArrayList<WebSocketSession>>();
	    
	private Map<WebSocketSession, String> sessionList = new HashMap<WebSocketSession, String>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		// Map<String,Object> map = session.getAttributes();
		// UserVO loginUser = (UserVO)map.get("userVO");

		// LOGGER.debug("loginUser =>{}",loginUser);
		
		//sessions.add(session);
		
		//Map<String, String> data = new HashMap<>();
		//data.put("dataType", "login");
		//세션이 없으면 에려
		//data.put("data", loginUser.getNickname()+"님이 접속했습니다.<br/>현재 총"+sessions.size()+"명 접속중.");
		
		//String jsonData = new Gson().toJson(data);
	//	for(WebSocketSession user :sessions) {
		//	user.sendMessage(new TextMessage(jsonData));
		//}
		
		//LOGGER.debug("dataMap =>{}",data);
	/*	String senderId = getId(session);
		userSessionsMap.put(senderId , session);*/
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

	
		
		String msg = message.getPayload();
		
		ChatMessageVO chatMessage = objectMapper.readValue(msg,ChatMessageVO.class);
		
		LOGGER.debug("chatMessage =>{}",chatMessage);
		
		ChatVO commandChat = new ChatVO();
		commandChat.setUserId(chatMessage.getUserId());
		commandChat.setRealRoom(chatMessage.getRealRoom());
		
		LOGGER.debug("commandChat =>{}",commandChat);
		
		ChatVO chatRoom = chatService.getRoomByRealRoom(commandChat);
		
		LOGGER.debug("chatRoom =>{}",chatRoom);
		
		if(RoomList.get(chatRoom.getRealRoom()) == null && chatMessage.getContent().equals("ENTER-CHAT") && chatRoom != null) {
            
            // 채팅방에 들어갈 session들
            ArrayList<WebSocketSession> sessionTwo = new ArrayList<>();
            // session 추가
            sessionTwo.add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRealRoom());
            // RoomList에 추가
            RoomList.put(chatRoom.getRealRoom(), sessionTwo);
            LOGGER.debug("채팅방 생성");
        }
        
        // 채팅방이 존재 할 때
        else if(RoomList.get(chatRoom.getRealRoom()) != null && chatMessage.getContent().equals("ENTER-CHAT") && chatRoom != null) {
            
            // RoomList에서 해당 방번호를 가진 방이 있는지 확인.
            RoomList.get(chatRoom.getRealRoom()).add(session);
            // sessionList에 추가
            sessionList.put(session, chatRoom.getRealRoom());
            LOGGER.debug("채팅방 입장");
        }
        
        // 채팅 메세지 입력 시
        else if(RoomList.get(chatRoom.getRealRoom()) != null && !chatMessage.getContent().equals("ENTER-CHAT") && chatRoom != null) {
            
        	
        	LOGGER.debug("채팅 매시지 입력 메서드 실행");
        	
            // 메세지에 이름, 내용을 담는다.
            TextMessage textMessage = new TextMessage(chatMessage.getUserId() + ","+chatMessage.getNickname()+","+ chatMessage.getContent()+","+chatMessage.getRegdate());
            
            
            // 현재 session 수
            int sessionCount = 0;
 
            // 해당 채팅방의 session에 뿌려준다.
            for(WebSocketSession sess : RoomList.get(chatRoom.getRealRoom())) {
                sess.sendMessage(textMessage);
                sessionCount++;
            }
            
            // 동적쿼리에서 사용할 sessionCount 저장
            // sessionCount == 2 일 때는 unReadCount = 0,
            // sessionCount == 1 일 때는 unReadCount = 1
            // chatMessage.setSessionCount(sessionCount);
            
            chatMessage.setChatroomMsgNo(chatService.seqMessage());
            
            LOGGER.debug("chatMessage=>{}",chatMessage);
            chatService.createMessage(chatMessage);
            
        }
		
		
		
		
		
		/*	
		for (WebSocketSession sess : sessions) {
			sess.sendMessage(new TextMessage( getId(session) +" : " +  message.getPayload()));
			
		}*/
		
		

		
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		  if(sessionList.get(session) != null) {
	            // 해당 session의 방 번호를 가져와서, 방을 찾고, 그 방의 ArrayList<session>에서 해당 session을 지운다.
	            RoomList.get(sessionList.get(session)).remove(session);
	            sessionList.remove(session);
	        }
		
		
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


