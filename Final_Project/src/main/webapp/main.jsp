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
        <div class="site-main" id="sTop">
            <div class="site-header">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="social-icons">
                                <li><a href="#" class="fa fa-facebook"></a></li>
                                <li><a href="#" class="fa fa-twitter"></a></li>
                                <li><a href="#" class="fa fa-dribbble"></a></li>
                                <li><a href="#" class="fa fa-linkedin"></a></li>
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
                        <div class="service-item" id="service-1">
                            <div class="service-icon">
                                <i class="fa fa-file-code-o"></i>
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
                        <div class="service-item" id="service-2">
                            <div class="service-icon">
                                <i class="fa fa-flag"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>스포츠</h3>
                                   <p>여러가지 스포츠</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-3">
                            <div class="service-icon">
                                <i class="fa fa-institution"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>술</h3>
                                   <p>술자리나 맛난 술 추천</p> 
                                </div>
                            </div> <!-- /.service-content -->
                        </div> <!-- /#service-1 -->
                    </div> <!-- /.col-md-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="service-item" id="service-4">
                            <div class="service-icon">
                                <i class="fa fa-flask"></i>
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
                        <div class="service-item" id="service-5">
                            <div class="service-icon">
                                <i class="fa fa-headphones"></i>
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
                        <div class="service-item" id="service-6">
                            <div class="service-icon">
                                <i class="fa fa-globe"></i>
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
                        <div class="service-item" id="service-7">
                            <div class="service-icon">
                                <i class="fa fa-shopping-cart"></i>
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
                        <div class="service-item" id="service-8">
                            <div class="service-icon">
                                <i class="fa fa-leaf"></i>
                            </div> <!-- /.service-icon -->
                            <div class="service-content">
                                <div class="inner-service">
                                   <h3>게임</h3>
                                   <p>롤, 에이펙스 등 게임같이하자!</p> 
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
                                <p>이번에 다같이 산악자전거를 타고왔어요!</p>
                            </div> <!-- /.portfolio-overlay -->
                        </div> <!-- /.portfolio-thumb -->
                    </div> <!-- /.portfolio-item -->
                    <div class="portfolio-item col-md-3 col-sm-6">
                        <div class="portfolio-thumb">
                            <img src="/resources/main/images/gallery/p2.jpg" alt="">
                            <div class="portfolio-overlay">
                                <h3>'무비메이트'</h3>
                                <p>블랙위도우를 보러갔다왔습니다.</p>
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
                    <button onclick="location.href='#'" id="feed_info">MORE</button>
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#portfolio -->
            
        <div id="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-xs-12 text-left">
                        <span>Copyright &copy; 2021 너나들이</span>
                  </div> <!-- /.text-center -->
                    <div class="col-md-4 hidden-xs text-right">
                        <a href="#top" id="go-top">Back to top</a>
                    </div> <!-- /.text-center -->
                </div> <!-- /.row -->
            </div> <!-- /.container -->
        </div> <!-- /#footer -->
</body>
</html>