<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<!DOCTYPE html>
		<html lang="ko" class="mdl-js">

		<head>
			<meta charset="utf-8">
			<meta http-equiv="X-UA-Compatible" content="IE=edge">
			<meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
			<title>모임 개설하기</title>
			<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
			<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
			<!-- Add to homescreen for Chrome on Android -->
			<meta name="mobile-web-app-capable" content="yes">
			<link rel="icon" sizes="192x192" href="../../image/android-desktop.png">

			<!-- Add to homescreen for Safari on iOS -->
			<meta name="apple-mobile-web-app-capable" content="yes">
			<meta name="apple-mobile-web-app-status-bar-style" content="black">
			<meta name="apple-mobile-web-app-title" content="Material Design Lite">
			<link rel="apple-touch-icon-precomposed" href="../../image/ios-desktop.png">

			<!-- Tile icon for Win8 (144x144 + tile color) -->
			<meta name="msapplication-TileImage" content="../../image/touch/ms-touch-icon-144x144-precomposed.png">
			<meta name="msapplication-TileColor" content="#3372DF">

			<link rel="shortcut icon" href="../../image/favicon.png">

			<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
			<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

			<link rel="stylesheet"
				href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
			<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
			<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.grey-orange.min.css">
			<link rel="stylesheet" type="text/css" href="/resources/css/newClub/newClub.css" />
			<link rel="stylesheet" type="text/css" href="/resources/css/newClub/newClub2.css" />
			<!--script-->
			<script src="/resources/js/newClub/modal.js"></script>
			<style>
				#view-source {
					position: fixed;
					display: block;
					right: 0;
					bottom: 0;
					margin-right: 40px;
					margin-bottom: 40px;
					z-index: 900;
				}
			</style>
		</head>
		<body>

		<%@ include file="/WEB-INF/views/common/header.jsp"%>

			<div class="wrapper">
				<div class="container">
					<div class="wrap">
						<div class="navi">
							<ul class="menu">
								<li class="active"><a href="#">게시글</a></li>
								<li><a href="#">사진첩</a></li>
								<li><a href="#">일정</a></li>
								<li><a href="#">멤버</a></li>
							</ul>
						</div>
						<div class=contain>
							<div class="left">
								<div class="profile">
									<div class="clubimg">

									</div>
									<div class="clubinfo1">
										<div class="memberNum">멤버 수</div>
										<div class="inviteMember">초대하기</div>
									</div>
									<div class="clubinfo2">
										<div class="clubnotice">가입해주셔서 감사합니다 많이 소통해요</div>
									</div>
								</div>
							</div>
							<div class="middle">
								<div class="tab-cont">
									<div>
									<c:forEach items="${list }" var="board">
										<div class="board-wrap">
											<div class="userinfo" style="height: 30%;">											
												<div class="userImg"></div>  
												<div class="userName">${board.boardWriter }</div>
												<div class="enrollDate">${board.enrollDate }</div>
											</div>	
											<div class="boardcontain" style="height: 40%;">
												${board.boardContent}
											</div>
											<div class="userview" style="height: 30%;">
													<div class="usernum">조회수 3명 읽음</div>
													<div class="btn trigger"><a href="#">상세보기</a></div>
											</div>
										</div>
									</c:forEach>
									</div>
									<div>2.내용입니다</div>
									<div>3.내용입니다</div>
									<div>4.내용입니다</div>
								</div>
							</div>
							<div class="right">
								<div class="chatlist">
									<div class="chat">채팅하기</div>
									<div class="chatcontent">채팅목록</div>
								</div>
							</div>
						</div>
					</div>						
				</div>
			</div>
			<!-- Modal -->
                <div class="modal-wrapper">
                   <div class="modal">
                      <div class="head">
                         <a class="btn-close trigger" href="#">
                            <i class="fa fa-times" aria-hidden="true"></i>
                         </a>
                      </div>
                      <div class="content2">
                         <div class="good-job">
                            <i class="fa fa-thumbs-o-up" aria-hidden="true"></i>
                            <h1>Good Job!</h1>
                         </div>
                         <div class="close-wrapper">
                            <button id="close">닫기</button>
                         </div>
                      </div>
                   </div>
                </div>   
			<script>
				var tabBtn = $(".navi > .menu > li"); //각각의 버튼을 변수에 저장
				var tabCont = $(".tab-cont > div"); //각각의 콘텐츠를 변수에 저장

				tabCont.hide().eq(0).show();

				tabBtn.click(function () {
					var target = $(this); //버튼의 타겟(순서)을 변수에 저장
					var index = $(".navi>.menu>li").index(this); //인덱스
					tabBtn.removeClass("active"); //버튼의 클래스를 삭제
					target.addClass("active"); //타겟의 클래스를 추가
					tabCont.css("display", "none");
					tabCont.eq(index).css("display", "block");
				});
			</script>
		</body>

		</html>