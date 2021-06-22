<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드게시판</title>
<style>
/* container {
	padding-top: 100px;
	margin: 0 auto;
	text-align: center;
}
#feed_info {
  background-color: #ec523f;
  color: white;
  padding: 15px 40px;
  text-transform: uppercase;
  font-weight: 700;
  float:right;
  margin-right:200px;
  }
#feed_info:hover{
	cursor:pointer;
  }
.posting>img {
	width: 700px;
	height: 600px;
	text-align: center;
	margin: 30px;
}

.posting>img:hover {
	cursor: pointer;
}

.posting {
	background-color: #ccc;
	text-align: center;
	margin: 0 auto 40px;
	border:1px solid #ccc;
	width:800px;
}

.etc {
	display:block;
	text-align: center;
	margin-right:200px;
}

.etc>button {
	background-color: transparent;
	border: none;
	font-size: 30px;
	margin: 20px;
}
.etc>button:hover{
	cursor:pointer;
}
 */
#more-btn{
		margin-top : 100px;
	}
	.photoWrapper{
		padding-top : 20px;
		clear : right;
		display : flex;
		justify-content : space-around;
		flex-wrap : wrap;
	}
	.photo{
		border : 1px solid #ccc;
		margin-top : 30px;
		width : 18%;
		
		height : 122px;
		overflow : hidden;
		transition-duration : 1s;
	}
	.photo>img{
		width : 100%;
		height : 100px;
	}
	.photo>p{
		text-align : center;
	}
	.photo>img:hover{
		transform : scale(1.4);
	}
</style>


</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<h1 style="margin-left: 200px; margin-top:50px;">CLUB FEED</h1>
	<c:choose>
	<c:when test="${!empty sessionScope.m }">
	<button id="feed_info" onclick="location.href='/insertFreeBoardFrm.do';">MAKE FEED</button>
	</c:when>
	</c:choose>
	<!-- <div class="container">
		<div class="posting">
			<img src="/resources/main/images/intro_1.jpg">
			<p class="etc">
				<button>
					<i class="far fa-heart"></i>
				</button>
				<button>
					<i class="far fa-circle"></i>
				</button>
			</p>
			<p class="comments"></p>
		</div>
		<div class="posting">
			<img src="/resources/main/images/intro_2.jpg">
			<p class="etc">
				<button>
					<i class="far fa-heart"></i>
				</button>
				<button>
					<i class="far fa-circle"></i>
				</button>
			</p>
			<p class="comments"></p>
		</div>
	</div> -->
	<%--<% String path = request.getSession().getServletContext().getRealPath("/resources/freeBoardUpload/") %>
	 <%= application.getContextPath() %><br>
	<%= request.getSession().getServletContext().getRealPath("/") %><br>
	<%= application.getRealPath("/resources/freeBoardUpload/") %> --%>
			<div class="photoWrapper">
			<img src="/resources/freeBoardUpload/images/intro_1.jpg">
			</div>
			<button class="btn btn-outline-info btn-block" currentCount="0" value="" totalcount=${totalCount } id="more-btn">더보기</button>
	<script>
 	 $(function(){
		more(1);		//처음에 more함수에 1을주면서 실행할거다 온로드함수기 때문에
		$("#more-btn").click(function(){
			more($(this).val());			//더보기를 버튼 누르면 자기자신의 val값을 전달해주면서 함수 실행
		});
	});  
		 function more(start){
			$.ajax({
				url : "/selectFreeBoards.do",
				data : {start:start},
				type : "post",
				success : function(data){	//data에 포토객체가 여러개 들어있는거죠 gson to list 그거한거
					for(var i = 0; i<data.length; i++){
						var fb = data[i];		//p에 데이터인덱스 근깐 포토객체으 인덱스가p에 들어갈거고
						//여기여기1
						console.log(fb.FILEPATH);
						console.log(fb.FB_CONTENT);
						var html = "";				//html초기화
						html += "<div class='photo'>";			//여기다가 div클ㄹ스
						html += "<img src='/resources/freeBoardUpload/"+fb.FILEPATH+"'>"; 		//포토가 저장되는 경로에 파일패스 이 html을 넣어줘야 사진이ㅣ 보이겠죠
						html += "<p class='caption'>"+fb.FB_CONTENT+"</p></div>";
						$(".photoWrapper").append(html);								
							}
				/* //이미지 추가가 끝나고 나면 더보기 버튼의 currentValue,totlacount 값 조정
				$("#more-btn").val(Number(start)+5);		//얘는 반면 시작값이라 datalength가 아니라 5를 더하는거임
				var curr = Number($("#more-btn").attr("currentCount"));
				$("#more-btn").attr("currentCount",curr+data.length);		//이게 5단위가 아닐 수 있기 때문에 21개면 마지막 for문 도는 횟수는 한번일 테니깐 그래서 data.length를 더하는중
				var totalCount = $("#more-btn").attr("totalCount");
				var currCount = $("#more-btn").attr("currentCount");
				if(currCount == totalCount){		//최근불러온 currcount와 total카운트 전체 카운트가 같아지면 더 불러올 게 없기때문에 더보기 버튼은 사라져야한다
					$("#more-btn").attr("disabled",true);
				} */
				}
			});
		} 
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>