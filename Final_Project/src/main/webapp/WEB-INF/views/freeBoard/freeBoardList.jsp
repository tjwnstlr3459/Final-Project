<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>피드게시판</title>
<style>
container {
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
	width: 500px;
	height: 400px;
	text-align: center;
	margin: 30px;
}

.posting>img:hover {
	cursor: pointer;
}

.posting {
	background-color: rgba(240,136,76,0.8);
	text-align: center;
	margin: 0 auto 40px;
	border:3px solid #ccc;
	width:600px;
}
.fbContent{
	background-color: rgba(240,136,76,0.4);
	display:block;
	text-align: center;
	margin-right:200px;
	width:100%;
	border: 1px solid #ccc;
	border-bottom: none;
	font-size: 30px;
}
.etc{
	background-color: rgba(240,136,76,0.4);
	display:block;
	text-align: center;
	margin-right:200px;
	width:100%;
	border: 1px solid #ccc;
	font-size: 25px;
}

button {
	background-color: transparent;
	border: none;
	font-size: 25px;
	
}
button:hover{
	cursor:pointer;
}
.comment{
	display:block;
	text-align: center;
	margin-right:200px;
	width:100%;
	border: 1px solid #ccc;
}
.comments{
	width:400px;
	height: 300px;
}
#temporary :hover{
	background-color: black;
}

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
            width: 50%; /* Could be more or less, depending on screen size */                          
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
	<div class="container">
			<%-- <button class="btn btn-outline-info btn-block" currentCount="0" value="" totalcount=${totalCount } id="more-btn">더보기</button> --%>
	  <!-- <button id="myBtn">Open Modal</button>  -->
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close" onclick="closeView();">&times;</span>         
        <%-- <p><img src='/resources/freeBoardUpload/"</p>
        <p>${fb.fbContent }</p>
        <p>${fb.fbWriter }</p> --%>
      </div>
 
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
						var html2 ="";
						html += "<div class='posting'>";			//여기다가 div클ㄹ스 */
						html += "<img src='/resources/freeBoardUpload/"+fb.filepath+"'>"; 		//포토가 저장되는 경로에 파일패스 이 html을 넣어줘야 사진이ㅣ 보이겠죠
						/* html += "<span class='fbContent'>"+fb.fbContent+"</span>"; */
						/* html += "<input type='text' value='fbNo' hidden>"; */
						html += "<button onclick='addHeart(this);'><i class='far fa-heart'></i>&nbsp;";
						html += "<input type='text' value='"+fb.fbNo+"' hidden>";
						html +="</button><button><i class='far fa-circle'></i></button>&nbsp;&nbsp;<span class='etc'>Likes : "+fb.fbGood+"&nbsp;&nbsp;";
						html += "</button>Views : "+fb.fbViews+"&nbsp;&nbsp;<br>BY: "+fb.fbWriter+"&nbsp;&nbsp;Sub : "+fb.typeString+"</span>";
						if(fb.fbWriter == "${sessionScope.m.memberNick}"){							
						html += "<button id='temporary'><a style = 'line-height: 30px; text-decoration:none; color:#fff; font-size:20px;' href='/updateFreeBoardFrm.do?fbNo="+fb.fbNo+"'"+">UPDATE FEED</a><br></button>&nbsp;&nbsp;&nbsp;";
						html += "<button id='temporary'><a style = 'line-height: 30px; text-decoration:none; color:#fff; font-size:20px;' href='/deleteFreeBoard.do?fbNo="+fb.fbNo+"'"+">DELETE FEED</a></button>";
						}
						html += "<span class='comments'></span></div>";
						html += "<button onclick='detailView();'>상세view</button>";
						/* html2 += "<p><img src='/resources/freeBoardUpload/"+fb.filepath;
				        html2 += "</p><p>"+fb.fbContent;
				        html2 += "</p><p>"+fb.fbWriter+"</p>";*/
				        html2 += "<p>"+fb.fbContent+"</p>";
				        html2 += "<p>"+fb.fbWriter+"</p>";
				        $(".modal-content").append(html2); 
						$(".container").append(html);
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
			var fbNo = $(obj).children().last().val();
			$.ajax({
				url : "/addHeart.do",
				data : {fbNo:fbNo},
				type : "post",
				success : function(data){
					if(data == 1){
						$(obj).children().first().removeClass("far fa-heart");
						$(obj).children().first().addClass("fas fa-heart");
					}
					location.reload();
				}
		});
		}
		
		//모달쪽
		/*  var modal = document.getElementById('myModal');
		        // Get the button that opens the modal
		        var btn = document.getElementById("myBtn");
		        // Get the <span> element that closes the modal
		        var span = document.getElementsByClassName("close")[0];                                           
		        // When the user clicks on the button, open the modal 
		         btn.onclick = function() {
		            modal.style.display = "block";
		        }
		        // When the user clicks on <span> (x), close the modal
		        span.onclick = function() {
		            modal.style.display = "none";
		        }
		        // When the user clicks anywhere outside of the modal, close it
		        window.onclick = function(event) {
		            if (event.target == modal) {
		                modal.style.display = "none";
		            }
		        } */
		        	var modal = document.getElementById('myModal');
		        	var span = document.getElementsByClassName("close")[0];
		        function detailView() {
		        	modal.style.display = "block";
				}
		        function closeView() {
		        	modal.style.display="none";
				}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>

</html>