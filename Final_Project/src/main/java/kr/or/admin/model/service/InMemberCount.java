package kr.or.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.admin.model.vo.AdminCount;


public class InMemberCount extends TextWebSocketHandler{ 	//상속으로 생성하며 메소드는 3개(연결 시, 주고받을 시, 종료되었을 시) 존재
	private ArrayList<WebSocketSession> sessionList;		//접속한 회원의 세션(eamil)을 저장하는 list
	private Map<WebSocketSession, String> memberList;		//각 세션별로 접속한 회원의 아이디를 저장하는 map
	@Autowired
	private AdminService aService;
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
			//보내는 값이 하나가 아니기 때문에 map으로 보내기 위한 생성
			HashMap<String, Object> map = new HashMap<String, Object>();
			//db에서 data select 해오기
			AdminCount ac = aService.selectAdminCount();
			//현재 방문자 수 
			int visitorCount = sessionList.size();
			//미답변 문의/신고 수
			int notAnswerCount = ac.getNotAnswer();
			//map에 put
			map.put("visitorCount", visitorCount);
			map.put("notAnswerCount", notAnswerCount);
			TextMessage countData = new TextMessage(new Gson().toJson(map));
			s.sendMessage(countData);
		}
	}
	// 클라이언트가 연결을 끊을 때 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		for(WebSocketSession s : sessionList) {
			//TextMessage count = new TextMessage(Integer.toString(sessionList.size()));
			//보내는 값이 하나가 아니기 때문에 map으로 보내기 위한 생성
			HashMap<String, Object> map = new HashMap<String, Object>();
			int visitorCount = sessionList.size();
			//map에 put
			map.put("visitorCount", visitorCount);
			TextMessage countData = new TextMessage(new Gson().toJson(map));
			s.sendMessage(countData);
		}
		System.out.println("사용자 종료 > 현재 접속자 수 : "+sessionList.size());
	}
}