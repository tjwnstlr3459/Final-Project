<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko" class="mdl-js">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>클럽 상세페이지</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="../../image/android-desktop.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="apple-touch-icon-precomposed"
	href="../../image/ios-desktop.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="../../image/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="../../image/favicon.png">

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.grey-orange.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/newClub.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/chat.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/modal.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/photo.css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- 메인달력 -->
<link href="/resources/css/reservation/packages/core/main.css"
	rel="stylesheet" />
<link href="/resources/css/reservation/packages/daygrid/main.css"
	rel="stylesheet" />
<script src="/resources/css/reservation/packages/core/main.js"></script>
<script src="/resources/css/reservation/packages/interaction/main.js"></script>
<script src="/resources/css/reservation/packages/daygrid/main.js"></script>

<!-- 테이블css -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- 모달 부트스트랩 -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<!--script-->
<script src="/resources/js/newClub/modal.js"></script>
<script src="/resources/js/newClub/chat.js"></script>
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
body{
	background: #f3f1f1;
}
</style>

</head>

<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="wrapper">
		<div>
			<div class="wrap">
				<div class="navi">
					<ul class="menu">
						<li class="active"><a href="#">게시글</a></li>
						<li><a href="#">사진첩</a></li>
						<li><a href="#">일정</a></li>
						<c:if test="${sessionScope.m.memberNick eq club.clubOpener}">
							<li><a href="#">클럽관리</a></li>
						</c:if>
					</ul>
				</div>
				<div class="contain">
					<div class="left1">
						<div class="profile">
							<div class="clubimg">
								<img style="height: 100%";
									src="/resources/clubImgUpload/${club.filePath }">
							</div>
							<div class="clubTitleMent">클럽소개</div>
							<div class="clubinfo2">
								<div class="clubnotice">${club.clubIntro}</div>
							</div>
							<hr style="margin: 0">
							<div class="clubinfo1">
								<div class="memberNum">멤버 수</div>
								<div class="memberNum">초대하기</div>
							</div>

							<div style="display: flex; justify-content: center;">
								<c:choose>

									<c:when test="${sessionScope.m == null }">
										<!-- 로그인 안되어있다면 -->
										<button type="button" class="btn btn-info btn-lg"
											style="padding: 5px" onclick="location.href='/loginFrm.do'">로그인하기</button>
									</c:when>

									<c:otherwise>
										<c:set var="num" value="1" />
										<!-- num 변수선언해서, 회원의 clubNo와 현재 페이지 clubNo를 비교해서 foreach조건문을 위한 변수 -->
										<c:forEach items="${memberClubNo}" var="l">
											<!-- 클럽개설자가 입장시 보이는 문구 변경 -->
											<c:if test="${club.clubOpener eq sessionScope.m.memberNick && num eq 1 }">
												<button type="button" class="btn btn-info btn-lg"
													style="padding: 5px">어서오세요 관리자님</button>
												<c:set var="num" value="2" />
											</c:if>
											
										
											<!-- 회원이 속한 클럽넘버들을 list에 담아서 비교 -->
											<c:if test="${l.clubNo eq clubNo && num eq 1 }">
												<!-- 회원이 속한 clubNo와 현재페이지clubNo가 같으면서 변수가 1이라면 -->
												<button type="button" class="btn btn-info btn-lg"
													style="padding: 5px">어서오세요</button>
												<c:set var="num" value="2" />
												<!-- if문을 탄다면 num을 2로 선언해서 다음 if문 안타게하기 -->
											</c:if>

											<c:if test="${l.clubNo ne clubNo && num eq 1}">
												<!-- 클럽이 속한 clubNo가 없으면서 num가 1이라면 -->
												<button type="button" class="btn btn-info btn-lg"
													style="padding: 5px" data-toggle="modal"
													data-target="#myModal">클럽 가입하기</button>
												<c:set var="num" value="2" />
											</c:if>
										</c:forEach>
									</c:otherwise>


								</c:choose>
							</div>
						</div>
					</div>
					<div class="middle">
						<div class="tab-cont">
							<div>
								<h4 style="width: 200px; margin-top: 0px; font-weight: bold;">게시글
									등록</h4>
								<div class="boardWritebox">
									<!-- 게시물 등록시 현재있는 페이지의 clubNo를 같이 넘겨준다 -->
									<!-- clubNo는 카테고리에서 이곳 페이지 넘어올때 컨트롤로에서 담아주고 넘어오는 값이당 -->
									<form action="/boardWrite.do?clubNo=${clubNo }" method="post"
										enctype="multipart/form-data">
										작성자 : <input type="text" name="boardWriter"
											value="${sessionScope.m.memberNick }" readonly>
										<hr>
										제목 : <input type="text" name="boardTitle"
											style="width: 200px;">
										<hr> 
										파일 : <input type="file" name="files" multiple style="margin: 0px;">
										<hr>
										내용 :
										<textarea rows="5" cols="90" name="boardContent"
											style="resize: none; margin-top:10px;"></textarea>
										<input type="text" name="boardCG" value="${club.clubCg }" style="display: none;">
										<br>
										<input type="submit" value="등록">
									</form>
								</div>
								<hr>
								<!-- 게시물 형태 바뀐부분 -->
								<%-- <c:forEach items="${list }" var="board">
										<div class="board-wrap">
								            <div class= "userDate">
								                <div class="userImg"></div>
								                <div class="userName">작성자</div>
								                <div class="enrollDate">작성일</div>
								            </div>    
								            <div class= "boardTitle"></div>
								            <div class= "boardContent"></div>
								            <div class= "boardComment"></div>
								            <div class= "boardFooter">
								                <div class= "numView">
								                    <div class="userNum">조회수<span id="ctView"></span>명</div>
								                    <div class="userGood">좋아요</div>
								                </div>    
								                <div class= "btn-wrap">
								                    <button id="openModal">상세보기</button>
								                </div>
								            </div>        
								        </div>
									</c:forEach> --%>
								<div class="photoWrapper"></div>
								<button class="btn btn-outline-info btn-block" currentCount="0"
									value="" totalCount="${totalCount }" id="more-btn"
									style="display: none;"></button>
							</div>
							<div>
								<!-- 사진첩   -->
								<h4 style="width: 200px; margin-top: 0px; font-weight: bold;">
									사진 게시판</h4>
								<div class="photo-wrap">
									<c:forEach items="${list }" var="board">
										<c:choose>
											<c:when test="${board.filepath != null }">
												<div class="album">
													<img
														style="width: 215px; height: 194px; object-fit: contain;"
														src="/resources/image/clubimg/${board.filepath}">
												</div>
											</c:when>
										</c:choose>
									</c:forEach>
								</div>
							</div>

							<!-- 달력 api -->
							<div>
								<div id="test" style="width: 650px;"></div>
								<button type="button" class="btn btn-info btn-lg" id="calModal"
									data-toggle="modal" data-target="#myModal3">일정 추가하기</button>
								<input class="calList" style="display: none" value="${calList }">
							</div>

							<!-- 멤버목록(관리자) -->
							<div>
								<div class="contentMent"
									style="font-weight: bold; font-size: 25px;">관리목록</div>
								<input class="adminCheckButton" style="margin-left: 370px;"
									type="button" value="회원목록" onclick="memberListAdmin();">
								<input class="adminCheckButton" type="button" value="예약목록"
									onclick="userListAdmin();">
								<div class="table-responsive"
									style="height: 500px; margin-top: 10px;">
									<!-- 회원목록 -->
									<table class="table table-hover1">
										<thead>
											<tr class="listBar"
												style="background-color: #ec523f; color: white; width: 100%">
												<th>No.</th>
												<th>멤버</th>
												<th style="width: 330px;">자기소개</th>
												<th>가입날짜</th>
												<th style="text-align: center">쪽지</th>
												<th style="text-align: center">추방</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${clubMemberList }" var="l" varStatus="i">
												<tr>
													<td>${i.count }</td>
													<td>${l.clubNick }</td>
													<th>${l.intro}</th>
													<td>${l.cmDate }</td>
													<td style="text-align: center">
													<button type="button" class="btn btn-info btn-lg" id="userMailBtn"
									data-toggle="modal" data-target="#myModal4" value="${l.clubNick }">쪽지</button>
														
													</td>
													<td>
														<button type="button" id="blackBtn" class="btn btn-info btn-lg" onclick="blackMember(${l.cmNo })">추방</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 예약목록 -->
									<table class="table table-hover2" style="display: none;">
										<thead>
											<tr class="listBar"
												style="background-color: #ec523f; color: white;">
												<th>No.</th>
												<th>멤버</th>
												<th style="width: 360px">자기소개</th>
												<th>신청날짜</th>
												<th style="text-align: center">수락</th>
												<th style="text-align: center">거절</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${applyList }" var="l" varStatus="i">
												<tr>
													<td>${i.count }</td>
													<td class="listNumber" style="display: none;">${l.iaNo }</td>
													<td>${l.receiver }</td>
													<td>${l.iaContent }</td>
													<td>${l.iaDate }</td>
													<td style="text-align: center">
														<button type="button" class="noNo"
															onclick="accept(${l.iaNo })">수락</button>
													</td>
													<td style="text-align: center">
														<button class="noNo" type="button" onclick="refusal(${l.iaNo })">거절</button>
														<!-- location.href='/deleteRefusal.do?listNo=${l.iaNo }&clubNo=${clubNo }&menuNo=3' -->
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<br>


								<hr>
								<!-- 관리자 컨텐츠(관리자) -->
								<h3 style="margin-left: 10px; font-weight: bold;">클럽 관리</h3>
								<div class="bottomAdmin">
									<!-- 모임글 수정 -->
									<div class="clubModify">
										<div style="margin-left: 30px; padding-top: 15px;">${club.clubName }</div>
										<div>
											<%-- <input type="text" name="clubNo" value="${clubNo }" style="display: none"> --%>
											<textarea name="clubIntro">${club.clubIntro }</textarea>
										</div>
									</div>
									<div class="clubModifyDelete">
										<div onclick="clubInfoModify()">수정</div>
										<div onclick="location.href=''">모임폐쇄</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="right1">
						<%-- <button onclick="initChat('${sessionScope.m.memberId }')">채팅시작</button>
						<hr> --%>
						<div class="commentbox1" style="width: 300px; height: 50px;">클럽
							멤버와 채팅하기</div>
						<div class="chatting">
							<div class="messageArea"></div>
							<div class="sendBox">
								<input type="text" id="sendMsg">
								<button id="sendBtn" onclick="sendMsg();">전송</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 오늘 작업Modal -->
	<div class="allModal">
		<!--바디처럼 전체를 감싸고있는 div-->
		<div class="modalWrap">
			<!--숨어있는 모달-->
			<h2>게시물 상세보기</h2>
			<hr>
			<div class="userDate">
				<div class="userImg"></div>
				<div class="userName"></div>
				<div class="enrollDate"></div>
			</div>
			<div class="boardTitle"></div>
			<div class="boardComment"></div>
			<div class="boardNo1"></div>

			<!-- 댓글달기 -->
			<div class="commentBox" style="width: 500px; height: 120px;">
				<!-- <form action="/insertComment.do" method="post"> -->
					<ul style="list-style: none; margin: 0; padding: 0;">
						<li style="float:left;">
							<img class="userImg" src="/resources/image/프로필사진.png" style="margin:30px 10px 30px 0px;" >
						</li>
						<li style="float:left; margin-top: 30px;">
							
							<textarea class="ccContent" name="ccContent" placeholder="댓글을 입력해주세요" style="width: 360px;"></textarea>
						</li>
						<li style="float:left; margin-top:30px">
							<input type="hidden" name="boardNo">
							<input type="hidden" name="ccWriter" value="${sessionScope.m.memberNick}">
							<button onclick="insertComment();" style="margin:1px 0px 10px 10px; height: 50px;width: 60px;">등록</button>
							<!-- <button type="submit">등록</button> -->
							
						</li>
					</ul>
				<!-- </form>	 -->
			</div>
			<%-- <c:forEach items="${list1 }" var="cmt">
				<div class="listComment" style="width: 300px; height:100px;">
					<div class="nameUser">${cmt.ccWriter}</div>
					<div class="contentComment">${cmt.ccContent}</div>
				</div>
			</c:forEach>  --%>
			<div class="commentView"></div>
			<button id="closeBtn" style="display: line;">닫기</button>
			<button onclick="boardDelete();"style="margin-left: 200px;">게시글 삭제</button>
			<!--m.nickname==boardWriter?  -->
		</div>

	</div>


	<!-- Modal2 -->
	<div class="modal fade" id="myModal" role="dialog"
		style="margin: 100px auto 0px;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"
				style="height: 320px; background-color: #e6e6e6ed;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="margin-left: 20px;">클럽 가입신청하기</h3>
				</div>
				<div class="modal-body">
					<p>클럽에 가입하기 전에</p>
					<p>인사말을 적어주세요.</p>
				</div>
				<input type="text" class="receiver" name="receiver"
					value="${sessionScope.m.memberNick }" style="display: none">
				<input type="text" class="clubNo" name="clubNo" value="${clubNo }"
					style="display: none">
				<div style="display: flex; justify-content: center;">
					<textarea class="iaContent" placeholder="모임장에게 전해질 인사말을 적어주세요!"
						name="iaContent"></textarea>
				</div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<button type="button" onclick="userClubJoin()"
						class="btn btn-default" style="background: #5bc0de; color: wheat;">신청</button>
					<button type="button" id="closeModal" class="btn btn-default"
						data-dismiss="modal"
						style="background-color: #e84c4ca8; color: wheat;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달3 -->
	<div class="modal fade" id="myModal3" role="dialog"
		style="margin: 100px auto 0px;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"
				style="background-color: #e6e6e6ed;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="margin-left: 20px;">달력 일정 추가하기</h3>
				</div>

				<div class="modal-body">
					<input type="text" name="id" value=""
						style="display: none">
					<div>
						<div>일정명 :</div>
						<div>
							<input type="text" name="calTitle">
						</div>
					</div>
					<div style="display: none;">
						<div>숨겨진 넘버</div>
						<div>
							<input type="text" name="id" value="">
						</div>
					</div>
					<div>
						<div>시작날 :</div>
						<div>
							<input type="date" name="calStart" onchange="changeStart()"
								value="">
						</div>
					</div>
					<div>
						<div>배경컬러 :</div>
						<div>
							<input type="color" name="calBack" value="#e66465">
						</div>
					</div>
					<div>
						<div>폰트컬러 :</div>
						<div>
							<input type="color" name="calFont" value="#ffffff">
						</div>
					</div>
				</div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<button type="button" onclick="calendarModal()"
						class="btn btn-default" style="background: #5bc0de; color: wheat;">추가</button>
					<button type="button" id="closeModal2" class="btn btn-default"
						data-dismiss="modal"
						style="background-color: #e84c4ca8; color: wheat;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달4 -->
	<div class="modal fade" id="myModal4" role="dialog"
		style="margin: 100px auto 0px;display: none;">
		<div class="modal-dialog modal-sm">
			<div class="modal-content"
				style="background-color: #e6e6e6ed;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 class="modal-title" style="margin-left: 20px;">Message</h3>
				</div>
				<div>
					<textarea class="sendMessage" placeholder="보내고 싶은 메세지를 적어주세요" style="width: 80%;height: 100px"></textarea>
				</div>
				<div class="modal-body">
					<input type="text" name="receiver" value="" style="display: none">
					<input type="text" name="sender" value="${sessionScope.m.memberNick }" style="display: none">
				</div>
				<div class="modal-footer"
					style="display: flex; justify-content: center;">
					<button type="button" onclick="userMailSend()"
						class="btn btn-default" style="background: #5bc0de; color: wheat;">보내기</button>
					<button type="button" id="closeModal2" class="btn btn-default"
						data-dismiss="modal"
						style="background-color: #e84c4ca8; color: wheat;">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<script>
	//메세지 보내기
	function userMailSend(){
		var sender = $("input[name=sender]").val();
		var messageText = $(".sendMessage").val();
		var memberNick = $("#userMailBtn").val();
		$("input[name=receiver]").val(memberNick);
		var receiver = $("input[name=receiver]").val();
		
		console.log(sender);
		console.log(messageText);
		console.log(receiver);
		
		$.ajax({
			url : "/sendMail.do",
			data : {
				sender : sender,
				messageText : messageText,
				receiver : receiver
				},
			type : "post",
			success :function(data){
				if(data>0){
					alert("쪽지가 전송되었습니다.");
				}else{
					alert("전송실패")
				}
			}
		})
	}
	//클럽 추방
	function blackMember(obj){	
		$.ajax({
			url:"/MemberBlack.do",
			data : {
				cmNo : obj
			},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("추방되었습니다.");
					//수락하고 다시 컨트롤러로 보내서 다시 로드할때 3번페이지가 바로 보일수있게
					location.href="/newClub.do?clubNo=${clubNo}&menuNo=3";
				}else{
					alert("추방 실패");
				}
			}
		})
	}
	//클럽 소개글 수정
	function clubInfoModify(){
		var clubNo = ${clubNo }
		var clubIntro = $("textarea[name=clubIntro]").val();
		$.ajax({
			url : "/clubInfoModify.do",
			data : {
				clubNo : clubNo,
				clubIntro : clubIntro,
			},
			type : "post",
			success : function(data){
				if(data>0){
					alert("클럽 소개가 수정되었습니다.");
					location.href="/newClub.do?clubNo=${clubNo}&menuNo=3";
				}else{
					alert("클럽 소개 수정 실패");
				}
			}
		})
	}
	//일정추가
	function calendarModal(){
		var Calendar={
			clubNo : $("input[name=clubNo]").val(),
			calTitle : $("input[name=calTitle]").val(),
			calStart : $("input[name=calStart]").val(),
			calEnd : $("input[name=calEnd]").val(),
			calBack : $("input[name=calBack]").val(),
			calFont : $("input[name=calFont]").val(),
			idValue : $("input[name= idValue ]").val(),
		}
		$.ajax({
			url : "/calendarAdd.do",
			data :  Calendar,
			type : "post",
			success : function(data){
				if(data > 0){
					alert("일정이 추가되었습니다.");
					$("#closeModal2").click();
					location.href="/newClub.do?clubNo=${clubNo}&menuNo=2";
				}else{
					alert("일정 추가 실패");
				}
			}
		});
		console.log("idValue :"+ $("input[name=idValue]").val());
		var test = $("input[name=idValue]").val();
		console.log(test);
		console.log("idValue :"+ $("input[name=idValue]").val());
	}
	//클럽 가입 수락
	function accept(obj){	//클릭한 게시물의 번호값 가져오기
		var clubNo = ${clubNo }
		$.ajax({
			url:"/memberJoinCheck.do",
			data : {
				no : obj,
				clubNo : clubNo,
			},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("수락되었습니다.");
					//수락하고 다시 컨트롤러로 보내서 다시 로드할때 3번페이지가 바로 보일수있게
					location.href="/newClub.do?clubNo=${clubNo}&menuNo=3";
				}else{
					alert("수락 실패");
				}
			}
		})
	}
	
	//클럽 가입 거절
	function refusal(obj){	//클릭한 게시물의 번호값 가져오기
		var clubNo = ${clubNo }
		$.ajax({
			url:"/deleteRefusal.do",
			data : {
				listNo : obj,
				clubNo : clubNo,
			},
			type : "post",
			success : function(data){
				if(data > 0){
					alert("거절되었습니다.");
					//수락하고 다시 컨트롤러로 보내서 다시 로드할때 3번페이지가 바로 보일수있게
					location.href="/newClub.do?clubNo=${clubNo}&menuNo=3";
				}else{
					alert("거절 실패");
				}
			}
		})
	}
	//클럽가입 신청
	function userClubJoin(){
		var apply={
			clubNo : $(".clubNo").val(),
			receiver : $(".receiver").val(),
			iaContent : $(".iaContent").val(),
		}
		/* console.log(apply); */
		$.ajax({
			url : "/memberClubJoin.do",
			data : apply,
			type : "post",
			success : function(data){
				if(data > 0){
					alert("가입신청이 완료되었습니다. 모임장의 수락을 기다리세요");
					$("#closeModal").click();
				}else{
					alert("가입실패");
				}
			}
		})
	}
		/* 관리자 회원/예약  버튼*/
        function userListAdmin(){
            $(".table-hover1").hide();
            $(".table-hover2").show();
        }
        function memberListAdmin(){
            $(".table-hover1").show();
            $(".table-hover2").hide();
        }
        
	/*탭기능*/
		var tabBtn = $(".navi > .menu > li"); //각각의 버튼을 변수에 저장
		var tabCont = $(".tab-cont > div"); //각각의 콘텐츠를 변수에 저장
		tabCont.hide();
		
		//페이지 로드할때 menuNo값 있는지 확인후 번호값대로 btn(no) 실행
		var index = '${menuNo}';
		$(function(){
			tabBtn.eq(index).click();
			$(".adminCheckButton").click();
		});

		tabBtn.click(function() {
			var target = $(this); //버튼의 타겟(순서)을 변수에 저장
			var index = $(".navi>.menu>li").index(this); //인덱스
			tabBtn.removeClass("active"); //버튼의 클래스를 삭제
			target.addClass("active"); //타겟의 클래스를 추가
			tabCont.css("display", "none");
			tabCont.eq(index).css("display", "block");
			
			/* 달력 초반 출력 문제 해결 */
			if(index==2){
				$("#test").empty();				
				var calendarEl = document.getElementById("test");			
				  test = new FullCalendar.Calendar(calendarEl, {
				    plugins: ["interaction", "dayGrid"],
				    defaultDate: "2021-06-06",
				    editable: true,
				    eventLimit: true,
				    
				    
				    //날짜 클릭시 모달 활성화
				    dateClick: function (data) {
				       /* $("#myModal3").css("display","block");
				       $("#myModal3").addClass("in"); */
				       $("#myModal3").click();
				       onload="calModal()";
				       
				      
				       console.log(reserNo);
				       
			
				    },
				    	//날짜 일정 클릭시 값 알아내고 삭제
				       	eventClick : function(data){
				       	   //data 확인하기
				    	   console.log(data);
				    	   //data 안에 event 안에 id값 추출
				    	   console.log("id값 : " +data.event.id);
				    	   var reserNo = data.event.id;
				    		   
					    	   if(confirm("일정을 삭제하시겠습니까?")){
					    		   
					    		   $.ajax({
					    			   url:"/reservationDelete.do",
					    			   data : {
					    				   reserNo : reserNo
					    			   },
					    			   type : "post",
					    			   success : function(data){
					    				   if(data>0){
					    					   alert("일정이 삭제 되었습니다.");
				    				  		   location.href="/newClub.do?clubNo=${clubNo}&menuNo=2";
					    				   }else{
					    					   alert("일정이 삭제실패");
					    				   }
					    			   }
					    		   });
					    	   }
				       }
				  });
				  var test;
				  test.render();
				  //달력값 불러와서 적용
				  
				  var calendarList = $(".calList").val();
				  test.addEvent({title:'사이트 개설일',color:'#0083ffa1',textColor:'#FFFFFF',start:'2021-06-28',end:'2021-06-28',id:'1'});
				  //해당클럽의 번호를 넘겨주어 클럽의 달력게시물을 가져오기
				  var clubNo = ${clubNo};
					$.ajax({
						url : "/calListCome.do",
						data : {clubNo : clubNo},
						/* dataType : "json", */
						type : "post",
						success : function(data){
							/* console.log(data) */
							for (var i = 0; i < data.length; i++) {
								var title = data[i].calTitle;
								var color = data[i].calBack;
								var textColor = data[i].calFont;
								var start = data[i].calStart;
								var end = data[i].calEnd;
								var calNo = data[i].id;
								//값넣기
								
								test.addEvent({title : title,
												color : color,
												textColor : textColor,
												start : start,
												end : end,
												id : calNo
								});		
							}
						}
					})
			}
		});
	//시작날과 종료날 동일하게하기
	function changeStart(){
		var start = $("input[name=calStart]").val();
		$("input[name=calEnd]").val(start);
	}
	/*더보기 기능*/
	$(function() {
		more(1);
		$("#more-btn").click(function() {
			more($(this).val());
		});
	});
	
	/*스크롤*/
	$(window).scroll(function() {
	    var scrolltop = $(document).scrollTop();	//스크롤할때의 값 지정
	    /* console.log("11:"+scrolltop); */
	    
	    var height = $(document).height();		//문서의 총길이
	    /* console.log("22:"+height); */
	    
	    var height_win = $(window).height();	//화면에 보여지는 길이
	    /* console.log("33:"+height_win); */
	    
	 if (Math.floor($(window).scrollTop()) == $(document).height() - $(window).height()) {	//스크롤이 바닥에 닿았을시 more메소드 실행
	    more($("#more-btn").val());	//#('more-btn').val()만큼 추가시켜준다
	    							//$("#more-btn").val(Number(start) + 5);
	    /* console.log(1); */
	 }else{
		/*  console.log(2); */
	 }
	});
		function more(start) {
			var clubNo = '${clubNo}';
			$.ajax({
				url : "/clubBoardMore.do",
				data : {
					start : start,
					clubNo : clubNo
				},
				type : "post",
				success : function(data) { //data에 포토객체가  gson to list 그거한거
					
					console.log(data);
					   for (var i = 0; i < data.length; i++) {
						var p = data[i]; //p에 데이터인덱스 근깐 포토객체으 인덱스가p에 들어갈거고 style="display:none"
						var html = ""; //html초기화
						html += '<div class="board-wrap">';
						html +=   '<div class="boardNoTest">'+p.boardNo+'</div>';
						html +=   '<div class= "userDate">';
						html +=        '<div class="userImg">'+'</div>';
						html +=        '<div class="userName">'+ p.boardWriter+'</div>';
						html +=        '<div class="enrollDate">'+ p.enrollDate+'</div>';
						html +=     '</div>';    
						html +=   '<div class= "boardTitle">'+p.boardTitle+'</div>';
						if(p.filepath != undefined){	
						html +=   '<div class= "boardContent">'+'<img style="width:420px; height:270px; object-fit:contain;" src=/resources/image/clubimg/'+ p.filepath +'></div>';
						}
						html +=   '<div class= "boardComment">'+ p.boardContent +'</div>';
						html +=   '<div class= "boardFooter">';
						html +=       '<div class= "numView">';
						html +=           '<div class="userNum">'+'조회수'+'<span ="ctView">'+p.boardViews+'</span>명</div>';
						html +=           '<div class="userGood">';
						html +=					'<img class="img1" src=/resources/image/clubimg/하트.png>'+'<img class="img2" src=/resources/image/clubimg/저장사진.png></div>';
						html +=   		  '</div>';
						html +=       '</div>';    
						html +=   '<div class= "btn-wrap">';
						html +=      '<button id="openModal" onclick="modalClick(this);">' + '상세보기'+'</button>';
						html +=   '</div>';
						html +=   '</div>';        
						html +='</div>';
						$(".photoWrapper").append(html); 
						
						
					}
					//이미지 추가가 끝나고 나면 더보기 버튼의 currentValue,totlacount 값 조정
					$("#more-btn").val(Number(start) + 3); //얘는 반면 시작값이라 datalength가 아니라 3를 더하는거임
					var curr = Number($("#more-btn").attr("currentCount"));
					$("#more-btn").attr("currentCount", curr + data.length); //이게 3단위가 아닐 수 있기 때문에 21개면 마지막 for문 도는 횟수는 한번일 테니깐 그래서 data.length를 더하는중
					var totalCount = $("#more-btn").attr("totalCount");
					var currCount = $("#more-btn").attr("currentCount");
					if (currCount == totalCount) { //최근불러온 currcount와 total카운트 전체 카운트가 같아지면 더 불러올 게 없기때문에 더보기 버튼은 사라져야한다
						$("#more-btn").attr("disabled", true);
					}
					
				}
					
			});
		}
		 // 작업중 모달 상세보기 내용
		 function modalClick(openbtn){
			 var btnWrap = $(openbtn).parents(); // 현재 눌린 게시물의 값 추출용
			 var target = $(".modalWrap"); // 넣을 위치 지정
			 
			 var sendBoardNo = $(".modalWrap").find("input[name=boardNo]"); // 댓글의 히든 boardNo
			 console.log(sendBoardNo);
			 //alert(sendBoardNo.length);
			 var boardNo = $(openbtn).parent().parent().children().eq(0).text(); // boardNo1 의 값
			 sendBoardNo.val(boardNo); // 댓글 용 보드 넘버 넣기
			 console.log(sendBoardNo.val()); // 정상적으로 넣어진 boardNo의 값 확인 ex) 129
			

	        //console.log(value.siblings(".userDate").children("userName").text());
	        
	         target.children("div").eq(0).children().eq(1).text(btnWrap.siblings(".userDate").children(".userName").text()); // 내용 적을 곳
	         target.children("div").eq(0).children().eq(2).text(btnWrap.siblings(".userDate").children(".enrollDate").text());
			 target.children("div").eq(1).text(btnWrap.siblings(".boardTitle").text());
			 target.children("div").eq(2).text(btnWrap.siblings(".boardComment").text());
			 target.children("div").eq(3).text(boardNo);
			 
			 
			 $.ajax({
				url : "/commentList.do",
				data : {boardNo:boardNo},
				type : "post",
				success : function(data){ // data = 컨트롤러 리턴값 == 0 , 1
					 console.log("댓글 수 : "+data.length);
					 $(".commentView").empty();
					   for (var i = 0; i < data.length; i++) {
						var p = data[i]; 
						console.log(p.ccNo);
						console.log(p.ccWriter);
						console.log(p.ccContent);
						var html = ""; //html초기화
						
						html += '<div class="listComment">';
						html += '<div class="nameUser">'+ p.ccWriter+'</div>';
						html +=	'<div class="contentComment">'+ p.ccContent+'</div>';
						html += '<input type="hidden" name="ccNo" value='+p.ccNo+'>';
						html +=	'</div>';
						html += '<div class= "delBtnbox" style="width: 50px; height:50px;">';
						$(".commentView").append(html); 
						
						
					}
					   $(".allModal").css("display","flex");//위치문제?
				}
			});
			 
			
		     //조회수 업데이트
	     $.ajax({
				url : "/viewUpdate.do",// boardNo에 해당하는 게시물의 조회수를 업데이트
				data : {boardNo:boardNo},
				type : "post",
				success : function(data){
				
					}
				
				});
		}
		
		 
		 
		 
		 //댓글 작성 기능(댓글쓰기 기능!)--질문하기 글쓰기가 먹히질 않음
		 function insertComment(){
			 var target = $(".modalWrap"); // 넣을 위치 지정
			 var ccContent = $(".modalWrap").find("textarea[name=ccContent]").val(); // 댓글의 히든 내용
			 var ccWriter = $(".modalWrap").find("input[name=ccWriter]").val(); // 댓글의 히든 작성자
			 var boardNo = $(".modalWrap").find("input[name=boardNo]").val(); // 댓글의 히든 boardNo

			 $.ajax({
					url : "/insertComment.do",
					data : {ccContent:ccContent,ccWriter:ccWriter,boardNo:boardNo},
					type : "post",
					success : function(data){
							if(data == 1){
								alert("등록 성공");
								var html = ""; //html초기화
								
								html += '<div class="listComment">';
								html += '<div class="nameUser">'+ ccWriter+'</div>';
								html +=	'<div class="contentComment">'+ ccContent+'</div>';
								html +=	'</div>';
								$(".commentView").append(html);  
								$("cc")
								
							}else if(data == 0){
								alert("등록 실패!");
							}
							$(".modalWrap").find("textarea[name=ccContent]").val("");
						}
			 });
		 }
		 
		//게시물 삭제기능
		function boardDelete(){
			 var target = $(".modalWrap"); // 넣을 위치 지정
			 var boardNo = target.children("div").eq(3).text();
			 
		 $.ajax({
				url : "/boardDelete.do",
				data : {boardNo:boardNo},
				type : "post",
				success : function(data){
						alert("삭제성공!");
						$(".allModal").hide();
						location.reload();
						
					}
				
				
				
				
				});
		 }
		 
		 
		$(function() {
		    initChat('${sessionScope.m.memberNick}'); 
	});
	/*웹소켓*/		
   var ws;
   var memberId;
   function initChat(param){
      memberId = param;
      //웹소켓 연결시도
      ws = new WebSocket("ws:/192.168.0.2/chat.do")
      //소켓 연결 성공 시 실행될 함수 지정
      ws.onopen = startChat;
      //소켓으로 서버가 데이터를 전송하면 로직을 수행할 함수
      ws.onmessage = receiveMsg;
      //소켓 연결이 종료되는 수행할 함수 지정
      ws.onclose = endChat;
      $(".chatting").slideDown();
   }   
   //연결하면 함수들 자동실행
   function startChat(){   
      var data = {type:"enter",msg:memberId};
      ws.send(JSON.stringify(data));   //자바스크립트 객체를 문자열로 변환해서 서버로 전송
      appendChat("<p>채팅방에 입장했습니다</p>");
   }
   function receiveMsg(param){
      appendChat(param.data);
   }
   function endChat(){   
      appendChat("<p>채팅이 종료되었습니다</p>");
   }
   function appendChat(msg){
      $(".messageArea").append(msg);// 메시지 내용 추가
      $(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);// 스크롤용
   }
   /* 채팅 보내기*/
   function sendMsg(){
      var msg = $("#sendMsg").val();// 메시지 입력창 내용 가져오기
      
      // 공백이 아닌 경우 전송
      if( msg != ''){
         var data = {type:"chat",msg:msg};
         //소켓 서버로 문자열 전송
         ws.send(JSON.stringify(data));
         //내화면에 출력
         appendChat("<div class='chat right'>"+msg+"</div>");
         $("#sendMsg").val("");
      }
   }
   
   // 엔터키 인식
   $(function () {
      $("#sendMsg").on("keydown", function (key) {
         if (key.keyCode == 13) {
            sendMsg();
         }
      })
   });
   //댓글삭제 기능
   function delComment(deletebtn){
		 var delBtnbox = $(deletebtn).parent(); 
		 var ccNo= delBtnbox.siblings(".listComment").children().eq(2).val();
		 console.log(ccNo);
		 
		 $.ajax({
				url : "/commentDelete.do",
				data : {ccNo : ccNo},
				type : "post",
				success : function(data){
					if(data > 0){
						alert("삭제 성공!");
						location.reload();
					}else{
						alert("삭제 실패");
					}
				}
				});
		 
	 }
</script>


</body>

</html>