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
        <form action="/createClub.do" method="POST" enctype="multipart/form-data">
                    CLUB MASTER<br>
                    <input type="text" readonly value="${sessionScope.m.memberNick }" name="clubOpener"><br>
                    CATEGORY<br>
            <select name="clubCg">
                <option disabled>Category</option>                
                <option value="4">스포츠</option>
                <option value="5">음악</option>
                <option value="6">여행</option>
                <option value="7">자연</option>
                <option value="8">게임</option>
                <option value="9">영화</option>
                <option value="10">술</option>
                <option value="11">음식</option>
            </select><br>
            CLUB NAME<br>
            <input type="text" name="clubName"><br>
            CLUB INTRO<br>
            <textarea rows="10" cols="50" name="clubIntro"></textarea rows><br>
                CLUB IMG<br>
            <input type="file" name="file"><br>
                <input type="radio" name="ispublic" value="Y">PUBLIC
                <input type="radio" name="ispublic" value="N">PRIVATE<br>
            <button type="submit">MAKE!</button>
        </form>
    </fieldset>
</div>
</body>
</html>