package com.myweb.home.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.myweb.home.login.model.AccountDTO;

public class Chatting extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println(session.getUri().getQuery());
		Map<String, Object> map = session.getAttributes();
		String name = (String)map.get("HTTP.SESSION.ID");
		
		if(map.get("loginData") != null) {
			name = ((AccountDTO)map.get("loginData")).getName();
		}
		
		for(Entry<String, WebSocketSession> entry: sessionMap.entrySet()) {
			entry.getValue().sendMessage(new TextMessage("<p>" + name +"님이 접속하였습니다.</p> "));
		}
		sessionMap.put(name, session);
		
		super.afterConnectionEstablished(session);
		
	}
	
	protected void handlerTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> map = session.getAttributes();
		String name = (String)map.get("HTTP.SESSION.ID");
		
		if(map.get("loginData") != null) {
			name = ((AccountDTO)map.get("loginData")).getName();
			
			for(Entry<String, WebSocketSession> entry:sessionMap.entrySet()) {
				WebSocketSession ws = entry.getValue();
				ws.sendMessage(new TextMessage("<p>" + name + "님이 보낸 메세지<br>" + message.getPayload() + "</p>"));
			}
		}
		
		
		super.handleTextMessage(session, message);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		Map<String, Object> map = session.getAttributes();
		String name = (String)map.get("HTTP.SESSION.ID");
		
		if(map.get("loginData") != null) {
			name = ((AccountDTO)map.get("loginData")).getName();
		}
		
		for(Entry<String, WebSocketSession> entry: sessionMap.entrySet()) {
			WebSocketSession ws = entry.getValue();
			if(ws.isOpen()) {
				ws.sendMessage(new TextMessage("<p>" + name + "님이 접속을 종료합니다."));
			}
		}
		
		sessionMap.remove(name);
		
		super.afterConnectionClosed(session, status);
	}
}
