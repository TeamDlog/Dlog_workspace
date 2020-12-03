package com.kh.dlog.common.websocket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.maven.shared.utils.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.dlog.member.model.vo.Member;

@Component
public class WebSocketHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<>();
	Map<String, WebSocketSession> userSessions = new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
//		System.out.println("afterConnectionEstablished:" + session);
		sessions.add(session);
		String senderUserNo = getUserNo(session);
		userSessions.put(senderUserNo, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
//		System.out.println("handleTextMessage:" + session + " : " + message);
//		String senderNickname = getNickname(session);
//		for(WebSocketSession sess: sessions) {
//			sess.sendMessage(new TextMessage(senderId + ": " + message.getPayload()));
//		}
		
		//protocol: cmd, 댓글작성자, 게시글작성자,bno (ex: reply,user2,user1,234)
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = message.getPayload().split(",");
			if(strs != null) {
//				String cmd = strs[0];
//				String replyWriter = strs[1];
//				String boardWriter = strs[2];
//				String title = strs[3];
//				WebSocketSession boardWriterSession = userSessions.get(boardWriter);
//				if("reply".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(replyWriter + "님이 게시글 \"" + title + "\"에 댓글을 달았습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
//				}
				
				String memberNo = strs[0];
				String content = strs[1];
				WebSocketSession WriterSession = userSessions.get(memberNo);
				if(WriterSession != null) {
					WriterSession.sendMessage(new TextMessage(content));
				}
			}
		}
	}

	private String getNickname(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		if(null == loginUser)
			return session.getId();
		else
			return loginUser.getNickname();
	}
	
	private String getUserNo(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		if(null == loginUser)
			return session.getId();
		else
			return loginUser.getMemberNo() + "";
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
//		System.out.println("afterConnectionClosed:" + session + " : " + status);
	}


	
}
