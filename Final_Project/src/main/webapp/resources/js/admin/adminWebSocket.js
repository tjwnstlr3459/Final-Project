$(function(){
	var ws;
	var memberEmail;
	function initMember(){
		//memberEmail = email;
		//웹 소켓 생성 > 연결 시도
		ws = new WebSocket("ws://192.168.10.24//inMemberCount.do");
		//1. 웹소켓 연결 성공 시 실행 함수 지정
		ws.onopen = inMember;
		//2. 웹소켓으로 서버가 데이터를 전송할 시 로직을 수행할 함수 지정
		ws.onmessage = receiveMsg;
		//3. 웹소켓연결이 종료되면 수행할 함수 지정
		ws.onclose = outMember;
	}
	function inMember(){
	/*
		var data = {type:"in", msg:memberEmail};
		ws.send(JSON.stringify(data));
	*/
	}
	function receiveMsg(param){
	
	}
	function outMember(){
	
	}
	function getSessionEmail(){
		$.ajax({
			url:"/getSessionEmail.do",
			success : function(data){
				memberEmail = data.email;
				initMember(data.email);
			}
		});
	}
	initMember();
	//getSessionEmail();
});
