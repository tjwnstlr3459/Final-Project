<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이-채팅</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	body {
		margin:0;
	}
	.chatting {
		width: 100vw;
		height: 100vh;
		display:flex;
		flex-direction:column;
		justify-content:space-between;
	}
	.title {
		width: 100%;
		height: 35px;
		line-height: 35px;
		background-color: black;
		color: white;
		text-align: center;
	}
	.messageArea{
		flex-grow: 1;
		overflow-y: auto;
		border: 1px solid black;
		height: 500px;
		display: flex;
		flex-direction: column;
		background-color: #ddd;				
		box-sizing:border-box;
		padding-left:15px;
		padding-right:15px;
	}
	.messageArea>p {
		text-align: center;
		width: 100%;
		background-color:white;
		border-raduis: 4px;
		padding: 3px;
	}	
	.sendBox {
		width:100%;
		height:35px;
		display:flex;
		justify-content:space-between;
		align-items:center;
		margin-bottom: 5px;
	}	
	input,
	textarea {
	  flex: 1;
	  width: 300px;
	  height: 35px;
	  padding: 5px;
	  box-sizing: border-box;
	}
	input:focus,
	textarea:focus {
	  outline: none;
	}
	button {
	  width: 100px;
	  height: 35px;
	  color: white;
	  font-weight: bold;
	  background-color: #ec523f;
	  border: 0;
	}
	.chat {
		margin-bottom: 10px;
		padding: 8px;
		border-radius: 3px;
	}
	.right{
		background-color: #ffeb33;
		align-self: flex-end;
		margin-right: 10px;
	}
	.left {
		background-color: #ffffff;
		align-self: flex-start;
		margin-left: 10px;
	}
</style>
</head>
<body>
	<div class="chatting">
		<div class="title">${target } 님과의 채팅</div>
		<div class="messageArea"></div>
		<div class="sendBox">
			<input type="text" id="sendMsg">
			<button id="sendBtn" onclick="sendMsg()">전송</button>
		</div>
	</div>
	<script>
	var chatWs;
	var user = "<c:out value='${m.memberNick}'/>";
	var target = "<c:out value='${target}'/>";

		function chat() {
			var email = "<c:out value='${m.email}'/>";
			console.log(email);
			if(!(email == undefined)) {
				chatWs = new WebSocket("ws:/172.30.1.42/memberChat.do");
				//1. 웹소켓 연결 성공 시 실행 함수 지정
				chatWs.onopen = initChat;
				//2. 웹소켓으로 서버가 데이터를 전송할 시 로직을 수행할 함수 지정
				chatWs.onmessage = receiveMsg;
				//3. 웹소켓연결이 종료되면 수행할 함수 지정
				chatWs.onclose = outMember;
			}		
		}
		function initChat() {
			var name = "<c:out value='${m.memberNick}'/>";
			var tName = "<c:out value='${target}'/>";
			console.log("로그인 유저 : " + name);
			console.log("상대 유저 : " + tName);
			var data = {type:"chatin", user:name, target:tName};
			chatWs.send(JSON.stringify(data));
			appendChat("<p>채팅방에 입장했습니다.</p>");
		}
		function receiveMsg(param) {
			msg = JSON.parse(param.data);
			console.log(msg);
			if(msg.hasOwnProperty('refuse')) {
				appendChat("<p>" + msg.string + "</p>");
				console.log(msg.string);
				outMember();
			} else if(msg.hasOwnProperty('message')) {
				appendChat("<p>" + msg.string + "</p>");
			} else if(msg.hasOwnProperty('chat')) {
				appendChat("<div class='chat left'>" + msg.string + "</div>");
			}
		}
		$("#sendMsg").keypress(function(event){
	    	if ( event.which == 13 ) {
	        	$('#sendBtn').click();
	         	return false;
	     	}
		})
		function outMember() {
			var data = {type:"chatout", user:user, target:target};
			chatWs.send(JSON.stringify(data));
			appendChat("<p>연결이 해제되었습니다</p>");			
		}
		function appendChat(msg) {
			$(".messageArea").append(msg);
			$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
		}
		function print(loginList) {
			$(".rcvchat").html(loginList);
			$(".rcvchat").attr("display", "block");
		}
		function showFriend(loginList){
			var friends = $(".friendName");
			console.log(friends.length);
			for(var i=0;i<friends.length;i++){				
				for(var j=0;j<loginList.length;j++){
					if(friends.eq(i).text() == loginList[j]){
						friends.eq(i).attr("class","friendName onFriend");
						friends.eq(i).parent().prev().append("<span class='onbadge'>on</span>");
						break;
					}
				}
			}
		}
		function endChat() {
			appendChat("<p>서버와의 연결이 끊어졌습니다.</p>");
		}
		function appendChat(msg) {
			$(".messageArea").append(msg);
			$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
		}
		function sendMsg() {
			var msg = $("#sendMsg").val();
			if(msg != '') {
				var data = {type:"chat", user:user, msg:msg, target:target};
				chatWs.send(JSON.stringify(data));
				appendChat("<div class='chat right'>" + msg + "</div>");
				$("#sendMsg").val("");
			}
		}
		
		chat();

	</script>
</body>
</html>