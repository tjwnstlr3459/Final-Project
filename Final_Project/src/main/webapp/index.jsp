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
<title>너나들이</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
   <link rel="stylesheet" type="text/css" href="resources/css/login.css" />
   <script src="resources/js/login.js" ></script>
</head>
<body>
	<div class="intro">
   <div class="animated-bar"></div>

   <div class="slide slide-a">
      <div class="slide-content">
         <h2 class="slide-a-child">나 몰랐는데..</h2>
         <h1 class="slide-a-child" style="font-size:32px; font-weight: bold;">영화</h1>
         <p class="slide-a-child" style=" font-size:30px;">좋아하네..</p>
         <button class="slide-a-child" onclick="location.href='/main.jsp';" style="background-color:rgba(255,255,255,0.3); font-weight:bold; font-size:25px;" >ENTER</button>
      </div>
   </div>

   <div class="slide slide-b">
      <div class="slide-content">
         <h2 class="slide-b-child">나 몰랐는데..</h2>
         <p class="slide-b-child" style="font-weight:bold; font-size:32px;">여행</p>
         <p class="slide-b-child" style=" font-size:30px;">좋아하네..</p>
         <button class="slide-b-child" onclick="location.href='/main.jsp';" style="background-color:rgba(255,255,255,0.6); font-weight:bold; font-size:25px;">ENTER</button>
      </div>
   </div>

   <div class="slide slide-c">
      <div class="slide-content">
         <h2 class="slide-c-child">나 몰랐는데..</h2>
         <ul>
            <li class="slide-c-child" ><p>스포츠</p></li>
            <li class="slide-c-child" ><p> 와인</p></li>&nbsp;&nbsp;
            <li class="slide-c-child" ><p> 등산</p></li>&nbsp;&nbsp;
            <li class="slide-c-child" ><p> 맛집탐방</p></li>
         </ul>
         <h2>좋아하네..</h2>
         <button class="slide-c-child" onclick="location.href='/main.jsp';" style="background-color:rgba(255,255,255,0.6); font-weight:bold; font-size:25px;">ENTER</button>
      </div>
   </div>

   <div class="slide slide-d">
      <div class="slide-content">
         <h2 class="slide-d-child">'너나들이'와 함께</h2>
         <p class="slide-d-child">좋아하는 것을해볼까요?</p>
         <button class="slide-a-child" onclick="location.href='/main.jsp';" style="background-color:rgba(255,255,255,0.3); font-weight:bold; font-size:25px;">ENTER</button>
         <button class="slide-a-child" onclick="location.href='/';" style="background-color:rgba(255,255,255,0.3); font-weight:bold; font-size:25px;">REPLAY</button>
      </div>
   </div>

</div>
</body>
</html>











