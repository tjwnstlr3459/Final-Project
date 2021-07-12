<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.3/css/all.css"
	integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="/resources/css/footer.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="resources/css/member/chat.css">

	<!-- 현재 접속자 파싱 웹소켓 -->
	<script src="/resources/js/admin/adminWebSocket.js"></script>
<style>
body {
font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
}

.navbar_logo>a {
	text-decoration: none;
	color: #fff;
}

.navbar_menu>li>a {
	text-decoration: none;
	color: #fff;
	font-family: 'Noto Sans KR', sans-serif;
}

.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #ec523f;
	height: 85px;
	font-size: 16px;
	font-weight: bold;
	min-width:1600px;
}

.navbar_logo {
	font-size: 24px;
	color: #fff;
	font-family: 'Noto Sans KR', sans-serif;
}

.navbar_logo {
	color: #152447;
}

.navbar_menu {
	display: flex;
	list-style: none;
	padding-left: 0;
}

.navbar_menu li {
	padding: 15px 0px;
	font-size: 16px;
	font-weight: bold;
}
.navbar_menu {
        	margin-bottom: 0px;
        	text-align:center;
        	        }
.navbar_menu :hover {
	background-color: #152447;
	border-radius: 10px;
}

.navbar_icons li {
	list-style-type: none;
	color: #fff;
	display: flex;
}

.navbar_icons li {
	padding: 8px 10px;
	float: left;
}

#go-top {
	background-color: #ec523f;
	color: white;
	padding: 15px 40px;
	text-transform: uppercase;
	font-weight: 700;
	float: right;
	text-decoration: none;
}

.viewClubList {
	display: flex;
	align-items: center;
	flex-wrap: wrap;
	margin-left:350px;
}

.viewClubList>div {
	margin: 50px;

}

.viewClubList>.card border-white-primary mb-3 {
	padding: 20px;
}

.viewClubList p {
	text-align: center;
	height: 40px;
	line-height: 40px;
	font-size: 17px;
	font-weight:bold;
}
.categoryNavi{
 position:fixed; 
}

.categoryNavi ul {	
	overflow: hidden;
	list-style-type: none;
	margin: 0;
	padding: 0;
	margin-left: 40px;
}
/* .categoryNavi ul{
	border: 1px solid black;
	border-radius: 7%;
} */
.categoryNavi ul>li>a {
	display: block;
	width: 200px;
	height: 50px;
	text-align: center;
	line-height: 50px;
	text-decoration: none;
	border-bottom: 1px solid black;
}
.categoryNavi>ul>li>a {
	background-color: transparent;
	color: black;
	font-size: 23px;
}
.categoryNavi>ul>li :hover{
	background-color: transparent;
	font-weight: bolder;
}
.cardTitle>a :hover{
	font-weight: bolder;
	color:black;
}

/*헤더드롭메뉴 조정중*/
.dropmenu{
	position:relative;
}
#dm_ul{ /* background-color: navy; */ text-align: center;}
        .dropmenu ul ul{position: absolute; display: none;}
        .dropmenu ul ul li{display: block;   color: black;}
      .dropmenu ul li{display: inline-block;}
      .dropmenu ul li a{display: block;  width: 170px; color: white; /* line-height: 43px; */
        text-decoration: none;}
		.sub li a {
		width: 20px;
		}
		.sub{
			padding:0px;
			background-color: #152447;
		}
		.sub li{
			text-align:center;
			margin-top: 15px;
		}
		.sub li a{
			text-align:center;
		}
		.sub{
			border-radius:10px;
			z-index: 1;
		}

</style>
</head>
<body>
	<nav class="navbar" style="margin: 0px; padding: 0px 200px 0px 200px;">
		<div class="navbar_logo" style="margin-left:100px;">
			<i class="fas fa-people-arrows"></i> <a href="/main.jsp">NUNADRI</a>
		</div>
		<div class="dropmenu">
		 <ul class="navbar_menu">
		 <c:if test="${sessionScope.m.grade ge 2 }">
		 	<li><a href="#" onclick="location.href='/myClub.do';" style="cursor: pointer;">${sessionScope.m.memberNick }'s CLUB</a></li>
		 </c:if>
		 	<li><a style="cursor:pointer;" disabled>클럽</a>
          <ul class='sub'>
            <li><a href="/main.jsp#clubCategory">클럽 카테고리</a></li>
            <li><a href="/freeBoardList.do">클럽 피드</a></li>
             <li><a href="#" onclick="loginCheck();" style='cursor:pointer;'>클럽 만들기</a></li> 
            <!-- <li><a href="loginCheck();">클럽 만들기</a></li> -->
          </ul>
        </li>
			<%-- <li><a href="/main.jsp#clubCategory">CLUB CATEGORY</a></li>
			<li><a href="/freeBoardList.do">CLUB FEED</a></li>
			<c:if test="${empty sessionScope.m }">
			<li><a onclick="loginCheck();" style="cursor:pointer; color:#fff;">CREATE CLUB</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.m }">
			<li><a href="/createClubFrm.do">CREATE CLUB</a></li>
			</c:if> --%>
			<c:if test="${empty sessionScope.m }">
				<li><a href="/loginFrm.do">로그인</a></li>
				<li><a href="/join.do">회원가입</a></li>
			</c:if>
			<c:if test="${sessionScope.m.grade lt 2 }">
			<li><a href="/adminMain.do">ADMIN</a></li>
			<li><a href="/logout.do">로그아웃</a></li>
			</c:if>
			<c:if test="${sessionScope.m.grade ge 2 }">
			<li><a href="/mypage.do">마이페이지</a></li>
			<li><a href="/logout.do">로그아웃</a></li>
			</c:if>
			<li><a href="/boardList.do?reqPage=1&type=1&sort=1">Q&A</a></li>

		</ul>
		</div>
		<ul class="navbar_icons" style="margin-right: 150px;">
			<li
				onclick="window.open('https://www.facebook.com/%EB%84%88%EB%82%98%EB%93%A4%EC%9D%B4-102411682096038')"
				style="cursor: pointer; color:black;"><i class="fab fa-facebook-f"></i></li>
			<li onclick="window.open('https://www.instagram.com/nunadri_/')"
				style="cursor: pointer; color:black;"><i class="fab fa-instagram"></i></li>
		</ul>
	</nav>
	<div class="modalchat">
		<div class="modalchat-content">
				<div class="rcvchat">		
							
				</div>
			</div>
		</div>	
	</div>
	<script>
	var ws;
	var chatWs;
	
	function loginCheck() {
		if(${empty sessionScope.m}){
		alert("로그인 후 가능한 서비스입니다.");
		location.href = "/loginFrm.do";				
		}else{
			location.href="/createClubFrm.do";
		}
	}
	$(function() {		
		var loginList; 
		
		function loggedIn() {
			var email = "<c:out value='${m.email}'/>";
			console.log(email);
			if(!(email == undefined)) {
				//ws = new WebSocket("ws:/172.30.1.5/loginMember.do");
				ws = new WebSocket("ws:/khdsa1.iptime.org:18080/loginMember.do");
				//1. 웹소켓 연결 성공 시 실행 함수 지정
				ws.onopen = loginMember;
				//2. 웹소켓으로 서버가 데이터를 전송할 시 로직을 수행할 함수 지정
				ws.onmessage = loginFriend;
				//3. 웹소켓연결이 종료되면 수행할 함수 지정
				ws.onclose = outMember;
			}		
		}
		function loginMember() {
			var name = "<c:out value='${m.memberNick}'/>";
			console.log("로그인 유저 : " + name);
			var data = {type:"login", user:name};
			ws.send(JSON.stringify(data));
		}
		function loginFriend(param) {
			loginList = JSON.parse(param.data);
			console.log(loginList);
			if (loginList.hasOwnProperty('name')) { //name 키가 있을 때
				print(loginList); //채팅 요청 div 보여주기
			} else { //키가 따로 없을 때
				showFriend(loginList); //로그인된 친구 표시하기
			}		
		}
		function outMember() {
			
		}
		//채팅 요청 출력
		function print(req) {
			$(".modalchat").show();
			$(".rcvchat").html('<i class="fas fa-bell fa-beat blink"></i> ' + req.string);
			$(".rcvchat").after('<button type="button" class="chatButton" onclick="accChat(\'' + loginList.name + '\')">요청 수락</button>');
			$(".rcvchat").after().after('<button type="button" class="chatButton" onclick="refChat(\'' + loginList.name + '\')">요청 거절</button>');
		}
		//로그인된 친구 표시
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
		
		loggedIn();
	})

	$(".dropmenu ul li").hover(function(){
		$(this).find("ul").stop().fadeToggle(1);
      });
	
	function accChat(target) {
		window.open("/onechat.do?targetUser=" + target, "너나들이-채팅", "width=400, height=600");
		$(".modalchat").hide();
	}
	function refChat(target) {
		$(".modalchat").hide();
		//chatWs = new WebSocket("ws:/172.30.1.5/memberChat.do");
		chatWs = new WebSocket("ws:/khdsa1.iptime.org:18080/memberChat.do");
		//1. 웹소켓 연결 성공 시 실행 함수 지정
		chatWs.onopen = function() {
			var name = "<c:out value='${m.memberNick}'/>";
			console.log("요청 유저 : " + target);
			console.log("거절 유저 : " + name);
			var data = {type:"refuse", user:name, target:target};
			chatWs.send(JSON.stringify(data));
		}
		//2. 웹소켓으로 서버가 데이터를 전송할 시 로직을 수행할 함수 지정
		chatWs.onmessage = loginFriend;
		//3. 웹소켓연결이 종료되면 수행할 함수 지정
		chatWs.onclose = outMember;
	}
	function sendRefusal(target) {
		var name = "<c:out value='${m.memberNick}'/>";
		console.log("요청 유저 : " + target);
		console.log("거절 유저 : " + name);
		var data = {type:"refuse", user:name, target:target};
		chatWs.send(JSON.stringify(data));
	}
	</script>
</body>
</html>