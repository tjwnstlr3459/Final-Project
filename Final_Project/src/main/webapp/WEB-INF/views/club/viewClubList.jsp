<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css">
<title>${cgName}에해당하는클럽들</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<hr>
	<h1 style="font-size: 40px; text-align: center;">${cgName}</h1>
	<br>
	<c:choose>
	 <c:when test="${cgName eq '영화' }">
		<h5 style="text-align: center; font-size: 19px;">${cgName }를 사랑하는 사람들이 개설한 클럽목록입니다.</h5>
	</c:when>
	<c:otherwise>
	<h5 style="text-align: center; font-size: 19px;">${cgName }을 사랑하는 사람들이 개설한 클럽목록입니다.</h5>
	</c:otherwise>
	</c:choose>
	<hr>
	<h3 style="text-align: center;">CLUB LIST</h3>
	<div class="all-wrap">
		<div class="categoryNavi">
				 <b style="text-align:center; font-size:27px; margin-left: 70px;">Category</b><br><br> 
			<ul>
				<li><a href="/viewClubList.do?cgNo=4">스포츠</a></li>
				<li><a href="/viewClubList.do?cgNo=6">여행</a></li>
				<li><a href="/viewClubList.do?cgNo=10">술</a></li>
				<li><a href="/viewClubList.do?cgNo=11">음식</a></li>
				<li><a href="/viewClubList.do?cgNo=8">게임</a></li>
				<li><a href="/viewClubList.do?cgNo=7">자연</a></li>
				<li><a href="/viewClubList.do?cgNo=5">음악</a></li>
				<li><a href="/viewClubList.do?cgNo=9">영화</a></li>
			</ul>
		</div>
		<div class="viewClubList">
			<c:forEach items="${list }" var="club">
				<div class="card border-white-primary mb-3"
					style="max-width: 20rem;">
					<div class="card-header">${club.clubOpener} 님의 클럽입니다.</div>
					<div class="card-body">
						<h4 class="card-title">
							<a href="#" style="text-decoration: none;">${club.clubName}</a>
						</h4>
						<img class="card-text" src="/resources/main/images/intro_1.jpg"
							style="width: 100%; height: 100%;" alt="이미지들어갈곳"></img>
					</div>
					<p class="card-text" style="border-top:1px solid #ccc; line-height:50px;">개설일 : ${club.enrollDate}</p>
					<p class="card-text" style="border-top:1px solid #ccc; ">제제횟수 : ${club.warningCount}</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>