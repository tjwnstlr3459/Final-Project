<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/freeBoardList/freeBoardList.css" />
<!-- 	<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script> -->
<meta charset="UTF-8">
<title>피드게시판</title>
<style>

/*모달창*/
      .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */     
            font-size: 13px;                     
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
         a{
            border-bottom: none;
        }
        .navbar_menu > li :hover > a {
        	color : #fff !important;
        }
        #wrapper span {
        	font-size: 15px;
        }
	.item button{
		text-align:center;
	}
</style>

</head>
<body>
	 <%@include file="/WEB-INF/views/common/header.jsp"%>  
	<h1 style="margin-left: 200px; margin-top:50px;">CLUB FEED<br><sub style='font-size:15px;'>클럽활동들을 자유롭게 올리는 곳입니다.</sub></h1>
	<c:choose>
	<c:when test="${!empty sessionScope.m }">
	<button id="feed_info" style="float:right; margin-right: 300px; font-size: 14px;" onclick="location.href='/insertFreeBoardFrm.do';">MAKE FEED</button>
	</c:when>
	</c:choose>
	<div id="wrapper">
		<input type='text' name='userNo' value="${sessionScope.m.memberNo }" style='display:none;'>
	<section class="main items">
	</section>
	</div>
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
	<div class="modal-content">
        <span class="close" onclick="closeView();">&times;</span>         
      </div>
 
    </div>
	    
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
						var html = "";				//html초기화
						html += "<article class='item'><header style='display:flex;'>";			
						html += "<a onclick='detailView(this);' style='cursor:pointer;'><img style='width:100%; height:100%;' src='/resources/freeBoardUpload/"+fb.filepath+"'></a>"; 
						html += "<span style='display:none;'>"+fb.fbContent+"</span>";
						html += "<span style='display:none;'>"+fb.fbWriter+"</span>";
						html += "<input type='text' name='fbNo' value='"+fb.fbNo+"'style='display:none;'>";
						html += "<input type='text' value='"+fb.fbGood+"'style='display:none;'>";
						html += "<input type='text' value='"+fb.fbViews+"'style='display:none;'>";
						html += "<input type='text' value='"+fb.typeString+"'style='display:none;'>";
						html += "<h3 style='font-size:18px;'>"+fb.fbWriter+"님의 게시물입니다.</h3></header>";
						html += "<ul class='actions'>";
						<c:choose>
							<c:when test="${empty sessionScope.m}">
							html += "<li><a onclick='loginCheckHeart();' class='button' style='font-size:10px;'><i class='far fa-heart' style='font-size:5px;'></i></a></li><br>";
							</c:when>
							<c:otherwise>
							if(fb.flag == 0){
							html += "<li style='margin-left:12px;'><a class='button' onclick='addHeart(this);' style='font-size:10px;'><i class='far fa-heart' style='font-size:5px;'></i></a></li><br>";								
							}else{
							html += "<li style='margin-left:12px;'><a class='button' onclick='minusHeart(this);' style='font-size:10px;'><i class='fas fa-heart' style='font-size:5px;'></i></a></li><br>";																
							}
							</c:otherwise>
						</c:choose>
						
						html += "<span>"+fb.fbGood+"</span><span> likes</span><br>";
						html += "<span>"+fb.fbViews+"&nbsp;views</span>";
						html += "<br>";
						if(fb.fbWriter == "${sessionScope.m.memberNick}"){							
						html += "<li ><a style='text-decoration:none; font-size:15px;' href='/updateFreeBoardFrm.do?fbNo="+fb.fbNo+"'"+">UPDATE FEED</a></li>";
						html += "<li ><a onclick='deleteCheck(this);' style='text-decoration:none; cursor:pointer; font-size:15px;'>DELETE FEED</a></li>";						
							}
						if(${sessionScope.m.grade < 2}){
						html += "<li id='temporary'><a onclick='deleteCheck(this);'>DELETE FEED</a></li>";													
						}
						html += "</ul></article>";
						
						$(".main").append(html);
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
		function addHeart(obj){		//this 를 obj로 주고 받아서 this를 찍어야 해당하는 속성값이 찍힘
			var fbNo = $(obj).parents().eq(1).parents().eq(0).children().eq(0).children().eq(3).val();
			var userNo = $(obj).parents().eq(3).parents().eq(0).children().eq(0).val();
			   $.ajax({
				url : "/addHeart.do",
				data : {fbNo:fbNo,userNo:userNo},
				type : "post",
				success : function(data){
					if(data == 1){
						$(obj).children().first().removeClass("far fa-heart");
						$(obj).children().first().addClass("fas fa-heart");
						var likes = parseInt($(obj).parents().eq(0).next().next().html())+1;
						$(obj).parents().eq(0).next().next().html(likes);
						
						if($(obj).children().first().attr('class') == 'fas fa-heart'){
						$(obj).parents().children().eq(0).attr("onclick","minusHeart(this);");							
						}
					}
				}
		});  
		}
		function deleteCheck(obj) {
			var fbNo = $(obj).parent().eq(0).parent().eq(0).parent().eq(0).children().eq(0).children().eq(3).val();
			if(confirm('피드를 정말 삭제하시겠습니까?')){				
				location.href='/deleteFreeBoard.do?fbNo='+fbNo;
				
			}else{
				location.href-"redirect:/";
			}
		}
		function minusHeart(obj){
			var fbNo = $(obj).parents().eq(1).parents().eq(0).children().eq(0).children().eq(3).val();
			var userNo = $(obj).parents().eq(3).parents().eq(0).children().eq(0).val();
			  $.ajax({
					url : "/minusHeart.do",
					data : {fbNo:fbNo,userNo:userNo},
					type : "post",
					success : function(data){
						if(data == 1){
							$(obj).children().first().removeClass("fas fa-heart");
							$(obj).children().first().addClass("far fa-heart");
							var likes = parseInt($(obj).parents().eq(0).next().next().html())-1;
							$(obj).parents().eq(0).next().next().html(likes);
							
							if($(obj).children().first().attr('class') == 'far fa-heart'){
							$(obj).parents().children().eq(0).attr("onclick","addHeart(this);");							
							}
						}
					}
			});  
		}
		        	var modal = document.getElementById('myModal');
		        	var span = document.getElementsByClassName("close")[0];
		        function detailView(obj) {
		        	var filepath = $(obj).children().eq(0).attr('src');
		        	var img = "<img src='"+filepath+"' style='width:100%; height:100%;'>";
		        	var fbContent = $(obj).parents().children().eq(1).html();
		        	var fbWriter = $(obj).parents().children().eq(2).html();
		        	var fbGood = $(obj).parents().children().eq(4).val();
		        	var fbViews = $(obj).parents().children().eq(5).val();
		        	var fbTypeString = $(obj).parents().children().eq(6).val();
		        	modal.style.display = "block";
		        	$('.modal-content').append(img);
		        	$('.modal-content').append("<hr><p style='text-align:center; font-size:17px;'>"+fbContent+"</p>");
		        	$('.modal-content').append("<hr>");		        	
		        	$('.modal-content').append("<span style='text-align:right;'>"+fbTypeString+" 관련클럽</span><br>");
		        	$('.modal-content').append("<span style='text-align:left;'>좋아요 : "+fbGood+"개</span>&nbsp;&nbsp;&nbsp;");
		        	$('.modal-content').append("<span style='text-align:left;'>조회수 : "+fbViews+"회</span><br>");
		        	$('.modal-content').append("<span style='text-align:right;'>작성자 : "+fbWriter+"</span>");
		        	 var fbNo = $(obj).parents().children().eq(3).val();
		        	 $.ajax({
						url : "/addViews.do",
						data : {fbNo:fbNo},
						type : "post",
						success : function(data){
							if(data == 1){
								 console.log("조회수1증가"); 
							}
						}
				}); 
		        }
		        function closeView() {
		        	$('.modal-content').empty();
		        	$('.modal-content').append('<span class="close" onclick="closeView();">&times;</span>');		        	
		        	modal.style.display="none";
				}
		        window.onclick = function(event) {
		            if (event.target == modal) {
		        	$('.modal-content').empty();
		        	$('.modal-content').append('<span class="close" onclick="closeView();">&times;</span>');		        	
		                modal.style.display = "none";
		            }
		        }
		        
		        function loginCheckHeart() {
					if(${empty sessionScope.m}){
					alert("로그인 후 좋아요 가능합니다.");
					}
		        }
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>