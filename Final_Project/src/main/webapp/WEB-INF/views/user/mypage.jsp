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
	href="/resources/css/member/base.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/member/vendor.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/member/main.css" />
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
		display: block;
	}
	.modal {
        	position:absolute;
        	width: 100%;
        	height:100%;
        	background:rgba(0,0,0,0.8);
        	top:0;
        	left:0;
        	display:none;
        	justify-content: center;
        	align-items: center;
        }
        .modal-content {
        	background-color: #fff;
        	width:400px;
        	height:200px;
        	border-radius: 10px;
        	display:flex;
        	flex-direction:column; 
        	justify-content: flex-start;
        	align-items: center;
        	text-align:center;
        }
        .modal-header {
        	width:100%;
        	height: 60px;
        	border-bottom: 4px solid #ffcdc7;
        	margin-bottom: 20px;
        }
        .modal-input {
        	display:flex;
        	align-items: center;
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
					<div class="userName">${m.memberNick}</div>
					<hr width="95%" style="margin: 0 auto" />
					<span>#${m.intro }</span>
				</div>
				<hr width="95%" style="margin: 0 auto" />
				<div>읽지 않은 메세지 1 건</div>
				<div>친구 요청 ${req }건</div>
				<div class="myMenu">
					<a href="#">회원정보수정</a>
                    <a href="#">쪽지함</a>
                    <a href="#">내 친구</a>
                    <a href="#">문의/신고 내역</a>
				</div>
			</div>

			<div class="rightCon">
				<div>
					<a href="javascript:void(0)" id="find">친구 추가</a>
				</div>
				<div style="display:none;">
				<c:forEach items="${dmList }" var="dm">
					<c:if test="${dm.receiver == m.memberNick and dm.readStatus == 'N'}">
					 읽지 않은 쪽지  건
					</c:if>
					${dm.sender }, ${dm.receiver }, ${dm.dmContent }, ${dm.dmDate }, ${dm.readStatus }
				</c:forEach>
				</div>
				친구 요청
				<div>
					
					<c:forEach items="${rfriends }" var="f">					
						${f.memberNick }, ${f.intro }<br>
					</c:forEach>
				</div>
				내 친구들
				<div>					
					<c:forEach items="${friends }" var="f">					
						${f.memberNick }, ${f.intro }<br>
					</c:forEach>
				</div>
				<!-- 오른쪽 컨텐츠 종료-->
			</div>
				<button class="btn btn-outline-info btn-block" currentCount="0"
					value="" totalCount="${totalCount }" id="more-btn" style="display:none;"></button>
			<!-- end brick-wrapper -->
		</div>		
	</section>
	<div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>친구 추가</h2>
			</div>
			<div class="modal-body">
				<div class="modal-input">
					<input type="text" id="finduser" name="email" placeholder="이메일 주소 혹은 이름을 입력해주세요">
					<button type="button" onclick="findID('${m.memberNick}')">회원 검색</button>
				</div>
				<div class="findResult"></div>
				
				<button type="button" id="closeModal">닫기</button>
			</div>
		</div>	
	</div>
	<!-- Java Script
   ================================================== -->
	<script src="/resources/js/myClub/jquery-2.1.3.min.js"></script>
	<script src="/resources/js/myClub/plugins.js"></script>
	<script src="/resources/js/myClub/main.js"></script>
	<script>
		function addFriend(sender, receiver) {
			var result = $(".findResult");
			$.ajax({
	 			url: "/user/addFriend.do",
                type: "post",
                data: {sender:sender, receiver:receiver},
                success: function(data) {
                	console.log(data)
                	if(data == 0) {
                		result.append("<span>이미 친구입니다.</span>");
                	} else if(data == 1) {
                		result.append("<span>친구 요청 수락을 기다리는 중입니다.</span>");
                	} else if(data == 2) {
                		result.append("<span>친구 요청이 들어와 있습니다. 수락하시겠습니까?</span>");
                		result.append("<button type='button' onclick='accFriend(\"" + receiver + "\", \"" + sender + "\")'>요청 수락</button>")
                	} else if(data == 3) {
                		result.append("<span>요청 성공!</span>");
                	} else {
                		result.append("에러가 발생했습니다. 다시 시도해주세요.");
                	}
                },
                error: function() {
                    console.log("error")
                }
        	})
		}
		function accFriend(sender, receiver) {
			var result = $(".findResult");
			$.ajax({
	 			url: "/user/accFriend.do",
                type: "post",
                data: {sender:sender, receiver:receiver},
                success: function(data) {
                	console.log(data)
                	if(data == 1) {
                		result.append("<span>친구 요청을 수락했습니다.</span>");
                	} else {
                		result.append("<span>에러가 발생했습니다. 다시 시도해주세요.</span>");
                	}
                },
                error: function() {
                    console.log("error")
                }
        	})
		}
		$("#find").click(function() {
			$(".modal").fadeIn();
			$(".modal").css("display", "flex");
			
		})
		$("#findEmail").keypress(function(event){
	    	if ( event.which == 13 ) {
	        	$('#findID').click();
	         	return false;
	     	}
		})
		$("#closeModal").click(function() {
			$(".modal").fadeOut();
		})
	 	function findID(currUser) {
			console.log(currUser)
	 		var user = $("#finduser").val();
			var result = $(".findResult");
	 		$.ajax({
	 			url: "/user/findUser.do",
                type: "post",
                data: {user:user},
                success: function(data) {
       				result.html("");
                	if(typeof(data) == "object"){
                		console.log("2" + data.memberNick);
                		result.append("<img src='resources/image/userPic/" + data.filepath + "'>");
                		result.append("<span>" + data.memberNick + " " + data.intro + "</span>");
                		result.append("<button type='button' onclick='addFriend(\"" + currUser + "\", \"" + data.memberNick + "\")'>친구추가</button>");
                		
                	} else{
                		result.html("찾는 회원이 없습니다.");
                	}
                },
                error: function() {
                    console.log("error")
                }

	 		})
	 	}
	 	function isJsonString(str) {
		  try {
		    var json = JSON.parse(str);
		    return (typeof json === 'object');
		  } catch (e) {
		    return false;
		  }
		}
	</script>
</body>


</html>