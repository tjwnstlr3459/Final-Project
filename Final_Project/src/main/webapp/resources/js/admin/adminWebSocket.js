$(function(){
	var ws;
	var memberEmail;
	function initMember(){
		//memberEmail = email;
		//웹 소켓 생성 > 연결 시도
		ws = new WebSocket("ws://khdsa1.iptime.org:18080/inMemberCount.do");
		//1. 웹소켓 연결 성공 시 실행 함수 지정
		ws.onopen = inMember;
		//2. 웹소켓으로 서버가 데이터를 전송할 시 로직을 수행할 함수 지정
		ws.onmessage = receiveMsg;
		//3. 웹소켓연결이 종료되면 수행할 함수 지정
		ws.onclose = outMember;
	}	
	function inMember(){
	ws.send(JSON.stringify());
	/*
		var data = {type:"in", msg:memberEmail};
		ws.send(JSON.stringify(data));
	*/
	}
	function receiveMsg(param){
		var jsonObj = JSON.parse(param.data);
		console.log(jsonObj.visitorCount);
		if(window.location.pathname == "/adminMain.do") document.getElementById('visitor').innerHTML = jsonObj.visitorCount;
		if(jsonObj.notAnswerCount > 0){
			$('.alarm-box').show();
		}else{
			$('.alarm-box').hide();		
		}
	}
	function outMember(){
	
	}

	initMember();		//우리 사이트 접속(전역) 시 웹소켓 연결 함수
	insertVisit();		//우리 사이트 접속(전역) 시 visit테이블에 사용자 ip 저장(오늘 날짜에 없을 시에만)
});
function insertVisit(){
	$.ajax({
		url:"/insertVisit.do",
		success : function(data){	
			
		}
	});
}