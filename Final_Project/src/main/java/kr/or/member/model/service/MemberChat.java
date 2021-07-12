package kr.or.member.model.service;

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
import com.google.gson.JsonParser;

import kr.or.member.model.dao.MemberDao;
import kr.or.member.model.vo.Member;

public class MemberChat extends TextWebSocketHandler {
	private ArrayList<WebSocketSession> sessionList;		//접속한 회원의 세션(eamil)을 저장하는 list
	private Map<WebSocketSession, String> memberList;		//각 세션별로 접속한 회원의 아이디를 저장하는 map
	@Autowired
	private MemberDao dao;
	@Autowired
	private MemberService service;
	
	public MemberChat() {
		super();
		sessionList = new ArrayList<WebSocketSession>();
		memberList = new HashMap<WebSocketSession, String>(); 
	}
	//클라이언트가 최초로 웹소켓 서버에 접속했을 때 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		//새로 접속한 클라이언트의 웹소켓 세션을 리스트에 저장
		sessionList.add(session);
	}
	// 클라이언트가 서버로 전송했을 때 수행되는 메소드(실제 웹소켓 로직을 구현하는 메소드)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		//문자열을 JSON타입으로 처리하기 위한 객체
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(message.getPayload());
		//type 키의 값 추출
		String type = element.getAsJsonObject().get("type").getAsString();
		//user 키의 값 추출
		String user = element.getAsJsonObject().get("user").getAsString();
		String target = element.getAsJsonObject().get("target").getAsString();
		
		if(type.equals("chatin")) {
			memberList.put(session, user);				
			
			for (WebSocketSession key : memberList.keySet()) {
				String value = memberList.get(key);
			    System.out.println("[key]:" + key + ", [value]:" + value);
			}    
			
			WebSocketSession targetUser = null;
			for(WebSocketSession s : memberList.keySet()) {
		        if(memberList.get(s).equals(target)) {
		        	System.out.println(s);
		            targetUser = s;
		        }
		    }
			if(targetUser != null) {
				String sendMsg = "{\"message\" : \"true\", \"string\" : \"" + user + "님이 입장했습니다.\"}";
				System.out.println(sendMsg);
				TextMessage tm = new TextMessage(sendMsg);
				targetUser.sendMessage(tm);
			}
			
			
//			for(WebSocketSession s : sessionList) { //세션리스트에 있는 모든 사람에게 보냄
//				if(!session.equals(s)) { //들어온 본인에게는 보내지 않음
//					TextMessage tm = new TextMessage(sendMsg);
//					s.sendMessage(tm);
//				}
//			}
		} else if(type.equals("refuse")) {
			
			WebSocketSession targetUser = null;
			for(WebSocketSession s : memberList.keySet()) {
		        if(memberList.get(s).equals(target)) {
		        	System.out.println(s);
		            targetUser = s;
		        }
		    }
			if(targetUser != null) {
				String sendMsg = "{\"refuse\" : \"true\", \"string\" : \"" + user + "님이 채팅 요청을 거절했습니다. 채팅이 종료됩니다.\"}";
				System.out.println(sendMsg);
				TextMessage tm = new TextMessage(sendMsg);
				targetUser.sendMessage(tm);
			}
			
		} else if(type.equals("chat")) {
			WebSocketSession targetUser = null;
			for(WebSocketSession s : memberList.keySet()) {
		        if(memberList.get(s).equals(target)) {
		        	System.out.println(s);
		            targetUser = s;
		        }
		    }
			if(targetUser != null) {
				String msg = element.getAsJsonObject().get("msg").getAsString();
				String sendMsg = "{\"chat\" : \"true\", \"string\" : \"" + msg + "\"}";
				System.out.println(sendMsg);
				TextMessage tm = new TextMessage(sendMsg);
				targetUser.sendMessage(tm);
			} 		
		}
	}
	// 클라이언트가 연결을 끊을 때 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		memberList.remove(session);
	}
}