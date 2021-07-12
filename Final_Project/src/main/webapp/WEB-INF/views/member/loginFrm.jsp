<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이</title>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 네이버 로그인 -->
<script type="text/javascript" src="resources/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<!-- 카카오 로그인 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

</head>
<body>
	<%@ include file = "/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h2>로그인</h2>  
		<div class="join">  
			<form action="/login.do" method="post">
				<div class="element">
		        	<span class="legend">이메일</span>
		        	<input type="email" name="email" placeholder="이메일" style="margin-bottom: 10px;">		        	
		        </div>
		        <div class="element">
		            <span class="legend">비밀번호</span>
		            <input type="password" name="memberPw" placeholder="비밀번호">
		            <span class="inputMsg"></span>
		        </div>
		        <input type="submit" value="로그인">
	        </form>
	        <div class="findpw"><a href="/join.do">회원가입</a> / <a href="javascript:void(0)" id="find">비밀번호 찾기</a></div>
	        
	        <div class="social">
                <span style="display:block;margin-top:30px;margin-bottom:5px;"><b>소셜 로그인</b></span>
                <a href="javascript:void(0)" class="kakao" onclick="kakaoLogin()">카카오 아이디로 로그인</a>
                <div id="naver_id_login"></div>
                
            </div> 
        </div>        
	</div>
	<div class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2>비밀번호 찾기</h2>
			</div>
			<div class="modal-body">
				<div class="modal-input">
					<input type="text" id="findEmail" name="email" placeholder="이메일 주소를 입력해주세요">
					<button type="button" id="findID">확인</button>
				</div>
				<div class="findResult"></div>
				<button type="button" id="closeModal">닫기</button>
			</div>
		</div>	
	</div>
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>  
	<!-- 네이버 소셜로그인 -->
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("QqHxZVXS15sYfRiy7g5M", "http://172.30.1.42/view/nLogin.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 2,65);
	  	naver_id_login.setDomain("http://127.0.0.1");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	 </script>
	 <!-- 카카오 소셜로그인 -->
	 <script>
	 Kakao.init('b0e4792bb9bc14ffbeebc4cac841f141'); 
	  //카카오로그인
	  function kakaoLogin() {
	      Kakao.Auth.login({
	        success: function (response) {
	          Kakao.API.request({
	            url: '/v2/user/me',
	            success: function (res) {
		            var email = res.kakao_account.email;
		           	var pw = res.id;
		           	console.log(email)
		           	console.log(pw)
		           	var form = $("form");
		           	$("[name=email]").val(email);
					$("[name=memberPw]").val(pw);
					form.submit();
	            },
	            fail: function (error) {
	            	console.log(error)
	            	alert("로그인에 실패했습니다. 잠시 후 다시 시도해주세요.")
	            },
	          })
	        },
	        fail: function (error) {
	          console.log(error)
	          alert("로그인에 실패했습니다. 잠시 후 다시 시도해주세요.")
	        },
	      })
	    }
	 </script>
	 
	 
	 <script>
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
			$(".findResult").html("");
		})
	 	$("#findID").click(function() {
	 		var email = $("#findEmail").val();
	 		$(".findResult").append("<img src='resources/image/ajax-loader.gif'>");
	 		$.ajax({
	 			url: "/user/chkEmail.do",
                type: "post",
                data: {email:email},
                success: function(data) {
					if(data == "1") {
						$(".findResult").html("");
						$.ajax({
							url: "pwMail.do",
							type: "post",
							data: {email:email},
							success: function(data) {
								console.log(data)
							},
							error: function() {
			                    console.log("error")
			                }
						})
						$(".findResult").html("임시 비밀번호를 메일로 전송했습니다.");
					}
					else if(data == "2") {
						$(".findResult").html("");
						$(".findResult").html("소셜 로그인으로 가입된 계정입니다.<br>각 서비스의 비밀번호 찾기를 이용해주세요.");
					} else {
						$(".findResult").html("");
						$(".findResult").html("가입 정보가 없습니다.");
					}
                },
                error: function() {
                    console.log("error")
                }

	 		})
	 	})
	 </script>
</body>
</html>