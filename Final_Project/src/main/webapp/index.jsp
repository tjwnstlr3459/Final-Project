<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTL Core 태그 -->
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/login.css" />
   <script src="resources/js/login.js" ></script>
</head>
<body>
	<a href="/myClub.do">마이클럽</a>
	<a href="/adminMain.do">관리자 페이지</a>
	<a href="/newClub.do">모임개설페이지</a>
	<div class="intro">
   <div class="animated-bar"></div>

   <div class="slide slide-a">
      <div class="slide-content">
         <p class="slide-a-child">나 몰랐는데..</p>
         <h1 class="slide-a-child" style="font-size:35px; font-weight: bold;">영화</h1>
         <p class="slide-a-child">좋아하네..</p>
         <button class="slide-a-child" onclick="location.href='/main.jsp';">ENTER</button>
      </div>
   </div>

   <div class="slide slide-b">
      <div class="slide-content">
         <h2 class="slide-b-child">나 몰랐는데..</h2>
         <p class="slide-b-child">여행</p>
         <p class="slide-b-child">좋아하네..</p>
         <button class="slide-b-child" onclick="location.href='/main.jsp';">ENTER</button>
      </div>
   </div>

   <div class="slide slide-c">
      <div class="slide-content">
         <h2 class="slide-c-child">나 몰랐는데..</h2>
         <ul>
            <li class="slide-c-child"><p>스포츠,</p></li>
            <li class="slide-c-child" ><p> 와인,</p></li>&nbsp;&nbsp;
            <li class="slide-c-child" ><p> 등산,</p></li>&nbsp;&nbsp;
            <li class="slide-c-child" ><p> 맛집탐방</p></li>
         </ul>
         <h2>좋아하네..</h2>
         <button class="slide-c-child" onclick="location.href='/main.jsp';">ENTER</button>
      </div>
   </div>

   <div class="slide slide-d">
      <div class="slide-content">
         <h2 class="slide-d-child">너나들이와 함께</h2>
         <p class="slide-d-child">좋아하는 것을<a href="http://mohamdhasan.pro/" target="_blank">해볼까요?</a></p>
         <button class="slide-d-child" onclick="location.href='/main.jsp';">ENTER</button>
      </div>
   </div>

</div>
</body>
</html>











