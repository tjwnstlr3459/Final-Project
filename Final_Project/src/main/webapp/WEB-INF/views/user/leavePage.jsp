<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>너나들이</title>
<link rel="stylesheet" type="text/css" href="resources/css/member/rest.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="container">
		<h2>너나들이 회원 탈퇴</h2> 
		<div class="message">
			<p>회원 탈퇴 시 회원 정보와 서비스 이용 내역은 모두 삭제되며, 복구가 불가능합니다.</p>
		</div>
		<div class="rest-table">
			<p>탈퇴를 진행하시려면 비밀번호를 입력해주세요.</p>
			<form action="/goodbye.do" method="post">
				<input type="hidden" name="email" value="${m.email }">				
				<input type="password" name="memberPw"><br>
				<input type="submit" value="회원 탈퇴">
			</form>
		</div>
		
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>