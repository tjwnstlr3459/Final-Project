<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
        
        <link rel="stylesheet" href="/resources/main/css/bootstrap.min.css">
        <link rel="stylesheet" href="/resources/main/css/font-awesome.css">
        <link rel="stylesheet" href="/resources/main/css/animate.css">
        <link rel="stylesheet" href="/resources/main/css/templatemo_misc.css">
        <link rel="stylesheet" href="/resources/main/css/templatemo_style.css">

        <script src="/resources/main/js/vendor/jquery-1.11.0.min.js"></script>
        <!-- <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.0.min.js"><\/script>')</script> -->
        <script src="/resources/main/js/bootstrap.js"></script>
        <script src="/resources/main/js/plugins.js"></script>
        <script src="/resources/main/js/main.js"></script>

        <script src="/resources/main/js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>

</head>
<body>
<div class="site-main" id="sTop">
            <div class="site-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
                                <li><a href="https://www.facebook.com/%EB%84%88%EB%82%98%EB%93%A4%EC%9D%B4-102411682096038" class="fa fa-facebook" target='_blank'></a></li>
                                <li><a href="https://www.instagram.com/nunadri_/" class="fa fa-instagram" target='_blank'></a></li>
                            </ul>
                        </div> <!-- /.col-md-12 -->
                    </div> <!-- /.row -->
                </div> <!-- /.container -->
                <div class="main-header">
                    <div class="container">
                        <div id="menu-wrapper">
                            <div class="row">
                                <div class="logo-wrapper col-md-2 col-sm-2">
                                    <h1>
                                        <a href="/">NUNADRI</a>
                                    </h1>
                                </div> <!-- /.logo-wrapper -->
                                <div class="col-md-10 col-sm-10 main-menu text-right">
                                    <div class="toggle-menu visible-sm visible-xs"><i class="fa fa-bars"></i></div>
                                    <ul class="menu-first">
                                        <li class="active"><a href="#">Home</a></li>
                                        <li><a href="#clubCategory">Club category</a></li>
                                        <li><a href="#clubFeed">club Feed</a></li>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="toggle-menu visible-sm visible-xs"></div>
                                        <c:choose>
                                        <c:when test="${!empty sessionScope.m }">
                                        <c:choose>
                                        	<c:when test="${sessionScope.m.memberNick eq 'ADMIN1' }">
											<li><a onclick="location.href='/adminMain.do';" style="cursor: pointer;">관리자 페이지</a></li>
                                        	<li><a onclick="location.href='/logout.do';" style="cursor: pointer;">로그아웃</a></li>
											</c:when>
											<c:otherwise>
                                        	<li><a onclick="location.href='/myClub.do';" style="cursor: pointer;">마이클럽</a></li>
                                        	<li><a onclick="location.href='/logout.do';" style="cursor: pointer;">로그아웃</a></li>
                                        	</c:otherwise>
                                        </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                        <li><a onclick="location.href='/loginFrm.do';" style="cursor: pointer;">Login</a></li>
                                        <li><a onclick="location.href='/join.do';" style="cursor: pointer;">Join</a></li>
                                        </c:otherwise>
                                        </c:choose> 
										<li><a onclick="location.href='/newClub.do';" style="cursor: pointer;">create club</a></li> 
                                        <li><a onclick="location.href='/badReport.do';" style="cursor: pointer;">Bad report</a></li>                                                                         
                                    </ul>                                    
                                </div> <!-- /.main-menu -->
                            </div> <!-- /.row -->
                        </div> <!-- /#menu-wrapper -->                        
                    </div> <!-- /.container -->
                </div> <!-- /.main-header -->
            </div> <!-- /.site-header -->
            <div class="site-slider">
                <div class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <div class="overlay"></div>
                                <img src="/resources/main/images/intro_4.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>'너나들이'</h2>
                                    <p>이곳에서 클럽을 만들고<br>사람들과 건전한 모임을 이어가세요</p>
                                    <br>
                                    <br>
                                    <br>
                                    <a href="#" class="slider-btn" style="font-size: 25px;">클럽 만들기</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="/resources/main/images/intro_2.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>'너나들이'</h2>
                                    <p>당신의 취향이 이곳에 모두 있습니다</p>
                                    <a href="#" class="slider-btn" style="font-size: 25px;">클럽 카테고리</a>
                                </div>
                            </li>
                            <li>
                                <div class="overlay"></div>
                                <img src="/resources/main/images/intro_3.jpg" alt="">
                                <div class="slider-caption visible-md visible-lg">
                                    <h2>'너나들이'</h2>
                                    <p>당신의 클럽을 자랑하세요</p>
                                    <a href="#" class="slider-btn" style="font-size: 25px;">피드 보러가기</a>
                                </div>
                            </li>
                        </ul>
                    </div> <!-- /.flexslider -->
                </div> <!-- /.slider -->
            </div> <!-- /.site-slider -->
        </div> <!-- /.site-main -->
</body>
</html>