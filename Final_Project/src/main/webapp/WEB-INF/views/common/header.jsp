<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,600;1,400&display=swap" rel="stylesheet">
<style>
        body{
            margin: 0;
        }
        .navbar_logo > a{
            text-decoration: none;
            color: #fff;
        }
        .navbar_menu > li > a{
            text-decoration: none;
            color: #fff;
            font-family: 'Source Sans Pro', sans-serif;
        }
        .navbar{
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #ec523f;
            padding: 8px 50px;
        }
        .navbar_logo{
            font-size: 24px;
            color: #fff;
            font-family: 'Source Sans Pro', sans-serif;
        }
        .navbar_logo{
            color: #152447;
        }
        .navbar_menu{
            display: flex;
            list-style: none;
            padding-left: 0;
        }
        .navbar_menu li{
            padding: 8px 30px;
        }
        .navbar_menu :hover{
            background-color: #152447;
            border-radius: 10px;
        }
        .navbar_icons li{
            list-style-type: none;
            color: #fff;
            display: flex;
        }
        .navbar_icons li{
            padding: 8px 10px;
            float: left;
        }
</style>
</head>
<body>
  <nav class="navbar">
        <div class="navbar_logo">
            <i class="fas fa-people-arrows"></i>
            <a href="/main.jsp">NUNADRI</a>
        </div>
            <ul class="navbar_menu">
                <li><a href="#">CLUB CATEGORY</a></li>
                <li><a href="#">CLUB FEED</a></li>
                <!--<c:choose>
                <c:when test="${!empty sessionScope.m }"
                	<c:choose>
                	<c:when test="${!empty sessionScope.m eq 'ADMIN1' }"-->
                		<li><a href="/adminMain.do">ADMIN</a></li>
	                	<li><a href="/logout.do">LOGOUT</a></li>
	          		<!--</c:when>
                	<c:otherwise>-->
	                	<li><a href="/myClub.do">MY CLUB</a></li>
	                	<li><a href="/logout.do">LOGOUT</a></li>
	            	<!--</c:otherwise>
	            </c:choose>
	            </c:when>
	            <c:otherwise>-->
                <li><a href="/lgoinFrm.do">LOGIN</a></li>
                <li><a href="/join.do">JOIN</a></li>
                <!--</c:otherwise>
                </c:choose>-->
                <li><a href="/newClub.do">CREATE CLUB</a></li>
                <li><a href="/badReport.do">BADREPORT</a></li>
                
            </ul>
        <ul class="navbar_icons">
            <li><i class="fab fa-facebook-f"></i></li>
            <li><i class="fab fa-instagram"></i></li>
        </ul>
    </nav>
</body>
</html>