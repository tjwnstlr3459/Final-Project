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
  color:black;
	}
	.all-wrap *, .viewClubList *{
	color: black;
	}
	.categoryNavi >ul > li a{		
	color: black;
	}
	button{
  /* background: rgba(236,82,63,0.1); */
  background : black;
  color:#fff;
  border:none;
  position:relative;
  height:60px;
  font-size:1.6em;
  padding:0 2em;
  cursor:pointer;
  transition:400ms ease all;
  outline:none;
}
button:hover{
  background:transparent;
  color:black;
}
button:before,button:after{
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: black;
  transition:200ms ease all;
}
button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
button:hover:before,button:hover:after{
  width:100%;
  transition:800ms ease all;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<h1 style="font-size: 40px; text-align: center; margin-top:20px;">${cgName}</h1>
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
	<div>
		<!-- <a href="/createClubFrm.do" style="float:right; margin-right:100px; font-size:18px; color:black; font-weight:bold; text-decoration:none;">MAKE CLUB</a> -->
		<button onclick="location.href='/createClubFrm.do';" style='float:right; margin-right:200px; font-size:13px;' >클럽만들기</button>
	</div>
	</c:if>
	<div class="all-wrap">
		<div class="categoryNavi">
				 <b style="text-align:center; font-size:27px; margin-left: 70px;">Category</b><br><br> 
			<ul>
				<li><a href="/viewAllClubList.do">전체</a></li>
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
					<div class="card-header">${club.clubOpener} 님의 클럽입니다.
					</div>
					<div class="card-body">
						<h4 class="card-title">
							${club.clubName}
						</h4>
						<a href="/newClub.do?clubNo=${club.clubNo }" style="text-decoration: none;" id="imgScale"><img class="card-text" src="/resources/clubImgUpload/${club.filePath }"
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