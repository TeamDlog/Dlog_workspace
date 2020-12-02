package com.kh.dlog.common.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
//	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
//	private Map<String, WebSocketSession> userSessionsMap = new HashMap<>();
	
	// 클라이언트와 연결 이후에 실행되는 메서드
//    @Override
//    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//      sessionList.add(session);
//      String senderId = getUserId(session);
//      userSessionsMap.put(senderId, session);
//      System.out.println("{} 연결됨"+ session.getId());
//    }
//   
//    // 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
//    @Override
//    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//      System.out.println(("{}로 부터 {} 받음"+ session.getId()+ message.getPayload()));
//      for (WebSocketSession sess : sessionList) {
//        sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
//      }
//    }
//   
//    // 클라이언트와 연결을 끊었을 때 실행되는 메소드
//    @Override
//    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
//      sessionList.remove(session);
//      System.out.println(("{} 연결 끊김"+ session.getId()));
//    }
//    
//    private String getUserId(WebSocketSession session) {
//    	Map<String, Object> httpSession = session.getAttributes();
//    	Member loginUser = (Member)httpSession.get("loginUser");
//    	if(loginUser == null) {
//    		return session.getId();
//    	}else {
//    		return loginUser.getMemberId();
//    	}
//    }
	
	
	//연결 요청 처리 
        //메시지 받기, 메시지 전달

	//WebSocketSession 클라이언트 당 하나씩 생성, 해당 클라이언트와 연결된 웹소켓을 이용할 수 있는 객체  
	//해당 객체를 통해 메시지를 주고 받음

	private List<WebSocketSession> users;
	private Map<String, Object> userMap;
	
	public WebSocketHandler() {
		users= new ArrayList<WebSocketSession>();
		userMap = new HashMap<String,Object>();
	}

	@Override
    //소켓 연결 생성 후 실행 메서드
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 생성!");
		users.add(session);
	}

	@Override
    //메시지 수신 후 실행 메서드
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("TextWebSocketHandler : 메시지 수신!");
		System.out.println("메시지 : " + message.getPayload());
		
		
		
		
//		JSONObject object = new JSONObject(message.getPayload());
//		String type = object.getString("type");
//
//		if(type != null && type.equals("register") ) {
//			//등록 요청 메시지
//			String user = object.getString("userid");
//			//아이디랑 Session이랑 매핑 >>> Map
//			userMap.put(user, session);
//		}else {
//			//채팅 메시지 : 상대방 아이디를 포함해서 메시지를 보낼것이기 때문에
//			//Map에서 상대방 아이디에 해당하는 WebSocket 꺼내와서 메시지 전송
//			String target = object.getString("target");
//			WebSocketSession ws = (WebSocketSession)userMap.get(target);
//			String msg = object.getString("message");
//			if(ws !=null ) {
//				ws.sendMessage(new TextMessage(msg));
//			}
//		}
	}

	@Override
    //연결 해제 후 실행 메서드
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("TextWebSocketHandler : 연결 종료!");
		users.remove(session);
	}	
	

	
}
