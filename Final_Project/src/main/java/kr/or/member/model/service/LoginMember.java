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
		
		if(type.equals("login")) { //로그인 했을 때(헤더가 로드 되었을 때)
			//아직 멤버릿트 map에 세션에 해당하는 유저가 없다면 map에 유저를 저장 
			if(!memberList.containsValue(user)) {
				memberList.put(session, user);
			}			
			
			//세션키 확인용
			for (WebSocketSession key : memberList.keySet()) {
				String value = memberList.get(key);
			    System.out.println("[key]:" + key + ", [value]:" + value);
			}    
			
			//해당하는 유저의 친구 리스트 가져오기
			service.selectFriends(user);
			ArrayList<Member> fList = (ArrayList<Member>)dao.selectFriend(user);
			ArrayList<String> loginUser = new ArrayList<String>();
			for(int i=0; i<fList.size(); i++) { //친구 리스트를 돌면서
				if(memberList.containsValue(fList.get(i).getMemberNick())) { //로그인된 세션 중에  친구가 존재하는지 확인
					loginUser.add(fList.get(i).getMemberNick()); //로그인된 친구 리스트에 추가
				}
			}
			String sendMsg = new Gson().toJson(loginUser);
			TextMessage tm = new TextMessage(sendMsg);
			session.sendMessage(tm); //로그인된 친구 리스트를 전송
			
//			for(WebSocketSession s : sessionList) { //세션리스트에 있는 모든 사람에게 보냄
//				if(!session.equals(s)) { //들어온 본인에게는 보내지 않음
//					TextMessage tm = new TextMessage(sendMsg);
//					s.sendMessage(tm);
//				}
//			}
		} else if(type.equals("chatReq")) { //채팅 요청을 보냈을 때
			//target 키의 값 추출
			String target = element.getAsJsonObject().get("target").getAsString();
			System.out.println(user);
			System.out.println(target);
			
			//세션에서 요청 대상이 있는지 검색
			WebSocketSession targetUser = null;
			for(WebSocketSession s : memberList.keySet()) {
		        if(memberList.get(s).equals(target)) {
		        	System.out.println(s);
		            targetUser = s;
		        }
		    }
			if(targetUser != null) { //대상이 로그인되어 있으면
				String sendMsg = "{\"name\" : \"" + user + "\", \"string\" : \"" + user + "님이 채팅을 요청하셨습니다. 채팅을 시작하시겠습니까?\"}";
				System.out.println(sendMsg);
				TextMessage tm = new TextMessage(sendMsg);
				targetUser.sendMessage(tm);
			} else { //대상이 로그인되어 있지 않으면
				String sendMsg = "채팅 요청 중 에러가 발생했습니다. 다시 시도해주세요.";
				TextMessage tm = new TextMessage(sendMsg);	
				session.sendMessage(tm);
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
