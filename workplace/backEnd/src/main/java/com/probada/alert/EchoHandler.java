package com.probada.alert;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.probada.alert.vo.AlertVO;
import com.probada.user.vo.UserVO;
import com.probada.util.UserUtil;


public class EchoHandler extends TextWebSocketHandler {
		// 접속되어 있는 유저들을 담는다.
		List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		// 1대1
		Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
		@Autowired
		private UserUtil userUtil = new UserUtil();
	
/*
	일단 일대일로 알림을 주고받아야 하는 상황에서 각각의 로그인 되어 있는 회원의 정보를 Map에 저장을 해야 한다.
	Map의 키값은 email을 value의 값에는 websocketSession을 저장하고
	데이터를 보낼때 map에서 email별로 데이터를 꺼내와서 알림을 보낸다.
 */		
		//서버에 접속이 성공 했을때
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			sessions.add(session);
			
			String senderEmail = getId(session);
			userSessionsMap.put(senderEmail , session);
		}
		
		//소켓에 메세지를 보냈을때
		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			String senderEmail = getId(session);
			
			//protocol : cmd , 닉네임, 송신자, 프로젝트넘버
			String msg = message.getPayload();
			
			if(StringUtils.isNotEmpty(msg)) {
				String[] strs = msg.split(",");
				
				for (String string : strs) {
					System.out.println("msg.split 출력 -> " + string);
				}
				
				if(strs != null && strs.length == 5) {
					String serderNickName = strs[0];
					String serderWhere = strs[1];
					String senderTarget = strs[2];
					String senderWhatToDo = strs[3];
					String senderProjNo = strs[4];
					
					// sender가 로그인 해있으면
					for (WebSocketSession sess : sessions) {
						List<String> othersProjNoList = userUtil.getUserProjNoList(getId(sess));
						for (int i = 0; i < othersProjNoList.size(); i++) {
							
							if(sess != null && othersProjNoList.get(i).equals(senderProjNo) 
											&& sess != session) {
//								protocol : 누가(nickname) 어디서(분야) 무엇(target)을 curd(어떻게) + 상대방 이메일 주소(DB저장용) 
								System.out.println("getId(sess) => " + getId(sess));
								TextMessage tmpMsg = new TextMessage(
																	serderNickName 
																	+ "," + serderWhere 
																	+ "," + senderTarget
																	+ "," + senderWhatToDo 
																	+ "," + senderProjNo
																	+ "," + getId(sess));
								
								sess.sendMessage(tmpMsg);
							}
						}
					}
				}
				
//				if(strs != null && strs.length == 5) {
//					String cmd = strs[0];
//					String caller = strs[1]; 
//					String receiver = strs[2];
//					String receiverEmail = strs[3];
//					String seq = strs[4];
//					
//					//작성자가 로그인 해서 있다면
//					WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);
//					
//					if("reply".equals(cmd) && boardWriterSession != null) {
//						TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
//											"<a type='external' href='/mentor/menteeboard/menteeboardView?seq="+seq+"&pg=1'>" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
//						boardWriterSession.sendMessage(tmpMsg);
//					
//					}else if("follow".equals(cmd) && boardWriterSession != null) {
//						TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
//								 "님을 팔로우를 시작했습니다.");
//						boardWriterSession.sendMessage(tmpMsg);
//						
//					}else if("scrap".equals(cmd) && boardWriterSession != null) {
//						TextMessage tmpMsg = new TextMessage(caller + "님이 " +
//											//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
//											"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+seq+"&mentors="+ receiver +"'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
//						boardWriterSession.sendMessage(tmpMsg);
//					}
//				}
//				
			}
		}
		
		//연결 해제될때
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			//System.out.println("afterConnectionClosed " + session + ", " + status);
			userSessionsMap.remove(session.getId());
			sessions.remove(session);
		}
		
		//웹소켓 email 가져오기
		private String getId(WebSocketSession session) {
			Map<String, Object> httpSession = session.getAttributes();
			UserVO userVO = (UserVO) httpSession.get("userVO");
			return userVO == null ? null : userVO.getUserId();
		}
		
}