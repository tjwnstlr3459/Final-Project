<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- Sha256 암호화 관련 -->
<script type="text/javascript" src="/resources/js/core.min.js"></script>
<script type="text/javascript" src="/resources/js/sha256.min.js"></script>
</head>
<body>

	<form method="post" id="form" style="display:none">
		<input type="hidden" id="email" name="email">
		<input type="hidden" id="memberPw" name="memberPw">
	</form>
	
<script type="text/javascript">
  var naver_id_login = new naver_id_login("QqHxZVXS15sYfRiy7g5M", "http://127.0.0.1/view/callback.jsp");
  // 접근 토큰 값 출력
  //alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    //alert(naver_id_login.getProfileData('email'));
    //alert(naver_id_login.getProfileData('nickname'));
    //alert(naver_id_login.getProfileData('age'));
    //alert(naver_id_login.getProfileData('id'));
    //alert(naver_id_login.getProfileData('gender'));
    //alert(naver_id_login.getProfileData('birthday'));
    //alert(naver_id_login.getProfileData('profile_image'));
    //alert(naver_id_login.getProfileData('id'));
    
   
    var email = naver_id_login.getProfileData('email');    
    var memberPw = naver_id_login.getProfileData('id');
    var shaPw = CryptoJS.SHA256(memberPw).toString(); 
    
    $(document).ready(function() {
  	  $.ajax({
  			url: "/nLogin.do",
  			data: {email:email},
  			type: "post",
  			success: function(data) {
  				if(data == "1" || data == "2") {
  					alert("이미 가입된 아이디입니다. 로그인 화면으로 이동합니다.")
  					form.action = "/login.do";
  					$("#email").val(email);
  					$("#memberPw").val(shaPw);
  					form.submit();
  				} else {
  					form.action = "/socialJoin.do";
  					$("#email").val(email);
  					$("#memberPw").val(shaPw);
  					form.submit();
  				}
  			},
  			error: function() {
  				console.log("에러")
  			}
  		})
    })
  }
 
</script>
</body>
</html>