<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="utf-8" />
<!-- JSTL Core 태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<title>너나들이 - My Page</title>
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/base.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/vendor.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/main.css" />
<!-- script
   ================================================== -->
<script src="/resources/js/myClub/modernizr.js"></script>
<script src="/resources/js/myClub/pace.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
<style>
	.myMenu > a {
		display: inline-block;
	}
</style>
</head>

<body id="top">
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<!-- page header
   ================================================== -->
	
	<!-- masonry
   ================================================== -->
	<section id="bricks" class="with-top-sep">
		<div class="row masonry">
		<section id="page-header">
		<div class="row current-cat">
			<div class="col-full" style="width:28%">
				<h1 style="margin: 0px">Latest Posts</h1>
				<hr>
			</div>
			
		</div>
	</section>
			<div class="leftCon">
				<div class="myInfo">
					<div class="myInfoImg">
						<img src="/resources/image/userPic/4R04w58K.jpg" />
					</div>
					<div class="userName">${sessionScope.m.memberNick}</div>
					<hr width="95%" style="margin: 0 auto" />
					<div>읽지 않은 메세지 1 건</div>
					<img src="/resources/image/icons/tag.png">
					<span>#${m.hobby1 }</span> <span>#${m.hobby2 }</span> <span>#${m.hobby3}</span>
				</div>
				<hr />
				<div class="myMenu">
					<a href="#">회원정보수정</a>
                    <a href="#">쪽지함</a>
                    <a href="#">내 친구</a>
                    <a href="#">문의/신고 내역</a>
				</div>
				<c:forEach items="${clubList}" var="l" varStatus="i">
					<div class="myClubList">
						<div class="clubListOne">
							<img src="/resources/image/6.jpg" />
						</div>
						<div class="clubListName">
							<div>${l.clubName}</div>
							<div class="clubJang" style="float: right">
								<img src="/resources/image/user04.jpg" />
							</div>
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="rightCon">
				${m.memberNick } 
				${m.intro }
				${m.hobby1 }
				${m.hobby2 }
				${m.hobby3 }
				<div>
				<c:forEach items="${dmList }" var="dm">
					<c:if test="${dm.receiver == m.memberNick and dm.readStatus == 'N'}">
					 읽지 않은 쪽지 
					</c:if>
					${dm.sender }, ${dm.receiver }, ${dm.dmContent }, ${dm.dmDate }, ${dm.readStatus }
				</c:forEach>
				</div>
				
				<!-- brick-wrapper -->
				<div class="bricks-wrapper" style="height: 1200px">
					<div class="grid-sizer"></div>
					<div class="photoWrapper">
						
					</div>
				</div>
				<!-- 오른쪽 컨텐츠 종료-->
			</div>
				<button class="btn btn-outline-info btn-block" currentCount="0"
					value="" totalCount="${totalCount }" id="more-btn" style="display:none;"></button>
			<!-- end brick-wrapper -->
		</div>
		
		
		<!-- 게시물 모달창 -->
		<div class="postModal" style="display: none">
			<div class="postModalPan"
				style="padding-bottom: 20px; padding-top: 20px">
				<div class="postUser">
					<div class="modalUserImg">
						<img src="/resources/image/user04.jpg" />
					</div>
					<div class="modalUserId">
						<div class="modalMemberName">유저네임</div>
						<div class="modalClubName">클럽이름</div>
					</div>
					<div class="modalClose" style="float: right">
						<img src="/resources/image/icons/x.png" style="width: 30px;">
					</div>
				</div>
				<!--아이디 정보-->
				<hr />
				<div class="postImg">
					<img src="/resources/image/user04.jpg" />
				</div>
				<!--이미지-->
				<div class="postContent"></div>
				<!--내용-->
				<div class="postLike">
					<div>
						<img src="/resources/image/icons/home.png" />
					</div>
					<div>
						<img src="/resources/image/icons/loveBean.png" />
					</div>
					<div class="postLikeCount" style="width: 100%">userName 님 외
						127명이 좋아합니다.</div>
				</div>
				<!--좋아요-->
				<hr />
				<div class="modalComent">
					<!--댓글-->
					<div>
						<div class="imgimg">
							<img src="/resources/image/user04.jpg" />
						</div>
					</div>
					<div>
						<div style="width: 70%; float: left">
							<div style="font-weight: bold; font-size: 12px; float: left;">바람돌이</div>
							<div style="width: 85%; float: left;">
								<p
									style="font-size: 12px; line-height: 15px; margin: 0px; float: left; margin-bottom: 10px;">
									안녕하세요 감사해요 잘있어요 다시만나요</p>
							</div>
						</div>
						<div
							style="width: 30px; float: left; height: 100%; display: flex; align-items: center;">
							<img src="/resources/image/icons/down.png" style="width: 30px;" />
						</div>
						<div style="float: left"></div>
					</div>
				</div>
				<hr />
				<div class="modalComentWrite">
					<div style="float: left;">
						<div class="imgimg">
							<img src="/resources/image/user04.jpg" />
						</div>
					</div>
					<div style="margin-bottom: 20px; float: left;">
						<input type="text" name="coment" class="comentWrite" />
					</div>
					<div style="float: left;">
						<img src="/resources/image/icons/check.png"
							style="width: 30px; margin-left: 10px; margin-top: 10px;" />
					</div>
				</div>
				<!--댓글 작성-->
			</div>
		</div>
	</section>
	<!-- bricks -->
	<div id="preloader">
		<div id="loader"></div>
	</div>
	<!-- Java Script
   ================================================== -->
	<script src="/resources/js/myClub/jquery-2.1.3.min.js"></script>
	<script src="/resources/js/myClub/plugins.js"></script>
	<script src="/resources/js/myClub/main.js"></script>
</body>


</html>