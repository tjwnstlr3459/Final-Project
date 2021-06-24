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
<title>모임 개설하기</title>
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
	href="/resources/css/newClub/newClub2.css" />
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
							<div class="clubimg"></div>
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
						<div class="boardWritebox">
							<form action="/" method="post">
								작성자: <input type="text" name="boardWriter">
								<hr>
								내용:<br>
								<textarea rows="11" cols="95" name="boardContent"></textarea>
								<br> <input type="submit" value="작성">
							</form>
						</div>
						<div class="tab-cont">
							<div>
								<%-- <c:forEach items="${list }" var="board">
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
									</c:forEach> --%>
								<div class="photoWrapper"></div>
								<button class="btn btn-outline-info btn-block" currentCount="0"
									value="" totalCount="${totalCount }" id="more-btn" style="display:none;"></button>
							</div>
							<div>사진첩</div>

							<div>일정</div>
							<div>멤버</div>
						</div>
					</div>
					 
		 			<div class="right">
						<div class="chatlist">
							<div class="chatcontent">
								<button onclick="initChat('${sessionScope.m.memberId }')">채팅시작</button>
								<hr>
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
		</div>
	</div>
	<!-- Modal -->
	<div class="modal-wrapper">
		<div class="modal">
			<div class="head">
				<a class="btn-close trigger" href="#"> <i class="fa fa-times"
					aria-hidden="true"></i>
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

		tabBtn.click(function() {
			var target = $(this); //버튼의 타겟(순서)을 변수에 저장
			var index = $(".navi>.menu>li").index(this); //인덱스
			tabBtn.removeClass("active"); //버튼의 클래스를 삭제
			target.addClass("active"); //타겟의 클래스를 추가
			tabCont.css("display", "none");
			tabCont.eq(index).css("display", "block");
		});
		
		/*더보기 기능*/
	$(function() {
		more(1);
		$("#more-btn").click(function() {
			more($(this).val());
		});
	});
	
	//스크롤
	$(window).scroll(function() {
	    var scrolltop = $(document).scrollTop();	//스크롤할때의 값 지정
	    console.log(scrolltop);
	    
	    var height = $(document).height();		//문서의 총길이
	    console.log(height);
	    
	    var height_win = $(window).height();	//화면에 보여지는 길이
	    console.log(height_win);
	    
	 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {	//스크롤이 바닥에 닿았을시 more메소드 실행
	    more($("#more-btn").val());	//#('more-btn').val()만큼 추가시켜준다
	    							//$("#more-btn").val(Number(start) + 5);
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
						var p = data[i]; //p에 데이터인덱스 근깐 포토객체으 인덱스가p에 들어갈거고
						var html = ""; //html초기화
						html += '<div class="board-wrap">';
						html += 	'<div class="userinfo" style="height:30%;">';
						html += 		'<div class="userImg">'+'</div>';
						html += 		'<div class="userName">' + p.boardWriter+ '</div>';
						html += 		'<div class="enrollDate">' + p.enrollDate+ '</div>';
						html += 	'</div>';
						html += 	'<div class="boardcontain" style="height:40%;">'
										+ p.boardContent + '</div>';
						html += 	'<div class="userview" style="height:30%;">';
						html += 		'<div class="usernum">' + '조회수3명읽음' + '</div>';
						html += 		'<div class="btn trigger">'+'<a href="#">' + '상세보기'+ '</a>'+'</div>';
						html += 	'</div>';
						html += '</div>';
						$(".photoWrapper").append(html); 
					}//버튼 이 없는듯?
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
	</script>
</body>

</html>