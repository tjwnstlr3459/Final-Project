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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
	
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/chat.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/modal.css" />
	<link rel="stylesheet" type="text/css"
	href="/resources/css/newClub/photo.css" />
	
<!-- 메인달력 -->
<link href="/resources/css/reservation/packages/core/main.css" rel="stylesheet" />
<link href="/resources/css/reservation/packages/daygrid/main.css" rel="stylesheet" />
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
  <!-- <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->
	
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
					<div class="left1">
						<div class="profile">
							<div class="clubimg"></div>
							<div class="clubinfo1">
								<div class="memberNum">멤버 수</div>
								<div class="inviteMember">초대하기</div>
							</div>
							<div class="clubinfo2">
								<div class="clubnotice">가입해주셔서 감사합니다 많이 소통해요</div>
							</div>
							<div style="display: flex; justify-content: center;">
								<c:choose>
								<c:when test="${sessionScope.m != null }">
									<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">클럽 가입하기</button>
								</c:when>
								<c:otherwise>
									<button type="button" class="btn btn-info btn-lg" onclick="location.href='/loginFrm.do'">로그인하기</button>
								</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					<div class="middle">
						<div class="tab-cont">
							<div>
								<h4 style="width:200px; margin-top:0px; font-weight:bold;" >게시글 등록</h4>
								<div class="deletebox">
				                  <a class="deletebtn" href="/boardDelete">삭제하기</a>
				                </div>           
								<div class="boardWritebox">
									<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
										작성자 : <input type="text" name="boardWriter" value="${sessionScope.m.memberNick }" readonly><hr>
										제목 : <input type="text" name="boardTitle" style= "width:200px;"><br>
										파일 : <input type="file" name="files" multiple style="margin:0px;">
										내용 : <textarea rows="6" cols="88" name="boardContent" style="resize: none; "></textarea><br>
										<input type="hidden" name="clubNo" value="${clubNo }">
										<input type="submit" value="등록">
									</form>
								</div>
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
									value="" totalCount="${totalCount }" id="more-btn" style="display:none;"></button>
							</div>
							<div>
								<!-- 사진첩 -->
								<div class="photohead">
									<h4 style="width:200px; margin-top:0px; font-weight:bold;" >게시글 등록</h4>
									<div class="photoadd">
						            </div>
						         </div>
						         <c:forEach items="${list }" var="board">   
								 <div class="photo-wrap">
                                    <div class="userName2">${board.boardWriter }</div>
                                    <div class="album"><img src="/resources/fileupload/postImg/${board.filepath}"></div>
                                    <div class="albumcontent">${board.boardContent}</div>
                                    <div class="albumdate">${board.enrollDate }</div>
								</div>
								</c:forEach>
							</div>
							
							
							<!-- 달력 api -->
							<div>
								<div id="test" style="width: 650px;"></div>
							</div>
                            <!-- 멤버목록(관리자) -->
							<div>
                                <div class="contentMent" style="font-weight: bold;font-size: 25px;">관리목록</div>
								<input class="adminCheckButton" style="margin-left: 373px;" type="button" value="회원목록" onclick="memberListAdmin();">
                                <input class="adminCheckButton" type="button" value="예약목록" onclick="userListAdmin();">
                                <div class="table-responsive" style="height: 500px;margin-top: 10px;">
                                    <!-- 회원목록 -->
                                    <table class="table table-hover1">
                                        <thead>
                                            <tr class="listBar" style="background-color: #ec523f; color: white; width: 100%">
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
                                                    <th>자기소개</th>
                                                    <td>${l.cmDate }</td>
                                                    <td style="text-align: center">쪽지</td>
                                                    <td style="text-align: center">강퇴</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!-- 예약목록 -->
                                     <table class="table table-hover2" style="display: none;">
                                        <thead>
                                            <tr class="listBar" style="background-color: #ec523f; color: white;">
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
                                                    	<button type="button" class="noNo" onclick="accept(${l.iaNo })" value="${l.iaNo }">수락</button>
                                                    </td>
                                                    <td style="text-align: center">
                                                    	<button type="button" onclick="refusal(this)">거절</button>
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
                                    <div class="clubModify">
                                        <div style="margin-left: 30px; padding-top: 15px;">모임명</div>
                                        <div><textarea>모임 소개글</textarea></div>
                                    </div>
                                    <div class="clubModifyDelete">
                                        <div>수정</div>
                                        <div>모임폐쇄</div>
                                    </div>
                                </div>
                            </div>
						</div>
					</div>

					<div class="right1">
						<%-- <button onclick="initChat('${sessionScope.m.memberId }')">채팅시작</button>
						<hr> --%>
						<div class="commentbox" style="width: 250px; height: 30px;">클럽
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
	<!-- Modal -->
	<div class="allModal"> <!--바디처럼 전체를 감싸고있는 div-->
        <div class="modalWrap"> <!--숨어있는 모달-->
            <h2>게시물 상세보기</h2>
            <hr>
            <div class="userDate">
            <div class="userImg"></div>
			<div class="userName"></div>
			<div class="enrollDate"></div>
			</div>
            <div class= "boardTitle"></div>
			<div class= "boardComment"></div>
            <button id="closeBtn">닫기</button>
        </div>
    </div>
    
    <!-- Modal2 -->
	 <div class="modal fade" id="myModal" role="dialog" style="margin: 100px auto 0px;">
	   <div class="modal-dialog modal-sm">
	     <div class="modal-content" style=" height: 320px;background-color: #e6e6e6ed;">
	       <div class="modal-header">
	         <button type="button" class="close" data-dismiss="modal">&times;</button>
	         <h3 class="modal-title">클럽 가입신청하기</h3>
	       </div>
	       <div class="modal-body">
	         <p>클럽에 가입하기 전에 </p>
	         <p>인사말을 적어주세요.</p>
	       </div>
	       <input type="text" class="receiver" name="receiver" value="${sessionScope.m.memberNick }" style="display: none">
	       <input type="text" class="clubNo"  name="clubNo" value="${clubNo }" style="display: none">
	       <div style="display: flex;justify-content: center;">
	       	<textarea class="iaContent" placeholder="모임장에게 전해질 인사말을 적어주세요!" name="iaContent"></textarea>
	       </div>
	       <div class="modal-footer"style="display: flex;justify-content: center;">
	         <button type="button" onclick="userClubJoin()" class="btn btn-default">신청</button>
	         <button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal">닫기</button>
	       </div>
	     </div>
	   </div>
	 </div>
	<script>
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
				}else{
					alert("수락 실패");
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
		console.log(apply);
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
		tabCont.eq(0).show();

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
				    
				    dateClick: function (data) {
				      /* if(stu != ""){
				        $(".service").css("display", "block");
				       $(".service_date").val(data.dateStr);
				       console.log(data.dateStr);
				      }else{
				    	  alert("로그인 후 이용이 가능합니다.");
				          location.href = "/";
				      } */
				    },
				  });
				  var test;
				  test.render();
				 /*  test.addEvent({title:'혜영아힘내라!ㅋ',color:'#ff0000',textColor:'#FFFFFF',start:'2021-07-03',end:'2021-07-03'}); */
				  test.addEvent({title:'민형이생일',color:'blue',textColor:'#FFFFFF',start:'2021-07-02',end:'2021-07-02'});
			}
		});
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
	    console.log("11:"+scrolltop);
	    
	    var height = $(document).height();		//문서의 총길이
	    console.log("22:"+height);
	    
	    var height_win = $(window).height();	//화면에 보여지는 길이
	    console.log("33:"+height_win);
	    
	 if (Math.floor($(window).scrollTop()) == $(document).height() - $(window).height()) {	//스크롤이 바닥에 닿았을시 more메소드 실행
	    more($("#more-btn").val());	//#('more-btn').val()만큼 추가시켜준다
	    							//$("#more-btn").val(Number(start) + 5);
	    console.log(1);
	 }else{
		 console.log(2);
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
						html +=   '<div class= "boardContent">'+'<img style="width:460px; height:270px; object-fit:contain;" src=/resources/image/clubimg/'+ p.filepath +'></div>';
						}
						html +=   '<div class= "boardComment">'+ p.boardContent +'</div>';
						html +=   '<div class= "boardFooter">';
						html +=       '<div class= "numView">';
						html +=			  '<div class="userNum">'+'조회수'+'<span ="ctView">'+p.boardViews+'</span>명</div>';
						html +=           '<div class="userGood">'+'좋아요'+'</div>';
						html +=       '</div>';    
						html +=   '<div class= "btn-wrap">';
						html +=       '<button id="openModal" onclick="modalClick(this);">' + '상세보기'+'</button>';
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
		// 작업중
		 function modalClick(openbtn){
			 var btnWrap = $(openbtn).parents(); // 현재 눌린 게시물의 값 추출용
			 var target = $(".modalWrap"); // 넣을 위치 지정
			 var boardNo = btnWrap.siblings(".boardNoTest").text();
			
			/*  <div class="modalWrap"> <!--숨어있는 모달-->
	            <h2>게시물 상세보기</h2>
	            <hr>
	            <div class="userDate">
		            <div class="userImg"></div>
					<div class="userName"></div>
					<div class="enrollDate"></div>
	            </div>
	            <div class= "boardTitle"></div>
				<div class= "boardComment"></div>
	            <button id="closeBtn">닫기</button>
	        </div> */
	        //console.log(value.siblings(".userDate").children("userName").text());
	        
	         target.children("div").eq(0).children().eq(1).text(btnWrap.siblings(".userDate").children(".userName").text()); // 내용 적을 곳
	         target.children("div").eq(0).children().eq(2).text(btnWrap.siblings(".userDate").children(".enrollDate").text());
			 target.children("div").eq(1).text(btnWrap.siblings(".boardTitle").text());
			 target.children("div").eq(2).text(btnWrap.siblings(".boardComment").text());
		     $(".allModal").css("display","flex");
		     
	     $.ajax({
				url : "/viewUpdate.do",// boardNo에 해당하는 게시물의 조회수를 업데이트
				data : {boardNo:boardNo},
				type : "post",
				success : function(data){
				
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
      ws = new WebSocket("ws://192.168.10.47//chat.do")
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
	</script>
</body>

</html>