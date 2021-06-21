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

<title>Category Page - Abstract</title>
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
</head>

<body id="top">
<%-- <%@include file="/WEB-INF/views/common/header.jsp" %> --%>
	<!-- page header
   ================================================== -->
	<section id="page-header">
		<div class="row current-cat">
			<div class="col-full">
				<h1 style="margin: 0px">Latest Posts</h1>
			</div>
		</div>
	</section>
	<!-- masonry
   ================================================== -->
	<section id="bricks" class="with-top-sep">
		<div class="row masonry">
			<div class="leftCon">
				<!-- 클러리스트 -->
				<div class="myInfo">
					<div class="myInfoImg">
						<img src="/resources/image/user04.jpg" />
					</div>
					<div>${sessionScope.m.memberNick}</div>
					<hr width="95%" style="margin: 0 auto" />
					<div>읽지 않은 메세지 1 건</div>

					<span>#${m.hobby1 }</span> <span>#${m.hobby2 }</span> <span>#${m.hobby3
						}</span>
					<!-- <div>#여행 #요리 #음식</div> -->
				</div>
				<hr />
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
				<!-- 오른쪽 컨텐츠-->
				<div class="rightConSelect">
					<input type="text" name="search" class="inputStryle" />
					<button class="postSearch">Search</button>
					<select>
						<option>모든날짜</option>
						<option>지난 1시간</option>
						<option>지난 1일</option>
						<option>지난 1주</option>
						<option>지난 1개월</option>
					</select>
				</div>
				<a href="/insertPostWrite.do">게시물 등록</a>
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
<script>
	/* $(".postsCheck").click(function() {
		$(".postModal").css("display", "block");
		$(".postModal").css("z-index", "10000");
		$("#top").css("background", "rgba(0,0,0,.75)");
		$("#top").css("z-index", "10000");
	}); */
$(function() {
	$(".modalClose").click(function() {
		$(".postModal").css("display", "none");
		$("#top").css("background", "none");
	});
	
	
});
	
//모달클릭
function func1(obj){
	var idx = $(".entry-thumb").index(obj);	//선택한 게시물의 인덱스값알아내기
	
	$(".postModal").css("display", "block");
	$(".postModal").css("z-index", "10000");
	$(".postModal").css("display","flex");
	
	
	//모달창 내 해당 값 넣기
	$(".modalMemberName").html($(".cName").eq(idx).html());		//게시글 작성자
	$(".modalClubName").html($(".clubName").eq(idx).html());	//해당 게시글 클럽명
	$(".postContent").html($(".entry-excerpt").eq(idx).html());	//게시글 내용
	
	//배경어둡게
	/* $("#top").css("background", "rgba(0,0,0,.75)");
	$("#top").css("z-index", "10000"); */
}

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


function more(start) {//더보기 클릭시
	$.ajax({
		url : "/photoMore.do",
		data : {
			start : start
		}, //시작번호를 매개변수로 1-5 1-10f
		type : "post",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {
				var p = data[i];
				var html = "";
                	 html +='<article class="brick entry format-standard animate-this"id="check"style="z-index: 0">';
                	 html +=  '<div class="entry-thumb" onclick="func1(this)">';
                	 html +=   '<a href="#" class="thumb-link">';
                	 html +=     '<img src="/resources/image/user04.jpg"class="postsCheck"alt="building"/>';
                	 html +=    '</a>';
                	 html +=   '</div>';
                	 html +=   '<div class="entry-text">';
                	 html +=    '<div class="entry-header">';
                	 html +=    '<div class="entry-meta">';
                	 html +=    '<span class="cat-links">';
                	 html +=	'<div class="cName" style="display:none">'+p.boardWriter+'</div>';
                	 html +=        '<a href="#" class="clubName">'+p.clubName+'</a>';
                	 html +=    '</span>';
                	 html +=   '</div>';
                	 html +=  '<h1 class="entry-title">';
                	 html +=     '<a href="single-standard.html"class="bTitle"style="font-size: 20px;">'+p.boardTitle+'</a>';
                	 html +=  '</h1>';
                	 html +=  '</div>';
                	 html +=  '<div class="entry-excerpt">'+p.boardContent+'</div>';
                	 html +=  '</div>';
                	 html +=   '</article>';
				$(".photoWrapper").append(html);
			}
			
			//이미지 추가가 끝나고나면 더보기 버튼의 value, 값조정 1->6->11
			$("#more-btn").val(Number(start) + 5
			);
			var curr = $("#more-btn").attr("currentCount"); //현재값
			$("#more-btn").attr("currentCount", curr + data.length);//현재값 = 현재값+데이터길이 변경 

			var totalCount = $("#more-btn").attr("totalCount");//전체게시물

			var currCount = $("#more-btn").attr("currentCount");//내가 최종적으로가져온게시물
			if (currCount == totalCount) {//가져올게없다면
				$("#more-btn").attr("disabled", true); //최대치면 버튼 비활성화
			}
		}
	});
}
</script>

</html>