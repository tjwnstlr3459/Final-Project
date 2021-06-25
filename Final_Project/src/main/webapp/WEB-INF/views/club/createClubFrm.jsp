<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클럽생성페이지</title>
<style>
	body {
  background-color: #ec523f;
}
.clubForm {
  text-align: center;
  font-family: "Source Sans Pro", sans-serif;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="clubForm">
    <fieldset style="border: 1px solid #ccc;">
        <h1>CREATE CLUB FORM</h1>
        <form action="#" method="POST" enctype="multipart/form-data">
                    CLUB MASTER<br>
                    <input type="text" readonly value="로그인자"><br>
                    CATEGORY<br>
            <select name="clubCg">
                <option value="3" disabled>Category</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
                <option value="3">영화</option>
            </select><br>
            CLUB TITLE<br>
            <input type="text"><br>
            CLUB INTRO<br>
            <textarea rows="10" cols="50"></textarea rows><br>
                CLUB IMG<br>
            <input type="file"><br>
                <input type="radio" name="type">PUBLIC
                <input type="radio" name="type">PRIVATE<br>
            <button type="submit">MAKE!</button>
        </form>
    </fieldset>
</div>
</body>
</html>