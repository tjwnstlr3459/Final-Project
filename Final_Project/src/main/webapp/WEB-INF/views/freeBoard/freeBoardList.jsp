<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드게시판</title>
<style>
.container {
	padding-top: 100px;
	margin: 0 auto;
	text-align: center;
}
#feed_info {
  background-color: #ec523f;
  color: white;
  padding: 15px 40px;
  text-transform: uppercase;
  font-weight: 700;
  float:right;
  margin-right:200px;
  }
#feed_info:hover{
	cursor:pointer;
  }
.posting>img {
	width: 700px;
	height: 600px;
	text-align: center;
	margin: 30px;
}

.posting>img:hover {
	cursor: pointer;
}

.posting {
	background-color: #ccc;
	text-align: center;
	margin: 0 auto 40px;
	border:1px solid #ccc;
	width:800px;
}

.etc {
	display:block;
	text-align: center;
	margin-right:200px;
}

.etc>button {
	background-color: transparent;
	border: none;
	font-size: 30px;
	margin: 20px;
}
.etc>button:hover{
	cursor:pointer;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<h1 style="margin-left: 200px; margin-top:50px;">CLUB FEED</h1>
	<c:choose>
	<c:when test="${!empty sessionScope.m }">
	<button id="feed_info">MAKE FEED</button>
	</c:when>
	</c:choose>
	<div class="container">
		<div class="posting">
			<img src="/resources/main/images/intro_1.jpg">
			<p class="etc">
				<button>
					<i class="far fa-heart"></i>
				</button>
				<button>
					<i class="far fa-circle"></i>
				</button>
			</p>
			<p class="comments"></p>
		</div>
		<div class="posting">
			<img src="/resources/main/images/intro_2.jpg">
			<p class="etc">
				<button>
					<i class="far fa-heart"></i>
				</button>
				<button>
					<i class="far fa-circle"></i>
				</button>
			</p>
			<p class="comments"></p>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>