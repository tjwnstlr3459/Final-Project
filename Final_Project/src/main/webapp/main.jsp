<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
 <html class="no-js" lang="ko">
<head>
<meta charset="UTF-8">
<title>너나들이에오신걸 환영합니다!</title>
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
        <%@include file="/WEB-INF/views/common/header.jsp" %>

        <div class="content-section" id="clubCategory">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>Club Category</h2>
                        <p>맘에드는 카테고리를 확인하세요</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-1" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-apple"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>음식</h3>
                                   <p>나만이 아는 맛집을 공유하고 같이 가잨</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-2" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-flag"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>스포츠</h3>
                                   <p>여러가지 스포츠 동호회를 만들어 같이 즐겨요!</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-3" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-glass"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>술</h3>
                                   <p>도수높은 위스키, 향이 좋은 와인을 함께즐겨요</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-4" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-asterisk"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>게임</h3>
                                   <p>롤, 에이펙스 등 게임같이하자!</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-5" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-headphones"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>음악</h3>
                                </div>
                                   <p>좋아하는 음악을 공유하고, 함께 콘서트도 즐겨요!</p> 
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-6" onclick="location.href=''" style="cursor:pointer; background-color:firebrick;">
                            <div class="service-icon">
                                <i class="fa fa-globe"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>여행</h3>
                                   <p>사람들과 함께 어우러져 이곳저곳 여행명소로 떠나봅시다!</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-7" onclick="location.href=''" style="cursor:pointer; background-color:coral;">
                            <div class="service-icon">
                                <i class="fa fa-shopping-cart"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>쇼핑</h3>
                                   <p>좋아하는 물품들을 공유하고, 함께 쇼핑도 해요!</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-8" onclick="location.href=''" style="cursor:pointer">
                            <div class="service-icon">
                                <i class="fa fa-leaf"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>환경</h3>
                                   <p>함께 환경을 보호하는 활동을 해보아요!</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#services -->



        <div class="content-section" id="clubFeed">
            <div class="container">
                <div class="row">
                    <div class="heading-section col-md-12 text-center">
                        <h2>Our Club Feed</h2>
                        <p>당신의 클럽을 자랑하세요</p>
                    </div> <!-- /.heading-section -->
                </div> <!-- /.row -->
                <div class="row">
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p1.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'네발자전거'</h3>
                                <p>자전거 라이딩으로 회원님덜과 파주 평화공원을 다녀왔숨당</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p2.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'무비메이트'</h3>
                                <p>채팅으로 알게된 회원님과 둘이 킬러의 보디가드 관람! 배꼽 찾아 삼만리</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p7.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'떠나자 어디든'</h3>
                                <p>회원님들과 함께 다녀온 강릉여행</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p8.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'니가사는거라면 나도 끼지'</h3>
                                <p>그라가스같은 회원님이 와인에 대해 알려주셨어요!</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p3.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'아미회장'</h3>
                                <p>방탄소년단 콘서트에 같이 다녀왔어요!</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p4.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'6군 스트라이커'</h3>
                                <p>상암 풋살장을 빌려서 3:3 밀어내기를 했어요!</p>
                                <a href="images/gallery/p4.jpg" data-rel="lightbox" class="expand">
                                    <i class="fa fa-search"></i>
                                </a>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p5.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'내일의쇼핑왕'</h3>
                                <p>옷잘알 친구들과 쇼핑을 했어요!</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p6.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'나무나무'</h3>
                                <p>식목일이 아니어도 나무를 심고 왔어요.</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <button onclick="location.href='/feedList.do'" id="feed_info">MORE</button>
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->
            
<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>