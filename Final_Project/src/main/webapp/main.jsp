<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="UTF-8">
<title>너나들이에오신걸 환영합니다!</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800'
	rel='stylesheet' type='text/css'>

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

<script
	src="/resources/main/js/vendor/modernizr-2.6.1-respond-1.1.0.min.js"></script>
</head>
<body>
	<div class="site-main" id="sTop">
		<div class="site-header">
			<div class="container">
				<div class="row">
					<div class="col-md-12 text-center">
						<ul class="social-icons">
							<li><a
								href="https://www.facebook.com/%EB%84%88%EB%82%98%EB%93%A4%EC%9D%B4-102411682096038"
								class="fa fa-facebook" target='_blank'></a></li>
							<li><a href="https://www.instagram.com/nunadri_/"
								class="fa fa-instagram" target='_blank'></a></li>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<c:choose>
								<c:when test="${!empty sessionScope.m }">
									<c:choose>
										<c:when test="${sessionScope.m.grade lt 2 }">
											<li><a href="/adminMain.do" class="fa fa-user"></a></li>
											<li><a href="/logout.do" class="fa fa-sign-out"></a></li>
										</c:when>
										<c:otherwise>
											<li><a href="/mypage.do" class="fa fa-user"></a></li>
											<li><a href="/logout.do" class="fa fa-sign-out"></a></li>
										</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<li><a href="javascript:void(0)" id="needLoginAlert"
										class="fa fa-user"></a></li>

									<li><a href="/loginFrm.do" class="fa fa-sign-in"></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
					<!-- /.col-md-12 -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
			<div class="main-header">
				<div class="container">
					<div id="menu-wrapper">
						<div class="row">
							<div class="logo-wrapper col-md-2 col-sm-2">
								<h1>
									<a href="/">NUNADRI</a>
								</h1>
							</div>
							<!-- /.logo-wrapper -->
							<div class="col-md-10 col-sm-10 main-menu text-right"
								style="width: 850px;">
								<div class="toggle-menu visible-sm visible-xs">
									<i class="fa fa-bars"></i>
								</div>
								<ul class="menu-first">
									<li class="active"><a href="#">Home</a></li>
									<li><a href="#clubCategory">Club category</a></li>
									<li><a href="#clubFeed">club Feed</a></li>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<div class="toggle-menu visible-sm visible-xs"></div>
									<c:choose>
										<c:when test="${!empty sessionScope.m }">
											<c:choose>
												<c:when test="${sessionScope.m.grade gt 1 }">
													<li><a onclick="location.href='/myClub.do';"
														style="cursor: pointer;">${sessionScope.m.memberNick }'s
															CLUB</a></li>
												</c:when>
											</c:choose>
										</c:when>
									</c:choose>
									<li><a onclick="location.href='/newClub.do?clubNo=6';"
										style="cursor: pointer;">CLUB VIEW</a></li>
									<li><a
										onclick="location.href='/boardList.do?reqPage=1&type=1';"
										style="cursor: pointer;">FEEDBACK</a></li>
									<c:if test="${empty sessionScope.m }">
										<li><a onclick="location.href='/join.do';"
											style="cursor: pointer;">JOIN</a></li>
									</c:if>
									<!-- <li><a onclick="location.href='/badReport.do';" style="cursor: pointer;">Bad report</a></li> -->
								</ul>
							</div>
							<!-- /.main-menu -->
						</div>
						<!-- /.row -->
					</div>
					<!-- /#menu-wrapper -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /.main-header -->
		</div>
		<!-- /.site-header -->

	</div>
	<!-- /.site-main -->
	<div class="site-slider">
		<div class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li>
						<div class="overlay"></div> <img
						src="/resources/main/images/intro_4.jpg" alt="">
						<div class="slider-caption visible-md visible-lg">
							<h2>'너나들이'</h2>
							<p>
								이곳에서 클럽을 만들고<br>사람들과 건전한 모임을 이어가세요
							</p>
							<br> <br> <br>
							<c:if test="${!empty sessionScope.m }">
								<a onclick="location.href='/createClubFrm.do';"
									class="slider-btn" style="font-size: 25px; cursor: pointer;">클럽
									만들기</a>
							</c:if>
							<c:if test="${empty sessionScope.m }">
							<a onclick="location.href='/createClubFrm.do';"
								 class="slider-btn"
								style="font-size: 25px; cursor: pointer;">클럽 만들기</a>
							</c:if>
						</div>
					</li>
					<li>
						<div class="overlay"></div> <img
						src="/resources/main/images/intro_2.jpg" alt="">
						<div class="slider-caption visible-md visible-lg">
							<h2>'너나들이'</h2>
							<p>당신의 취향이 이곳에 모두 있습니다</p>
							<a href="#clubCategory" class="slider-btn"
								style="font-size: 25px;">클럽 카테고리</a>
						</div>
					</li>
					<li>
						<div class="overlay"></div> <img
						src="/resources/main/images/intro_3.jpg" alt="">
						<div class="slider-caption visible-md visible-lg">
							<h2>'너나들이'</h2>
							<p>당신의 클럽을 자랑하세요</p>
							<a href="/freeBoardList.do" class="slider-btn"
								style="font-size: 25px;">피드 보러가기</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.flexslider -->
		</div>
		<!-- /.slider -->
	</div>
	<!-- /.site-slider -->
	<div class="content-section" id="clubCategory">
		<div class="container">
			<div class="row">
				<div class="heading-section col-md-12 text-center">
					<h2>Club Category</h2>
					<p>맘에드는 카테고리를 확인하세요</p>
				</div>
				<!-- /.heading-section -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-1"
						onclick="location.href='/viewClubList.do?cgNo=11';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-apple"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>음식</h3>
								<p>나만이 아는 맛집을 공유하고 같이 가잨</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-2"
						onclick="location.href='/viewClubList.do?cgNo=4';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-flag"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>스포츠</h3>
								<p>여러가지 스포츠 동호회를 만들어 같이 즐겨요!</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-3"
						onclick="location.href='/viewClubList.do?cgNo=10';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-glass"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>술</h3>
								<p>도수높은 위스키, 향이 좋은 와인을 함께즐겨요</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-4"
						onclick="location.href='/viewClubList.do?cgNo=8';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-asterisk"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>게임</h3>
								<p>롤, 에이펙스 등 게임같이하자!</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-5"
						onclick="location.href='/viewClubList.do?cgNo=5';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-headphones"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>음악</h3>
							</div>
							<p>좋아하는 음악을 공유하고, 함께 콘서트도 즐겨요!</p>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-6"
						onclick="location.href='/viewClubList.do?cgNo=6';"
						style="cursor: pointer; background-color: firebrick;">
						<div class="service-icon">
							<i class="fa fa-globe"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>여행</h3>
								<p>사람들과 함께 어우러져 이곳저곳 여행명소로 떠나봅시다!</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-7"
						onclick="location.href='/viewClubList.do?cgNo=9';"
						style="cursor: pointer; background-color: coral;">
						<div class="service-icon">
							<i class="fa fa-shopping-cart"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>영화</h3>
								<p>좋아하는 영화들을 공유하고, 함께 관람도 해요!</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item" id="service-8"
						onclick="location.href='/viewClubList.do?cgNo=7';"
						style="cursor: pointer">
						<div class="service-icon">
							<i class="fa fa-leaf"></i>
						</div>
						<!-- /.service-icon -->
						<div class="service-content">
							<div class="inner-service">
								<h3>자연</h3>
								<p>함께 환경을 보호하는 활동을 해보아요!</p>
							</div>
						</div>
						<!-- /.service-content -->
					</div>
					<!-- /#service-1 -->
				</div>
				<!-- /.col-md-3 -->
			</div>
			<!-- /.row -->
			<c:if test="${!empty sessionScope.m }">
			<button onclick="location.href='/createClubFrm.do';" id="feed_info">CREATE CLUB</button>
			</c:if>
			<c:if test="${empty sessionScope.m }">
			<button onclick="location.href='/createClubFrm.do';" id="feed_info">CREATE CLUB</a>
			</c:if>
				
		</div>
		<!-- /.container -->
	</div>
	<!-- /#services -->



	<div class="content-section" id="clubFeed">
		<div class="container">
			<div class="row">
				<div class="heading-section col-md-12 text-center">
					<h2>Our Club Feed</h2>
					<p>당신의 클럽을 자랑하세요</p>
				</div>
				<!-- /.heading-section -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p11.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'네발자전거'</h3>
							<p>자전거 라이딩으로 회원님덜과 파주 평화공원을 다녀왔숨당</p>
							<a href="/resources/main/images/gallery/p11.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p12.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'무비메이트'</h3>
							<p>채팅으로 알게된 회원님과 둘이 킬러의 보디가드 관람! 배꼽 찾아 삼만리</p>
							<a href="/resources/main/images/gallery/p12.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p13.png" alt="">
						<div class="portfolio-overlay">
							<h3>'떠나자 어디든'</h3>
							<p>너나들이 회원님과 함께 다녀온 스페인, 가우디 성당이 아주 아름다웠습니다</p>
							<a href="/resources/main/images/gallery/p13.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p14.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'니가사는거라면 나도 끼지'</h3>
							<p>그라가스같은 회원님이 와인에 대해 알려주셨어요!</p>
							<a href="/resources/main/images/gallery/p14.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p15.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'아미회장'</h3>
							<p>방탄소년단 콘서트에 같이 다녀왔어요!</p>
							<a href="/resources/main/images/gallery/p15.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p16.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'6군 스트라이커'</h3>
							<p>상암 풋살장을 빌려서 3:3 밀어내기를 했어요!</p>
							<a href="/resources/main/images/gallery/p16.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p17.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'무조건 정글잘못'</h3>
							<p>다이아정글러 준식님이 갱승을 당했어요!</p>
							<a href="/resources/main/images/gallery/p17.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<div class="portfolio-item col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="/resources/main/images/gallery/p18.png" alt="">
						<div class="portfolio-overlay" style="cursor: auto;">
							<h3>'나무나무'</h3>
							<p>식목일이 아니어도 나무를 심고 왔어요.</p>
							<a href="/resources/main/images/gallery/p18.png"
								data-rel="lightbox" class="expand"> <i class="fa fa-search"></i>
							</a>
						</div>
						<!-- /.portfolio-overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.portfolio-item -->
				<button onclick="location.href='/freeBoardList.do'" id="feed_info">MORE</button>
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#portfolio -->
	<script>
		$("#needLoginAlert").click(function() {
			alert("로그인 후 가능한 서비스입니다.");
			location.href = "/loginFrm.do";
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>