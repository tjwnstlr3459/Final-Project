<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/login.do" method="post">
		<fieldset>
			<legend>로그인</legend>
			이메일 : <input type="emial" name="email"><br>
			비밀번호 : <input type="password" name="memberPw"><br>
			<input type="submit" value="로그인">
			<input type="reset" value="취소">	
		</fieldset>
	</form>
</body>
</html>