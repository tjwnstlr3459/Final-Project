<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/join.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>

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
	        <div class="social">
                <span>소셜 로그인</span>
                <a href="#">구글 로그인</a>
                <a href="#">카카오 로그인</a>
                <a href="${nUrl}">네이버 로그인</a>
                <div id="naver_id_login"></div>
            </div> 
        </div>        
	</div>
	<%@ include file = "/WEB-INF/views/common/footer.jsp" %>  
	<script type="text/javascript">
	  	var naver_id_login = new naver_id_login("QqHxZVXS15sYfRiy7g5M", "http://127.0.0.1/view/nLogin.jsp");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 1,50);
	  	naver_id_login.setDomain("http://127.0.0.1");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	 </script>
</body>
</html>