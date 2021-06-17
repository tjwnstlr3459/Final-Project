<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta charset="utf-8" />

<title>Category Page - Abstract</title>
<meta name="description" content="" />
<meta name="author" content="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/base.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/vendor.css" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/myClub/main.css" />
<!-- script
   ================================================== -->
<script src="/resources/js/myClub/modernizr.js"></script>
<script src="/resources/js/myClub/pace.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="icon" href="favicon.ico" type="image/x-icon" />
</head>
<script>
	$(function() {
		$(".entry-thumb").click(function() {
			$(".postModal").css("display", "block");
			$(".postModal").css("zindex", "1000");
		});
		$(".modalClose").click(function(){
			$(".postModal").css("display", "none");
		});
	});
</script>
<body id="top">
	<!-- page header
   ================================================== -->
	<section id="page-header">
		<div class="row current-cat">
			<div class="col-full">
				<h1 style="margin: 0px">Latest Posts</h1>
			</div>
		</div>
	</section>
	<!-- masonry
   ================================================== -->
	<section id="bricks" class="with-top-sep">
      <div class="row masonry">
        <div class="leftCon">
          <!-- 클러리스트 -->
          <div class="myInfo">
            <div class="myInfoImg">
              <img src="/resources/image/user04.jpg" />
            </div>
            <div>서준식</div>
            <hr />
            <div>읽지 않은 메세지 1 건</div>
            <div>#여행 #요리 #음식</div>
          </div>
          <hr width="80%" style="margin: 0 auto" />
          <div class="myClubList">
            <div class="clubListOne"><img /></div>
            <div class="clubListName">
              <div>클럽소개</div>
              <div class="clubJang" style="float: right">
                <img src="/resources/image/user04.jpg" />
              </div>
            </div>
          </div>
        </div>

        <div class="rightCon">
          <!-- 오른쪽 컨텐츠-->
          <div class="rightConSelect">
            <input type="text" name="search" />
            <button style="height: 30px">Search</button>
            <select>
              <option>모든날짜</option>
              <option>지난 1시간</option>
              <option>지난 1일</option>
              <option>지난 1주</option>
              <option>지난 1개월</option>
            </select>
          </div>
          <!-- brick-wrapper -->
          <div class="bricks-wrapper">
            <div class="grid-sizer"></div>
            <!--게시물 시작-->
            <article
              class="brick entry format-standard animate-this"
              id="check"
            >
              <div class="entry-thumb">
                <a href="#" class="thumb-link" id="cccdd">
                  <img
                    src="/resources/image/user04.jpg"
                    class="postsCheck"
                    alt="building"
                  /><!--이미지-->
                </a>
              </div>
              <div class="entry-text">
                <div class="entry-header">
                  <div class="entry-meta">
                    <span class="cat-links">
                      <a href="#">클럽이름</a>
                      <!--태그-->
                    </span>
                  </div>
                  <h1 class="entry-title">
                    <a href="single-standard.html">제목</a>
                  </h1>
                  <!--제목-->
                </div>
                <div class="entry-excerpt">
                  <!--내용-->
                  est ad minim elit reprehenderit nisi officia aute incididunt
                  velit sint in aliqua cillum in consequat consequat in culpa in
                  anim.
                </div>
              </div>
            </article>
            <!-- end article -->

            <!-- end article -->
          </div>
          <!-- 오른쪽 컨텐츠 종료-->
        </div>
        <!-- end brick-wrapper -->
      </div>

      <div class="postModal" style="display: none">
        <!-- 게시물 모달창 -->
        <div
          class="postModalPan"
          style="padding-bottom: 20px; padding-top: 20px"
        >
          <div class="postUser">
            <div class="modalUserImg"><img src="/resources/image/user04.jpg" /></div>
            <div class="modalUserId">
              <div>바람돌이</div>
              <div>낚시모임</div>
            </div>
            <div class="modalClose" style="float: right"><img src="/resources/image/icons/x.png" style="width: 30px;"></div>
          </div>
          <!--아이디 정보-->
          <hr />
          <div class="postImg"><img src="/resources/image/user04.jpg" /></div>
          <!--이미지-->
          <div class="postContent">흰 천과 바람만 있으면 어디든 갈수있어..</div>
          <!--내용-->
          <div class="postLike">
            <div><img src="/resources/image/icons/home.png" /></div>
            <div><img src="/resources/image/icons/loveBean.png" /></div>
            <div class="postLikeCount" style="width: 100%">
              userName 님 외 127명이 좋아합니다.
            </div>
          </div>
          <!--좋아요-->
          <hr />
          <div class="modalComent">
            <!--댓글-->
            <div>
              <div class="imgimg"><img src="/resources/image/user04.jpg" /></div>
            </div>
            <div>
              <div style="float: left">
                <div style="font-weight: bold; font-size: 12px">바람돌이</div>
                <div>
                  <p style="font-size: 12px; line-height: 10px; margin: 0px">
                    안녕하세요 감사해요 잘있어요 다시만나요
                  </p>
                </div>
              </div>
              <div style="float: left"></div>
            </div>
          </div>
          <hr />
          <div class="modalComentWrite">
            <div>
              <div class="imgimg"><img src="/resources/image/user04.jpg" /></div>
            </div>
            <div style="margin-bottom: 20px">
              <input type="text" name="coment" class="comentWrite" />
            </div>
            <div>
              <img
                src="/resources/image/icons/down.png"
                style="width: 30px; float: left"
              />
            </div>
          </div>
          <!--댓글 작성-->
        </div>
      </div>
    </section>
	</section>
	<!-- bricks -->
	<div id="preloader">
		<div id="loader"></div>
	</div>
	<!-- Java Script
   ================================================== -->
	<script src="/resources/js/myClub/jquery-2.1.3.min.js"></script>
	<script src="/resources/js/myClub/plugins.js"></script>
	<script src="/resources/js/myClub/main.js"></script>
</body>
</html>
