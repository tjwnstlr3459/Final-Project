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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.3.2/chart.min.js"></script>
<!-- favicons==================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<script type="text/javascript">


</script>
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
			<div class="col-full" style="width:28%;">
				<h1 style="margin: 0px">Latest Posts</h1>
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
					<div class="userName">${sessionScope.m.memberNick}</div>
					<hr width="95%" style="margin: 0 auto" />
					<div>읽지 않은 메세지 ${myMessage } 건</div>
					<div>나의 관심 태그</div>
					<span>#${m.ho1 }</span> <span>#${m.ho2 }</span> <span>#${m.ho3}</span>
					<div style="margin: 10px;">
						<div class="mypageBtn"><a href="mypage.do">마이페이지</a></div>
					</div>
					<!-- <div>#여행 #요리 #음식</div> -->
				</div>
				<hr />
				<!-- 회원이 속한 클럽들 출력 -->
				<c:forEach items="${clubList}" var="l" varStatus="i">
					<div class="myClubList">
						<div class="clubListOne">
							<a href="/newClub.do?clubNo=${l.clubNo }"><img src="/resources/clubImgUpload/${l.filePath }" /></a>
						</div>
						<div class="clubListName">
							<div>${l.clubName}</div>
							<div class="clubJang" style="float: right">
								<a href="/newClub.do?clubNo=${l.clubNo }"><img src="/resources/image/userPic/${sessionScope.m.filepath }"/></a>
							</div>
						</div>
					</div>
				</c:forEach>
				 <canvas id="myChart" width="400px" height="600px" style="margin-top:20px"></canvas>
			</div>
			
			<div class="rightCon" >
				<!-- 오른쪽 컨텐츠-->
				<div class="rightConSelect"> 
					<input type="text" name="search" class="inputStryle" />
					
					<button class="postSearch">Search</button>
					
					<select class="selectDate" onchange="selectDateChange(this)">
						<option value="0">모든날짜</option>
						<option value="1">지난 1일</option>
						<option value="7">지난 1주</option>
						<option value="30">지난 1개월</option>
					</select>
					<a href="/insertPostWrite.do">게시물 등록</a>
				</div>
				
				<!-- brick-wrapper -->
				<div class="bricks-wrapper" style="height: 1200px">
					<div class="grid-sizer"></div>
					<div class="photoWrapper" style="width:100%;height:800px; overflow-y:scroll ">
						<!--  style="width:100%;height:800px; overflow-x:scroll; overflow-y:scroll; -->
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
					<div class="child">
						<a href="/newClub.do?clubNo=38"><img src="/resources/image/icons/home.png"/></a>
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
							<img src="/resources/image/userPic/${sessionScope.m.filepath }" />
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
							<img src="/resources/image/userPic/${sessionScope.m.filepath }" />
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
<style>
/* 메인컨텐츠 스크롤  */
.photoWrapper{
	-ms-overflow-style: none; /* IE and Edge */
    scrollbar-width: none; /* Firefox */
}
.photoWrapper::-webkit-scrollbar {
     display: none; /* Chrome, Safari, Opera*/
}
</style>
<script>
$(function(){
	myClubChart();	//유저가 속한 클럽들 게시물 차트 실행문
})
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
	function selectDateChange(obj){	//select문이 초기화 될때마다
		changeDate = $(obj).val();	//select option의 해당 값을 넣어준다
		$(".photoWrapper").empty();		//게시물 목록을 지워준다
		$("#more-btn").prop("disable",false);	//
		$("#more-btn").val("0");	//
		$("#more-btn").attr("currentCount","0");
		
		$.ajax({
			url : "/selectTotalCount.do",
			data : {
				changeDate : changeDate,
			},
			type: "post",
			success : function(data){
				$("#more-btn").attr("totalCount",data);
			}
		})
		more(1);
	}

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
	$(".postImg").html($(".picPath").eq(idx).clone());
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
    /* console.log(scrolltop); */
    
    var height = $(document).height();		//문서의 총길이
    /* console.log(height); */
    
    var height_win = $(window).height();	//화면에 보여지는 길이
    /* console.log(height_win); */
    
 if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {	//스크롤이 바닥에 닿았을시 more메소드 실행
    more($("#more-btn").val());	//#('more-btn').val()만큼 추가시켜준다
    							//$("#more-btn").val(Number(start) + 5);
 }
});


function more(start) {//더보기 클릭시
	$.ajax({
		url : "/photoMore.do",
		data : {
			start : start,
			changeDate:changeDate
		}, //시작번호를 매개변수로 1-5 1-10f
		type : "post",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {
				var p = data[i];
				var html = "";
 html +='<article class="brick entry format-standard animate-this"id="check"style="z-index: 0">';
 html +=  '<div class="entry-thumb" onclick="func1(this)"  style="height:135px;border-radius: 10px;" >';
 html +=   '<a href="#" class="thumb-link">';
	if(p.filePath != null){ 
		html +='<img class="picPath" src="/resources/fileupload/postImg/'+p.filePath+'" class="postsCheck"alt="building"/>';
	}else{
		html +='<img class="picPath" src="/resources/image/icons/camera.png" class="postsCheck"alt="building" style="margin: 0 auto;display: flex;margin-top: 15px;"/>';
	}
 html +=    '</a>';
 html +=   '</div>';
 html +=   '<div class="entry-text" style="height: 150PX;">';
 html +=    '<div class="entry-header">';
 html +=    '<div class="entry-meta">';
 html +=    '<span class="cat-links">';
 html +=	'<div class="clubNo" style="display:none">'+p.clubNo+'</div>';
 html +=	'<div class="cName" style="display:none">'+p.boardWriter+'</div>';
 html +=        '<a href="#" class="clubName">'+p.clubName+'</a>';
 html +=    '</span>';
 html +=   '</div>';
 html +=  '<h1 class="entry-title" style="width:124px; margin-bottom:0px; height:30px; overflow: hidden;font-size: 18px;text-overflow: ellipsis;white-space: nowrap;">';
 html +=     '<a href="single-standard.html"class="bTitle">'+p.boardTitle+'</a>';
 html +=  '</h1>';
 html +=  '</div>';
 html +=  '<div class="entry-excerpt" style="height: 70px;overflow: hidden;text-overflow: ellipsis;">'+p.boardContent+'</div>';
 html +=  '</div>';
 html +=   '</article>';
 
			$(".photoWrapper").append(html);
			}
			
			//이미지 추가가 끝나고나면 더보기 버튼의 value, 값조정 1->6->11
			$("#more-btn").val(Number(start) + 10
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
function myClubChart(){
	$.ajax({
		url : "/clubPostCount.do",
		type : "post",
		success : function(data){
			console.log(data);
			myChart(data);				//회원들이 선택한 취미 차트
			
		}
	});
}

//회원 취미 선택 통계
function myChart(data){
	console.log(data);
    var list = new Array();
    var post = new Array();
    
    for (var i = 0; i < data.length; i++) {
		list.push(data[i].clubName);
		post.push(data[i].clubPostCount)
		console.log(list);
	}
    
	var myChart = new Chart(document.getElementById('myChart'), {
        type: "pie",
        data: {
        	labels: list,
        	  datasets: [
        	    {
        	      label: 'Dataset 1',
        	      data: post,
        	      backgroundColor:[
                	'rgba(0, 0, 255, 0.3)',
                	'rgba(255, 0, 255, 0.3)',
                    'rgba(76, 216, 153, 0.5)',
                    'rgba(0, 255, 255, 0.3)',
                    'rgba(255, 0, 0, 0.3)',
				],
        	    }
        	  ]
        },
        options: {
            responsive: true,
            plugins: {
              	legend: {
                position: 'top'
              },
              title: {
                display: true,
                text: '회원님의 모임게시물 통계'
              }
            }
        }
    });
}



</script>

</html>


















