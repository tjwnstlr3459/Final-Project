package kr.or.admin.model.service;

import java.util.ArrayList;
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
	
	//클라이언트가 최초로 웹소켓 서버에 접속했을 때 수행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("클라이언트가 접속함");
		System.out.println(session);
		System.out.println(session.toString());
		sessionList.add(session);		//새로 접속한 클라이언트의 췝소켓 세션을 list에 추가(사용자가 접속할때마다)
	}
	// 클라이언트가 서버로 전송했을 때 수행되는 메소드(실제 웹소켓 로직을 구현하는 메소드)
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message)throws Exception{
		//WebSocketSession session : 
		//jsp에서 웹소켓을 통해 보내준 메세지 값(문자열) 확인
		System.out.println(message.getPayload());
		JsonParser parser = new JsonParser();						//문자열을 JSON타입으로 처리하기 위한 parser객체 생성
		JsonElement element = parser.parse(message.getPayload());	//parser를 이용하여 JSON데이터를 분석
		//키 > type,msg
		String type = element.getAsJsonObject().get("type").getAsString();	//키가 "type"인 value 추출
		String msg = element.getAsJsonObject().get("msg").getAsString();	//키가 "msg"인 value 추출
		
		if(type.equals("enter")) {
			memberList.put(session, msg);	//map에 세션에 해당하는 memberId를 저장
			String sendMsg = "<p>"+msg+"님이 입장하셨습니다.</p>";
			for(WebSocketSession s : sessionList) {
				if(!session.equals(s)) {						//본인에게는 전송 제외
					TextMessage tm = new TextMessage(sendMsg);
					s.sendMessage(tm);
				}
			}
		}else if(type.equals("chat")) {
			String sendMsg = "<div class='chat left'><span class='chatId'>"+memberList.get(session)+" : </span>"+msg+"</div>";
			for(WebSocketSession s : sessionList) {
				if(!session.equals(s)) {
					TextMessage tm = new TextMessage(sendMsg);
					s.sendMessage(tm);
				}
			}
		}
	}
	// 클라이언트가 연결을 끊을 때 수행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);			//접속이 끊긴 세션을 list에서 제거
		for(WebSocketSession s : sessionList) {
			TextMessage tm = new TextMessage("<p>"+memberList.get(session)+"님이 퇴장하셨습니다</p>");
			s.sendMessage(tm);
		}
		System.out.println(memberList.get(session));
		System.out.println(memberList.size());
		memberList.remove(session);
		System.out.println(memberList.size());
	}
}