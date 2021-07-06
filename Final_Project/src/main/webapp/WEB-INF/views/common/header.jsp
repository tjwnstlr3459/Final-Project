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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">

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
	width: 1920px;
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
	padding: 8px 30px;
	font-size: 16px;
	font-weight: bold;
}
.navbar_menu {
        	margin-bottom: 0px;
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
	margin-right: 200px;
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
</style>
</head>
<body>
	<nav class="navbar" style="margin: 0px">
		<div class="navbar_logo" style="margin-left:100px;">
			<i class="fas fa-people-arrows"></i> <a href="/main.jsp">NUNADRI</a>
		</div>
		<ul class="navbar_menu">
			<li><a href="/main.jsp#clubCategory">CLUB CATEGORY</a></li>
			<li><a href="/freeBoardList.do">CLUB FEED</a></li>
			<c:if test="${empty sessionScope.m }">
			<li><a onclick="loginCheck();" style="cursor:pointer; color:#fff;">CREATE CLUB</a></li>
			</c:if>
			<c:if test="${!empty sessionScope.m }">
			<li><a href="/createClubFrm.do">CREATE CLUB</a></li>
			</c:if>
			<li><a href="/newClub.do?clubNo=38">CLUB VIEW</a></li>
			<li><a href="/boardList.do?reqPage=1&type=1&sort=1">FEEDBACK</a></li>
			<c:if test="${empty sessionScope.m }">
				<li><a href="/loginFrm.do">LOGIN</a></li>
				<li><a href="/join.do">JOIN</a></li>
			</c:if>
			<c:if test="${sessionScope.m.grade lt 2 }">
			<li><a href="/adminMain.do">ADMIN</a></li>
			<li><a href="/logout.do">LOGOUT</a></li>
			</c:if>
			<c:if test="${sessionScope.m.grade ge 2 }">
			<li><a href="/myClub.do">${sessionScope.m.memberNick }'s CLUB</a></li>
			<li><a href="/logout.do">LOGOUT</a></li>
			</c:if>

		</ul>
		<ul class="navbar_icons" style="margin-right: 150px;">
			<li
				onclick="window.open('https://www.facebook.com/%EB%84%88%EB%82%98%EB%93%A4%EC%9D%B4-102411682096038')"
				style="cursor: pointer;"><i class="fab fa-facebook-f"></i></li>
			<li onclick="window.open('https://www.instagram.com/nunadri_/')"
				style="cursor: pointer;"><i class="fab fa-instagram"></i></li>
		</ul>
	</nav>
	<script>
	function loginCheck() {
		if(${empty sessionScope.m}){
		alert("로그인 후 가능한 서비스입니다.");
		location.href = "/loginFrm.do";				
		}else{
			location.href="/createClubFrm.do";
		}
	}
	</script>
</body>
</html>