package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class InMemberCount extends TextWebSocketHandler{ 	//상속으로 생성하며 메소드는 3개(연결 시, 주고받을 시, 종료되었을 시) 존재
	private ArrayList<WebSocketSession> sessionList;		//접속한 회원의 세션(eamil)을 저장하는 list
	private Map<WebSocketSession, String> memberList;		//각 세션별로 접속한 회원의 아이디를 저장하는 map
	
	public InMemberCount() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<WebSocketSession, String>(); 
	}
	//클라이언트가 최초로 웹소켓 서버에 접속했을 때 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		sessionList.add(session);
		System.out.println("사용자 접속 > 현재 접속자 수 : "+sessionList.size());
	}
	// 클라이언트가 서버로 전송했을 때 수행되는 메소드(실제 웹소켓 로직을 구현하는 메소드)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		for(WebSocketSession s : sessionList) {
			TextMessage count = new TextMessage(Integer.toString(sessionList.size()));
			s.sendMessage(count);
		}
	}
	// 클라이언트가 연결을 끊을 때 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		for(WebSocketSession s : sessionList) {
			TextMessage count = new TextMessage(Integer.toString(sessionList.size()));
			s.sendMessage(count);
		}
		System.out.println("사용자 종료 > 현재 접속자 수 : "+sessionList.size());
	}
}