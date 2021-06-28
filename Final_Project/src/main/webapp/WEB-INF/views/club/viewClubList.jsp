<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/freeBoardFrm/bootstrap.css">
<title>${cgName}에해당하는클럽들</title>
<style>

	body{
		width: 100%;
  height: 100%;
  /* background-color:#fff; */
  position: relative;
  z-index: 1;
  color:black;
	}
	body::after{
	width: 100%;
  height: 100%;
  content: "";
   /* background-image:url("/resources/main/images/intro_4.jpg"); */ 
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.7;
	}
	.all-wrap *, .viewClubList *{
	color: black;
	}
	.categoryNavi >ul > li a{		
	color: black;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
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
	<c:if test="${!empty sessionScope.m }">
	<button type="button" onclick="location.href='/createClubFrm.do';" style="float:right; margin-right:300px; width:150px; height:70px; background-color:#ec5674; font-size:18px; font-weight:bold;">MAKE CLUB</button>
	</c:if>
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
							${club.clubName}</a>
						</h4>
						<a href="#" style="text-decoration: none;" id="imgScale"><img class="card-text" src="/resources/clubImgUpload/${club.filePath }"
							style="width: 250px; height: 200px;" alt="이미지들어갈곳"></img></a>
					</div>
					<p class="card-text" style="border-top:1px solid #ccc; line-height:50px;">개설일 : ${club.enrollDate}</p>
					<p class="card-text" style="border-top:1px solid #ccc; ">제제횟수 : ${club.warningCount}</p>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>