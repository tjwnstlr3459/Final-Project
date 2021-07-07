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

public class LoginMember extends TextWebSocketHandler {
	private ArrayList<WebSocketSession> sessionList;		//접속한 회원의 세션(eamil)을 저장하는 list
	private Map<WebSocketSession, String> memberList;		//각 세션별로 접속한 회원의 아이디를 저장하는 map
	@Autowired
	private MemberDao dao;
	@Autowired
	private MemberService service;
	
	public LoginMember() {
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
		
		if(type.equals("login")) {
			//map에 세션에 해당하는 memberID를 저장 
			if(!memberList.containsValue(user)) {
				memberList.put(session, user);
			}			
			
			for (WebSocketSession key : memberList.keySet()) {
				String value = memberList.get(key);
			    System.out.println("[key]:" + key + ", [value]:" + value);
			}    
			
			//해당하는 memberID의 친구 리스트 가져오기
			service.selectFriends(user);
			ArrayList<Member> fList = (ArrayList<Member>)dao.selectFriend(user);
			ArrayList<String> loginUser = new ArrayList<String>();
			for(int i=0; i<fList.size(); i++) {
				if(memberList.containsValue(fList.get(i).getMemberNick())) {
					loginUser.add(fList.get(i).getMemberNick());
				}
			}
			String sendMsg = new Gson().toJson(loginUser);
			TextMessage tm = new TextMessage(sendMsg);
			session.sendMessage(tm);
			
//			for(WebSocketSession s : sessionList) { //세션리스트에 있는 모든 사람에게 보냄
//				if(!session.equals(s)) { //들어온 본인에게는 보내지 않음
//					TextMessage tm = new TextMessage(sendMsg);
//					s.sendMessage(tm);
//				}
//			}
		} else if(type.equals("chatReq")) {
			//target 키의 값 추출
			String target = element.getAsJsonObject().get("target").getAsString();
			System.out.println(user);
			System.out.println(target);
			
			WebSocketSession targetUser = null;
			for(WebSocketSession s : memberList.keySet()) {
		        if(memberList.get(s).equals(target)) {
		            targetUser = s;
		        }
		    }
			String sendMsg = "string: " + user + "님이 채팅을 요청하셨습니다. 채팅을 시작하시겠습니까?";
			TextMessage tm = new TextMessage(sendMsg);
			targetUser.sendMessage(tm);
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
