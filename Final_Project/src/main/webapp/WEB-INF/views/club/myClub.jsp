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
<!-- 차트 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
<!-- favicons==================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<script type="text/javascript">
	
</script>
<body id="top"
	style="background-color: #d4c8c86e;">
	<!-- page header
   ================================================== -->

	<!-- masonry
   ================================================== -->
	<section id="bricks" class="with-top-sep">
		<%@include file="/WEB-INF/views/common/header.jsp"%>
		<div class="row masonry">
			<section id="page-header">
				<div class="row current-cat">
					<div class="col-full" style="width: 25%;margin-left: 10px;height: 40px;">
						<h1 class="deepshadow">${sessionScope.m.memberNick }'s Club</h1>
						<hr>
					</div>

				</div>
			</section>
			<div class="leftCon">
				<!-- 클러리스트 -->
				<div class="myInfo">
					<div class="myInfoImg">
						<img src="/resources/image/userPic/${sessionScope.m.filename }" />
					</div>
					<div class="userName" style="text-align: center;">${sessionScope.m.memberNick}님</div>
					<div
						style="font-size: 17px; font-weight: bold; text-align: center;">환영합니다.</div>
					<hr width="95%" style="margin: 0 auto" />
					<div style="text-align: center;">
						나에게 온 메세지 <a href="#" style="font-size: 17px;">${myMessage }</a> 건
					</div>
					<div style="text-align: center;">나의 관심 태그</div>
					<span class="tagHobby" style="margin-left: 13px;">#${m.ho1}</span> 
					<span class="tagHobby" style="background-color: #7a86ffcf" >#${m.ho2}</span> 
					<span class="tagHobby" style="background-color: #e29ff5" >#${m.ho3}</span>
					<div style="margin: 10px;">
						<div class="mypageBtn">
							<a href="mypage.do">마이페이지</a>
						</div>
					</div>
					<!-- <div>#여행 #요리 #음식</div> -->
				</div>
				<hr />
				<!-- 회원이 속한 클럽들 출력 -->
				<c:forEach items="${clubList}" var="l">
					<div class="myClubList">
						<div class="clubListOne">
							<a href="/newClub.do?clubNo=${l.clubNo }"><img
								src="/resources/clubImgUpload/${l.filePath }" /></a>
						</div>
						<div class="clubListName">
							<div>${l.clubName}</div>
							<div class="clubJang" style="float: right; margin-top: 2px">
								<a href="/newClub.do?clubNo=${l.clubNo }"><img
									src="/resources/image/userPic/${sessionScope.m.filepath }" /></a>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 차트넣기 -->
				<canvas id="myChart" width="400px" height="600px"style="margin-top: 20px"></canvas>
				
			</div>

			<div class="rightCon">
				<!-- 오른쪽 컨텐츠-->
				<div class="rightConSelect">
					<input type="text" name="search" class="inputStryle" />

					<button class="postSearch" onclick="postSearch()">Search</button>

					<select class="selectDate" onchange="selectDateChange(this)">
						<option value="0">모든날짜</option>
						<option value="1">지난 1일</option>
						<option value="7">지난 1주</option>
						<option value="30">지난 1개월</option>
					</select>
					<!-- <a href="/insertPostWrite.do">게시물 등록</a> -->
				</div>

				<!-- brick-wrapper -->
				<div class="bricks-wrapper" style="height: 1200px;margin-left: 5px">
					<div class="grid-sizer"></div>
					<div class="photoWrapper"
						style="width: 100%; height: 800px; overflow-y: scroll">
						<!--  style="width:100%;height:800px; overflow-x:scroll; overflow-y:scroll; -->
					</div>
				</div>
				<!-- 오른쪽 컨텐츠 종료-->
			</div>
			<button class="btn btn-outline-info btn-block" currentCount="0"
				value="" totalCount="${totalCount }" id="more-btn"
				style="display: none;"></button>
			<!-- end brick-wrapper -->
		</div>


		<!-- 게시물 모달창 -->
		<div class="postModal" style="display: none">
			<div class="postModalPan"
				style="padding-bottom: 5px; padding-top: 20px">
				<div class="postUser">
					<div class="modalUserImg">
						<img src="/resources/image/userPic/${sessionScope.m.filepath }" />
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
					<%-- <img class="postImg" src="/resources/fileupload/postImg/${filePath }" /> --%>
				</div>
				<!--이미지-->
				<div class="postContent"></div>
				<!--내용-->
				<div class="postLike">
					<div  class="modalIndexNumber"style="display: none;"></div>
					<div class="child">
						<a href="#" onclick="homeEnter()"><img
							src="/resources/image/icons/home.png" /></a>
					</div>
					<div onclick="postLikeDo(this)">
						<input class="postLikeNum" type="text" value="0" style="display: none;">
						<span class="postImgPan">
							
						</span>
					</div>
					<div style="width: 100%">바람돌이 님 외
						<a class="postLikeCount" href="#"></a>명이 좋아합니다.</div>
				</div>
				<!--좋아요-->
				<hr />
				<div class="mentScroll"
					style="max-height: 150px; overflow: scroll; overflow-x: hidden;">
					<!-- 댓글 -->
					<div class="modalComent">
					</div>
				</div>
				<hr />
				<!--댓글 작성-->
				<div class="modalComentWrite">
					<div style="float: left;">
						<div class="imgimg">
							<img src="/resources/image/userPic/${sessionScope.m.filepath }" />
						</div>
					</div>
					<div style="margin-bottom: 20px; float: left;">
						<input type="text" name="coment" class="comentWrite" />
					</div>
					<input type="text" class="comentSendNo" value=""
						style="display: none">
					<div style="float: left;" onclick="comentSend(this)">
						<img src="/resources/image/icons/check.png"
							style="width: 30px; margin-left: 10px; margin-top: 10px;" />
					</div>
				</div>
				<!--댓글 작성 끝-->
			</div>
		</div>
		<input type="text" class="userInfomationImg" value="${sessionScope.m.filepath}" style="display: none;">
		<input type="text" class="userInfomationNick" value="${sessionScope.m.memberNick}" style="display: none;">
	<!-- bricks -->
	<div id="preloader">
		<div id="loader"></div>
	</div>
	</section>
	<!-- Java Script
   ================================================== -->
	<script src="/resources/js/myClub/jquery-2.1.3.min.js"></script>
	<script src="/resources/js/myClub/plugins.js"></script>
	<script src="/resources/js/myClub/main.js"></script>


</body>
<style>
/* 메인컨텐츠 스크롤  */
.photoWrapper {
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none; /* Firefox */
}

.photoWrapper::-webkit-scrollbar {
	display: none; /* Chrome, Safari, Opera*/
}
</style>

<script>
	//게시물 좋아요
	function postLikeDo(obj){
		/* $(".entry-thumb").index(obj); //선택한 게시물의 인덱스값알아내기 */
		var idx = $(".modalIndexNumber").html();
		console.log("idx 111 : "+idx);
		
		var boardMoment = $(".boardNo").eq(idx).html();	//게시글 보드넘버
		
		console.log("보드 넘버 :"+boardMoment);
		console.log($(".postLikeNum").val());
		console.log("하트 눌렀을때 likeCheck :"+$(".likeCheck").eq(idx).html());
		console.log("모달별 인덱스 넘버 : "+$(".modalIndexNumber").html());
		
		var heartBean = '<img style="margin-top: 2px;"src="/resources/image/icons/loveBean.png" />';
		var heart = '<img style="width: 20px;margin-top: 5px;"src="/resources/image/icons/heart2.png" />';
		
		
		//좋아요수 업데이트 로직
		if($(".likeCheck").eq(idx).html() == "likeOff"){
		$.ajax({
			url:"/postLike.do",
			data : {
				boardMoment:boardMoment
			},
			type:"get",
			success : function(data){
				if(data>0){
					alert("좋아요 확인");
					//좋아요 클릭 조건(-1이면 취소버튼이 활성화)
					/* $(".postLikeNum").val(-1); */
					//이미지 변화
					$(".postImgPan").empty();
					$(".postImgPan").html(heart);
					//좋아요 누름 체크
					console.log("idx : "+idx);
					console.log($(".likeCheck").length);
					$(".likeCheck").eq(idx).html("likeOn");
				}
			}
		});
		}else{
			//좋아요 취소 업데이트 로직
			$.ajax({
				url:"/postDeletLike.do",
				data : {
					boardMoment:boardMoment
				},
				type:"get",
				success : function(data){
					if(data>0){
						alert("좋아요 취소");
						//하단의 좋아요수 변화
						//좋아요 클릭 조건(0이면 좋아요버튼이 활성화)
						/* $(".postLikeNum").val(0); */
						//이미지 변화
						$(".postImgPan").empty();
						$(".postImgPan").html(heartBean);
						//좋아요 누름 해제
						$(".likeCheck").eq(idx).empty();
						$(".likeCheck").eq(idx).html("likeOff");
					}
				}
			});
		}
	}
	//검색버튼 클릭시
	function postSearch(){
		var searchCon = $("input[name=search]").val();
		/* console.log("검색버튼 클릭시 내용값 :"+searchCon); */
		$.ajax({
			url:"/searchContent.do",
			data :{
				searchCon : searchCon,
				start : 1,
				changeDate : 0,
			},
			type: "post",
			success : function(data){
				$(".photoWrapper").empty();
				for (var i = 0; i < data.length; i++) {
					var p = data[i];
					var html = "";
					html += '<article class="brick entry format-standard animate-this"id="check"style="z-index: 0">';
					html += '<div class="entry-thumb" onclick="func1(this)"  style="height:135px;border-radius: 5% 5% 1% 1%;" >';
					html += '<a href="#" class="thumb-link">';
					if (p.filePath != null) {
						html += '<img class="picPath" src="/resources/image/clubimg/'+p.filePath+'" class="postsCheck"alt="building"/>';
					} else {
						html += '<img class="picPath" src="/resources/image/icons/camera.png" class="postsCheck"alt="building" style="margin: 0 auto;display: flex; margin-top:30px;width: 40%;"/>';
					}
					html += '</a>';
					html += '</div>';
					html += '<div class="entry-text" style="height: 150PX;">';
					html += '<div class="entry-header">';
					html += '<div class="entry-meta">';
					html += '<span class="cat-links">';
					html += '<div class="boardNo" style="display:none" values="p.boardNo">'
							+ p.boardNo + '</div>';
					html += '<div class="clubNo" style="display:none">'
							+ p.clubNo + '</div>';
					html += '<div class="cName" style="display:none">'
							+ p.boardWriter + '</div>';
					html += ' <a href="#" class="clubName">'
							+ p.clubName + '</a>';
					html += '</span>';
					html += '</div>';
					html += '<h1 class="entry-title" style="width:124px; margin-bottom:0px; height:30px; overflow: hidden;font-size: 18px;text-overflow: ellipsis;white-space: nowrap;">';
					html += '<a href="single-standard.html"class="bTitle">'
							+ p.boardTitle + '</a>';
					html += '</h1>';
					html += '</div>';
					html += '<div class="entry-excerpt" style="height: 70px;overflow: hidden;text-overflow: ellipsis;">'
							+ p.boardContent + '</div>';
					html += '</div>';
					html += '</article>';

					$(".photoWrapper").append(html);
				}

				
			}
		})
	}
	//유저가 속한 클럽들 게시물 차트 실행문
	$(function() {
		myClubChart();
	});

	//해당 상세페이지로 이동
	function homeEnter() {
		var homeNo = $(".clubNo").html();
		location.href = "/newClub.do?clubNo=" + homeNo;
		/* console.log(homeNo); */
	}
	var changeDate = 0;
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

	//날짜별 조회시 totalCount를 매번 새로 가져오기때문에, total이 쌓여서 
	//사이트가 느려지는걸 방지하기위해 할때마다 totalCount를 초기화 시켜준다
	function selectDateChange(obj) { //select문이 초기화 될때마다
		changeDate = $(obj).val(); //select option의 해당 값을 넣어준다
		$(".photoWrapper").empty(); //게시물 목록을 지워준다
		$("#more-btn").prop("disable", false); //
		$("#more-btn").val("0"); //
		$("#more-btn").attr("currentCount", "0");
		$.ajax({
			url : "/selectTotalCount.do",
			data : {
				changeDate : changeDate,
			},
			type : "post",
			success : function(data) {
				$("#more-btn").attr("totalCount", data);
			}
		});
	}
		
	//모달클릭
	function func1(obj) {
		var idx = $(".entry-thumb").index(obj); //선택한 게시물의 인덱스값알아내기
		console.log("idx : " + idx);
		var heartBean = '<img style="margin-top: 2px;"src="/resources/image/icons/loveBean.png" />';
		var heart = '<img style="width: 20px;margin-top: 5px;"src="/resources/image/icons/heart2.png" />';
		var indexNumber = '<div class="indexNumber" style="display:none">'+ idx + '</div>';
		
		/* console.log("idx : "+idx); */
		$(".postModal").css("display", "block");
		$(".postModal").css("z-index", "10000");
		$(".postModal").css("display", "flex");
		
		//모달창 내 해당 값 넣기
		$(".modalMemberName").html($(".cName").eq(idx).html()); //게시글 작성자
		$(".modalClubName").html($(".clubName").eq(idx).html()); //해당 게시글 클럽명
		$(".postContent").html($(".entry-excerpt").eq(idx).html()); //게시글 내용
		$(".postImg").html($(".picPath").eq(idx).clone());			//사진경로
		$(".comentSendNo").val($(".boardNo").eq(idx).html());	//게시글의 보드넘버
		$(".postLikeCount").html( $(".totalCount").eq(idx).html());	//좋아요 모달에 넣어주기
		
		$(".modalIndexNumber").eq(0).html(idx);
		console.log($(".modalIndexNumber"));
		
		var likeCheckLike = $(".likeCheck").eq(idx).html();
		console.log("모달클릭시 초기 likeCheck : "+likeCheckLike);
		
		if(likeCheckLike == 'likeOn'){
			
			$(".postImgPan").empty();
			$(".postImgPan").append('<img style="width: 20px;margin-top: 5px;"src="/resources/image/icons/heart2.png" />');
		}else{
			console.log(0);
			$(".postImgPan").empty();
			$(".postImgPan").append(heartBean);
		}
		
		//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		/* $.ajax({
			url : "/selectLikeCheck.do",
			type:"post",
			success : function(data){
				
				
			}
		}) */

		
		console.log("좋아요 개숫 : "+$(".likeCountLoad").eq(idx).html());	//좋아요 갯수
		
		var boardMoment = $(".boardNo").eq(idx).html();	//게시글 보드넘버
		/* console.log($(".boardNo").eq(idx).html());
		console.log(boardMoment); */
		
		//모달창 내에 해당 게시물의 댓글들 불러오기
		$.ajax({
			url : "/postMoment.do",
			data : {
				boardNo : boardMoment
			},
			type : "post",
			success : function(data) {
				console.log(data.length);
				$(".modalComent").empty();	//empty()를 해주지 않으면 게시물을 클릭할때만다 for문이 돌아서 기존 댓글들이 추가된다
				if(data.length == 0){
					var html = "";
					html += '<p class="postMentContentBean"style="margin-bottom: 10px;font-size: 12px; line-height: 15px; margin: 0px; float: left;margin-left: 120px;">댓글이 없습니다.</p>';
					$(".modalComent").append(html);
				}else{
					for (var i = 0; i < data.length; i++) {					
						var html = "";
						html += '<div class="modalComentImg">';
						html += '<div class="imgimg">';
						html += '<img src="/resources/image/userPic/'+data[i].filepath+'"/></div></div>';
						html += '<div class="modalComentMoment">';
						html += '<div class="lastFinal" style="width: 70%; float: left">';
						html += '<div class="testesttestest">';
						html += '<div class="mentNoNo" type="text" style="display:none;">'+data[i].ccNo+'</div>';
						html += '<div class="postWrite"style="line-height: 15px;font-weight: bold; font-size: 12px;margin-left:5px;margin-top: 3px;">'+data[i].ccWriter+'</div></div>';					
						html += '<div class="lightlight" style="width: 85%; float: left;">';		
						html += '<p class="postMentContent"style="margin-bottom: 10px;font-size: 12px; line-height: 15px; margin: 0px; float: left;margin-left: 5px;">'+data[i].ccContent+'</p></div></div>';					
						html += '<div style="width: 30px; float: left; height: 100%; display: flex; align-items: center;">'
						html += '<img class="mentNoChek" onclick="delMent(this)"; style="width: 20px;" src="/resources/image/clubimg/del.png"/></div>';
						html += '<div style="float: left"></div></div>';
						$(".modalComent").append(html);
					}
				}
			}
		});
		}
		//댓글 입력
		function comentSend(obj){
		
		var comentCon = $('input[name=coment]').val();//해당 게시물 번호
		var comentBoardNo = $(".comentSendNo").val();//해당게시물 댓글 내용
		/* console.log(comentCon);
		console.log(comentBoardNo); */
		
		//이미지, 닉넴임userInfomationImg
		var userInfomationImg = $(".userInfomationImg").val();
		var userInfomationNick = $(".userInfomationNick").val();
		//해당 댓글 번호(삭제할때 댓글번호를 위해서)
		var comentNo = $('.mentNoNo').html();
		console.log(comentNo);
		//무댓글이면 "댓글이 없습니다"문구 삭제
		$(".postMentContentBean").remove();
		
		$.ajax({
			url : "/comentSend.do",
			data : {
				comentBoardNo : comentBoardNo,
				comentCon : comentCon
			},
			type : "get",
			success : function(data){
				if(data>0){
					alert("등록되었습니다.");
					var html="";
					html += '<div class="modalComentImg">';
					html += '<div class="imgimg">';
					html += '<img src="/resources/image/userPic/'+userInfomationImg+'"/></div></div>';
					html += '<div class="modalComentMoment">';
					html += '<div class="lastFinal" style="width: 70%; float: left">';
					html += '<div class="testesttestest">';
					html += '<div class="mentNoNo" type="text" style="display:none;">'+comentNo+'</div>';
					html += '<div class="postWrite"style="line-height: 15px;font-weight: bold; font-size: 12px;margin-left:5px;margin-top: 3px;">'+userInfomationNick+'</div></div>';
					html += '<div class="lightlight" style="width: 85%; float: left;">';
					html += '<p class="postMentContent"style="margin-bottom: 10px;font-size: 12px; line-height: 15px; margin: 0px; float: left;margin-left: 5px;">'+comentCon+'</p></div></div>';
					html += '<div style="width: 30px; float: left; height: 100%; display: flex; align-items: center;">'
					html += '<img class="mentNoChek" onclick="delMent(this)"; style="width: 20px;" src="/resources/image/clubimg/del.png"/></div>';
					html += '<div style="float: left"></div></div>';
					$(".modalComent").append(html);
					$(".comentWrite").val("");//댓글입력후 입력창에 남아있는 글자 초기화
				}else{
					alert("등록실패");
				}
			}
		});
	}
	//댓글 삭제
	function delMent(obj){
		//선택한 게시물의 인덱스값알아내기
		var idx = $(".mentNoChek").index(obj); 
		/* console.log(idx); */
		//각 버튼의 댓글 넘버 가져오기
		var mentNo =$(".mentNoNo").eq(idx).html();
		/* console.log(mentNo); */
		
		$.ajax({
			url : "/mentOut.do",
			data : {
				mentNo : mentNo
			},
			type : "post",
			success : function(data) {
				if(data>0){
					alert("댓글이 삭제되었습니다.");
					$(obj).parents(".modalComentMoment").prev().remove();
					$(obj).parents(".modalComentMoment").remove();
					 	/* location.reload(); 
					 	location = location.href;
						location.href = url;  */
				}else{
					alert("댓글이 삭제 실패");
				}
			}
		});
	}
		
	//더보기
	$(function() {
		more(1);
		$("#more-btn").click(function() {
			more($(this).val());
		});
	});

	//스크롤
	$(window).scroll(
			function() {
				var scrolltop = $(document).scrollTop(); //스크롤할때의 값 지정
				/* console.log(scrolltop); */

				var height = $(document).height(); //문서의 총길이
				/* console.log(height); */

				var height_win = $(window).height(); //화면에 보여지는 길이
				/* console.log(height_win); */

				if (Math.round($(window).scrollTop()) == $(document).height()
						- $(window).height()) { //스크롤이 바닥에 닿았을시 more메소드 실행
					more($("#more-btn").val()); //#('more-btn').val()만큼 추가시켜준다
					//$("#more-btn").val(Number(start) + 5);
				}
			});
	
	//더보기 클릭시
	function more(start) {
		var searchCon = $("input[name=search]").val();
	/* console.log(searchCon) */
		$.ajax({
			url : "/photoMore.do",
			data : {
				start : start,
				changeDate : changeDate
			}, //시작번호를 매개변수로 1-5 1-10f
			type : "post",
			success : function(data) {
				
				for (var i = 0; i < data.length; i++) {
					var p = data[i];
					/* console.log("콘솔확인 : ");
					console.log(p.cbGood); */
					var html = "";
					html += '<div style="float:left;width:180px; height:280px;margin-left: 10px;margin-right: 10px;margin-bottom: 40px;"><article class="brick entry format-standard animate-this"id="check"style="z-index: 0">';
					html += '<div class="entry-thumb" onclick="func1(this)"  style="border-radius: 5% 5% 1% 1%;width: 180px;" >';
					html += '<a href="#" class="thumb-link">';
					if (p.filePath != null) {
						html += '<img class="picPath" src="/resources/image/clubimg/'+p.filePath+'" class="postsCheck"alt="building"/>';
					} else {
						html += '<img class="picPath" src="/resources/image/icons/camera.png" class="postsCheck"alt="building" style="margin: 0 auto;display: flex;margin-top:20px; margin-bottom: 20px;width: 40%;"/>';
					}
					html += '</a>';
					html += '</div>';
					html += '<div class="entry-text" style="height: 150PX;">';
					html += '<div class="entry-header">';
					html += '<div class="entry-meta">';
					html += '<span class="cat-links">';
					html += '<div class="boardNo" style="display:none" values="p.boardNo">'+ p.boardNo + '</div>';
					html += '<div class="clubNo" style="display:none">'+ p.clubNo + '</div>';
					html += '<div class="likeCheck" style="display:none;">'+ p.likeCheck + '</div>';
					html += '<div class="totalCount" style="display:none">'+ p.totalCount + '</div>';
					html += '<div class="cName" style="display:none">'+ p.boardWriter + '</div> <div class="miniBoardName">club</div>';
					html += '<a href="#" class="clubName">'+ p.clubName + '</a>';
					html += '</span>';
					html += '</div>';
					html += '<h1 class="entry-title" style="width:124px; margin-bottom:0px; height:30px; overflow: hidden;font-size: 10px;text-overflow: ellipsis;white-space: nowrap;"><div class="miniTitle">Title</div>';
					html += '<a href="single-standard.html"class="bTitle">'
							+ p.boardTitle + '</a>';
					html += '</h1>';
					html += '</div><div class="miniCon">Content</div>';
					html += '<div class="entry-excerpt" style="font-size: 12px;">'
							+ p.boardContent + '</div>';
					html += '</div>';
					html += '</article></div>';

					$(".photoWrapper").append(html);
				}

				//이미지 추가가 끝나고나면 더보기 버튼의 value, 값조정 1->6->11
				$("#more-btn").val(Number(start) + 10);
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
	//차트실행문이 작동되면 회원이 속한 클럽의(클럽네임,클럽게시물수) 가져오기
	function myClubChart() {
		$.ajax({
			url : "/clubPostCount.do",
			type : "post",
			success : function(data) {
				/* console.log(data); */
				myChart(data); //회원들이 선택한 취미 차트

			}
		});
	}
	//차트에 회원 게시물수 넣어 통계내기
	function myChart(data) {
		/* console.log(data); */
		var list = new Array();	//클럽 이름을 담을 변수
		var post = new Array(); //각각의 클럽 게시물 수를 담을 변수
		for (var i = 0; i < data.length; i++) {
			list.push(data[i].clubName);
			post.push(data[i].clubPostCount)
			/* console.log(list); */
		}
		var myChart = new Chart(document.getElementById('myChart'),
				{
				type : "pie",	//차트 형식
				data : {
					labels : list,	//클럽명
					datasets : [ {
						label : 'Dataset 1',
						data : post,	//클럽의 게시물 데이터
						//차트의 보여질 각각의 색상 설정
						backgroundColor : [ 'rgba(0, 0, 255, 0.3)',
								'rgba(255, 0, 255, 0.3)',
								'rgba(76, 216, 153, 0.5)',
								'rgba(0, 255, 255, 0.3)',
								'rgba(255, 0, 0, 0.3)', ],
					} ]
				},
				options : {
					responsive : true,
					plugins : {
						legend : {
							position : 'top'
						},
						title : {
							display : true,
							text : '회원님의 모임게시물 통계'
						}
					}
				}
			}
		);
	}
</script>

</html>


















